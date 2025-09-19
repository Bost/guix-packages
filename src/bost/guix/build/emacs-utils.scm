(define-module (bost guix build emacs-utils)
  ;; #:use-module (ice-9 pretty-print)

  ;; #:use-module (bost utils) ; my=warn however when used, it errors out with
  ;; 'no code for module (bost utils)' even if this module is under among
  ;; #:modules and #:imported-modules of emacs-spacemacs package arguments
  ;; It must be used via ((@(bost utils) my=warn) "The warning message" ...)

  #:use-module (guix build emacs-utils)
  #:export (
            write-pkg-file
            print-vars
            find-el-file-directories-gitignore
            ))

;;; Commentary:
;;;
;;; Tools to programmatically edit files using Emacs,
;;; e.g. to replace entire s-expressions in elisp files.
;;;
;;; Code:

(define (find-root-library-file name)
  (let loop ((parts (string-split
                     (package-name-version->elpa-name-version name) #\-))
             (candidate ""))
    (cond
     ;; at least one version part is given, so we don't terminate "early"
     ((null? parts) #f)
     ((string-null? candidate) (loop (cdr parts) (car parts)))
     ((file-exists? (string-append candidate ".el")) candidate)
     (else
      (loop (cdr parts) (string-append candidate "-" (car parts)))))))

(define (emacs-package? name)
  "Check if NAME correspond to the name of an Emacs package."
  (string-prefix? "emacs-" name))

(define (package-name-version->elpa-name-version name-ver)
  "Convert the Guix package NAME-VER to the corresponding ELPA name-version
format.  Essentially drop the prefix used in Guix."
  (if (emacs-package? name-ver)  ; checks for "emacs-" prefix
      (string-drop name-ver (string-length "emacs-"))
      name-ver))

(define (print-vars files)
  "Put debug info to every file listed in the FILES.

(print-vars (list \"core/core-configuration-layer.el\"))"
  (let [(fun-as-string
         "`'
(defun print-vars (f)
  (message \"[%s] user-emacs-directory                     : %s\" f (or (and (boundp 'user-emacs-directory) user-emacs-directory) 'undefined))
  (message \"[%s] emacs-startup-hook                       : %s\" f (or (and (boundp 'emacs-startup-hook) emacs-startup-hook) 'undefined))
  (message \"[%s] noninteractive                           : %s\" f (or (and (boundp 'noninteractive) noninteractive) 'undefined))
  (message \"[%s] spacemacs-start-directory                : %s\" f (or (and (boundp 'spacemacs-start-directory) spacemacs-start-directory) 'undefined))
  (message \"[%s] spacemacs-data-directory                 : %s\" f (or (and (boundp 'spacemacs-data-directory) spacemacs-data-directory) 'undefined))
  (message \"[%s] spacemacs-cache-directory                : %s\" f (or (and (boundp 'spacemacs-cache-directory) spacemacs-cache-directory) 'undefined))
  (message \"[%s] spacemacs-private-directory              : %s\" f (or (and (boundp 'spacemacs-private-directory) spacemacs-private-directory) 'undefined))
  (message \"[%s] quelpa-dir                               : %s\" f (or (and (boundp 'quelpa-dir) quelpa-dir) 'undefined))
  (message \"[%s] configuration-layer--elpa-root-directory : %s\" f (or (and (boundp 'configuration-layer--elpa-root-directory) configuration-layer--elpa-root-directory) 'undefined))
  (message \"[%s] spacemacs--last-emacs-version-file       : %s\" f (or (and (boundp 'spacemacs--last-emacs-version-file) spacemacs--last-emacs-version-file) 'undefined))
  )")]
    (map (lambda* (file)
           (substitute* file
             ((";; (\\(print-vars \".*\"\\))" all sexp)
              (format #f "\n~a\n~a" fun-as-string sexp))))
         files)))

(define (find-el-file-directories-gitignore path)
  "Find directories containing .el files, explicitly respecting common .gitignore
patterns.

Usage:
  (find-el-file-directories-gitignore \"/path/to/emacs/packages\")

Returns a list of unique relative directory paths containing .el files."
  (let* [(absolute-path (if (absolute-file-name? path)
                            path
                            (canonicalize-path path)))
         (path-length (string-length absolute-path))]
    ((comp
      (cut sort <> string<?)
      (cut delete-duplicates <> string=?)
      (cut map (cut string-drop <> 1) <>)
      (cut remove string-null? <>)
      ;; Convert to relative paths
      (cut map (lambda (dir)
                 (if (string-prefix? absolute-path dir)
                     (string-drop dir path-length)
                     dir)) <>)
      (cut map dirname <>)
      ;; Filter out .git directories and other common ignore patterns
      (cut filter (lambda (file)
                    (not
                     (or
                      ;; (any pred lst1 lst2 ...)
                      ;; Test whether any set of elements from LST1 LST2 ... satisfies PRED.
                      ;; If so, the return value is the return value from the successful
                      ;; PRED call, or if not, the return value is ‘#f’.
                      (any (cut string-contains file <>)
                           (list "/.git/" "/.svn/" "/.#" "/.github/"
                                 ;; "/." ; ignores everything
                                 "/node_modules/"))
                      (string-suffix? "~" file))))
           <>)
      (cut find-files <> "\\.el$" #:directories? #f #:fail-on-error? #f))
     absolute-path)))

(define (store-directory->elpa-name-version store-dir)
  "Given a store directory STORE-DIR return the part of the basename after the
second hyphen.  This corresponds to 'name-version' as used in ELPA packages."
  ((compose package-name-version->elpa-name-version
            strip-store-file-name)
   store-dir))

(define* (write-pkg-file name #:optional pkg-name)

  (define file-name-pkg (if pkg-name
                            pkg-name
                            (string-append name "-pkg.el")))

  (define summary-regexp
    "^;;; [^ ]*\\.el ---[ \t]*\\(.*?\\)[ \t]*\\(-\\*-.*-\\*-[ \t]*\\)?$")

  (define %write-pkg-file-form
    `(progn
      (require 'lisp-mnt)
      (require 'package)

      ;; WTF?!? The package--prepare-dependencies should be defined by (require 'package)
      ;;   Symbol’s function definition is void: package--prepare-dependencies
      (defun package--prepare-dependencies (deps)
        "Turn DEPS into an acceptable list of dependencies.

Any parts missing a version string get a default version string
of \"0\" (meaning any version) and an appropriate level of lists
is wrapped around any parts requiring it."
        (cond
         ((not (listp deps))
          (error "Invalid requirement specifier: %S" deps))
         (t (mapcar (lambda (dep)
                      (cond
                       ((symbolp dep) `(,dep "0"))
                       ((stringp dep)
                        (error "Invalid requirement specifier: %S" dep))
                       ((and (listp dep) (null (cdr dep)))
                        (list (car dep) "0"))
                       (t dep)))
                    deps))))

      (defun build-package-desc-from-library (name)
        (package-desc-from-define
         name
         ;; Workaround for malformed version string (for example "24 (beta)"
         ;; in paredit.el), try to parse version obtained by lm-version,
         ;; before trying to create package-desc.  Otherwise the whole process
         ;; of generation -pkg.el will fail.
         (condition-case
          nil
          (let ((version (lm-version)))
            ;; raises an error if version is invalid
            (and (version-to-list version) version))
          (error "0.0.0"))
         (or (save-excursion
              (goto-char (point-min))
              (and (re-search-forward ,summary-regexp nil t)
                   (match-string-no-properties 1)))
             package--default-summary)
         (let ((require-lines (lm-header-multiline "package-requires")))
           (and require-lines
                (package--prepare-dependencies
                 (package-read-from-string
                  (mapconcat 'identity require-lines " ")))))
         :kind       'single
         :url        (lm-homepage)
         :keywords   (lm-keywords-list)
         :maintainer (lm-maintainer)
         :authors    (lm-authors)))

      (defun generate-package-description-file (name)
        (package-generate-description-file
         (build-package-desc-from-library name)
         ,file-name-pkg))

      (let ((f "[%write-pkg-file-form]"))
        (condition-case
         err
         (progn
          ;; (message "%s Generating %s…" f ,file-name-pkg)
          (let ((name (file-name-base (buffer-file-name))))
            (generate-package-description-file name)
            (message "%s Generating %s… done" f ,file-name-pkg)))
         (error
          (message "%s Errors during generation of %s :" f ,file-name-pkg)
          (message "%s %s" f (error-message-string err)))))))

  (if (file-exists? file-name-pkg)
      ((@(bost utils) my=warn) "[write-pkg-file] file-exists ~a\n" file-name-pkg)
      (emacs-batch-edit-file (string-append name ".el")
        %write-pkg-file-form)))

(define-module (bost guix build emacs-utils)
  #:use-module (guix build emacs-utils)
  #:export (
            write-pkg-file
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

(define (store-directory->elpa-name-version store-dir)
  "Given a store directory STORE-DIR return the part of the basename after the
second hyphen.  This corresponds to 'name-version' as used in ELPA packages."
  ((compose package-name-version->elpa-name-version
            strip-store-file-name)
   store-dir))

(define (write-pkg-file name)

  (define summary-regexp
    "^;;; [^ ]*\\.el ---[ \t]*\\(.*?\\)[ \t]*\\(-\\*-.*-\\*-[ \t]*\\)?$")

  (define %write-pkg-file-form
    `(progn
      (require 'lisp-mnt)
      (require 'package)

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
         (concat name "-pkg.el")))

      (condition-case
       err
       (let ((name (file-name-base (buffer-file-name))))
         (generate-package-description-file name)
         (message (concat name "-pkg.el file generated.")))
       (error
        (message "There are some errors during generation of -pkg.el file:")
        (message "%s" (error-message-string err))))))

  (unless (file-exists? (string-append name "-pkg.el"))
    (emacs-batch-edit-file (string-append name ".el")
      %write-pkg-file-form))
  )


#!/home/bost/.guix-profile/bin/emacs --script

;; for `-compose' and `-partial'
(require 'dash)
(require 'f)

(defun append-to-list (list-var element)
  "Append ELEMENT to the end of LIST-VAR."
  (set list-var (nconc (symbol-value list-var) (list element))))

(cl-defstruct (package-desc
               ;; Rename the default constructor from `make-package-desc'.
               (:constructor package-desc-create)
               ;; Has the same interface as the old `define-package',
               ;; which is still used in the "foo-pkg.el" files. Extra
               ;; options can be supported by adding additional keys.
               (:constructor
                package-desc-from-define
                (name-string version-string &optional summary requirements
                             &rest rest-plist
                             &aux
                             (name (intern name-string))
                             (version (if (eq (car-safe version-string) 'vc)
                                          (version-to-list (cdr version-string))
                                        (version-to-list version-string)))
                             (reqs (mapcar (lambda (elt)
                                             (list (car elt)
                                                   (version-to-list (cadr elt))))
                                           (if (eq 'quote (car requirements))
                                               (nth 1 requirements)
                                             requirements)))
                             (kind (plist-get rest-plist :kind))
                             (archive (plist-get rest-plist :archive))
                             (extras (let (alist)
                                       (while rest-plist
                                         (unless (memq (car rest-plist) '(:kind :archive))
                                           (let ((value (cadr rest-plist)))
                                             (when value
                                               (push (cons (car rest-plist)
                                                           (if (eq (car-safe value) 'quote)
                                                               (cadr value)
                                                             value))
                                                     alist))))
                                         (setq rest-plist (cddr rest-plist)))
                                       alist)))))
  "Structure containing information about an individual package.
Slots:

`name'	Name of the package, as a symbol.

`version' Version of the package, as a version list.

`summary' Short description of the package, typically taken from
        the first line of the file.

`reqs'	Requirements of the package.  A list of (PACKAGE
        VERSION-LIST) naming the dependent package and the minimum
        required version.

`kind'	The distribution format of the package.  Currently, it is
        either `single' or `tar'.

`archive' The name of the archive (as a string) whence this
        package came.

`dir'	The directory where the package is installed (if installed),
        `builtin' if it is built-in, or nil otherwise.

`extras' Optional alist of additional keyword-value pairs.

`signed' Flag to indicate that the package is signed by provider."
  name
  version
  (summary package--default-summary)
  reqs
  kind
  archive
  dir
  extras
  signed)

(defun find-url (plist-list)
  "Search through a list of plists, PLIST-LIST, and return the value
associated with :url."
  (catch 'found
    (dolist (item plist-list)
      (when (and (consp item) (eq (car item) :url))
        (throw 'found (cdr item))))))

(defun get-pkg-desc (exp pkg-file)
  ;; vim-powerline makes troubles - ignore it for the now.
  (if (string= "vim-powerline" (cadr exp))
      nil
    (or (when (eq (car-safe exp) 'define-package)
          (let* ((new-pkg-desc (apply #'package-desc-from-define (cdr exp)))
                 (name (package-desc-name new-pkg-desc))
                 (extras (package-desc-extras new-pkg-desc))
                 (url (find-url extras))
                 (file (format "%s%s.el"
                               (file-name-directory pkg-file)
                               name)))
            (let* ((version
                    (string-trim
                     (shell-command-to-string
                      (format "grep -oP 'Version: \\K(.*)' %s" file)))))
              (list url version file))))
        (error "Can't find define-package in %s; pkg-file %s" exp pkg-file))))

(defun package-files ()
  (setq lst '())
  (let* ((dirs (list "/home/bost/.emacs.d.distros/spguimacs/elpa/29.4/develop/")))
    ;; (message "(length dirs) %s" (length dirs))
    (dolist (dir dirs)
      (when (file-directory-p dir)
        (dolist (pkg-dir (directory-files dir t "\\`[^.]"))
          (when (file-directory-p pkg-dir)
            (let* ((pkg-file (expand-file-name
                              (package--description-file pkg-dir) pkg-dir)))
              (if (file-exists-p pkg-file)
                  (progn
                    (with-temp-buffer
                      (insert-file-contents pkg-file)
                      (goto-char (point-min))
                      (let* ((exp (read (current-buffer)))
                             (pkg-desc (get-pkg-desc exp pkg-file)))
                        (when pkg-desc
                          (append-to-list 'lst pkg-desc)))))
                ;; (message "pkg-file doesn't exist : %s" pkg-file)
                )))))))
  ;; (message "(length lst) %s" (length lst))
  lst)

;; (
;;  "<git-repo>"
;;  "<version-number>"
;;  "<path-to-el-file>"
;; )

(defun lint-get-forms (filename)
  "Read FILENAME and return a list of its Lisp forms."
  (with-temp-buffer
    (let ((buf (current-buffer))
          forms)
      (insert-file-contents filename)
      (while (ignore-errors (push (read buf) forms)))
      (nreverse forms))))

(pcase-defmacro sexp (kw) `(pred (equal ,kw)))
;; (sexp--pcase-macroexpander 'provide) ;; => (pred (equal provide))

(setq inputs-to-remove
      (mapcar (-compose
               (-partial #'concat "emacs-")
               #'symbol-name)
              ;; color, dash are needed
              ;; posframe is NOT part of Emacs, despite the comment
              '(
                advice
                ansi-color
                auth-source
                avoid
                calc-ext
                cl
                cl-extra
                cl-lib
                compile
                cus-face
                derived
                dired
                dom
                easy-mmode
                edmacro
                eieio
                eieio-base
                epg
                erc
                ert
                eshell
                find-func
                flymake
                flyspell
                format-spec
                goto-addr
                help-fns
                help-mode
                hierarchy
                hl-line
                ido
                image
                ispell
                iswitchb ;; deprecated
                json
                latex
                let-alist
                lv
                magit
                map
                nxml-mode
                ob
                ob-core
                org
                org-capture
                package
                pcase
                pcomplete
                pdf-view  ;; in pdf-tools
                pp
                python
                regexp-opt
                reveal
                ring
                rx
                seq
                server
                sha1
                shell
                shr
                sql
                sqlite
                subr-x
                thingatpt
                tramp
                transient
                url
                url-parse
                url-http
                vc-hooks
                view
                warnings
                wid-edit
                xml
                xref
                )))

(defun find-sexps (kw lst)
  "Remove nil elements"
  (funcall
   (-compose
    ;; (-partial #'mapcar (-compose (-partial #'message "%s")))
    (-partial #'remove nil)
    (-partial #'mapcar
              (-compose
               (-partial
                (lambda (kw lst)
                  (pcase lst
                    (`(,(sexp kw) ,pkg)
;;; TODO find out what is the type of PKG? It's not a string neither symbol.
                     (substring (format "%s" pkg) 1)
                     )))
                kw))))
   lst))

(defun analyze (pkg)
  (funcall
   (-compose
    (lambda (lst)
      (list
       (append (find-sexps 'provide-theme lst) (find-sexps 'provide lst))
       ;; (find-sexps 'provide lst)
       ;; emacs-dash is needed
       (find-sexps 'require lst)))
    #'reverse
    #'lint-get-forms
    #'caddr)
   pkg))

(defun extract-infomation (pkg)
  "
(define
  pkgs-analyzed
  '((emacs-pkg-name \"auctex-latexmk\"
     repo-url \"https://github.com/tom-tan/auctex-latexmk/\"
     guix-package \"emacs-auctex-latexmk\"
     version \"20220529.161054\"
     propagated-inputs (propagated-inputs (list latex))
     file \"/home/bost/.emacs.d.distros/spguimacs/elpa/29.4/develop/auctex-latexmk-20220529.161054/auctex-latexmk.el\"
  )))"

  (let* ((r (analyze pkg))
         (name (caar r))
         (url (cond
               ((string= name "concurrent") "https://github.com/kiwanami/emacs-deferred")
               ((string= name "cython-mode") "https://github.com/cython/emacs-cython-mode")
               ((string= name "dired-quick-sort") "https://gitlab.com/xuhdev/dired-quick-sort")
               ((string= name "elisp-def") "https://github.com/Wilfred/elisp-def")
               ((string= name "erc-image") "https://github.com/kidd/erc-image.el")
               ((string= name "erc-tweet") "https://github.com/kidd/erc-tweet.el")
               ((string= name "erc-view-log") "https://github.com/Niluge-KiWi/erc-view-log")
               ((string= name "erc-yt") "https://github.com/yhvh/erc-yt.git")
               ((string= name "eval-sexp-fu") "https://github.com/hchbaw/eval-sexp-fu.el")
               ((string= name "evil-textobj-line") "https://github.com/emacsorphanage/evil-textobj-line")
               ((string= name "evil-visual-mark-mode") "https://github.com/roman/evil-visual-mark-mode")
               ((string= name "nose") "https://github.com/rasmus-toftdahl-olesen/iss-mode")
               ((string= name "pip-requirements") "https://github.com/Wilfred/pip-requirements.el")
               ((string= name "pos-tip") "https://github.com/pitkali/pos-tip")
               ((string= name "string-edit-at-point") "https://github.com/magnars/string-edit.el")
               ((string= name "systemd") "https://github.com/holomorph/systemd-mode")
               ((string= name "uuidgen") "https://github.com/kanru/uuidgen-el")
               ((string= name "highlight-parentheses") "https://git.sr.ht/~tsdh/highlight-parentheses.el")
               ((string= name "indent-guide") "https://github.com/zk-phi/indent-guide")
               ((string= name "live-py-mode") "https://github.com/donkirkby/live-py-plugin")
               ((string= name "open-junk-file") "https://github.com/rubikitch/open-junk-file")
               ((string= name "overseer") "https://github.com/tonini/overseer.el")
               ((string= name "pdf-tools") "https://github.com/vedang/pdf-tools")
               ((string= name "py-isort") "https://github.com/paetzke/py-isort.el")
               ((string= name "pyvenv") "https://github.com/jorgenschaefer/pyvenv")
               ((string= name "sass-mode") "https://github.com/nex3/sass-mode")
               ((string= name "org-category-capture") "https://github.com/colonelpanic8/org-project-capture")
               (t (car pkg)))))
    (list
     'emacs-pkg-name name    ; package name - string
     'repo-url url   ; repo url - string
     'guix-package (concat "emacs-" (caar r))    ; package name - string
     'version (cadr pkg)  ; version
     'propagated-inputs
     (let* ((input-syms     (mapcar #'intern (cadr r)))
            (input-syms-rem (mapcar #'intern inputs-to-remove))
            (inputs (cl-set-difference input-syms input-syms-rem)))
       ;; (message "r: %s" r)
       ;; (message "input-syms: %s" input-syms)
       `(propagated-inputs
         (list ,@inputs)))    ; required packages - list
     'file (caddr pkg) ; file
     )))

(funcall
 (-compose
  (lambda (_) (message "%s" "Now run ./create-elisp-package-definition.scm"))
  (message "%s" "Run "))
 ;; (lambda (_) (message "%s" "Now run ./create-elisp-package-definition.scm"))
 (lambda (s)
   (f-write-text (format "%s" (pp
                               `(define pkgs-analyzed
                                        ',s)))
                 'utf-8 (format "%s/analyzed.scm" (getenv "dotf"))))
 ;; (-partial #'mapcar #'print)
 (-partial #'mapcar
           (lambda (pkg)
             "(git-url, version, elisp-file). E.g.:
                  'utf-8 "/home/bost/dev/dotfiles/analyzed.scm"))
  (let* ((outfile (format "%s/analyzed.scm" (getenv "dotf"))))
    (f-write-text (pp `(define pkgs-analyzed ',s))
                  'utf-8 outfile)
    ;; (message "File created: %s" outfile)
    ))
 ;; (-partial #'mapcar #'print)
 (-partial #'mapcar
           (lambda (pkg)
             "(git-url, version, elisp-file). E.g.:
             ======= end
             (
              \"https://github.com/osv/web-completion-data\"
              \"0.2\"
              \"/home/bost/.local/share/spacemacs/elpa/28.2/develop/web-completion-data-20160318.848/web-completion-data.el\"
              ) "

              (let ((r (analyze pkg)))
                (list (caar r)    ; package name - string
                      (car pkg)   ; repo url - string
                      (cadr pkg)  ; version
                      (let* ((input-syms     (mapcar #'intern (cadr r)))
                             (input-syms-rem (mapcar #'intern inputs-to-remove))
                             (inputs (cl-set-difference input-syms input-syms-rem)))
                        ;; (message "r: %s" r)
                        ;; (message "input-syms: %s" input-syms)
                        `(propagated-inputs
                          (list ,@inputs)))    ; required packages - list
                      (caddr pkg) ; file
                      )))))
 ;; (list (car pkgs) (cadr pkgs))
 pkgs)
(-partial #'mapcar #'extract-infomation)
(-partial #'mapcar (lambda (pkg)
                     ;; (message "pkg : %s" pkg)
                     pkg)))
;; (list (car pkgs) (cadr pkgs))

;; (let ((lst (package-files))) (butlast lst (- (length lst) 1)))
(package-files)

;; '(
;;     ;; (
;;     ;;  "<git-repo>"
;;     ;;  "<version-number>"
;;     ;;  "<path-to-el-file>"
;;     ;;  )
;;     ;; )
;;   )
)
>>>>>>> Stashed changes

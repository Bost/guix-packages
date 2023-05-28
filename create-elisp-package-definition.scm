#!/run/current-system/profile/bin/guile
!#

(load "/home/bost/dev/dotfiles/guix/home/common/settings.scm")
(load "/home/bost/dev/dotfiles/guix/home/utils.scm")
(load "/home/bost/dev/dotfiles/guix/home/scm-bin/gcl.scm")
(load "/home/bost/dev/dotfiles/analyzed.scm")

(use-modules
 (ice-9 match)
 (utils)
 (scm-bin gcl)
 (srfi srfi-1) ;; remove
 )

;; (define url "https://github.com/Bost/search-notes")
;; (define dst-dir "/tmp/search-notes")

(define (latest-commit-hash dst-dir)
  "Get the latest commit hash from a repository in the DST-DIR."
  ((compose
    cadr
    exec
    (partial format #f "git --git-dir=~a/.git log -n 1 --format=%H"))
   dst-dir))

(define (latest-base32 dst-dir)
  "Get the latest commit hash from a repository in the DST-DIR."
  ((compose
    cadr
    exec
    (partial format #f "guix hash -x --serializer=nar ~a"))
   dst-dir))

(define (git-clone-to-tmp url)
  "Clone the git repository at the URL to the /tmp/"
  (let* [(project-name (basename url))
         (dst-dir (str "/tmp/" project-name))]
    ;; (format #t "(access? dst-dir F_OK): ~a\n" (access? dst-dir F_OK)
    (if (access? dst-dir F_OK)
        dst-dir
        (when (gcl url dst-dir)
          dst-dir))))

;; (access? some-file F_OK) ;; check if file exists
;; (access? some-file W_OK) ;; check if file is writable
;;   file-is-directory? (? file-exists?)

(define (make-pkg pkg)
  (let* [(url (cadr pkg))
         (dst-dir (git-clone-to-tmp url))]
    ;; (format #t "dst-dir ~a\n" dst-dir)
    ;; (format #t "(basename dst-dir) ~a\n" (basename dst-dir))
    (when dst-dir
      (let* [
             (emacs-pkg-name        (car pkg))
             (ver                   (caddr pkg))
             (propagated-inputs     (cadddr pkg))
             (emacs-pkg-name-symbol (string->symbol emacs-pkg-name))
             (commit (latest-commit-hash dst-dir))

             (package-specification
              (remove unspecified?
                      (list
                       `(name ,emacs-pkg-name)
                       `(version (git-version ,ver revision commit))
                       `(source
                         (origin
                           (method git-fetch)
                           (uri (git-reference
                                 (url ,url)
                                 (commit commit)))
                           (file-name (git-file-name name version))
                           (sha256
                            (base32 ,(latest-base32 dst-dir)))))
                       `(build-system emacs-build-system)
                       (unless (equal? '(propagated-inputs (list))
                                       propagated-inputs)
                         propagated-inputs)
                       `(home-page ,url)
                       `(synopsis "") ;; TODO synopsis
                       `(description "") ;; TODO description
                       `(license license:gpl3+))))
             ]

        ;; (format #t "(equal? '(propagated-inputs (list)) propagated-inputs): ~a\n"
        ;;         (equal? '(propagated-inputs (list)) propagated-inputs))
        ;; (format #t "package-specification: ~a\n" package-specification)

        (pretty-print->string
         `(define-public ,emacs-pkg-name-symbol
            (let ((commit ,commit)
                  (revision "0"))
              (package ,@package-specification))))))))

;; (define (prepare pkg)
;;   (pretty-print->string
;;    `(#:url ,(car pkg)
;;      #:version ,(cadr pkg)
;;      #:file ,(caddr pkg)
;;      #:package-name "TODO get from the repository under the #:url; analyze content of the .el files; the '(provides ...)'"
;;      #:requires "TODO get from the repository under the #:url; analyze content of the .el files; the '(require ...)'"
;;      #:synopsis "TODO get from the repository under the #:url"
;;      #:description "TODO get from the repository under the #:url"
;;      #:license "TODO get from the repository under the #:url. It must be one of the licenses defined in the 'guix/guix/licenses.scm' from the source code of the GNU Guix project"
;;      )))

;; (git-clone-to-tmp "https://github.com/purcell/color-theme-sanityinc-tomorrow")

(map (compose
      (partial format #t "\n~a\n")
      make-pkg)
     pkgs-analyzed
     #;
     (list (car pkgs-analyzed) (cadr pkgs-analyzed) (caddr pkgs-analyzed)))
#;
(load "/home/bost/dev/dotfiles/create-elisp-package-definition.scm")

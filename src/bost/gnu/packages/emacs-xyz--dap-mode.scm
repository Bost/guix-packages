(define-module (bost gnu packages emacs-xyz--dap-mode)
  ;; #:use-module (utils)
  #:use-module (bost utils)  ;; for build
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages emacs)
  )

(define-public emacs-lsp-mode
  (let ((commit "fd0a4f1fa5abc601b01a234e96798961b8a417c1")
        (revision "0"))
    (package
      (name "emacs-lsp-mode")
      (version (git-version "8.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0f92rp1z9512ms444j9yx9wrfn7ca23v4ywq7jd1nlfd4n006bjv"))))
      (build-system emacs-build-system)
      (arguments
       `(
         ;; #:exclude #~(cons* "^lsp-lense\\.el$" %default-exclude)
         #:emacs ,emacs                 ;need libxml support
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'move-clients-libraries
             ;; Move all clients libraries at top-level, as is done, e.g., in
             ;; MELPA.
             (lambda _
               (for-each (lambda (f)
                           (install-file f "."))
                         (find-files "clients/" "\\.el$"))))
           (add-before 'move-clients-libraries 'fix-patch-el-files
             ;; /bin/ksh is only used on macOS, which we don't support, so we
             ;; don't want to add it as input.
             (lambda _
               (substitute* '("clients/lsp-csharp.el" "clients/lsp-fsharp.el")
                 (("/bin/ksh") "ksh")))))))
      (propagated-inputs
       (list emacs-dash
             emacs-f
             emacs-ht
             emacs-hydra
             emacs-markdown-mode
             emacs-spinner))
      (home-page "https://emacs-lsp.github.io/lsp-mode/")
      (synopsis "Emacs client and library for the Language Server Protocol")
      (description
       "LSP mode is a client and library implementation for the Language
Server Protocol.  This mode creates an IDE-like experience by providing
optional integration with other popular Emacs packages like Company, Flycheck,
and Projectile.")
      (license license:gpl3+))))

(define emacs-dap-base
  (let ((commit
         "2f0c5b28578ce65ec746e4084ba72ba5c652ea79")
        (revision "0"))
    (package
      (name "emacs-dap-base")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0jkfj8x2ng8dbww4pscl1qqp3s1k3gzy3rv58fpagl9x38rb7h5h"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; Exclusions are done on top of the inclusions. However using
        ;; (inherit emacs-dap-base) we can effectivelly invert that. So then
        ;; the order is will be:
        ;; 1. emacs-dap-base include
        ;; 2. emacs-dap-base exclude
        ;; 3. emacs-dap-<..> include

        ;; Exclude all;
        ;; Also, matching every string except "foo" using lookahead assertion
        ;; "^\\(?!foo$\\).*" doesn't work. Lookahead assertions are not
        ;; supported in POSIX regular expressions used by Guile
        #:exclude #~(cons*
                     "^[^/]*\\.el$"
                     %default-exclude)))
      (home-page
       "https://github.com/emacs-lsp/dap-mode.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define all-info-include (quote (list "^[^/]*\\.info$" "^doc/.*\\.info$")))

(define-public emacs-dap-launch
  (let ((commit
         "2f0c5b28578ce65ec746e4084ba72ba5c652ea79")
        (revision "0"))
    (package
      (inherit emacs-dap-base)
      (name "emacs-dap-launch")
      (arguments
       (list #:include `(cons* "^dap-launch\\.el$" ,all-info-include)))
      (propagated-inputs (list emacs-lsp-mode)))))

(define-public emacs-dap-tasks
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-tasks")
    (arguments
     (list #:include `(cons* "^dap-tasks.\\el$" ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-lsp-docker
  (let ((commit
         "5554349883af05fd25d6bbd56d7116d7f965d493")
        (revision "0"))
    (package
      (name "emacs-lsp-docker")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-docker.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1ybcnha6kbqcx7jrm666jbrnw5hkbws7n541zl2d4jl1gpv09g5y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-ht
             emacs-yaml
             emacs-s
             emacs-f
             emacs-dash
             emacs-lsp-mode))
      (home-page
       "https://github.com/emacs-lsp/lsp-docker.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-dap-mode
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-mode")
    (arguments
     (list
      #:include `(cons*
                  "^dap-mode\\.el$"
                  "^dap-overlays\\.el$"
                  "^dap-launch\\.el$"
                  "^dap-tasks\\.el$"
                  ,all-info-include
                  )))
    (propagated-inputs
     (list
      emacs-lsp-mode
      emacs-f
      emacs-dash
      emacs-dap-overlays
      emacs-posframe
      emacs-ht
      emacs-lsp-docker
      emacs-dap-launch
      emacs-dap-tasks
      ))
    (synopsis "Emacs client/library for Debug Adapter Protocol")
    (description
     "Dap mode is an Emacs client/library for Debug Adapter
Protocol (DAP), a wire protocol for communication between client and
debug server.  It is similar to the LSP but provides integration with
Debug server.")))

(define-public emacs-dap-utils
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-utils")
    (arguments
     (list
      #:include `(cons*
                  "^dap-utils\\.el$"
                  ,all-info-include
                  )))
    (propagated-inputs
     (list emacs-dap-mode))))

(define-public emacs-dap-chrome
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-chrome")
    (arguments
     (list
      #:include `(cons*
                  "^dap-chrome\\.el$"
                  ,all-info-include
                  )))
    (propagated-inputs
     (list emacs-dap-utils emacs-dap-mode))))

(define-public emacs-dap-overlays
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-overlays")
    (arguments
     (list
      #:include `(cons*
                  "^dap-overlays\\.el$"
                  ,all-info-include
                  )))))

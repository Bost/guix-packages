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
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages bash)
  ;; #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  )

(define-public emacs-lsp-lens
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-lsp-mode)
     )
    (name "emacs-lsp-lens")))

(define-public emacs-lsp-protocol
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-lsp-mode)
     )
    (name "emacs-lsp-procotol")))

(define-public emacs-treemacs-treelib
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-treemacs)
     )
    (name "emacs-treemacs-treelib")))

(define emacs-lsp-metals-base
  (let ((commit
         "da7e54ed65f4e153c94b9c54689908dce142ef37")
        (revision "0"))
    (package
      (name "emacs-lsp-metals-base")
      (version (git-version "8.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-metals.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "17zs7s6dmaprdc000b9779flk4iw61gi1xgn2wxwq9bxn1l2p9ny"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/emacs-lsp/lsp-metals.git")
      (synopsis "Scala support for LSP mode")
      (description "This package is an Emacs Scala IDE using LSP mode to connect
to Metals.")
      (license license:gpl3+))))

;; Upstream uses https://github.com/emacs-lsp/lsp-metals commit "01060e9df33bb077ba6bb56ccfebc140aef8f8f3"
(define-public emacs-lsp-metals
  (package
    (inherit emacs-lsp-metals-base)
    (name "emacs-lsp-metals")
    (propagated-inputs
     (list emacs-lsp-metals-treeview
           emacs-lsp-metals-protocol
           (@(gnu packages emacs-xyz) emacs-lsp-mode)
           emacs-lsp-lens
           (@(gnu packages emacs-xyz) emacs-dap-mode)
           ))))

(define-public emacs-lsp-metals-protocol
  (package
    (inherit emacs-lsp-metals-base)
    (name "emacs-lsp-metals-protocol")
    ;; Consider using `native-inputs' instead of `propagated-inputs'.
    ;; `native-inputs' is typically used to list tools needed at build time,
    ;; but not at run time.
    (propagated-inputs
     (list
      emacs-lsp-protocol
      emacs-treemacs-treelib ;; needed, but not via (require 'treemacs-treelib)
      (@(gnu packages emacs-xyz) emacs-lsp-treemacs)
      (@(gnu packages emacs-xyz) emacs-dap-mode)
      ))))

(define-public emacs-lsp-metals-treeview
  (package
    (inherit emacs-lsp-metals-base)
    (name "emacs-lsp-metals-treeview")
    (propagated-inputs
     (list emacs-lsp-metals-protocol
           (@(gnu packages emacs-xyz) emacs-lsp-treemacs)
           (@(gnu packages emacs-xyz) emacs-lsp-mode)
           emacs-treemacs-treelib
           (@(gnu packages emacs-xyz) emacs-f)
           (@(gnu packages emacs-xyz) emacs-dash)
           (@(gnu packages emacs-xyz) emacs-ht)))))

(define-public emacs-lsp-volar
  (package
    (name "emacs-lsp-volar")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jadestrong/lsp-volar")
             (commit
              "6f0c2bc3be5fc4d8d8aa1cf5ee3546fcf6ef36be")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0bvma47dhnsipf3rdxlb5m040a40dxpkpbh7jcbr21r4g6z3xmlr"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-lsp-mode)
      ))
    (home-page
     "https://github.com/jadestrong/lsp-volar")
    (synopsis "Language support for Vue3")
    (description "Language support for Vue3
This package has been merged into lsp-mode, so you can use lsp-mode
directly. There will only be some experimental updates here. Once stable, they
will be submitted to lsp-mode.")
    (license license:gpl3+)))

(define-public emacs-lsp-haskell
  (package
    (name "emacs-lsp-haskell")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-lsp/lsp-haskell")
             (commit
              "3249cde75fb411f95fe173c222b848182fd0b752")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "06n16v278wzzh1iq4lp0k508dnynrz5c0qbv86hksm7sa4a4w4s7"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-haskell-mode)
      (@(gnu packages emacs-xyz) emacs-lsp-mode)
      ))
    (home-page
     "https://github.com/emacs-lsp/lsp-haskell")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define* (%emacs-lsp-treemacs-upstream-source #:key commit version hash)
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/emacs-lsp/lsp-treemacs")
          (commit commit)))
    (file-name (git-file-name "emacs-lsp-treemacs" version))
    (hash hash)))

(define-public emacs-lsp-pyright
  (let ((commit
         "2f2631ae242d5770dbe6cb924e44c1ee5671789d")
        (revision "0"))
    (package
      (name "emacs-lsp-pyright")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-pyright")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1gk23a56jf1v4f4ag07hzji5pw3mq1rq622ggbvqcbc2i2bnvdn1"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(gnu packages emacs-xyz) emacs-ht)
             (@(gnu packages emacs-xyz) emacs-dash)
             (@(gnu packages emacs-xyz) emacs-lsp-mode)
             ))
      (home-page
       "https://github.com/emacs-lsp/lsp-pyright")
      (synopsis "lsp-mode client leveraging Pyright language server")
      (description "lsp-mode client leveraging Pyright language server.")
      (license license:gpl3+))))

(define-public emacs-origami
  (package
    (inherit (@(gnu packages emacs-xyz) emacs-origami-el))
    (name "emacs-origami")))

(define-public emacs-lsp-origami
  (let ((commit
         "86aa06517910141c3d5054eea5f7723461fce6a6")
        (revision "0"))
    (package
      (name "emacs-lsp-origami")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-origami")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1nvz60iwdh5wkcflyk53lfwsd2yjniribvw95x9968sf9icf2dqw"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-lsp-mode)
        emacs-origami))
      (home-page
       "https://github.com/emacs-lsp/lsp-origami")
      (synopsis "origami.el support for lsp-mode")
      (description "lsp-origami provides support for origami.el using language server protocol’s
textDocument/foldingRange functionality. It can be enabled with.")
      (license license:gpl3+))))

(define-public emacs-lsp-python-ms
  (package
    (name "emacs-lsp-python-ms")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-lsp/lsp-python-ms")
             (commit
              "f8e7c4bcaefbc3fd96e1ca53d17589be0403b828")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1z7cs2linikm54a7dqn66p58vnsnhy2rj99l2wixa6cdfxlmacn0"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-lsp-mode)
      ))
    (home-page
     "https://github.com/emacs-lsp/lsp-python-ms")
    (synopsis "lsp-mode loves Microsoft's python language server.")
    (description
     "lsp-mode client leveraging Microsoft’s python-language-server.")
    (license license:bsd-3)))

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
;;; Exclusions are done on top of the inclusions. However using (inherit
;;; emacs-dap-base) we can effectivelly invert that. So then the order is will
;;; be:
;;; 1. emacs-dap-base include
;;; 2. emacs-dap-base exclude
;;; 3. emacs-dap-<..> include

        ;; Exclude all el-files in the working directory. el-files in the
        ;; subdirectories are NOT excluded.
        ;; Also, matching every string except "foo" using lookahead assertion
        ;; "^\\(?!foo$\\).*" doesn't work. Lookahead assertions are not
        ;; supported in POSIX regular expressions used by Guile
        #:exclude #~(cons*
                     "^[^/]*\\.el$"
                     %default-exclude)))
      (home-page "https://github.com/emacs-lsp/dap-mode.git")
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
       (list #:include `(cons*
                         "^dap-launch\\.el$"
                         ,all-info-include)))
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-lsp-mode)
        )))))

(define-public emacs-dap-tasks
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-tasks")
    (arguments
     (list #:include `(cons*
                       "^dap-tasks.\\el$"
                       ,all-info-include)))
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-lsp-mode)
      ))))

(define-public emacs-dap-utils
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-utils")
    (arguments
     (list #:include `(cons*
                       "^dap-utils\\.el$"
                       ,all-info-include)))
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-dap-mode)
      ))))

(define-public emacs-dap-chrome
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-chrome")
    (arguments
     (list #:include `(cons*
                       "^dap-chrome\\.el$"
                       ,all-info-include)))
    (propagated-inputs
     (list
      emacs-dap-utils
      (@(gnu packages emacs-xyz) emacs-dap-mode)
      ))))

(define-public emacs-dap-overlays
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-overlays")
    (arguments
     (list #:include `(cons*
                       "^dap-overlays\\.el$"
                       ,all-info-include)))))

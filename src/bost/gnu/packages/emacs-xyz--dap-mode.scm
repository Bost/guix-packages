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

(define-public emacs-treemacs
  (let* ((commit
          ;; Jun 15, 2023
          "58ed4538a7e5e3481571566101748a2bee29bc1d")
         (revision "1"))
    (package
      (name "emacs-treemacs")
      (version (git-version "3.1" revision commit)) ;; (version "3.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0166y4pw1njv2dkjkh54f9s16b8n2zihs4r7dxwllcm890rsa067"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #t
        #:test-command #~(list "make" "-C" "../.." "test")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'fix-makefile
              (lambda _
                (substitute* "Makefile"
                  (("@\\$\\(CASK\\) exec ") "")
                  ;; Guix does not need to prepare dependencies before testing.
                  (("test: prepare") "test:"))))
            (add-after 'fix-makefile 'chdir-elisp
              ;; Elisp directory is not in root of the source.
              (lambda _
                (chdir "src/elisp")))
            (add-before 'install 'patch-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (make-file-writable "treemacs-core-utils.el")
                (emacs-substitute-variables "treemacs-core-utils.el"
                  ("treemacs-dir" (string-append #$output "/")))
                (make-file-writable "treemacs-icons.el")
                (substitute* "treemacs-icons.el"
                  (("icons/default")
                   (string-append (elpa-directory #$output) "/icons/default")))
                (make-file-writable "treemacs-customization.el")
                (emacs-substitute-variables "treemacs-customization.el"
                  ("treemacs-python-executable"
                   (search-input-file inputs "/bin/python3")))
                (make-file-writable "treemacs-async.el")
                (substitute* "treemacs-async.el"
                  (("src/scripts")
                   (string-append (elpa-directory #$output) "/scripts")))))
            (add-after 'install 'install-data
              (lambda _
                (with-directory-excursion "../.." ;treemacs root
                  (copy-recursively
                   "icons/default"
                   (string-append (elpa-directory #$output) "/icons/default"))
                  (copy-recursively
                   "src/scripts"
                   (string-append (elpa-directory #$output) "/scripts"))))))))
      (native-inputs
       (list (@(gnu packages emacs-xyz) emacs-buttercup)
             (@(gnu packages emacs-xyz) emacs-el-mock)))
      (inputs
       (list python))
      (propagated-inputs
       (list (@(gnu packages emacs-xyz) emacs-ace-window)
             (@(gnu packages emacs-xyz) emacs-dash)
             (@(gnu packages emacs-xyz) emacs-f)
             (@(gnu packages emacs-xyz) emacs-ht)
             (@(gnu packages emacs-xyz) emacs-hydra)
             (@(gnu packages emacs-xyz) emacs-pfuture)
             (@(gnu packages emacs-xyz) emacs-s)))
      (home-page "https://github.com/Alexander-Miller/treemacs")
      (synopsis "Emacs tree style file explorer")
      (description
       "Treemacs is a file and project explorer similar to NeoTree or Vim's
NerdTree, but largely inspired by the Project Explorer in Eclipse.  It shows
the file system outlines of your projects in a simple tree layout allowing
quick navigation and exploration, while also possessing basic file management
utilities.")
      (license license:gpl3+))))

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
       (list (@(gnu packages emacs-xyz) emacs-dash)
             (@(gnu packages emacs-xyz) emacs-f)
             (@(gnu packages emacs-xyz) emacs-ht)
             (@(gnu packages emacs-xyz) emacs-hydra)
             (@(gnu packages emacs-xyz) emacs-markdown-mode)
             (@(gnu packages emacs-xyz) emacs-spinner)))
      (home-page "https://emacs-lsp.github.io/lsp-mode/")
      (synopsis "Emacs client and library for the Language Server Protocol")
      (description
       "LSP mode is a client and library implementation for the Language
Server Protocol.  This mode creates an IDE-like experience by providing
optional integration with other popular Emacs packages like Company, Flycheck,
and Projectile.")
      (license license:gpl3+))))

(define-public emacs-helm-lsp
  (package
    (name "emacs-helm-lsp")
    (version "0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emacs-lsp/helm-lsp")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1vq3qpqm3ndqyvf5bk8qhqcr60x9ykc0ipk2a43rr3yjm4z1b6s9"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(gnu packages emacs-xyz) emacs-helm)
           emacs-lsp-mode
           (@(gnu packages emacs-xyz) emacs-dash)))
    (home-page "https://github.com/emacs-lsp/helm-lsp")
    (synopsis "Provide LSP-enhanced completion for symbols")
    (description
     "This package enhances @code{helm} with completion for symbols from
workspaces with a LSP-compliant server running.")
    (license license:gpl3+)))

(define-public emacs-lsp-lens
  (package
    (inherit emacs-lsp-mode)
    (name "emacs-lsp-lens")
    (propagated-inputs
     (list emacs-lsp-mode))))

(define-public emacs-lsp-protocol
  (package
    (inherit emacs-lsp-mode)
    (name "emacs-lsp-procotol")))

(define-public emacs-lsp-java
  (package
    (name "emacs-lsp-java")
    (version "3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emacs-lsp/lsp-java")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1h0hqgjpk5mbylma1fkva0vx45achf0k7ab2c5y8a2449niww90h"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-cc-mode)
      emacs-dap-mode
      (@(gnu packages emacs-xyz) emacs-dash)
      (@(gnu packages emacs-xyz) emacs-f)
      (@(gnu packages emacs-xyz) emacs-ht)
      emacs-lsp-mode
      (@(gnu packages emacs-xyz) emacs-markdown-mode)
      (@(gnu packages emacs-xyz) emacs-request)
      emacs-treemacs
      ))
    (home-page "https://github.com/emacs-lsp/lsp-java/")
    (synopsis "Java support for lsp-mode")
    (description "Emacs Java IDE using Eclipse JDT Language Server.")
    (license license:gpl3+)))

(define-public emacs-treemacs-treelib
  (package
    (inherit emacs-treemacs)
    (name "emacs-treemacs-treelib")
    (propagated-inputs
     (list
      emacs-treemacs
      (@(gnu packages emacs-xyz) emacs-dash)
      (@(gnu packages emacs-xyz) emacs-s)))))

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

(define-public emacs-lsp-metals
  (package
    (inherit emacs-lsp-metals-base)
    (name "emacs-lsp-metals")
    (propagated-inputs
     (list emacs-lsp-metals-treeview
           emacs-lsp-metals-protocol
           emacs-lsp-mode
           emacs-lsp-lens
           emacs-dap-mode))))

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
      emacs-lsp-treemacs     ;; needed, but not via (require 'lsp-treemacs)
      emacs-dap-mode         ;; needed, but not via (require 'dap-mode)
      ))))

(define-public emacs-lsp-metals-treeview
  (package
    (inherit emacs-lsp-metals-base)
    (name "emacs-lsp-metals-treeview")
    (propagated-inputs
     (list emacs-lsp-metals-protocol
           emacs-lsp-treemacs
           emacs-lsp-mode
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
     (list emacs-lsp-mode))
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
      emacs-lsp-mode))
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

(define-public emacs-lsp-treemacs
  (package
    (name "emacs-lsp-treemacs")
    (version "0.4")
    (source
     (origin
       (method (@@ (guix packages) computed-origin-method))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256 #f)
       (uri
        (delay
          (with-imported-modules '((guix build emacs-utils)
                                   (guix build utils))
            #~(begin
                (use-modules (guix build utils)
                             (guix build emacs-utils))
                (let* ((dir (string-append "emacs-lsp-treemacs-" #$version)))

                  (set-path-environment-variable
                   "PATH" '("bin")
                   (list #+emacs-minimal
                         #+(canonical-package bash)
                         #+(canonical-package coreutils)
                         #+(canonical-package gzip)
                         #+(canonical-package tar)))

                  ;; Copy the upstream source
                  (copy-recursively
                   #+(%emacs-lsp-treemacs-upstream-source
                      #:commit version #:version version
                      #:hash
                      (content-hash
                       "05ivqa5900139jzjhwc3nggwznhm8564dz4ydcxym2ddd63571k0"))
                   dir)

                  (with-directory-excursion dir
                    ;; The icons are unclearly licensed and possibly non-free,
                    ;; see <https://github.com/emacs-lsp/lsp-treemacs/issues/123>
                    (with-directory-excursion "icons"
                      (for-each delete-file-recursively
                                '("eclipse" "idea" "netbeans")))

                    ;; Also remove any mentions in the source code.
                    (make-file-writable "lsp-treemacs-themes.el")
                    (emacs-batch-edit-file "lsp-treemacs-themes.el"
                      '(progn
                        (while (search-forward-regexp
                                "(treemacs-create-theme \"\\([^\"]*\\)\""
                                nil t)
                          (pcase (match-string 1)
                                 ("Iconless" nil)
                                 (_ (beginning-of-line)
                                    (kill-sexp)))
                          (basic-save-buffer)))))

                  (invoke "tar" "cvfa" #$output
                          "--mtime=@0"
                          "--owner=root:0"
                          "--group=root:0"
                          "--sort=name"
                          "--hard-dereference"
                          dir))))))))
    (build-system emacs-build-system)
    (arguments
     (list #:include #~(cons "^icons\\/" %default-include)))
    (propagated-inputs
     (list emacs-lsp-mode emacs-treemacs))
    (home-page "https://github.com/emacs-lsp/lsp-treemacs")
    (synopsis "Integration between LSP mode and treemacs")
    (description
     "This package provides integration between LSP mode and treemacs,
and implementation of treeview controls using treemacs as a tree renderer.")
    (license (list license:gpl3+
                   license:cc-by4.0  ; microsoft/vscode-icons
                   license:expat))))

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
             emacs-lsp-mode))
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
       (list emacs-lsp-mode
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
     (list emacs-lsp-mode))
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
       (list (@(gnu packages emacs-xyz) emacs-ht)
             (@(gnu packages emacs-xyz) emacs-yaml)
             (@(gnu packages emacs-xyz) emacs-s)
             (@(gnu packages emacs-xyz) emacs-f)
             (@(gnu packages emacs-xyz) emacs-dash)
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
      (@(gnu packages emacs-xyz) emacs-f)
      (@(gnu packages emacs-xyz) emacs-dash)
      emacs-dap-overlays
      (@(gnu packages emacs-xyz) emacs-posframe)
      (@(gnu packages emacs-xyz) emacs-ht)
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


(define-public emacs-lsp-ui
  (package
    (name "emacs-lsp-ui")
    (version "8.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emacs-lsp/lsp-ui")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1pd5lvjlmd6zq64py21yi5zxhcza9g5q48ngfivv7fi7pf3vsv00"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(gnu packages emacs-xyz) emacs-dash)
           emacs-lsp-mode
           (@(gnu packages emacs-xyz) emacs-markdown-mode)
           (@(gnu packages emacs-xyz) emacs-flycheck)))
    (home-page "https://github.com/emacs-lsp/lsp-ui")
    (synopsis "User interface extensions for @code{lsp-mode}")
    (description
     "@code{LSP-ui} contains several enhancements and integrations for
@code{lsp-mode}, such as visual flychecking, displaying references in-line,
and code peeking.")
    (license license:gpl3+)))

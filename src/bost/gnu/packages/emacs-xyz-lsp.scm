(define-module (bost gnu packages emacs-xyz-lsp)
  #:use-module (bost gnu packages emacs-xyz-done)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix deprecation)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages chez)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages java)
  #:use-module (gnu packages julia-xyz)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages music)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages racket)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages scheme)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages animation)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages screen)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages tor)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wget)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)

  #:use-module (bost guix build emacs-utils)
  )

(define-public emacs-lsp-mode
  (let ((commit
         "a478e03cd1a5dc84ad496234fd57241ff9dca57a"
         ;; "c77ba141063916ae5f36f84cb23230e1783b4f09"
         )
        (revision "0"))
    (package
      (name "emacs-lsp-mode")
      (version (git-version "9.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1p4979qbmllmmszmnyml0msxkza4pm14rdacmqczbfs3cs9n6bd3"
           ;; "0fkgd6bmdri6aa0f2qlxsp8imdn7zf2c30ymq9iqdcnly82ggd8k"
           ))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:emacs emacs                     ;need libxml support
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:test-command #~(list "ert-runner" "-L" "." "-L" "clients"
                               "-t" "!no-win" "-t" "!org")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'move-clients-libraries
              ;; Move all clients libraries at top-level, as is done, e.g., in
              ;; MELPA.
              (lambda _
                (for-each (lambda (f)
                            (install-file f "."))
                          (find-files "clients/" "\\.el$"))))
            (add-before 'check 'skip-failing-tests
              (lambda _
                (substitute* "test/lsp-common-test.el"
                  (("\\(require 'elenv" all)
                   (string-append all " nil t"))
                  (("\\(ert-deftest lsp--path-to-uri-1 .*" all)
                   (string-append all "(skip-unless (featurep 'elenv))"))
                  (("\\(ert-deftest lsp-byte-compilation-test .*" all)
                   (string-append all "(skip-unless nil)"))
                  (("\\(ert-deftest lsp--build-.*-response-test-[34] .*" all)
                   (string-append all "(skip-unless nil)")))
                (substitute* "test/lsp-mode-test.el"
                  (("\\(ert-deftest lsp--merge-results .*" all)
                   (string-append all "(skip-unless nil)")))
                (substitute* "test/lsp-integration-test.el"
                  (("\\(ert-deftest lsp-.*-hover-request(-tick)? .*" all)
                   (string-append all "(skip-unless nil)"))
                  (("\\(ert-deftest lsp-test-current-buffer-mode .*" all)
                   (string-append all "(skip-unless nil)")))
                (delete-file "test/lsp-clangd-test.el")))
            (add-before 'check 'set-home
              (lambda _ (setenv "HOME" (getenv "TMPDIR"))))
            (add-after 'unpack 'enable-plists
              (lambda _
                (substitute* "lsp-protocol.el"
                  ;; This is faster, and it's officially recommended,
                  ;; and it's required by emacs-lsp-booster.
                  ;; See also:
                  ;; <https://emacs-lsp.github.io/lsp-mode/page/performance/>.
                  (("\\(getenv \"LSP_USE_PLISTS\"\\)") "t"))))
            (add-before 'move-clients-libraries 'fix-patch-el-files
              ;; /bin/ksh is only used on macOS, which we don't support, so we
              ;; don't want to add it as input.
              (lambda _
                (substitute* '("clients/lsp-csharp.el" "clients/lsp-fsharp.el")
                  (("/bin/ksh") "ksh"))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "lsp-mode")
                ))
            )))
      (propagated-inputs
       (list
        emacs-dash
        emacs-f
        emacs-ht
        emacs-hydra
        emacs-markdown-mode
        emacs-spinner))
      (native-inputs
       (list
        emacs-deferred
        emacs-el-mock
        emacs-ert-runner))
      (home-page "https://emacs-lsp.github.io/lsp-mode/")
      (synopsis "Emacs client and library for the Language Server Protocol")
      (description
       "LSP mode is a client and library implementation for the Language
Server Protocol.  This mode creates an IDE-like experience by providing
optional integration with other popular Emacs packages like Company, Flycheck,
and Projectile.")
      (license license:gpl3+))))

(define-public emacs-lsp-ui
  (let ((commit "a0dde8b52b4411cbac2eb053ef1515635ea0b7ed")
        (revision "0"))
    (package
      (name "emacs-lsp-ui")
      (version (git-version "9.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-ui.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0zyv1rar9vmxxs5n0mly5m9k5m8gia85c8c5rjap8fvrrbmjcfaa"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-lsp-mode
        emacs-markdown-mode
        emacs-flycheck))
      (home-page "https://github.com/emacs-lsp/lsp-ui")
      (synopsis "User interface extensions for @code{lsp-mode}")
      (description
       "@code{LSP-ui} contains several enhancements and integrations for
@code{lsp-mode}, such as visual flychecking, displaying references in-line,
and code peeking.")
      (license license:gpl3+))))

(define-public emacs-lsp-haskell
  (let ((commit "081d5115ceb1f1647497a8a3de4ca0702aaadb48")
        (revision "0"))
    (package
      (name "emacs-lsp-haskell")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-haskell.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cjxf2xqdmhi1mq4d1k4k8xh1lqglr8s6r1yw12b8956sjm9ykv9"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-haskell-mode
        emacs-lsp-mode))
      (home-page "https://github.com/emacs-lsp/lsp-haskell")
      (synopsis "LSP client integration for Haskell in Emacs")
      (description
       "Emacs integration for the Haskell Language Server (HLS) via lsp-mode.
  It facilitates features such as code completion,diagnostics, and formatting
 by launching and configuring HLS automatically.  Users can customize server
 settings through Emacs' customization system, and support is provided for
 both haskell-mode and haskell-literate-mode.")
      (license license:gpl3+))))

(define-public emacs-lsp-pyright
  (let ((commit "73377169beff8fe22cc6d52d65099db88bf49679")
        (revision "0"))
    (package
      (name "emacs-lsp-pyright")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-pyright.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1nbvl850ifnzfbncbl9wvarbh3l8r3yapj6c0pxk2r5b9mifgp75"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-ht
        emacs-dash
        emacs-lsp-mode))
      (home-page "https://github.com/emacs-lsp/lsp-pyright")
      (synopsis "LSP client integration for Python using (Based)Pyright")
      (description
       "This package integrates the Pyright and BasedPyright language servers
 with Emacs' lsp-mode, providing advanced Python language support.  It offers
features such as type checking, auto-import completions, inlay hints, and
diagnostics.  The package automatically detects virtual environments and
supports extensive customization through Emacs variables and
pyrightconfig.json.")
      (license license:gpl3+))))

(define-public emacs-origami
  (package
    (inherit emacs-origami-el)
    (name "emacs-origami")))

(define-public emacs-lsp-origami
  (let ((commit "f757a7b45538b6cf1da04183e99171e59e92c9a7")
        (revision "0"))
    (package
      (name "emacs-lsp-origami")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-origami.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "05lfm13bg7na7p0372p5arjbyr9m9fyrq3v7q1aavrg6vd2bdc6q"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-lsp-mode
        emacs-origami))
      (home-page "https://github.com/emacs-lsp/lsp-origami")
      (synopsis "Origami-based code folding integration for lsp-mode in Emacs")
      (description
       "This package integrates origami.el with Emacs' lsp-mode by utilizing
 the Language Server Protocol's textDocument/foldingRange feature.  It enables
 structural code folding based on language server data, providing accurate and
 efficient folding capabilities.  Users can activate it by adding
 `lsp-origami-try-enable` to `lsp-after-open-hook`, enhancing code navigation
 and readability.")
      (license license:gpl3+))))

(define-public emacs-lsp-python-ms
  (let ((commit "7bda327bec7b219d140c34dab4b1e1fbd41bc516")
        (revision "0"))
    (package
      (name "emacs-lsp-python-ms")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-python-ms.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1i7l06cw25fb202fbhqhx8xyfynz6sinka9ybh8n4cxjq19ffm8b"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-lsp-mode))
      (home-page "https://github.com/emacs-lsp/lsp-python-ms")
      (synopsis "LSP client integration for Microsoft's Python Language
 Server in Emacs")
      (description
       "This package integrates Microsoft's Python Language Server with Emacs'
 lsp-mode, providing features such as code completion, diagnostics, and
 navigation for Python development.  It is now deprecated in favor of
 lsp-pyright, which offers improved performance and ongoing support.")
      (license license:bsd-3))))

(define emacs-dap-base
  (let ((commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0"))
    (package
      (name "emacs-dap-base")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cgqhv036fzcv9dg89k5czcfx5w56jkm4rm216lra004nph0sj82"))))
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
      (home-page "https://github.com/emacs-lsp/dap-mode")
      (synopsis "Debug Adapter Protocol client integration for Emacs")
      (description
       "Emacs client for the Debug Adapter Protocol (DAP),enabling interactive
debugging capabilities within the editor.  It integrates with lsp-mode and
supports various programming languages, including Java,Python, Ruby, Elixir,
and C/C++.  Features include breakpoints, call stacks,variable inspection, and
a hydra-based UI for controlling debug sessions. Users can define reusable
debug templates and configure per-language adapters to streamline the
debugging workflow.")
      (license license:gpl3+))))

(define all-info-include (quote (list "^[^/]*\\.info$" "^doc/.*\\.info$")))

(define-public emacs-dap-launch
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-launch")
    (arguments
     (list #:include `(cons*
                       "^dap-launch\\.el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-dap-tasks
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-tasks")
    (arguments
     (list #:include `(cons*
                       "^dap-tasks.\\el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-dap-utils
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-utils")
    (arguments
     (list #:include `(cons*
                       "^dap-utils\\.el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-dap-mode))))

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
      emacs-dap-mode))))

(define-public emacs-dap-overlays
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-overlays")
    (arguments
     (list #:include `(cons*
                       "^dap-overlays\\.el$"
                       ,all-info-include)))))

(define-public emacs-lsp-metals
  (let ((commit "e1d9d04f3bab7e6e74916054b36ab1a87e831367")
        (revision "0"))
    (package
      (name "emacs-lsp-metals")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-metals.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00jyy2aqbci9k9x4rxxadpwlkpajg0xp0600ddk630nxfnr77vbv"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "lsp-metals-protocol")
                (bst:write-pkg-file "lsp-metals-treeview")
                )))))
      (propagated-inputs
       (list
        emacs-scala-mode
        emacs-lsp-mode
        emacs-lsp-treemacs
        emacs-dap-mode
        emacs-dash
        emacs-f
        emacs-ht
        (@(bost gnu packages emacs-xyz-magit) emacs-treemacs)
        ))
      (home-page "https://github.com/emacs-lsp/lsp-metals")
      (synopsis "Scala support for LSP mode")
      (description "This package is an Emacs Scala IDE using LSP mode to connect
to Metals.")
      (license license:gpl3+))))

;; (define* (%emacs-lsp-treemacs-upstream-source #:key commit version hash)
;;   (origin
;;     (method git-fetch)
;;     (uri (git-reference
;;           (url "https://github.com/emacs-lsp/lsp-treemacs.git")
;;           (commit commit)))
;;     (file-name (git-file-name "emacs-lsp-treemacs" version))
;;     (hash hash)))

;; (define-public emacs-lsp-treemacs
;;   (package
;;     (name "emacs-lsp-treemacs")
;;     (version "0.5")
;;     (source
;;      (origin
;;        (method (@@ (guix packages) computed-origin-method))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256 #f)
;;        (uri
;;         (delay
;;           (with-imported-modules '((guix build emacs-utils)
;;                                    (guix build utils))
;;             #~(begin
;;                 (use-modules (guix build utils)
;;                              (guix build emacs-utils))
;;                 (let* ((dir (string-append "emacs-lsp-treemacs-" #$version)))

;;                   (set-path-environment-variable
;;                    "PATH" '("bin")
;;                    (list #+emacs-minimal
;;                          #+(canonical-package bash)
;;                          #+(canonical-package coreutils)
;;                          #+(canonical-package gzip)
;;                          #+(canonical-package tar)))

;;                   ;; Copy the upstream source
;;                   (copy-recursively
;;                    #+(%emacs-lsp-treemacs-upstream-source
;;                       #:commit version #:version version
;;                       #:hash
;;                       (content-hash
;;                        "0clifff6xhi1irmx08wjdl13vlh05a7c108hmzzqmmklg76zyr04"))
;;                    dir)

;;                   (with-directory-excursion dir
;;                     ;; The icons are unclearly licensed and possibly non-free,
;;                     ;; see <https://github.com/emacs-lsp/lsp-treemacs/issues/123>
;;                     (with-directory-excursion "icons"
;;                       (for-each delete-file-recursively
;;                                 '("eclipse" "idea" "netbeans")))

;;                     ;; Also remove any mentions in the source code.
;;                     (make-file-writable "lsp-treemacs-themes.el")
;;                     (emacs-batch-edit-file "lsp-treemacs-themes.el"
;;                       '(progn
;;                         (while (search-forward-regexp
;;                                 "(treemacs-create-theme \"\\([^\"]*\\)\""
;;                                 nil t)
;;                           (pcase (match-string 1)
;;                                  ("Iconless" nil)
;;                                  (_ (beginning-of-line)
;;                                     (kill-sexp)))
;;                           (basic-save-buffer)))))

;;                   (invoke "tar" "cvfa" #$output
;;                           "--mtime=@0"
;;                           "--owner=root:0"
;;                           "--group=root:0"
;;                           "--sort=name"
;;                           "--hard-dereference"
;;                           dir))))))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list #:include #~(cons "^icons\\/" %default-include)))
;;     (propagated-inputs
;;      (list emacs-lsp-mode emacs-treemacs))
;;     (home-page "https://github.com/emacs-lsp/lsp-treemacs")
;;     (synopsis "Integration between LSP mode and treemacs")
;;     (description
;;      "This package provides integration between LSP mode and treemacs,
;; and implementation of treeview controls using treemacs as a tree renderer.")
;;     (license (list license:gpl3+
;;                    license:cc-by4.0  ; microsoft/vscode-icons
;;                    license:expat))))

(define-public emacs-lsp-treemacs
  (let ((commit "3e5550f278db74f15ebe34add0138b138207ec08")
        (revision "0"))
    (package
      (name "emacs-lsp-treemacs")
      (version (git-version "0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-treemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dkbq1sc1xwlvy1baxc4px9yi6lp614nl3n9vidpxsmbryaapimq"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^icons\\/" %default-include)
        )
       )
      (propagated-inputs
       (list
        emacs-dash
        emacs-f
        emacs-ht
        (@(bost gnu packages emacs-xyz-magit) emacs-treemacs)
        emacs-lsp-mode
        ))
      (home-page "https://github.com/emacs-lsp/lsp-treemacs")
      (synopsis "Integration between LSP mode and treemacs")
      (description
       "This package provides integration between LSP mode and treemacs, and
implementation of treeview controls using treemacs as a tree renderer.")
      (license (list license:gpl3+
                     license:cc-by4.0  ; microsoft/vscode-icons
                     license:expat)))))

(define-public emacs-lsp-docker
  (let ((commit "ff41f4a76b640d39dc238bacba7f654c297827fa")
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
          (base32 "1frlfcy5vwn8rprgfyrh2qjp2cwwyjsgsp112cxws98s91601v1j"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-lsp-mode
        emacs-yaml
        ))
      (home-page "https://github.com/emacs-lsp/lsp-docker")
      (synopsis "Leverage LSP mode in Docker environment")
      (description
       "This package provides scripts and configurations to leverage LSP mode
in Docker environment.")
      (license license:gpl3+))))

(define-public emacs-dap-mode
  (let ((commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0"))
    (package
      (name "emacs-dap-mode")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cgqhv036fzcv9dg89k5czcfx5w56jkm4rm216lra004nph0sj82"))))
      (build-system emacs-build-system)
      (arguments
       (list #:include #~(cons* "\\.png$" %default-include)))
      (propagated-inputs
       (list emacs-bui
             emacs-lsp-docker
             emacs-lsp-mode
             emacs-posframe
             emacs-lsp-treemacs))
      (home-page "https://emacs-lsp.github.io/dap-mode")
      (synopsis "Emacs client/library for Debug Adapter Protocol")
      (description
       "Dap mode is an Emacs client/library for Debug Adapter
Protocol (DAP), a wire protocol for communication between client and
debug server.  It is similar to the LSP but provides integration with
Debug server.")
      (license license:gpl3+))))

(define-public emacs-lsp-java
  (let ((commit "21c89243adfca4b70e244b0a10cfaa0cd78c61e7")
        (revision "1"))
    (package
      (name "emacs-lsp-java")
      (version (git-version "3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-java.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mp99vyi104r3jm4dlg0c9ri6w543h70mi5qq797xlb70n3sxqw3"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dap-mode
        emacs-lsp-mode
        emacs-markdown-mode
        emacs-dash
        emacs-f
        emacs-ht
        emacs-request
        (@(bost gnu packages emacs-xyz-magit) emacs-treemacs)
        ))
      (home-page "https://github.com/emacs-lsp/lsp-java/")
      (synopsis "Java support for lsp-mode")
      (description "Emacs Java IDE using Eclipse JDT Language Server.")
      (license license:gpl3+))))

(define-public emacs-lsp-lens
  (package
    (inherit
     emacs-lsp-mode
     )
    (name "emacs-lsp-lens")))

(define-public emacs-lsp-protocol
  (package
    (inherit
     emacs-lsp-mode
     )
    (name "emacs-lsp-procotol")))

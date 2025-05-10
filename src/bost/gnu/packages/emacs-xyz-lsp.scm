(define-module (bost gnu packages emacs-xyz-lsp)
  #:use-module (bost gnu packages emacs-xyz-done)
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

(define-public emacs-lsp-haskell
  (let [(commit "081d5115ceb1f1647497a8a3de4ca0702aaadb48")
        (revision "0")]
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
        emacs-lsp-mode
        ))
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
  (let [(commit "73377169beff8fe22cc6d52d65099db88bf49679")
        (revision "0")]
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
        emacs-lsp-mode
        ))
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
  (let [(commit "f757a7b45538b6cf1da04183e99171e59e92c9a7")
        (revision "0")]
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
  (let [(commit "7bda327bec7b219d140c34dab4b1e1fbd41bc516")
        (revision "0")]
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
      (propagated-inputs
       (list
        emacs-lsp-mode
        ))
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
  (let [(commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0")]
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
    (propagated-inputs
     (list
      emacs-lsp-mode
      ))))

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
      emacs-lsp-mode
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
      emacs-dap-mode
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
      emacs-dap-mode
      ))))

(define-public emacs-dap-overlays
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-overlays")
    (arguments
     (list #:include `(cons*
                       "^dap-overlays\\.el$"
                       ,all-info-include)))))

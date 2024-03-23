(define-module (bost gnu packages emacs-xyz)
  ;; #:use-module (utils)
  #:use-module (bost utils)  ;; for build
  #:use-module (gnu packages emacs-xyz)
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
  #:use-module (gnu packages uml)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wget)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)

  #:use-module (bost gnu packages emacs-xyz-done)
  #:use-module (bost gnu packages emacs-xyz--dap-mode)
  #:re-export
  (
   emacs-dap-launch
   emacs-dap-tasks
   emacs-lsp-docker
   emacs-dap-mode
   emacs-dap-utils
   emacs-dap-chrome
   emacs-dap-overlays

   emacs-color-theme-sanityinc-tomorrow
   emacs-color-theme-sanityinc-solarized
   emacs-lsp-python-ms
   emacs-moe-theme
   emacs-slim-mode
   emacs-zop-to-char
   emacs-font-utils
   emacs-lush-theme
   emacs-vi-tilde-fringe
   emacs-popwin
   emacs-lsp-volar
   emacs-centered-cursor-mode
   emacs-company-statistics
   emacs-json-navigator
   emacs-eziam-themes
   emacs-helm-cider-history
   emacs-flx
   emacs-lsp-haskell
   emacs-helm-css-scss
   emacs-auto-yasnippet
   emacs-composer
   emacs-erc-social-graph
   emacs-hlint-refactor
   emacs-chocolate
   emacs-gruber-darker
   emacs-writeroom-mode
   emacs-js2-refactor
   emacs-origami
   emacs-farmhouse-themes
   emacs-farmhouse-light-mod-theme
   emacs-web-completion-data
   emacs-company-web
   emacs-gptel
   emacs-copilot
   emacs-ample-zen-theme
   emacs-anti-zenburn-theme
   emacs-apropospriate-theme
   emacs-badwolf-theme
   emacs-birds-of-paradise-plus-theme
   emacs-bubbleberry-theme
   emacs-busybee-theme
   emacs-cherry-blossom-theme
   emacs-clues-theme
   emacs-dakrone-theme
   emacs-darkmine-theme
   emacs-darkokai-theme
   emacs-darktooth-theme
   emacs-django-theme
   emacs-espresso-theme
   emacs-flatland-theme
   emacs-flatui-theme
   emacs-gandalf-theme
   emacs-gotham-theme
   emacs-grandshell-theme
   emacs-gruber-darker-theme
   emacs-hc-zenburn-theme
   emacs-hemisu-theme
   emacs-heroku-theme
   emacs-inkpot-theme
   emacs-ir-black-theme
   emacs-jazz-theme
   emacs-jbeans-theme
   emacs-light-soap-theme
   emacs-madhat2r-theme
   emacs-majapahit-themes
   emacs-material-theme
   emacs-minimal-theme
   emacs-color-theme
   emacs-molokai-theme
   emacs-monochrome-theme
   emacs-mustang-theme
   emacs-naquadah-theme
   emacs-noctilux-theme
   emacs-obsidian-theme
   emacs-occidental-theme
   emacs-oldlace-theme
   emacs-organic-green-theme
   emacs-phoenix-dark-mono-theme
   emacs-phoenix-dark-pink-theme
   emacs-planet-theme
   emacs-professional-theme
   emacs-purple-haze-theme
   emacs-reverse-theme
   emacs-seti-theme
   emacs-smyx-theme
   emacs-soft-charcoal-theme
   emacs-soft-morning-theme
   emacs-soft-stone-theme
   emacs-subatomic256-theme
   emacs-subatomic-theme
   emacs-sunny-day-theme
   emacs-tango-2-theme
   emacs-tango-plus-theme
   emacs-tangotango-theme
   emacs-toxi-theme
   emacs-twilight-anti-bright-theme
   emacs-twilight-bright-theme
   emacs-twilight-theme
   emacs-ujelly-theme
   emacs-underwater-theme
   emacs-white-sand-theme
   emacs-zen-and-art-theme
   emacs-omtose-phellack-theme
   emacs-unicode-fonts
   emacs-sublime-themes
   emacs-cider-hydra
   emacs-flycheck-clj-kondo
   emacs-flycheck-joker
   emacs-kaocha-runner
   emacs-sayid
   emacs-kaolin-themes
   emacs-emacsql-sqlite3
   emacs-zonokai-emacs
   emacs-treemacs
   emacs-lsp-treemacs
   emacs-kill-buffers
   emacs-copy-sexp
   emacs-jump-last
   emacs-evil-iedit-state
   emacs-tweaks
   emacs-term-cursor
   emacs-lsp-pyright
   emacs-lsp-origami
   emacs-winum
   emacs-frame-fns
   emacs-frame-cmds
   emacs-zoom-frm
   ))

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
      emacs-cc-mode
      emacs-dap-mode
      emacs-dash
      emacs-f
      emacs-ht
      emacs-lsp-mode
      emacs-markdown-mode
      emacs-request
      emacs-treemacs
      ))
    (home-page "https://github.com/emacs-lsp/lsp-java/")
    (synopsis "Java support for lsp-mode")
    (description "Emacs Java IDE using Eclipse JDT Language Server.")
    (license license:gpl3+)))

(define-public emacs-lsp-protocol
  (let ((commit
         "193c714c1d74afeee154b255fbe85025cc4ee690")
        (revision "0"))
    (package
      (name "emacs-lsp-protocol")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "03hcwhfv919rj1723pdg56p25zcv0rdp2adp3w8jaz4y16b8xdzd"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:exclude #~(cons*
                     "^lsp-completion\\.el$"
                     "^lsp-diagnostics\\.el$"
                     "^lsp-dired\\.el$"
                     "^lsp\\.el$"
                     "^lsp-headerline\\.el$"
                     "^lsp-icons\\.el$"
                     "^lsp-ido\\.el$"
                     "^lsp-iedit\\.el$"
                     "^lsp-lens\\.el$"
                     "^lsp-mode\\.el$"
                     "^lsp-modeline\\.el$"
                     "^lsp-semantic-tokens\\.el$"
                     %default-exclude)
        #:phases
        #~(modify-phases %standard-phases
          (add-before 'patch-el-files 'ksh
            (lambda _
              (delete-file "clients/lsp-csharp.el")
              (delete-file "clients/lsp-fsharp.el"))))
        ))
      (propagated-inputs
       (list emacs-s emacs-ht emacs-dash))
      (home-page
       "https://github.com/emacs-lsp/lsp-mode.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-lsp-metals-protocol
  (let ((commit
         "da7e54ed65f4e153c94b9c54689908dce142ef37")
        (revision "0"))
    (package
      (name "emacs-lsp-metals-protocol")
      (version (git-version "1.0.0" revision commit))
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
      (propagated-inputs (list emacs-lsp-protocol))
      (arguments
       (list
        #:exclude #~(cons*
                     "^lsp-metals\\.el$"
                     "^lsp-metals-treeview\\.el$"
                     %default-exclude)
        ))
      (home-page
       "https://github.com/emacs-lsp/lsp-metals.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-lsp-metals-treeview
  (let ((commit
          "da7e54ed65f4e153c94b9c54689908dce142ef37")
        (revision "0"))
    (package
      (name "emacs-lsp-metals-treeview")
      (version (git-version "1.0.0" revision commit))
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
      (propagated-inputs
        (list emacs-lsp-metals-protocol
              emacs-lsp-treemacs
              emacs-lsp-mode
              emacs-treemacs-treelib
              emacs-f
              emacs-dash
              emacs-ht))
      (home-page
        "https://github.com/emacs-lsp/lsp-metals.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-lsp-metals
  (let ((commit
         "da7e54ed65f4e153c94b9c54689908dce142ef37")
        (revision "0"))
    (package
      (name "emacs-lsp-metals")
      (version (git-version "1.0.0" revision commit))
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
      (propagated-inputs
       (list emacs-lsp-metals-treeview
             emacs-lsp-metals-protocol
             emacs-lsp-lens
             emacs-dap-mode
             emacs-lsp-mode))
      (home-page
       "https://github.com/emacs-lsp/lsp-metals.git")
      (synopsis "Scala support for LSP mode")
      (description "This package is an Emacs Scala IDE using LSP mode to connect
to Metals.")
      (license license:gpl3+))))

(define-public emacs-treemacs-treelib
  (let ((commit
         "8c6df39f01a4d47fda2cc943645fa067f771b748")
        (revision "0"))
    (package
      (name "emacs-treemacs-treelib")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "12jfivx5gqayv8n2q08f7inwqmxck51q0r9nxgb1m1kzi5vdisqp"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons*
                     "^src/elisp/treemacs-treelib\\.el$"
                     %default-include)))
      (propagated-inputs
       (list emacs-treemacs emacs-dash emacs-s))
      (home-page
       "https://github.com/Alexander-Miller/treemacs.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

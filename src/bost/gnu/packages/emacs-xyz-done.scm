(define-module (bost gnu packages emacs-xyz-done)
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
  #:use-module (gnu packages emacs-build)
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

  #:use-module (gnu packages emacs-xyz)
  )

(define-public emacs-color-theme-sanityinc-solarized ;; PL sent
  (let ((commit "9c62a49fe0a5ff456bcf3984ba825e75861534b9")
        (revision "0"))
    (package
      (name "emacs-color-theme-sanityinc-solarized")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/color-theme-sanityinc-solarized")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0vakjdm5xf7ahxf39j4bc38irkwyv8xkp45akqfc7z252vpxi44k"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/purcell/color-theme-sanityinc-solarized")
      (synopsis "Solarized color themes for Emacs")
      (description
       "An alternate Emacs color-theme version of Ethan Schoonover's \"Solarized\"
theme pair.")
      (license license:gpl3+))))

(define-public emacs-moe-theme
  (package
    (name "emacs-moe-theme")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kuanyui/moe-theme.el")
               (commit
                 "171d76b0c69e42a9d7b62c5c472944951cb2be6c")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0g4dci8r0p69vmhbp5djrjvqv7z90xw7pznzapgxy8dqmbvc14k0"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/kuanyui/moe-theme.el")
    (synopsis
     "A customizable colorful eye-candy theme for Emacser. Moe, moe, kyun!")
    (description
     "A customizable colorful eye-candy theme for Emacser. Moe, moe, kyun!")
    (license license:gpl3+)))

(define-public emacs-slim-mode
  (package
    (name "emacs-slim-mode")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "http://github.com/slim-template/emacs-slim")
               (commit
                 "3636d18ab1c8b316eea71c4732eb44743e2ded87")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1sqylm6ipmlh9249mmwfb16b4pv94cvzdwvi3zakdpz713phyjw5"))))
    (build-system emacs-build-system)
    (home-page "http://slim-lang.com/")
    (synopsis "Syntax highlighting for Slim.")
    (description
     "slim-mode provides Emacs support for editing Slim templates. It's based
on haml-mode.")
    (license license:gpl3+)))

(define-public emacs-lush-theme
  (package
    (name "emacs-lush-theme")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/andre-richter/emacs-lush-theme")
               (commit
                 "645e1959143532df8f7ef90e1184e9556df18af7")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0j9gbr3chaxc16yysyaaa1n2cvlrdc1y063l1kxj0mf435d1l7py"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/andre-richter/emacs-lush-theme")
    (synopsis "A dark theme with lush colors for Emacs24")
    (description "A dark theme with lush colors for Emacs24.")
    (license license:expat)))

(define-public emacs-vi-tilde-fringe ;; PR sent
  (let ((commit "f1597a8d54535bb1d84b442577b2024e6f910308")
        (revision "0"))
    (package
      (name "emacs-vi-tilde-fringe")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/vi-tilde-fringe")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wdm8k49zl6i6wnh7vjkswdh5m9lix56jv37xvc90inipwgs402z"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/syl20bnr/vi-tilde-fringe")
      (synopsis "Display tildes on empty lines in the Emacs fringe a la Vi")
      (description
       "Display tildes on empty lines in the Emacs fringe a la Vi.")
      (license license:gpl3+))))

(define-public emacs-popwin ;; PR sent
  (let ((commit "58adcd0ca7c3dbd58626ec7019252d64cbc73042")
        (revision "2"))
    (package
      (name "emacs-popwin")
      (version (git-version "1.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/popwin")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mqwzc6fwhwq1kl8b3i1hm2ylfh8blrxrw6mzr5wyifbwpg7dq10"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/emacsorphanage/popwin")
      (synopsis "Popup window manager for Emacs")
      (description
       "This package provides utilities for treating certain windows as @dfn{pop
up windows}, which close automatically when quitting a command or selecting
another window.")
      (license license:gpl3+))))

(define-public emacs-centered-cursor-mode
  (package
    (name "emacs-centered-cursor-mode")
    (version "0.5.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/andre-r/centered-cursor-mode.el")
             (commit
              "ebaeb80fba0bafdf6f95706308123dec2cf4b99f")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0rf6csfn3sprr4mlwq5gzl5di9xyhd4v46927vjhjj3k1qahvmpb"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/andre-r/centered-cursor-mode.el")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-company-statistics
  (package
    (name "emacs-company-statistics")
    (version "0.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/company-mode/company-statistics")
             (commit
              "e62157d43b2c874d2edbd547c3bdfb05d0a7ae5c")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "12mwviz1mwx4ywks2lkmybbgh1wny67wkzlq5y3ml8gvyc288n3i"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-company))
    (home-page "https://github.com/company-mode/company-statistics")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-json-navigator
  (package
    (name "emacs-json-navigator")
    (version "0.1.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/DamienCassou/json-navigator")
               (commit
                 "afd902e0b5cde37fad4786515a695d17f1625286")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0gn19qn11n86rn9b6knp9fb5jx9m2q1khhm4vnh0vjck7jxi9sqr"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))
    (home-page
      "https://github.com/DamienCassou/json-navigator")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-eziam-themes
  (package
    (name "emacs-eziam-themes")
    (version "4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thblt/eziam-theme-emacs")
             (commit
              "7fba717293072d0afdbd1c45351ddf47b26b3064")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "14v23aqyl971yaw00xmqymlmw6abkx1biflqy1q0908q6fzg170n"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/thblt/eziam-theme-emacs")
    (synopsis
     "A mostly grayscale theme for Emacs, inspired by Tao and Leuven.")
    (description
     "An Emacs theme, which tries to combine the simplicity of Tao with the
org-mode goodness of Leuven. Unlike Tao, keeps some very minimal color
indications, while remaining mainly grayscale and trying to avoid the “angry
fruit salad” syndrome. Unlike Leuven, it remains mostly grayscale, with no
color for syntax, and easily allows multiple variants.")
    (license license:gpl3+)))

(define-public emacs-erc-social-graph
  (package
    (name "emacs-erc-social-graph")
    (version "1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/vibhavp/erc-social-graph")
               (commit
                 "e6ef3416a1c5064054bf054d9f0c1c7bf54a9cd0")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0k3gp4c74g5awk7v9lzb6py3dvf59nggh6dw7530cswxb6kg2psa"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/vibhavp/erc-social-graph")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-hlint-refactor
  (package
    (name "emacs-hlint-refactor")
    (version "0.0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mpickering/hlint-refactor-mode")
               (commit
                 "c4307f86aad6d02e32e9b30cb6edc115584c791c")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1c71w9s34n0i7mm4njchxn6s3ri1y6mh3akgbg4nq41d42h8iap3"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/mpickering/hlint-refactor-mode")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-chocolate
  (package
    (name "emacs-chocolate")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SavchenkoValeriy/emacs-chocolate-theme")
             (commit
              "ccc05f7ad96d3d1332727689bf6250443adc7ec0")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1d8a9jwv9y0sncw24k840c8yyrig30f2d6q2zqlc09f05yzq9p9p"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-autothemer))
    (home-page "https://github.com/SavchenkoValeriy/emacs-chocolate-theme")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-gruber-darker
  (package
    (name "emacs-gruber-darker")
    (version "0.7")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/rexim/gruber-darker-theme")
               (commit
                 "6de7a37d7b18cf3f0ec51db799f4f2aa6e3e89ff")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1bqjn67s0kcnf86qjxz0ayaash4rbwfwqsppqyy7p9qfc00cjix2"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/rexim/gruber-darker-theme")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-writeroom-mode
  (package
    (inherit emacs-writeroom)
    (name "emacs-writeroom-mode")))

(define-public emacs-js2-refactor
  (package
    (inherit emacs-js2-refactor-el)
    (name "emacs-js2-refactor")))

(define-public emacs-farmhouse-themes
  (let ((commit
         "30c763d01611dad88f1a1ff88451431e2629016d")
        (revision "0"))
    (package
      (name "emacs-farmhouse-themes")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/farmhouse-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1ywm5k2zwamqm5h13fydsvahpfml5s292xy1ds1k9j33r44rqcyl"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/emacsorphanage/farmhouse-themes")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-farmhouse-light-mod-theme
  (let ((commit "1008a772e65735852b7fd77ecba16897b32c268b")
        (revision "0"))
    (package
      (name "emacs-farmhouse-light-mod-theme")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/farmhouse-light-mod-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1p3ygg1c2qd2051hfxmvyl29xp7z4qi3skj2dsksgsp3gfi8qg88"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/Bost/farmhouse-light-mod-theme")
      (synopsis "Modded farmhouse-light theme for Emacs")
      (description "Modded farmhouse-light theme for Emacs.")
      (license license:gpl3+))))

(define-public emacs-web-completion-data
  (let ((commit "c272c94e8a71b779c29653a532f619acad433a4f")
        (revision "0"))
    (package
      (name "emacs-web-completion-data")
      (version (git-version "0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/osv/web-completion-data")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "19nzjgvd2i5745283ck3k2vylrr6lnk9h3ggzwrwdhyd3m9433vm"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page
       "https://github.com/osv/web-completion-data")
      (synopsis "Shared web completion data for Emacs ac-html and company-web")
      (description
       "Shared web completion data dependency package for Emacs ac-html and
company-web.")
      (license license:gpl3+))))

(define-public emacs-company-web
  (let ((commit "863fb84b81ed283474e50330cd8d27b1ca0d74f1")
        (revision "0"))
    (package
      (name "emacs-company-web")
      (version (git-version "2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/osv/company-web")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0awl7b6p4vrxv0cy5xcxwihqzgk7kk6l7jsivyrj8s0f5jv2q71v"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-company
        emacs-dash
        emacs-web-completion-data))
      (home-page "https://github.com/osv/company-web")
      (synopsis "Emacs company backend for html, jade and slim")
      (description
       "Company-web is an alternative Emacs plugin for autocompletion in
html-mode, web-mode, jade-mode, slim-mode and use data of ac-html.  It uses
company-mode.")
      (license license:gpl3+))))

(define-public emacs-company-anaconda
  (let ((commit "169252fca79a79da41ef22f2ec0eab0cf1313966")
        (revision "0"))
    (package
      (name "emacs-company-anaconda")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pythonic-emacs/company-anaconda.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1kq035si3syi3pcacr6i5pbayqag5rfx4xw8brmrc92z5wlqm3ba"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-anaconda-mode
        emacs-company
        emacs-dash
        emacs-s))
      (home-page "https://github.com/pythonic-emacs/company-anaconda.git")
      (synopsis
       "Company backend for Python code completion using Anaconda mode")
      (description
       "This package provides a Company backend for Python code completion,
 leveraging Anaconda mode in Emacs.  It integrates with the Company (Complete
 Anything) framework to offer intelligent and context-aware code completions
 for Python, enhancing the coding experience with more accurate and efficient
 suggestions.")
      (license license:gpl3+))))

(define-public emacs-copilot
  (let ((commit "d2126f288cebd9cd7e768c53a4cbfa6eedcb0666")
        (revision "0"))
    (package
      (name "emacs-copilot")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/copilot-emacs/copilot.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "14qnhp9pzilkrkaz2w52ylanjg44idi41dg6g7lqqc4fk0ib12kj"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^assets/" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'substitute-copilot-node-executable
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "copilot.el"
                  ("copilot-node-executable"
                   (search-input-file inputs "/bin/node"))))))))
      (inputs (list (@(gnu packages node) node-lts)))
      (propagated-inputs
       (list
        ;; emacs-copilot-balancer
        emacs-dash
        emacs-editorconfig
        emacs-s
        emacs-f
        emacs-jsonrpc))
      (home-page "https://github.com/copilot-emacs/copilot.el")
      (synopsis "An unofficial Copilot plugin for Emacs")
      (description
       "Copilot.el is an Emacs plugin for GitHub Copilot. This plugin is
unofficial and based on binaries provided by copilot.vim. Note: You need
access to GitHub Copilot to use this plugin.")
      (license license:gpl3+))))

(define-public emacs-ample-zen-theme
  (let ((commit
          "b277bb7abd4b6624e8d59f02474b79af50a007bd")
        (revision "0"))
    (package
      (name "emacs-ample-zen-theme")
      (version (git-version "0.3" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mjwall/ample-zen")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "18z9jl5d19a132k6g1dvwqfbbdh5cx66b2qxlcjsfiqxlxglc2sa"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/mjwall/ample-zen")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-anti-zenburn-theme
  (let ((commit
          "dbafbaa86be67c1d409873f57a5c0bbe1e7ca158")
        (revision "0"))
    (package
      (name "emacs-anti-zenburn-theme")
      (version (git-version "2.5.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/m00natic/anti-zenburn-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1h4lachmrpjiblah4rjd2cpvz6n6qh3i5cdp4wra2dk177h7kj6h"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/m00natic/anti-zenburn-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-apropospriate-theme
  (let ((commit
          "9fd52d4b0dec6e805097e7f216db47dc37bc3abc")
        (revision "0"))
    (package
      (name "emacs-apropospriate-theme")
      (version (git-version "0.2.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/waymondo/apropospriate-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "189n4ds7mhz52hnk57gaqngi3m807cffgvasw9ysv9h42b0mp3kk"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/waymondo/apropospriate-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-badwolf-theme
  (let ((commit
          "ea01a3d9358e968f75e3ed15dec6a2a96ce3d9a1")
        (revision "0"))
    (package
      (name "emacs-badwolf-theme")
      (version (git-version "1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/bkruczyk/badwolf-emacs")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0a6adsxvmw3mgji17is75jrq3ifmzpch8rwqqyfgc99xzndvab7l"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/bkruczyk/badwolf-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-birds-of-paradise-plus-theme
  (let ((commit
          "bb9f9d4ef7f7872a388ec4eee1253069adcadb6f")
        (revision "0"))
    (package
      (name "emacs-birds-of-paradise-plus-theme")
      (version (git-version "0.1.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jimeh/birds-of-paradise-plus-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1n5icy29ks5rxrxp7v4sf0523z7wxn0fh9lx4y6jb7ppdjnff12s"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jimeh/birds-of-paradise-plus-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-bubbleberry-theme
  (let ((commit
          "22e9adf4586414024e4592972022ec297321b320")
        (revision "0"))
    (package
      (name "emacs-bubbleberry-theme")
      (version (git-version "0.1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jasonm23/emacs-bubbleberry-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1aha8rzilv4k300rr4l9qjfygydfwllkbw17lhm8jz0kh9w6bd28"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jasonm23/emacs-bubbleberry-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-busybee-theme
  (let ((commit
          "66b2315b030582d0ebee605cf455d386d8c30fcd")
        (revision "0"))
    (package
      (name "emacs-busybee-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/mswift42/busybee-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1cvj5m45f5ky3w86khh6crvdqrdjxg2z6b34jlm32qpgmn0s5g45"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/mswift42/busybee-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-cherry-blossom-theme
  (let ((commit
          "eea7653e00f35973857ee23b27bc2fae5e753e50")
        (revision "0"))
    (package
      (name "emacs-cherry-blossom-theme")
      (version (git-version "0.0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/inlinestyle/emacs-cherry-blossom-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0m97xr6lddy2jdmd4bl4kbp2568p4n110yfa9k7fqc20ihq8jkyd"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/inlinestyle/emacs-cherry-blossom-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-clues-theme
  (let ((commit
          "abd61f2b7f3e98de58ca26e6d1230e70c6406cc7")
        (revision "0"))
    (package
      (name "emacs-clues-theme")
      (version (git-version "1.0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/emacsfodder/emacs-clues-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "118k5bnlk9sc2n04saaxjncmc1a4m1wlf2y7xyklpffkazbd0m72"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/emacsfodder/emacs-clues-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-dakrone-theme
  (let ((commit
          "232ad1be5f3572dcbdf528f1655109aa355a6937")
        (revision "0"))
    (package
      (name "emacs-dakrone-theme")
      (version (git-version "0.0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/dakrone/dakrone-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0p51zni42hv090vv6mk9v0v88achmgxlsmlr40y8y6ng57w51r4s"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/dakrone/dakrone-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-darkmine-theme
  (let ((commit
          "7f7e82ca03bcad52911fa41fb3e204e32d6ee63e")
        (revision "0"))
    (package
      (name "emacs-darkmine-theme")
      (version (git-version "0.5" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/pierre-lecocq/darkmine-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0d2g4iyp8gyfrcc1gkvl40p1shlw1sadswzhry0m1lgbyxiiklrz"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/pierre-lecocq/darkmine-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-darkokai-theme
  (let ((commit
          "5820aeddfc8c869ba840cc534eba776936656a66")
        (revision "0"))
    (package
      (name "emacs-darkokai-theme")
      (version (git-version "0.1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/sjrmanning/darkokai")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1bj7l5sh6nzxcw575kjcscjpjqmwlxhvi30qviqg4d6aymzkgr53"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/sjrmanning/darkokai")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-darktooth-theme
  (let ((commit
          "fd3df73a4d937fa9e12f0b18acb009a9d40f245e")
        (revision "0"))
    (package
      (name "emacs-darktooth-theme")
      (version (git-version "1.0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/emacsfodder/emacs-theme-darktooth")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0dvfk9kyza6yq0jn9g2ffb5gv07xnjg6myxkqfxpll7m2s0zasi7"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-autothemer))
      (home-page "http://github.com/emacsfodder/emacs-theme-darktooth")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-django-theme
  (let ((commit
         "86c8142b3eb1addd94a43aa6f1d98dab06401af0")
        (revision "0"))
    (package
      (name "emacs-django-theme")
      (version (git-version "1.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/andrzejsliwa/django-theme.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1azf4p6salga7269l0kf13bqlxf9idp0ys8mm20qpyjpj79p5g9w"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/andrzejsliwa/django-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-espresso-theme
  (let ((commit
          "580f673729f02aa07070c5300bedf24733d56e74")
        (revision "0"))
    (package
      (name "emacs-espresso-theme")
      (version (git-version "1.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/dgutov/espresso-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1fxnsz0v7hizs7wf8pjfm7jwbrm9vg5gvxv1a6ixgfajka79amfw"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/dgutov/espresso-theme")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public emacs-flatland-theme
  (let ((commit
          "a98a6f19ad4dff0fa3fad1ea487b7d0ef634a19a")
        (revision "0"))
    (package
      (name "emacs-flatland-theme")
      (version (git-version "0.1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/gregchapple/flatland-emacs")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "02gbzxd1v003aaj5rn3vr00n4390bhdx2jhpa7nb430fg3s1ppdy"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/gregchapple/flatland-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flatui-theme
  (let ((commit
          "9c15db5526c15c8dba55023f5698372b19c2a780")
        (revision "0"))
    (package
      (name "emacs-flatui-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/john2x/flatui-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0ybgpnbq3b0ml3lzgkispn667acpjww7z6cr7hgwg3j1zrqpwi75"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/john2x/flatui-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-gandalf-theme
  (let ((commit
          "4e472fc851431458537d458d09c1f5895e338536")
        (revision "0"))
    (package
      (name "emacs-gandalf-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/ptrv/gandalf-theme-emacs")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0sn3y1ilbg532mg941qmzipvzq86q31x86ypaf0h0m4015r7l59v"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/ptrv/gandalf-theme-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-gotham-theme
  (let ((commit
          "4b8214df0851bb69b44c3e864568b7e0030a95d2")
        (revision "0"))
    (package
      (name "emacs-gotham-theme")
      (version (git-version "1.1.9" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://depp.brause.cc/gotham-theme.git")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "19ylb7d5jxr7mwjrmgq7acvb4a1q39909xaz3y6s3kjvsyg426pg"))))
      (build-system emacs-build-system)
      (home-page
        "https://depp.brause.cc/gotham-theme.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-grandshell-theme
  (let ((commit
          "0ed8e4273607dd4fcaa742b4097259233b09eda6")
        (revision "0"))
    (package
      (name "emacs-grandshell-theme")
      (version (git-version "" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://framagit.org/steckerhalter/grandshell-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "04vx5p1ffln5b9rxgfi15q735plxcjvskby3c5k4slgwf4p91bpq"))))
      (build-system emacs-build-system)
      (home-page
        "https://framagit.org/steckerhalter/grandshell-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-gruber-darker-theme
  (let ((commit
          "6de7a37d7b18cf3f0ec51db799f4f2aa6e3e89ff")
        (revision "0"))
    (package
      (name "emacs-gruber-darker-theme")
      (version (git-version "0.7" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/rexim/gruber-darker-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1bqjn67s0kcnf86qjxz0ayaash4rbwfwqsppqyy7p9qfc00cjix2"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/rexim/gruber-darker-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-hc-zenburn-theme
  (let ((commit
          "8a1f9d28f503615e5d9b3eac59a2f3c14e75fc20")
        (revision "0"))
    (package
      (name "emacs-hc-zenburn-theme")
      (version (git-version "2.8.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/bbatsov/zenburn-emacs")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "00zyx2knfchxkml19kf4wfgigsbgzqf47mvbgrmk3nfznnnnyvmf"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/bbatsov/zenburn-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-hemisu-theme
  (let ((commit
          "5c206561aa2c844ecdf3e3b672c3235e559ddd7f")
        (revision "0"))
    (package
      (name "emacs-hemisu-theme")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/andrzejsliwa/hemisu-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "178dvigiw162m01x7dm8pf61w2n3bq51lvk5q7jzpb9s35pz1697"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/andrzejsliwa/hemisu-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-heroku-theme
  (let ((commit
         "8083643fe92ec3a1c3eb82f1b8dc2236c9c9691d")
        (revision "0"))
    (package
      (name "emacs-heroku-theme")
      (version (git-version "2.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jonathanchu/heroku-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "15hk0v6ck076mahsz4spq75jcnv587fx4d3w50c7bdh423fl0xvx"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/jonathanchu/heroku-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-inkpot-theme
  (let ((commit
          "43c008f05b982fa41fc477b2f487ce04023dd073")
        (revision "0"))
    (package
      (name "emacs-inkpot-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://codeberg.org/ideasman42/emacs-theme-inkpot")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "12si69yrp0r34i1fswcfv94y3i2qykcxwpw086lcsylfrx88ydf2"))))
      (build-system emacs-build-system)
      (home-page
        "https://codeberg.org/ideasman42/emacs-theme-inkpot")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-ir-black-theme
  (let ((commit
          "36e930d107604b5763c80294a6f92aaa02e6c272")
        (revision "0"))
    (package
      (name "emacs-ir-black-theme")
      (version (git-version "1.0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jmdeldin/ir-black-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1cy9xwhswj9vahg8zr16r2crm2mm3vczqs73gc580iidasb1q1i2"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jmdeldin/ir-black-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-jazz-theme
  (let ((commit
          "d67e09f320d03ace79a05bd28f967b1ac61f2348")
        (revision "0"))
    (package
      (name "emacs-jazz-theme")
      (version (git-version "1.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/donderom/jazz-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "07m17yqhlc0fc3ga3dhkcrp9h8kr17s00ky3zwr8f2k6chj7xmn2"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/donderom/jazz-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-jbeans-theme
    (let ((commit
         "a63916a928324c42bfbe3016972c2ecff598b1ae")
        (revision "0"))
    (package
      (name "emacs-jbeans-theme")
      (version (git-version "1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/synic/jbeans-emacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1kw5czn7ddzhjhdhb8jpqbd2ha8s68fkk4m4iir09wnqdg6icvl8"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/synic/jbeans-emacs")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public emacs-light-soap-theme
  (let ((commit
          "76a787bd40c6b567ae68ced7f5d9f9f10725e00d")
        (revision "0"))
    (package
      (name "emacs-light-soap-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/light-soap-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "04dik8z2mg6qr4d3fkd26kg29b4c5crvbnc1lfsrzyrik7ipvsi8"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/light-soap-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-madhat2r-theme
  (let ((commit
          "6b387f09de055cfcc15d74981cd4f32f8f9a7323")
        (revision "0"))
    (package
      (name "emacs-madhat2r-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/madhat2r/madhat2r-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1nnjdqqbarzv62ic3ddc2z9wmh93zjia4nvfjmji8213dngrrf88"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/madhat2r/madhat2r-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-majapahit-themes
  (let ((commit
         "77c96df7619666b2102d90d452eeadf04adc89a6")
        (revision "0"))
    (package
      (name "emacs-majapahit-themes")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://gitlab.com/franksn/majapahit-theme.git")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
             "0wnhfdk2zwxqfh8d74xmszqgibcgxiq825pq8381zg4nkz5cckfb"))))
      (build-system emacs-build-system)
      (home-page
       "https://gitlab.com/franksn/majapahit-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-material-theme
  (let ((commit
          "6823009bc92f82aa3a90e27e1009f7da8e87b648")
        (revision "0"))
    (package
      (name "emacs-material-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/cpaulik/emacs-material-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1c0z2dxfwzgl71xwli3dmyn96xadm5wnhnp5inv5f01mp7iwhf8a"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/cpaulik/emacs-material-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-minimal-theme
  (let ((commit
          "221b43aad320d226863892dfe4d85465e8eb81ce")
        (revision "0"))
    (package
      (name "emacs-minimal-theme")
      (version (git-version "0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/anler/minimal-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1zsabgn5mi63ry8jg1li866jcix9mf588ypdfajk8747a6127qd0"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/anler/minimal-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

;; obsolete - replaced by emacs-color-theme-modern
(define-public emacs-color-theme
  (let ((commit
         "3a2f6b615f5e2401e30d93a3e0adc210bbb4b7aa")
        (revision "0"))
    (package
      (name "emacs-color-theme")
      (version (git-version "6.6.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsattic/color-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "09imx996afh3j207163kg8sc92hd7wljkpban1pnn6f67bgyrvlv"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page
       "https://github.com/emacsattic/color-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-monochrome-theme
  (let ((commit "bfca67fe7365310bc47ae9ca96c417caada54896")
        (revision "0"))
    (package
      (name "emacs-monochrome-theme")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/fxn/monochrome-theme.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jvsss38rgry37dnshxbqxcj7qh1q6iyza58kix47h5wbnrpvszn"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/fxn/monochrome-theme.el")
      (synopsis "Minimalistic monochrome color theme for Emacs")
      (description
       "This package provides a minimalistic monochrome color theme for Emacs.
  It uses shades of gray to create a distraction-free, high-contrast
 environment, ideal for users who prefer a simple, non-intrusive interface.
  The theme aims to reduce eye strain while maintaining readability and focus
 on content, without relying on multiple colors.")
      (license license:gpl3+))))

(define-public emacs-mustang-theme
  (let ((commit
          "dda6d04803f1c9b196b620ef564e7768fee15de2")
        (revision "0"))
    (package
      (name "emacs-mustang-theme")
      (version (git-version "0.3" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/mustang-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0pg3iay0iinf361v4ay8kizdxs5rm23ir556cwwgz3m3gbs0mgsh"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/mustang-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-naquadah-theme
  (let ((commit "430c3b7bd51922cb616b3f60301f4e2604816ed8")
        (revision "0"))
    (package
      (name "emacs-naquadah-theme")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jd/naquadah-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0z2dn05xgbdfw6rwgsq31rm5dr098dk411qk83fbx2bkdxxfr60w"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/jd/naquadah-theme")
      (synopsis "Naquadah theme for Emacs")
      (description "A theme based on Tango color set.")
      (license license:gpl3+))))

(define-public emacs-noctilux-theme
  (let ((commit "a3265a1be7f4d73f44acce6d968ca6f7add1f2ca")
        (revision "0"))
    (package
      (name "emacs-noctilux-theme")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sjrmanning/noctilux-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "12xx0v8d97kjvlkj0ii78vxxvzgmcfc4hzv4yvxymg50rsy0zzqi"))
         (patches
          (search-patches
           "emacs-noctilux-theme--fix-byte-compilation.patch"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/sjrmanning/noctilux-theme")
      (synopsis "Dark theme inspired by LightTable")
      (description
       "Dark color theme for Emacs 24+ (using deftheme), inspired by the
default dark theme in Light Table 0.4.0.  This color theme is based off the
definitions and format in sellout's awesome emacs-color-theme-solarized,
providing support for a lot of modes.")
      (license license:gpl3+))))

(define-public emacs-obsidian-theme
  (let ((commit "f45efb2ebe9942466c1db6abbe2d0e6847b785ea")
        (revision "0"))
    (package
      (name "emacs-obsidian-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mswift42/obsidian-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1d36mdq8b1q1x84a2nb93bwnzlpdldiafh7q7qfjjm9dsgbij73b"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/mswift42/obsidian-theme")
      (synopsis "Port of the Eclipse obsidian theme")
      (description "Port of the Eclipse obsidian theme.")
      (license license:gpl3+))))

(define-public emacs-occidental-theme
  (let ((commit
          "fd2db7256d4f78c43d99c3cddb1c39106d479816")
        (revision "0"))
    (package
      (name "emacs-occidental-theme")
       (version (git-version "1.0" revision commit))
       (source
         (origin
           (method git-fetch)
           (uri (git-reference
                  (url "https://github.com/olcai/occidental-theme")
                  (commit commit)))
           (file-name (git-file-name name version))
           (sha256
             (base32
               "0pnliw02crqw8hbg088klz54z6s1ih8q2lcn9mq5f12xi752hxm8"))))
       (build-system emacs-build-system)
       (home-page
         "https://github.com/olcai/occidental-theme")
       (synopsis "")
       (description "")
       (license license:gpl3+))))

(define-public emacs-oldlace-theme
  (let ((commit
         "5c6f437203b0783b36a7aff4a578de4a0c8c4ee6")
        (revision "0"))
    (package
      (name "emacs-oldlace-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mswift42/oldlace-theme.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0y9fxrsxp1158fyjp4f69r7g2s7b6nbxlsmsb8clwqc8pmmg2z82"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/mswift42/oldlace-theme.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-organic-green-theme
  (let ((commit
         "7ca93a1c42bba1bcced181bd8cc34cb57be39537")
        (revision "0"))
    (package
      (name "emacs-organic-green-theme")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kostafey/organic-green-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1fa27522nb3jqswbii9qsi1csjqw5p6a7lsrylhw2vll8w9v4mma"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/kostafey/organic-green-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-phoenix-dark-mono-theme
  (let ((commit
         "a54f515d162148bcb38676980bc2316adb3d7b8b")
        (revision "0"))
    (package
      (name "emacs-phoenix-dark-mono-theme")
      (version (git-version "2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/j0ni/phoenix-dark-mono")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1zr334qsjrajd2vrrlc1rfm4b4kdw15jfh5d102vj5bp7z7ajhb4"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/j0ni/phoenix-dark-mono")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-phoenix-dark-pink-theme
  (let ((commit
         "ddd98a45775be105984ec598384e68df3d3e8046")
        (revision "0"))
    (package
      (name "emacs-phoenix-dark-pink-theme")
      (version (git-version "3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/j0ni/phoenix-dark-pink")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "02fhna45wq3wja51yrwm0xysdvyck1r0a3dx41i5sh89504gl6a9"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/j0ni/phoenix-dark-pink")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-planet-theme
  (let ((commit
         "b0a310ff36565fe22224c407cf59569986698a32")
        (revision "0"))
    (package
      (name "emacs-planet-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cmack/emacs-planet-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1xdj59skmldq5dnarirhwq4qycipas86nbyqwl8zsv0bh20nl1rs"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/cmack/emacs-planet-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-professional-theme
  (let ((commit
          "0927d1474049a193f9f366bde5eb1887b9ba20ed")
        (revision "0"))
    (package
      (name "emacs-professional-theme")
      (version (git-version "0.0.3" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/juanjux/emacs-professional-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0hx7rxa3smdippcpj4j63k0r5l4wflllb0vpnwwknc9j93r7042b"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/juanjux/emacs-professional-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-purple-haze-theme
  (let ((commit
          "3e245cbef7cd09e6b3ee124963e372a04e9a6485")
        (revision "0"))
    (package
      (name "emacs-purple-haze-theme")
      (version (git-version "" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jasonm23/emacs-purple-haze-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "15myw5rkbnnpgzpiipm5xl4cyzymv8hh66x9al4aalb5nf52dckc"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jasonm23/emacs-purple-haze-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-reverse-theme
  (let ((commit
          "8319d0d5342890a3530ffa4daafdb7c35feda1ca")
        (revision "0"))
    (package
      (name "emacs-reverse-theme")
      (version (git-version "0.03" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/emacsorphanage/reverse-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "002ywhjms8ybk7cma2p2i11z3fz6kb0w8mlafysm911rvcq2hg5f"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/emacsorphanage/reverse-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-seti-theme
  (let ((commit
          "9d76db0b91d4f574dd96ac80fad41da35bffa109")
        (revision "0"))
    (package
      (name "emacs-seti-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/caisah/seti-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "14fqkkvjbq2gj737k3yz3s0dkya33fi0dj4wds99zyzss2xp37f8"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/caisah/seti-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-smyx-theme
  (let ((commit
          "6263f6b401bbabaed388c8efcfc0be2e58c51401")
        (revision "0"))
    (package
      (name "emacs-smyx-theme")
      (version (git-version "0.10" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/tacit7/smyx")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1z2sdnf11wh5hz1rkrbg7fs4ha3zrbj9qnvfzq9005y89d7cs95x"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/tacit7/smyx")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-soft-charcoal-theme
  (let ((commit
          "5607ab977fae6638e78b1495e02da8955c9ba19f")
        (revision "0"))
    (package
      (name "emacs-soft-charcoal-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/soft-charcoal-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "07056pnjgsgw06c67776qp7jci96iqbzlprbavzz2l1j8ywz8cwm"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/soft-charcoal-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-soft-morning-theme
  (let ((commit
          "c0f9c70c97ef2be2a093cf839c4bfe27740a111c")
        (revision "0"))
    (package
      (name "emacs-soft-morning-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/soft-morning-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "06q82v1hndvznsqg0r6jrxvgxhycg9m65kay4db4yy0gmc66v2xf"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/soft-morning-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-soft-stone-theme
  (let ((commit
          "fb475514cfb02cf30ce358a61c48e46614344d48")
        (revision "0"))
    (package
      (name "emacs-soft-stone-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/soft-stone-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "030mf8b0sf9mmzwhg85zh0ccvcg768kckwvbm0yzg7vmq1x46hjl"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/soft-stone-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-subatomic256-theme
  (let ((commit
          "326177d6f99cd2b1d30df695e67ee3bc441cd96f")
        (revision "0"))
    (package
      (name "emacs-subatomic256-theme")
      (version (git-version "1.3" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/d11wtq/subatomic256")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1w7mimyqc25phlww20l49wlafnxp6c7dwibvphg3vwl61g0llpq8"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/d11wtq/subatomic256")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-subatomic-theme
  (let ((commit
          "9d0ac6aa5272d0285965a48505eb35658c5472b0")
        (revision "0"))
    (package
      (name "emacs-subatomic-theme")
      (version (git-version "1.8.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/cryon/subatomic")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0fs1y53b025fwd690dl5iipsh3nz5g0jvj8ny1az614697yx90xw"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/cryon/subatomic")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-sunny-day-theme
  (let ((commit
          "420e0a6eb33fcc9b75c2c9e88ab60a975d782a00")
        (revision "0"))
    (package
      (name "emacs-sunny-day-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/sunny-day-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0mhyhkjjwszwl5wzkys9pgvgx9sps9r46k1s1hpzzf4s3vi015mc"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/sunny-day-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-tango-2-theme
  (let ((commit
          "64e44c98e41ebbe3b827d54280e3b9615787daaa")
        (revision "0"))
    (package
      (name "emacs-tango-2-theme")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://gist.github.com/2024464.git")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1lqkazis9pfcfdsb2lar4l1n4pd085v60xmnlkdrdllwamqachkk"))))
      (build-system emacs-build-system)
      (home-page "https://gist.github.com/2024464.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-tango-plus-theme
  (let ((commit
          "30495d1ab1df6213ecac008c599b91e6f9244c12")
        (revision "0"))
    (package
      (name "emacs-tango-plus-theme")
      (version (git-version "2.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/tmalsburg/tango-plus-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1qdz7nf4wqv58ck02ralp7l4an1ashh1bnjgqkp444as3vyli2c4"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/tmalsburg/tango-plus-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-tangotango-theme
  (let ((commit
          "dbefd8638c36595467efbce5a26da208320ac30a")
        (revision "0"))
    (package
      (name "emacs-tangotango-theme")
      (version (git-version "0.0.7" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/juba/color-theme-tangotango")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "093izf3zppfcb85bgdmq516sarkmwvwfi4b6jnpd6cnj7wl9zr1j"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/juba/color-theme-tangotango")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-toxi-theme
  (let ((commit
          "90c8828b91025adf5adc96011a35d25682991b8a")
        (revision "0"))
    (package
      (name "emacs-toxi-theme")
      (version (git-version "0.1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/postspectacular/toxi-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1pnsky541m8kzcv81w98jkv0hgajh04hxqlmgddc1y0wbvi849j0"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/postspectacular/toxi-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-twilight-anti-bright-theme
  (let ((commit
          "523b95fcdbf4a6a6483af314ad05354a3d80f23f")
        (revision "0"))
    (package
      (name "emacs-twilight-anti-bright-theme")
      (version (git-version "0.3.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jimeh/twilight-anti-bright-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0g6qqfgbg507r8lgq99zj2b5n3r9m23hpx19m36c3i55mh94dl2h"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jimeh/twilight-anti-bright-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-twilight-bright-theme
  (let ((commit
          "322157cb2f3bf7920ecd209dafc31bc1c7959f49")
        (revision "0"))
    (package
      (name "emacs-twilight-bright-theme")
      (version (git-version "0.1.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jimeh/twilight-bright-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1awqc4rvg8693myynb1d4y4dfdaxkd5blnixxs3mdv81l07zyn8c"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jimeh/twilight-bright-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-twilight-theme
  (let ((commit
          "77c4741cb3dcf16e53d06d6c2ffdc660c40afb5b")
        (revision "0"))
    (package
      (name "emacs-twilight-theme")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/developernotes/twilight-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0d7vd1h0rwwgrh7f9kmdgy2ni0p20da9c8ylwlg33nsb26345wfs"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/developernotes/twilight-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-ujelly-theme
  (let ((commit
          "bf724ce7806a738d2043544061e5f9bbfc56e674")
        (revision "0"))
    (package
      (name "emacs-ujelly-theme")
      (version (git-version "1.2.9" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/marktran/color-theme-ujelly")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0pz26q5qfq4wiqcpfkq26f19q5gyiv8q71sq4k77hkss5a5b5fqg"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/marktran/color-theme-ujelly")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-underwater-theme
  (let ((commit
          "4eb9ef014f580adc135d91d1cd68d37a310640b6")
        (revision "0"))
    (package
      (name "emacs-underwater-theme")
      (version (git-version "1.1.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jmdeldin/underwater-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1ypxpv5vw2ls757iwrq3zld6k0s29q3kg3spcsl5ks4aqpnkxpva"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jmdeldin/underwater-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-white-sand-theme
  (let ((commit
          "729dd52cc1936250183d6761eed406c4be514a71")
        (revision "0"))
    (package
      (name "emacs-white-sand-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/white-sand-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0vlq6wywhc08z4ivyahpagcxbxfww6ipbmvgw4sgc8c6h3vb8v9s"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/white-sand-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-zen-and-art-theme
  (let ((commit
          "a7226cbce0bca2501d69a620cb2aeabfc396c232")
        (revision "0"))
    (package
      (name "emacs-zen-and-art-theme")
      (version (git-version "1.0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/developernotes/zen-and-art-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0dnaxhsw549k54j0mgydm7qbl4pizgipfyzc15f9afsxa107rpnl"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/developernotes/zen-and-art-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

;; Defines emacs-omtose-darker-theme emacs-omtose-softer-theme
(define-public emacs-omtose-phellack-theme
  (let ((commit
         "66f99633e199e65bd28641626435e8e59246529a")
        (revision "0"))
    (package
      (name "emacs-omtose-phellack-theme")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url
                "https://github.com/franksn/omtose-phellack-theme"
                ;; "https://github.com/emacsmirror/omtose-phellack-theme"
                )
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0imf2pcf93srm473nvaksw5pw5i4caqxb6aqfbq6xww8gdbqfazy"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; contains code for omtose-darker-theme, omtose-softer-theme
        #:include #~(cons "^variants/" %default-include)))
      (home-page
       "https://github.com/emacsmirror/omtose-phellack-theme")
      (synopsis "Dark theme with cold bluish touch")
      (description "A dark, soothing theme for Emacs with a cold bluish touch.")
      (license license:gpl3+))))

(define-public emacs-sublime-themes
  (let ((commit
         "60ee40af82eb55b79d5ed4026f1911326311603f")
        (revision "0"))
    (package
      (name "emacs-sublime-themes")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/owainlewis/emacs-color-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "17fcqvavgyl9cmv1hwcid2bw513vhawlsmac1w2adiz567594i6h"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/owainlewis/emacs-color-themes")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-cider-hydra
  (let ((commit
          "c3b8a15d72dddfbc390ab6a454bd7e4c765a2c95")
        (revision "0"))
    (package
      (name "emacs-cider-hydra")
      (version
        (git-version "0.2.0-snapshot" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/clojure-emacs/cider-hydra")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0qrxja9bxx07m1ij8ly36sib901a6qhczgxsp4ap4wszy63lx93r"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-hydra
        emacs-cider
        ;; emacs-cider-inspector
        ;; emacs-cider-test
        ;; emacs-cider-repl
        ;; emacs-cider-mode
        ;; emacs-cider-macroexpansion
        ;; emacs-cider-eval
        ;; emacs-cider-clojuredocs
        ;; emacs-cider-doc
        ;; emacs-cider-client
        ;; emacs-cider-apropos
        ))
      (home-page "https://github.com/clojure-emacs/cider-hydra")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flycheck-joker
  (let ((commit
         "93576295fef7a749bf779eeece5edd85e21868e2")
        (revision "0"))
    (package
      (name "emacs-flycheck-joker")
      (version (git-version "1.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/candid82/flycheck-joker")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1hz5nlrhbrlwwk8rcjvc3jhj0g9wgm6xw903ap8fxq470mj99gln"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-flycheck))
      (home-page "https://github.com/candid82/flycheck-joker")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-kaocha-runner
  (let ((commit
         "9ba7b47d3a3834964f7fcad389081b3b282f692c")
        (revision "0"))
    (package
      (name "emacs-kaocha-runner")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magnars/kaocha-runner.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0slspzc3zppavmdnw8xpih1iiqyqbyx4mm286lz0naw7g4yrpb12"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        emacs-parseedn
        emacs-cider))
      (home-page "https://github.com/magnars/kaocha-runner.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-sayid
  (let ((commit
         "879aff586336a0ec4d46c0ed4720fb1de22082bd")
        (revision "0"))
    (package
      (name "emacs-sayid")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/clojure-emacs/sayid")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "013afdzz0rvb428pla78an052jvw2q95zzqvnq9z9w16y5yd1n0c"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include #~(cons "^src/el/" %default-include)))
      (propagated-inputs (list emacs-cider))
      (home-page "https://github.com/clojure-emacs/sayid")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-kaolin-themes
  (let ((commit
         "facb2a08d3179103d4c3a9905b37c87831fe1665")
        (revision "0"))
    (package
      (name "emacs-kaolin-themes")
      (version (git-version "1.6.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ogdenwebb/emacs-kaolin-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0r8lc175iswvwwqf2yqdc8sx07m8b8l0mylw0p1gxri45qd69hcq"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        ;; emacs-kaolin-themes-lib
        ;; emacs-color
        emacs-map
        emacs-autothemer))
      (home-page "https://github.com/ogdenwebb/emacs-kaolin-themes")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-emacsql-sqlite3
  ;; This commit contains changes necessary for Sqlite 3.38+.
  (let ((commit "2113618732665f2112cb932a66c0e89c404d8777")
        (revision "1"))
    (package
      (name "emacs-emacsql-sqlite3")
      (version (git-version "1.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cireu/emacsql-sqlite3")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0r8svrd0d4cflx8a8gkynnhafcpv3ksn9rds8dhyx5yibximbzsw"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
         ;; #:tests? #t
         ;; #:test-command #~(list
         ;;                   "emacs" "-Q" "--batch" "-L" "."
         ;;                  "--load" "emacsql-sqlite3-test.el"
         ;;                  "-f" "ert-run-tests-batch-and-exit")
         #:phases
         #~(modify-phases %standard-phases
             (add-after 'unpack 'embed-path-to-sqlite3
               (lambda _
                 (substitute* "emacsql-sqlite3.el"
                   (("\\(executable-find \"sqlite3\"\\)")
                    (string-append "\"" (which "sqlite3") "\""))))))))
      (native-inputs (list emacs-ert-runner))
      (inputs (list sqlite))
      (propagated-inputs (list emacs-emacsql))
      (home-page "https://github.com/cireu/emacsql-sqlite3")
      (synopsis "EmacSQL backend for SQLite")
      (description "This is yet another EmacSQL backend for SQLite which uses
official @command{sqlite3} executable to access SQL database.")
      (license license:gpl3+))))

(define-public emacs-zonokai-emacs
  (let ((commit
         "38ee819b711e848437ba6d563594129a0ecac598")
        (revision "0"))
    (package
      (name "emacs-zonokai-emacs")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ZehCnaS34/zonokai-emacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "16ni0va1adpqdnrkiwmpxwrhyanxp5jwbknii2wnbhgq62s7gv43"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        ;; emacs-color
        emacs-dash))
      (home-page "https://github.com/ZehCnaS34/zonokai-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-kill-buffers
  (let ((commit
         "eb2a195f4c98e62c8c541ea27a4f0398e8187b99")
        (revision "0"))
    (package
      (name "emacs-kill-buffers")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/kill-buffers")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ssnyvy80h1pc1khimcazxf0mqkzz0xmzjg2if7xc6js235rcksf"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-cider))
      (home-page "https://github.com/Bost/kill-buffers")
      (synopsis "Kill various unwanted buffers")
      (description "Kill various unwanted buffers.")
      (license license:gpl3+))))

(define-public emacs-copy-sexp
  (let ((commit
         "97f39a0651e50765e5f0d669b5566f251a2a9a7b")
        (revision "0"))
    (package
      (name "emacs-copy-sexp")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/copy-sexp")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1pd6nrgv6b6134w60zlxb3dnvn3nw8975wq5h6smach9cfxf7iry"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-smartparens
        emacs-eval-sexp-fu-el))
      (home-page "https://github.com/Bost/copy-sexp")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-jump-last
  (let ((commit
         "66103a31c16eaa41e4ce69680f378f934d39cd79")
        (revision "0"))
    (package
      (name "emacs-jump-last")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/jump-last")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0r31d7597dzi01y09acqvzqxn7fqb1amxngjq7zk5gp5n61frf9s"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-goto-chg))
      (home-page "https://github.com/Bost/jump-last")
      (synopsis "Jump to the Last Edit Location, regardless of the file")
      (description "Jump to the Last Edit Location, regardless of the file.")
      (license license:gpl3+))))

(define-public emacs-evil-iedit-state
  (let ((commit
         "6f7b502447ba35676375169d7707372ebad2791f")
        (revision "0"))
    (package
      (name "emacs-evil-iedit-state")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/evil-iedit-state")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0vjzjmp3ba0nzf0v04bhxvzgdwwm11vivxqjzgnvp3kq95kajr5h"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        emacs-iedit))
      (home-page "https://github.com/syl20bnr/evil-iedit-state")
      (synopsis "Slick Evil states for iedit")
      (description "This package adds two new Evil states:
* iedit state
* iedit-insert state
It has also a nice integration with expand-region for quick edit of the
current selected text by pressing e.")
      (license license:gpl3+))))

(define-public emacs-term-cursor
  (let ((commit
         "d6c9b46c6ad73875db4ce04cac335846f86fb7e7")
        (revision "0"))
    (package
      (name "emacs-term-cursor")
      (version (git-version "0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/h0d/term-cursor.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0jh284j7z4xmdd18ciaczlzc30g67gk14fv31kr20hgmd1fzv1m6"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/h0d/term-cursor.el.git")
      (synopsis "Bring GUI Emacs cursor behaviour to the terminal")
      (description "Display Emacs cursor in terminal as it would be in GUI,
 with or without evil-mode.  Send terminal escape codes to change cursor shape
in TTY Emacs.  Using VT520 DECSCUSR (cf
https://invisible-island.net/xterm/ctlseqs/ctlseqs.html).  Does not interfere
with GUI Emacs behavior.")
      (license license:gpl3+))))

(define-public emacs-winum
  (let ((commit "c5455e866e8a5f7eab6a7263e2057aff5f1118b9")
        (revision "0"))
    (package
      (name "emacs-winum")
      (version (git-version "2.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/deb0ch/emacs-winum")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lj4cp7ml7cjhkd66f6ivcl6sbfs2my8ajjlynzl3pm5qansfw5i"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-dash))
      (home-page "https://github.com/deb0ch/emacs-winum")
      (synopsis "Window number management for Emacs")
      (description
       "This package provides window number management for Emacs, enabling
 quick and easy navigation between windows using numbers.  It assigns numbers
 to windows dynamically and allows users to switch to a specific window by its
 number with minimal keystrokes.")
      (license license:gpl3+))))

(define-public emacs-frame-fns
  (package
    (name "emacs-frame-fns")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.emacswiki.org/emacs/download/frame-fns.el")
       (sha256
        (base32
         "00lpahlvm9z2sl7bcff0jd6f62zf2jg9mliwimwnpjz1dkmy5sj7"))))
    (build-system emacs-build-system)
    (home-page "https://www.emacswiki.org/emacs/frame-fns.el")
    (synopsis "Non-interactive frame and window functions")
    (description "Non-interactive frame and window functions.")
    (license license:gpl3+)))

(define-public emacs-frame-cmds
  (package
    (name "emacs-frame-cmds")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.emacswiki.org/emacs/download/frame-cmds.el")
       (sha256
        (base32
         "07bycmx9d7kd7yzsjy3xa0iqnrqzmhzjzah77qybcickp539dqf9"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-frame-fns))
    (home-page "https://www.emacswiki.org/emacs/frame-cmds.el")
    (synopsis "Frame and window commands (interactive functions)")
    (description "Frame and window commands (interactive functions).")
    (license license:gpl3+)))

(define-public emacs-zoom-frm
  (package
    (name "emacs-zoom-frm")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.emacswiki.org/emacs/download/zoom-frm.el")
       (sha256
        (base32
         "1l39hw0n3w96980varljd3z37d8a2x0yj577hcaf3qbwqywfgv9v"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-frame-cmds))
    (home-page "https://www.emacswiki.org/emacs/zoom-frm.el")
    (synopsis "Commands to zoom frame font size")
    (description "Commands to zoom frame font size.")
    (license license:gpl3+)))

(define-public emacs-auto-highlight-symbol
  (let ((commit
         "5847f06f86fd50be3fa041d65528d9665eea25dd")
        (revision "0"))
    (package
     (name "emacs-auto-highlight-symbol")
     (version (git-version "1.61" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/elp-revive/auto-highlight-symbol")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "04iz99x942i5awngj6fdshm2jh1ghnm47sck6xflj17pa2rzjyp4"))))
     (build-system emacs-build-system)
     (arguments
      (list
       #:tests? #f))
     (propagated-inputs (list emacs-ht))
     (home-page "https://github.com/elp-revive/auto-highlight-symbol")
     (synopsis "Automatic highlighting current symbol minor mode")
     (description
      "Minor mode for Emacs for automatic highlighting current symbol minor
 mode:
   * automatic highlighting current symbol like eclipse IDE.
   * cycle through highlighted locations.
   * can specify the range to highlight.
   * can edit the highlighted symbols at a time.")
     (license license:gpl3+))))

#|
(load "/home/bost/dev/dotfiles/guix/home/utils.scm")
(load "/home/bost/dev/guix-packages/packages/bost/packages/emacs-xyz.scm")
(use-modules (guix store)
             (guix derivations)
             (guix packages)
             (guix utils)
             (guix git)
             (guix git-download)
             ((guix licenses) #:prefix license:)
             (guix build-system emacs)
             (gnu packages emacs-xyz)
             (gnu packages mail)
             (bost gnu packages emacs-xyz)
             (utils)
             ;; ((utils) #:prefix bo:)
             )
(build emacs-copilot)
(build emacs-pythonic)
|#

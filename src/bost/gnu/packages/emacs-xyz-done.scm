(define-module (bost gnu packages emacs-xyz-done)
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
  #:use-module (ice-9 match))

(define-public emacs-color-theme-sanityinc-tomorrow
  (let ((commit "d34e8db507ee0c7b465ff18a8f220c33ed77cd79")
        (revision "0"))
    (package
      (name "emacs-color-theme-sanityinc-tomorrow")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/color-theme-sanityinc-tomorrow")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1mfildi7rav2j42avii7z4gp4ghl04cqv8wp1vyxzl8vkyj60nkb"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/purcell/color-theme-sanityinc-tomorrow")
      (synopsis "Emacs color themes based on Chris Kempson's 'tomorrow' themes")
      (description
       "An Emacs version of Chris Kempson's \"Tomorrow\" themes, with much more
extensive face definitions than the \"official\" Emacs variant.")
      (license license:gpl3+))))

(define-public emacs-color-theme-sanityinc-solarized
  (let ((commit "b8f4a65bd53b97b56b93fff2fb14f71b2831aa6f")
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
           "10vfbl9dry03dw264w7b4grmzcv78x3p7r86bsyhyl74hwwvx1hp"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/purcell/color-theme-sanityinc-solarized")
      (synopsis
       "Emacs color themes based on Ethan Schoonover's 'solarized' theme")
      (description
       "An alternate Emacs color-theme version of Ethan Schoonover's \"Solarized\"
theme pair.")
      (license license:gpl3+))))

;; 111111111111111111111111111111111111111

;; $ guix refresh
;; bost/packages/emacs-xyz.scm:397:13: emacs-eziam-theme-emacs would be upgraded from 0.1 to 2.0
;; bost/packages/emacs-xyz.scm:451:13: emacs-moe-theme would be upgraded from 0.1 to 1.0.1
;; bost/packages/emacs-xyz.scm:475:13: emacs-slim-mode would be upgraded from 0.1 to 1.1
;; bost/packages/emacs-xyz.scm:686:13: emacs-treemacs-magit would be upgraded from 0 to 3.0
;; bost/packages/emacs-xyz.scm:313:13: emacs-color-theme-sanityinc-tomorrow would be upgraded from 0.1 to 1.17
;; bost/packages/emacs-xyz.scm:426:13: emacs-lsp-python-ms would be upgraded from 0.1 to 0.7.2
;; bost/packages/emacs-xyz.scm:520:13: emacs-font-utils would be upgraded from 0.1 to 0.7.8
;; bost/packages/emacs-xyz.scm:152:17: emacs-font-lock+ would be upgraded from 0-233.aa1c82d to 208
;; bost/packages/emacs-xyz.scm:498:13: emacs-zop-to-char would be upgraded from 0.1 to 1.1
;; bost/packages/emacs-xyz.scm:338:13: emacs-gruvbox would be upgraded from 0.1 to 1.30.1
;; bost/packages/emacs-xyz.scm:604:13: emacs-popwin would be upgraded from 0.1 to 1.0.2

;; following redirection to `https://api.github.com/repositories/13679783/releases'...
;; following redirection to `https://api.github.com/repositories/13679783/tags'...

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

(define-public emacs-zop-to-char
  (let ((commit "00152aa666354b27e56e20565f186b363afa0dce")
        (revision "0"))
    (package
      (name "emacs-zop-to-char")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/thierryvolpiatto/zop-to-char")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1s4adi9hyhxn7ynx195mgg10h817hxdmlzlp09633bj0llr1mjn3"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/thierryvolpiatto/zop-to-char")
      (synopsis "A visual zap-to-char command for Emacs.")
      (description "A visual zap-to-char command for Emacs.")
      (license license:gpl3+))))


#|
The license was identified as 'bsd-2' by ChatGPT using following prompt:

Have a look at the BSD License definitions 'bsd-0', 'bsd-1', 'bsd-2',
'bsd-3', 'bsd-4', in the 'guix/guix/licenses.scm' from the source code of the
GNU Guix project identify the definition to which the text bellow
corresponds. The solution MUST be one of the aforementioned 'bsd-0', 'bsd-1',
'bsd-2', 'bsd-3', 'bsd-4'.

============================

<Text between the lines 98 - 129:
https://github.com/rolandwalker/font-utils/blob/abc572eb0dc30a26584c0058c3fe6c7273a10003/font-utils.el#L98-L129
>
|#
(define-public emacs-font-utils
  (let ((commit "abc572eb0dc30a26584c0058c3fe6c7273a10003")
        (revision "0"))
    (package
      (name "emacs-font-utils")
      (version (git-version "0.7.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/rolandwalker/font-utils")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0hx3k2zx2kdavivr1b957jq7kcwk301yzw77aprxzbs7jz73a35x"))))
      (build-system emacs-build-system)
      (home-page "http://github.com/rolandwalker/font-utils")
      (synopsis "Utility functions for working with fonts in Emacs")
      (description
       "Font-utils is a collection of functions for working with fonts.  This library
has no user-level interface, it is only useful for programming in Emacs Lisp.")
      (license license:bsd-2))))

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

;; 33333333333333333333333333333333

(define-public emacs-vi-tilde-fringe
  (package
    (name "emacs-vi-tilde-fringe")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/syl20bnr/vi-tilde-fringe")
               (commit
                 "f1597a8d54535bb1d84b442577b2024e6f910308")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0wdm8k49zl6i6wnh7vjkswdh5m9lix56jv37xvc90inipwgs402z"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/syl20bnr/vi-tilde-fringe")
    (synopsis "Display tildes on empty lines in the Emacs fringe a la Vi.")
    (description "Display tildes on empty lines in the Emacs fringe a la Vi.")
    (license license:gpl3+)))

(define-public emacs-popwin
  (package
    (name "emacs-popwin")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacsorphanage/popwin")
             (commit
              "b64499bb29663886b8f09f308eac609ce03fa601")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1nig4rxkbks9dbppcjpwd7hhaiqj404m4pxijy44hn7qhy9fp8n1"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/emacsorphanage/popwin")
    (synopsis "Popup Window Manager for Emacs.")
    (description
     "Popup window manager for Emacs which makes you free from the hell of
annoying buffers such like *Help*, *Completions*, *compilation*, and etc.")
    (license license:gpl3+)))

;; (define-public emacs-paradox
;;   (package
;;     (name "emacs-paradox")
;;     (version "0.1")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/Malabarba/paradox")
;;                (commit
;;                  "dec73d4ba3512e0f85983a4b992080b225d199ee")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "0dnfyfznps3p15zn3g4ay2y1wsrnkwrplsg0ramby4pkm61a5a5m"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list
;; ;;; <stdin>:499:6: warning: possibly unbound variable `emacs-paradox-core'
;; ;;; <stdin>:500:6: warning: possibly unbound variable `emacs-paradox-execute'
;; ;;; <stdin>:501:6: warning: possibly unbound variable `emacs-paradox-menu'
;;       emacs-paradox-core
;;       emacs-paradox-execute
;;       emacs-paradox-menu
;;       ))
;;     (home-page
;;       "https://github.com/Malabarba/paradox")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

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

;; 44444444444444444444444444444444444444444444

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
    (propagated-inputs
     (list emacs-company))
    (home-page
     "https://github.com/company-mode/company-statistics")
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

(define-public emacs-helm-cider-history
  (package
    (name "emacs-helm-cider-history")
    (version "0.0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/Kungi/helm-cider-history")
               (commit
                 "c391fcb2e162a02001605a0b9449783575a831fd")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "18j4ikb3q8ygdq74zqzm83wgb39x7w209n3186mm051n8lfmkaif"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-helm))
    (home-page
      "https://github.com/Kungi/helm-cider-history")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-flx
  (package
    (name "emacs-flx")
    (version "0.6.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/lewang/flx")
               (commit
                 "7b44a5abb254bbfbeca7a29336f7f4ebd8aabbf2")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "18vzjsscm9hsxxnacqfaskwayxhlg258rj8m7m8kim12nndgkzcy"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/lewang/flx")
    (synopsis "")
    (description "")
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
     (list emacs-haskell-mode emacs-lsp-mode))
    (home-page
      "https://github.com/emacs-lsp/lsp-haskell")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-helm-css-scss
  (package
    (name "emacs-helm-css-scss")
    (version "1.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/ShingoFukuyama/helm-css-scss")
               (commit
                 "48b996f73af1fef8d6e88a1c545d98f8c50b0cf3")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1xadlsg4c52anbk3dqz6blkrid8lzsd28rw402gy17vnk7lwg9i7"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-helm))
    (home-page
      "https://github.com/ShingoFukuyama/helm-css-scss")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-auto-yasnippet
  (package
    (name "emacs-auto-yasnippet")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/abo-abo/auto-yasnippet")
             (commit
              "6a9e406d0d7f9dfd6dff7647f358cb05a0b1637e")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0ifzbwnm2axb8kmfp3jvg05wq02j121iwp2m64pi70c7mza0i886"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/abo-abo/auto-yasnippet")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-composer
  (package
    (name "emacs-composer")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zonuexe/composer.el")
             (commit
              "5af1707fefbd9d7db1102afdaeb8f2da893fea37")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0m67sidj9rqbxfm3lfxsi8ljf8160060979kcdmw0bsvfzz1ns4r"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/zonuexe/composer.el")
    (synopsis "")
    (description "")
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
    (propagated-inputs
     (list emacs-autothemer))
    (home-page
     "https://github.com/SavchenkoValeriy/emacs-chocolate-theme")
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

;; 55555555555555555555555555555555555555555555

;; ;; emacs-eieio-base unbound
;; (define-public emacs-pcache
;;   (package
;;     (name "emacs-pcache")
;;     (version "0.5.1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/sigma/pcache")
;;              (commit
;;               "507230d094cc4a5025fe09b62569ad60c71c4226")))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32
;;          "1fjdn4g9ww70f3x6vbzi3gqs9dsmqg16isajlqlflzw2716zf2nh"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list emacs-eieio-base
;;            emacs-eieio
;;            emacs-cl-extra))
;;     (home-page "https://github.com/sigma/pcache")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; ;; emacs-pcache unbound
;; (define-public emacs-groovy-imports
;;   (package
;;     (name "emacs-groovy-imports")
;;     (version "1.0.1")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/mbezjak/emacs-groovy-imports")
;;                (commit
;;                  "a60c3202973e3185091db623d960f71840a22205")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1bsmf64ycmfnsb0r0nyaky1h3x2fpr4qyck3ihw16pa6d7spaw8c"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-pcache
;;             emacs-s
;;             emacs-subr-x
;;             emacs-thingatpt))
;;     (home-page
;;       "https://github.com/mbezjak/emacs-groovy-imports")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-helm-easymenu undefined
;; (define-public emacs-helm-dictionary
;;   (package
;;     (name "emacs-helm-dictionary")
;;     (version "1.0.0")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/emacs-helm/helm-dictionary")
;;                (commit
;;                  "65fdf36e9a5c6dd8dffa71dfb6c65bc03879abe2")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1r62xrq95lzgg3if0q86idl9l8gmks76pgpxr615vm8ndhq8a545"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-helm-easymenu
;;             emacs-helm-net
;;             emacs-helm))
;;     (home-page
;;       "https://github.com/emacs-helm/helm-dictionary")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-multi-line-shared unbound
;; (define-public emacs-multi-line
;;   (package
;;     (name "emacs-multi-line")
;;     (version "0.1.5")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/IvanMalison/multi-line")
;;                (commit
;;                  "625c608443f98bb34b4d5600d52c198509fb64d0")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "0f4wkkv34990ks58dbdywlvdxw4bj7d4h0rjy64qxv7n14blndgv"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-multi-line-shared
;;             emacs-multi-line-respace
;;             emacs-multi-line-find
;;             emacs-multi-line-enter
;;             emacs-multi-line-decorator
;;             emacs-multi-line-cycle
;;             emacs-eieio))
;;     (home-page
;;       "https://github.com/IvanMalison/multi-line")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-paradox-menu unbound
;; (define-public emacs-paradox
;;   (package
;;     (name "emacs-paradox")
;;     (version "2.5.5")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/Malabarba/paradox")
;;                (commit
;;                  "dec73d4ba3512e0f85983a4b992080b225d199ee")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "0dnfyfznps3p15zn3g4ay2y1wsrnkwrplsg0ramby4pkm61a5a5m"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-paradox-menu
;;             emacs-paradox-execute
;;             emacs-paradox-core
;;             emacs-package))
;;     (home-page
;;       "https://github.com/Malabarba/paradox")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-iswitchb unbound
;; (define-public emacs-js-doc
;;   (package
;;     (name "emacs-js-doc")
;;     (version "0.0.5")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/mooz/js-doc")
;;                (commit
;;                  "f0606e89d5aa89146f96edb38cf69af0068a9d1e")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1ffayl6hca9zanbznh6rkql7fbr53id1lyrj2vllx8zakfac4dyv"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-iswitchb))
;;     (home-page "https://github.com/mooz/js-doc")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-phpactor unbound
;; (define-public emacs-company-phpactor
;;   (package
;;     (name "emacs-company-phpactor")
;;     (version "0.1.0")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/emacs-php/phpactor.el")
;;                (commit
;;                  "9440005814c4858880ad45afdaa7d2e637a9d280")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "08pq03mvi887g0bl0s5mg3psmn43wxw8bl78k9m5r3yw4xdy8mhz"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-phpactor))
;;     (home-page
;;       "https://github.com/emacs-php/phpactor.el")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-goto-chg exist already

;; emacs-thingatpt unbound
;; (define-public emacs-php-auto-yasnippets
;;   (package
;;     (name "emacs-php-auto-yasnippets")
;;     (version "2.3.1")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/ejmr/php-auto-yasnippets")
;;                (commit
;;                  "03e1f0899c081813901ac15c2f7a675a37cca9f5")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "0d7y6njsd1s2r5df2k8wvvwgxpwwyaqkhdd2b3p1php8rrbj3mg8"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-yasnippet
;;             emacs-php-mode
;;             emacs-thingatpt))
;;     (home-page
;;       "https://github.com/ejmr/php-auto-yasnippets")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-python unbound
;; (define-public emacs-helm-pydoc
;;   (package
;;     (name "emacs-helm-pydoc")
;;     (version "0.07")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/syohex/emacs-helm-pydoc")
;;                (commit
;;                  "85480a29b56dacde425655bc8f5a597c785afdf5")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1wrs2d84xzjnsmw255bmnd1wcpwd36m0vyni48aa7661d4dh10x3"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-python emacs-helm))
;;     (home-page
;;       "https://github.com/syohex/emacs-helm-pydoc")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-flymake unbound
;; (define-public emacs-scss-mode
;;   (package
;;     (name "emacs-scss-mode")
;;     (version "0.5.0")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/antonj/scss-mode")
;;                (commit
;;                  "cf58dbec5394280503eb5502938f3b5445d1b53d")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "0raja19l0igwr0pn0ghr1pj1d8i9k3m3764ma4r8nwzxcj9qw4ja"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-flymake emacs-derived))
;;     (home-page "https://github.com/antonj/scss-mode")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

(define-public emacs-writeroom-mode
  (package
    (inherit emacs-writeroom)
    (name "emacs-writeroom-mode")))

(define-public emacs-js2-refactor
  (package
    (inherit emacs-js2-refactor-el)
    (name "emacs-js2-refactor")))

(define-public emacs-origami
  (package
    (inherit emacs-origami-el)
    (name "emacs-origami")))

;; emacs-pdf-view unbound
;; (define-public emacs-pdf-view-restore
;;   (package
;;     (name "emacs-pdf-view-restore")
;;     (version "0.1")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/007kevin/pdf-view-restore")
;;                (commit
;;                  "5a1947c01a3edecc9e0fe7629041a2f53e0610c9")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1b9zzvfsprf7x0v7l4dabdh5qdfhl7mm30vvqah8l10jvlf2wlc7"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-pdf-view))
;;     (home-page
;;       "https://github.com/007kevin/pdf-view-restore")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-kaolin-themes-lib unbound
;; (define-public emacs-kaolin-themes
;;   (package
;;     (name "emacs-kaolin-themes")
;;     (version "1.6.7")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/ogdenwebb/emacs-kaolin-themes")
;;                (commit
;;                  "f16e5ca9133ea0b5c096c3f845bd5e0e284b1a0b")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1q7lnysh8v8vzr0s7y62ay0mcmiz40i504ixf7n4jhvpcsffcasr"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-kaolin-themes-lib
;;             emacs-color
;;             emacs-map
;;             emacs-autothemer))
;;     (home-page
;;       "https://github.com/ogdenwebb/emacs-kaolin-themes")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-sql unbound
;; (define-public emacs-drupal-mode
;;   (package
;;     (name "emacs-drupal-mode")
;;     (version "0.7.4")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/arnested/drupal-mode")
;;                (commit
;;                  "17927723adc5921e8058f7c29e5e50e88b975639")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1j0zlcjrz0pswcc8wh476vx503qvlyzjscwh0gs3cfss8j6r6gd5"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-sql
;;             emacs-format-spec
;;             emacs-php-mode))
;;     (home-page
;;       "https://github.com/arnested/drupal-mode")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-subr-x unbound
;; (define-public emacs-code-cells
;;   (package
;;     (name "emacs-code-cells")
;;     (version "0.3")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/astoff/code-cells.el")
;;                (commit
;;                  "fd68a33eb43b3cbd44fed767f48e230382903592")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "072d5vldjfg9mj4a86bw8xmxl3hmywsnx4f2k6nayqy4whry5fmq"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-subr-x
;;             emacs-pulse
;;             emacs-outline
;;             emacs-map))
;;     (home-page
;;       "https://github.com/astoff/code-cells.el")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; doesn't compile
;; (define-public emacs-php-project
;;   (package
;;     (name "emacs-php-project")
;;     (version "1.24.2")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/emacs-php/php-mode")
;;                (commit
;;                  "fb11df8268b7099766264cd53836ef159746adbd")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "083nsw65d1zvknxyvwnxw8n8fjc566w940x5lgxz937afy6qxvfq"))))
;;     (build-system emacs-build-system)
;;     (home-page
;;       "https://github.com/emacs-php/php-mode")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-php-project unbound
;; (define-public emacs-php
;;   (package
;;     (name "emacs-php")
;;     (version "1.24.2")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/emacs-php/php-mode")
;;                (commit
;;                  "fb11df8268b7099766264cd53836ef159746adbd")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "083nsw65d1zvknxyvwnxw8n8fjc566w940x5lgxz937afy6qxvfq"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-php-project
;;             emacs-flymake
;;             emacs-cc-engine))
;;     (home-page
;;       "https://github.com/emacs-php/php-mode")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-php-project unbound
;; (define-public emacs-php-mode
;;   (package
;;     (name "emacs-php-mode")
;;     (version "1.24.2")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/emacs-php/php-mode")
;;                (commit
;;                  "fb11df8268b7099766264cd53836ef159746adbd")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "083nsw65d1zvknxyvwnxw8n8fjc566w940x5lgxz937afy6qxvfq"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-php-project
;;             emacs-mode-local
;;             emacs-nadvice
;;             emacs-package
;;             emacs-imenu
;;             emacs-speedbar
;;             emacs-custom
;;             emacs-font-lock
;;             emacs-cc-mode
;;             emacs-php-face
;;             emacs-php))
;;     (home-page
;;       "https://github.com/emacs-php/php-mode")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-php-project unbound
;; (define-public emacs-php-align
;;   (package
;;     (name "emacs-php-align")
;;     (version "1.24.2")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/emacs-php/php-mode")
;;                (commit
;;                  "fb11df8268b7099766264cd53836ef159746adbd")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "083nsw65d1zvknxyvwnxw8n8fjc566w940x5lgxz937afy6qxvfq"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-php-project
;;             emacs-regexp-opt
;;             emacs-align))
;;     (home-page
;;       "https://github.com/emacs-php/php-mode")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; doesn't compile
;; (define-public emacs-php-face
;;   (package
;;     (name "emacs-php-face")
;;     (version "1.24.2")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/emacs-php/php-mode")
;;                (commit
;;                  "fb11df8268b7099766264cd53836ef159746adbd")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "083nsw65d1zvknxyvwnxw8n8fjc566w940x5lgxz937afy6qxvfq"))))
;;     (build-system emacs-build-system)
;;     (home-page
;;       "https://github.com/emacs-php/php-mode")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; avy-menu missing
;; (define-public emacs-flyspell-correct-helm
;;   (package
;;     (name "emacs-flyspell-correct-helm")
;;     (version "0.6.1")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/d12frosted/flyspell-correct")
;;                (commit
;;                  "7d7b6b01188bd28e20a13736ac9f36c3367bd16e")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1b6h3wjmxg9d1d3mfvw6fsgkr1w0d14zxllv9jb5cscl5lq8rbmm"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-helm emacs-flyspell-correct))
;;     (home-page
;;       "https://github.com/d12frosted/flyspell-correct")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; (define-public emacs-php-mode-debug
;;   (let ((commit "fb11df8268b7099766264cd53836ef159746adbd")
;;         (revision "0"))
;;     (package
;;       (name "emacs-php-mode-debug")
;;       (version (git-version "1.24.3" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/emacs-php/php-mode")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "135hgrccpmn7z2228w98hwv9khdmfja89gmkg9im4s6daph4y5lc"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs
;;        (list emacs-php-mode
;;              emacs-cc-mode))
;;       ;; emacs-eglot
;;       ;; (arguments
;;       ;;  (list
;;       ;;   #:phases
;;       ;;   #~(modify-phases %standard-phases
;;       ;;       (add-after 'unpack 'substitute-php-ide-eglot-executable
;;       ;;         (lambda* (#:key inputs #:allow-other-keys)
;;       ;;           (emacs-substitute-variables "lisp/php-ide.el"
;;       ;;             ;; see https://github.com/emacs-php/php-mode/blob/47e0813079cea6243139da2b6efedd36940367c8/lisp/php-ide.el#L75
;;       ;;             ("php-ide-eglot-executable"
;;       ;;              (search-input-file inputs "/bin/..."))))))))
;;       (home-page
;;        "https://github.com/emacs-php/php-mode")
;;       (synopsis "Emacs major mode for editing PHP scripts")
;;       (description "Emacs major mode for editing PHP scripts.")
;;       (license license:gpl3+))))

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
      (propagated-inputs
       (list emacs-company
             emacs-dash
             emacs-web-completion-data))
      (home-page "https://github.com/osv/company-web")
      (synopsis "Emacs company backend for html, jade and slim")
      (description
       "Company-web is an alternative Emacs plugin for autocompletion in
html-mode, web-mode, jade-mode, slim-mode and use data of ac-html.  It uses
company-mode.")
      (license license:gpl3+))))

(define-public emacs-gptel
  (let ((commit
         "1c07a94e18a914ae69ea0061f81fda4bba29afd5")
        (revision "0"))
    (package
      (name "emacs-gptel")
      (version (git-version "0.2.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/karthink/gptel")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "190nrxf6nqmfrsza3vyc51f02hw10wzydi45phkswydjkgsllkmp"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'substitute-gptel-use-curl
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "gptel.el"
                  ("gptel-use-curl"
                   (search-input-file inputs "/bin/curl"))))))))
      (inputs (list curl))
      (propagated-inputs (list emacs-map))
      (home-page "https://github.com/karthink/gptel")
      (synopsis "GPTel is a simple ChatGPT client for Emacs")
      (description
        "GPTel is a simple, no-frills ChatGPT asynchronous client for Emacs with no
external dependencies.  It can interact with ChatGPT from any Emacs buffer
with ChatGPT responses encoded in Markdown or Org markup.  It supports
conversations, not just one-off queries and multiple independent sessions.
Requires an OpenAI API key.")
      (license license:gpl3+))))

#|
Error: void-function (make-tramp-file-name)
mapbacktrace(#f(compiled-function (evald func args flags) #<bytecode -0xabc85104510e41>))
debug-early-backtrace()
debug-early(error (void-function make-tramp-file-name))
(make-tramp-file-name :method "cache")
(defconst tramp-cache-version (make-tramp-file-name :method "cache") "Virtual connection vector for Tramp version.")

-----------------------

make-tramp-file-name is a byte-compiled Lisp function in ‘tramp.el’.

(make-tramp-file-name &key METHOD USER DOMAIN HOST PORT LOCALNAME HOP)

Constructor for objects of type ‘tramp-file-name’.

This function does not change global state, including the match data.
This function has a compiler macro ‘make-tramp-file-name--cmacro’. See the
manual for details.
|#
;; (define-public emacs-pythonic
;;   (let ((commit "8250de0c1bc27e46175d11cfc14e5dac308cc02e")
;;         (revision "0"))
;;     (package
;;       (name "emacs-pythonic")
;;       (version (git-version "0.2" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/proofit404/pythonic")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "0drg3ng8ycvlyh55m23rbkgqm5i2qis89b3xa596fsssm2yydpj7"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs
;;        (list emacs-f
;;              emacs-s
;;              emacs-tramp
;;              ))
;;       (home-page
;;        "https://github.com/proofit404/pythonic")
;;       (synopsis "Utility functions for writing Pythonic Emacs package.")
;;       (description
;;        "The Pythonic Emacs package provides function for convenient running
;; Python on different platforms on local and remote hosts including Docker
;; containers and Vagrant virtual machines.  To use Pythonic with Docker you need
;; to install docker-tramp Emacs package.")
;;       (license license:gpl3+))))

;; ;; depends on emacs-pythonic which doesn't compile
;; (define-public emacs-anaconda-mode
;;   (let ((commit "efd42aa8736d855a3c95e06e6daf4aa797290a93")
;;         (revision "0"))
;;       (package
;;         (name "emacs-anaconda-mode")
;;         (version (git-version "0.1.15" revision commit))
;;         (source
;;          (origin
;;            (method git-fetch)
;;            (uri (git-reference
;;                  (url "https://github.com/proofit404/anaconda-mode")
;;                  (commit commit)))
;;            (file-name (git-file-name name version))
;;            (sha256
;;             (base32
;;              "0r46zb5p9gmv60pkr0m6md89hha97dfswhybmilr39al6amk8j3w"))))
;;         (build-system emacs-build-system)
;;         (arguments
;;          (list
;;           #:include #~(cons "^anaconda-mode\\.py$" %default-include)
;;           #:phases
;;           #~(modify-phases %standard-phases
;;               (add-after 'unpack 'substitute-anaconda-mode-installation-directory
;;                 (lambda* (#:key outputs #:allow-other-keys)
;;                   (let* ((out (assoc-ref outputs "out"))
;;                          ;; this path must be writable probably
;;                          (inst-dir (string-append
;;                                         out
;;                                         "/share/emacs/site-lisp/anaconda-mode-"
;;                                         #$version)))
;;                     (emacs-substitute-variables "anaconda-mode.el"
;;                       ("anaconda-mode-installation-directory"
;;                        inst-dir)))))
;; ;;; sys.executable is an implicit dependency.
;; ;;; See:
;; ;;; https://github.com/pythonic-emacs/anaconda-mode/pull/422
;; ;;; https://github.com/pythonic-emacs/anaconda-mode/issues/421
;;               ;; def install_deps_pip():
;;               ;;   import subprocess
;;               ;;   # import sys
;;               ;;   cmd = [sys.executable, '-m', 'pip', 'install', '--target', server_directory]
;;               ;;   cmd.extend(missing_dependencies)
;;               ;;   subprocess.check_call(cmd)
;;               ;;   instrument_installation()

;;               ;; (add-after 'unpack 'substitute-python-path
;;               ;;   (lambda* (#:key inputs #:allow-other-keys)
;;               ;;     (emacs-substitute-variables "pippel.el"
;;               ;;       ("pippel-python-command"
;;               ;;        (search-input-file
;;               ;;         inputs
;;               ;;         "/bin/python")))))
;;               )))
;;         ;; To use this package you need to install setuptools
;;         (inputs (list ))
;;         (propagated-inputs
;;          (list
;;           emacs-dash
;;           emacs-f
;;           emacs-pythonic
;;           emacs-s
;;           emacs-tramp
;;           emacs-xref
;;           ))
;;         (home-page
;;          "https://github.com/proofit404/anaconda-mode")
;;         (synopsis
;;          "Python code navigation, documentation lookup & completion in Emacs")
;;         (description
;;          "Anaconda mode provides the following features:
;; * context-sensitive code completion
;; * jump to definitions
;; * find references
;; * view documentation
;; * virtual environment
;; * eldoc mode
;; * all this stuff inside vagrant, docker and remote hosts")
;;         (license license:gpl3+))))

(define-public emacs-copilot
  (let ((commit "15a698ebc1d6ffa10da7d6d7e9f972786d0ce526")
        (revision "0"))
    (package
      (name "emacs-copilot")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/zerolfx/copilot.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0j45sq1ayrcydzlabcszzqybsajwdlnjrr0zs4ghckr2iw8g5rgz"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^dist/" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'substitute-copilot-node-executable
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "copilot.el"
                  ("copilot-node-executable"
                   (search-input-file inputs "/bin/node"))))))))
      (inputs (list node-lts))
      (propagated-inputs
       (list emacs-dash emacs-editorconfig emacs-s))
      (home-page
       "https://github.com/zerolfx/copilot.el.git")
      (synopsis "An unofficial Copilot plugin for Emacs")
      (description
       "Copilot.el is an Emacs plugin for GitHub Copilot. This plugin is
unofficial and based on binaries provided by copilot.vim. Note: You need
access to GitHub Copilot to use this plugin.")
      (license license:gpl3+))))

;; part of emacs-use-package
;; (define-public emacs-bind-key
;;   (let ((commit "77945e002f11440eae72d8730d3de218163d551e")
;;         (revision "0"))
;;     (package
;;       (name "emacs-bind-key")
;;       (version (git-version "2.4.1" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/jwiegley/use-package")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "1irr8a8r28n8c0c2x5w1flgv1f3z5jy2i5r5dknddiqa93b3rm84"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs (list emacs-easy-mmode))
;;       (home-page
;;        "https://github.com/jwiegley/use-package")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

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
      (home-page
        "http://github.com/emacsfodder/emacs-theme-darktooth")
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
      (propagated-inputs (list))
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
      (propagated-inputs (list))
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
      (propagated-inputs (list))
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
          "7200f16f0fd4cc18e8c7d82b62cc351b610609af")
        (revision "0"))
    (package
      (name "emacs-majapahit-themes")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/emacsmirror/majapahit-themes")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0r47k03m21w206kq8n3q10374xxw0278l8wilb2ls1bmr2bsd2sa"))))
      (build-system emacs-build-system)
      (propagated-inputs (list))
      (home-page
        "https://github.com/emacsmirror/majapahit-themes")
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
      (home-page
       "https://github.com/emacsattic/color-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-molokai-theme
  (let ((commit
         "cc53e997e7eff93b58ad16a376a292c1dd66044b")
        (revision "0"))
    (package
      (name "emacs-molokai-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alloy-d/color-theme-molokai")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "109z13y6f54idzxk4incd4r0d3fr7wm7r8ifmd0s5hv1v1i93jc0"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-color-theme))
      ;; (inputs (list color-theme))
      (home-page
       "https://github.com/alloy-d/color-theme-molokai")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-monochrome-theme
  (let ((commit
          "bfca67fe7365310bc47ae9ca96c417caada54896")
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
            (base32
              "0jvsss38rgry37dnshxbqxcj7qh1q6iyza58kix47h5wbnrpvszn"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/fxn/monochrome-theme.el")
      (synopsis "")
      (description "")
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
  (let ((commit
          "430c3b7bd51922cb616b3f60301f4e2604816ed8")
        (revision "0"))
    (package
      (name "emacs-naquadah-theme")
      (version (git-version "" revision commit))
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
      (synopsis "")
      (description "")
      (license license:gpl3+))))
#|
Build in fish-shell:
  guix build --load-path=$dgxp/packages --keep-failed emacs-noctilux-theme
|#
(define-public emacs-noctilux-theme
  (let ((commit
          "a3265a1be7f4d73f44acce6d968ca6f7add1f2ca")
        (revision "0"))
    ;; (format #t "#### emacs-noctilux-theme %patch-path:\n  ~a\n\n"
    ;;         (string-join (%patch-path) "\n  "))
    (package
      (name "emacs-noctilux-theme")
      (version (git-version "" revision commit))
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
      (home-page
        "https://github.com/sjrmanning/noctilux-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-obsidian-theme
  (let ((commit
          "f45efb2ebe9942466c1db6abbe2d0e6847b785ea")
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
      (home-page
        "https://github.com/mswift42/obsidian-theme")
      (synopsis "")
      (description "")
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

(define-public emacs-unicode-fonts
  (let ((commit
         "44d0a22420c39709d1e1fa659a3f135facf3c986")
        (revision "0"))
    (package
      (name "emacs-unicode-fonts")
      (version (git-version "0.4.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rolandwalker/unicode-fonts")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "00qdwkphwpc5kddn3k3ck1isykbhlvqmfb45877a65274am79pd7"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/rolandwalker/unicode-fonts")
      (synopsis "")
      (description "")
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
      (home-page
        "https://github.com/clojure-emacs/cider-hydra")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flycheck-clj-kondo
  (let ((commit
         "ff7bed2315755cfe02ef471edf522e27b78cd5ca")
        (revision "0"))
    (package
      (name "emacs-flycheck-clj-kondo")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/borkdude/flycheck-clj-kondo")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0h0cbiifzjfm5ymwf98h6nlkaqavdlxvccdsb1h0yf4246scf251"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-flycheck))
      (home-page
       "https://github.com/borkdude/flycheck-clj-kondo")
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
      (home-page
       "https://github.com/candid82/flycheck-joker")
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
       (list emacs-s emacs-parseedn emacs-cider))
      (home-page
       "https://github.com/magnars/kaocha-runner.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

;; Debugger entered--Lisp error: (void-variable counsel-gtags--prompts-alist)
;; (define-public emacs-counsel-gtags
;;   (let ((commit
;;          "1d52eaeffeb60266434d4f7416a108ca058fde91")
;;         (revision "0"))
;;     (package
;;       (name "emacs-counsel-gtags")
;;       (version (git-version "0.10" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/FelipeLema/emacs-counsel-gtags")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "13jx6hscdcfqwzk1pcmzrv7frglcnd1ywl22ddxzzymi339r4lyj"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs (list emacs-counsel))
;;       (home-page
;;        "https://github.com/FelipeLema/emacs-counsel-gtags")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

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
        #:include #~(cons "^src/el/" %default-include)))
      (propagated-inputs (list emacs-cider))
      (home-page
       "https://github.com/clojure-emacs/sayid")
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
      (home-page
       "https://github.com/ogdenwebb/emacs-kaolin-themes")
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
         #:tests? #t
         #:test-command #~(list
                           "emacs" "-Q" "--batch" "-L" "."
                          "--load" "emacsql-sqlite3-test.el"
                          "-f" "ert-run-tests-batch-and-exit")
         #:phases
         #~(modify-phases %standard-phases
             (add-after 'unpack 'embed-path-to-sqlite3
               (lambda _
                 (substitute* "emacsql-sqlite3.el"
                   (("\\(executable-find \"sqlite3\"\\)")
                    (string-append "\"" (which "sqlite3") "\""))))))))
      (native-inputs
       (list emacs-ert-runner))
      (inputs
       (list sqlite))
      (propagated-inputs
       (list emacs-emacsql))
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
      (propagated-inputs (list
                          ;; emacs-color
                          emacs-dash))
      (home-page
       "https://github.com/ZehCnaS34/zonokai-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

;; (define-public emacs-auctex-latexmk
;;   (let ((commit
;;          ;; emacsmirror/auctex-latexmk
;;          "b00a95e6b34c94987fda5a57c20cfe2f064b1c7a"
;;          ;; tom-tan/auctex-latexmk
;;          ;; "4d353522650d7685acbf1d38f7dbc504f734bd84"
;;          )
;;         (revision "0"))
;;     (package
;;      (name "emacs-auctex-latexmk")
;;      (version (git-version "1.0.2" revision commit))
;;      (source
;;       (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url
;;               ;; the emacsmirror/auctex-latexmk differs from tom-tan/auctex-latexmk
;;               "https://github.com/emacsmirror/auctex-latexmk"
;;               ;; "https://github.com/tom-tan/auctex-latexmk"
;;               )
;;              (commit commit)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32
;;          ;; emacsmirror/auctex-latexmk
;;          "0bbvb4aw9frg4fc0z9qkc5xd2s9x65k6vdscy5svsy0h17iacsbb"
;;          ;; tom-tan/auctex-latexmk
;;          ;; "0qvscgffmzqk8lkcg3yk91vciim5ygk2m4crk02qn72ipkw5q13m"
;;          ))))
;;      (build-system emacs-build-system)
;;      (propagated-inputs (list emacs-auctex))
;;      (home-page
;;       ;; the emacsmirror/auctex-latexmk differs from tom-tan/auctex-latexmk
;;       "https://github.com/emacsmirror/auctex-latexmk"
;;       ;; "https://github.com/tom-tan/auctex-latexmk"
;;       )
;;      (synopsis "")
;;      (description "")
;;      (license license:gpl3+))))

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
       (list emacs-buttercup emacs-el-mock))
      (inputs
       (list python))
      (propagated-inputs
       (list emacs-ace-window
             emacs-dash
             emacs-f
             emacs-ht
             emacs-hydra
             emacs-pfuture
             emacs-s))
      (home-page "https://github.com/Alexander-Miller/treemacs")
      (synopsis "Emacs tree style file explorer")
      (description
       "Treemacs is a file and project explorer similar to NeoTree or Vim's
NerdTree, but largely inspired by the Project Explorer in Eclipse.  It shows
the file system outlines of your projects in a simple tree layout allowing
quick navigation and exploration, while also possessing basic file management
utilities.")
      (license license:gpl3+))))

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

;; (define-public emacs-lsp-metals
;;   (package
;;     (name "emacs-lsp-metals")
;;     (version "1.2.0")
;;     (source (origin
;;               (method git-fetch)
;;               (uri (git-reference
;;                     (url "https://github.com/emacs-lsp/lsp-metals")
;;                     (commit version)))
;;               (file-name (git-file-name name version))
;;               (sha256
;;                (base32
;;                 "0ca5xq1l3lscx36pcdnpy2axgyikjrl18naqr140kr1y500sy37s"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list emacs-dap-mode emacs-lsp-treemacs emacs-scala-mode))
;;     (home-page "https://github.com/emacs-lsp/lsp-metals")
;;     (synopsis "Scala support for LSP mode")
;;     (description "This package is an Emacs Scala IDE using LSP mode to connect
;; to Metals.")
;;     (license license:gpl3+)))

;; (define-public emacs-dap-mode
;;   (package
;;     (name "emacs-dap-mode")
;;     (version "0.7")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/emacs-lsp/dap-mode")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "1zczmcv8562lachkvcwy6njn7zkgny08iznpmrx821wr8mh52wnn"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list
;;       emacs-bui
;;       emacs-lsp-mode
;;       emacs-lsp-treemacs
;;       ))
;;     (home-page "https://emacs-lsp.github.io/dap-mode")
;;     (synopsis "Emacs client/library for Debug Adapter Protocol")
;;     (description
;;      "Dap mode is an Emacs client/library for Debug Adapter
;; Protocol (DAP), a wire protocol for communication between client and
;; debug server.  It is similar to the LSP but provides integration with
;; Debug server.")
;;     (license license:gpl3+)))

;; (define-public emacs-hybrid-mode
;;   (let ((commit
;;          "26629bf3a5b8d0228be23827bb86dbd8d8087378")
;;         (revision "0"))
;;     (package
;;       (name "emacs-hybrid-mode")
;;       (version (git-version "1" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/syl20bnr/spacemacs")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "0srvmjbwdp1ndmvks03ry5pn25fz7w87yrnpyqyq3796g981p1j9"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs (list emacs-evil))
;;       (home-page
;;        "https://github.com/syl20bnr/spacemacs")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

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
      (home-page
       "https://github.com/Bost/kill-buffers")
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
       (list emacs-smartparens emacs-eval-sexp-fu-el))
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
       (list emacs-evil
             emacs-iedit
             ))
      (home-page "https://github.com/syl20bnr/evil-iedit-state")
      (synopsis "Slick Evil states for iedit")
      (description "This package adds two new Evil states:
* iedit state
* iedit-insert state
It has also a nice integration with expand-region for quick edit of the
current selected text by pressing e.")
      (license license:gpl3+))))

(define-public emacs-tweaks
  (let ((commit
         "f512f65790fecb58a9682d966c9e820129241c27")
        (revision "0"))
    (package
      (name "emacs-tweaks")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/tweaks")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1a0fdg54n92i765kvdr3n7m21n9cal4m89kkkspwzf86g908xh7d"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-copy-sexp
        emacs-drag-stuff
        emacs-evil
        emacs-evil-iedit-state
        emacs-jump-last
        emacs-kill-buffers
        emacs-magit
        emacs-yasnippet
        emacs-yasnippet
        emacs-zoom-frm
        ))
      (home-page "https://github.com/Bost/tweaks")
      (synopsis "")
      (description "")
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
       (list emacs-ht emacs-dash emacs-lsp-mode))
      (home-page
       "https://github.com/emacs-lsp/lsp-pyright")
      (synopsis "lsp-mode client leveraging Pyright language server")
      (description "lsp-mode client leveraging Pyright language server.")
      (license license:gpl3+))))

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
       (list emacs-lsp-mode emacs-origami))
      (home-page
       "https://github.com/emacs-lsp/lsp-origami")
      (synopsis "origami.el support for lsp-mode")
      (description "lsp-origami provides support for origami.el using language server protocol’s
textDocument/foldingRange functionality. It can be enabled with.")
      (license license:gpl3+))))

(define-public emacs-winum
  (let ((commit
         "c5455e866e8a5f7eab6a7263e2057aff5f1118b9")
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
          (base32
           "0lj4cp7ml7cjhkd66f6ivcl6sbfs2my8ajjlynzl3pm5qansfw5i"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-dash))
      (home-page
       "https://github.com/deb0ch/emacs-winum")
      (synopsis "Navigate windows and frames using numbers")
      (description
       "Window numbers for Emacs: Navigate your windows and frames using
 numbers!

This package is an extended and actively maintained version of the
window-numbering package by Nikolaj Schumacher, with some ideas and code taken
from ace-window.

This version brings, among other things, support for number sets across
multiple frames, giving the user a smoother experience of multi-screen Emacs.")
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

;; (define-public emacs-frame-fns
;;   (let ((commit
;;          "291bc4cbb7d8504d8fddfc45debf1a8a3962bf7a")
;;         (revision "0"))
;;     (package
;;       (name "emacs-frame-fns")
;;       (version (git-version "0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/emacsmirror/frame-fns")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "1z8alj9i2jxhg13zkwz3pvbvzwa0p1zp4awcyml7wq7w0p13077d"))))
;;       (build-system emacs-build-system)
;;       (home-page "https://www.emacswiki.org/emacs/frame-fns.el")
;;       (synopsis "Non-interactive frame and window functions")
;;       (description "Non-interactive frame and window functions.")
;;       (license license:gpl3+))))

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

;; (define-public emacs-frame-cmds
;;   (let ((commit
;;          "291bc4cbb7d8504d8fddfc45debf1a8a3962bf7a")
;;         (revision "0"))
;;     (package
;;       (name "emacs-frame-cmds")
;;       (version (git-version "0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/emacsmirror/emacswiki.org.git")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "1z8alj9i2jxhg13zkwz3pvbvzwa0p1zp4awcyml7wq7w0p13077d"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs (list emacs-frame-fns))
;;       (home-page "https://www.emacswiki.org/emacs/frame-cmds.el")
;;       (synopsis "Frame and window commands (interactive functions)")
;;       (description "Frame and window commands (interactive functions).")
;;       (license license:gpl3+))))

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

;; (define-public emacs-zoom-frm
;;   (let ((commit
;;          "291bc4cbb7d8504d8fddfc45debf1a8a3962bf7a")
;;         (revision "0"))
;;     (package
;;       (name "emacs-zoom-frm")
;;       (version (git-version "0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/emacsmirror/emacswiki.org.git")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "1z8alj9i2jxhg13zkwz3pvbvzwa0p1zp4awcyml7wq7w0p13077d"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs (list emacs-frame-cmds))
;;       (home-page "https://www.emacswiki.org/emacs/zoom-frm.el")
;;       (synopsis "Commands to zoom frame font size")
;;       (description "Commands to zoom frame font size.")
;;       (license license:gpl3+))))

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

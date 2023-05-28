(define-module (bost packages emacs-xyz)
  ;; #:use-module (utils)
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

(define-public emacs-cider-eval-sexp-fu
  (package
    (name "emacs-cider-eval-sexp-fu")
    (version "1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clojure-emacs/cider-eval-sexp-fu")
             (commit "7fd229f1441356866aedba611fd0cf4e89b50921")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01gky548v3758fyr317lkwsc9aacab6m9d9vk1mrr3qyvmciwd51"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-eval-sexp-fu-el))
    (home-page "https://github.com/clojure-emacs/cider-eval-sexp-fu")
    (synopsis "eval-sexp-fu.el extensions for CIDER")
    (description
     "eval-sexp-fu provides tiny improvements to expression evaluation -
e.g. the expression you've just evaluated would briefly flash and so on.")
    (license license:gpl3+)))

;; (build emacs-cider-eval-sexp-fu)
;; (build emacs-font-lock+)

(define-public emacs-font-lock+
  (let ((commit "aa1c82d05c9222b09099a0ccd7468e955497940c")
        (revision "233"))
      (package
        (name "emacs-font-lock+")
        (version (git-version "0" revision commit))
        (source
         (origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/emacsmirror/font-lock-plus")
                 (commit commit)))
           (file-name (git-file-name name version))
           (sha256
            (base32 "1369r5p6s9c561g5f772lvrpcqxhvyhqd9yk0853hyl03ags9gvs"))))
        (build-system emacs-build-system)
        (home-page "https://github.com/emacsmirror/font-lock-plus")
        (synopsis "Enhancements to standard library `font-lock.el'")
        (description
         "Enhancements to standard library `font-lock.el'")
        (license license:gpl3+))))

(define-public emacs-cfrs
  (package
    (name "emacs-cfrs")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Alexander-Miller/cfrs")
             (commit "f3a21f237b2a54e6b9f8a420a9da42b4f0a63121")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vf5zm82sx3m1yvq73km8ajapv6rnz41b1jrsif7kh0ijh9vk3qi"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-dash emacs-posframe emacs-s))
    (home-page "https://github.com/Alexander-Miller/cfrs")
    (synopsis "Child Frame Read String")
    (description
     "Simple alternative to read-string that allows reading input via a small
child-frame spawned at the position of the cursor. Its goal is to make the
string input interface closer to those used in modern GUI programs and to help
the user with having to switch focus from whatever they are doing currently to
look at the minibuffer.")
    (license license:gpl3+)))

(define-public emacs-ac-ispell
  (package
    (name "emacs-ac-ispell")
    (version "0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacsorphanage/ac-ispell")
             (commit "22bace7387e9012002a6a444922f75f9913077b0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cq73bdv3lkn8v3nx6aznygqaac9s5i7pvirl8wz9ib31hsgwpbk"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-auto-complete))
    (home-page "https://github.com/emacsorphanage/ac-ispell")
    (synopsis "ispell/aspell completion source for auto-complete")
    (description
     "ispell/aspell completion source for auto-complete")
    (license license:gpl3+)))

(define-public emacs-ace-jump-helm-line
  (package
    (name "emacs-ace-jump-helm-line")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cute-jumper/ace-jump-helm-line")
             (commit "1483055255df3f8ae349f7520f05b1e43ea3ed37")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "191a2g1if1jliikbxkpwmvlp4v1sp541j71xrlymili8ygm0idq5"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-avy emacs-helm))
    (home-page "https://github.com/cute-jumper/ace-jump-helm-line")
    (synopsis "Ace-jump to a candidate in helm window")
    (description
     "Ace-jump to a candidate in helm window")
    (license license:gpl3+)))

;; needed is apparently only ac-php-core
(define-public emacs-ac-php
  (package
    (name "emacs-ac-php")
    (version "2.4.2") ;; ac-php-core
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xcwen/ac-php")
             (commit "dc563f4b1efeac8ae75f217532f4c99b4ba417de")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "188hisppjbpia3bmrpsxvkfi8xkirisarnrpvkk3ya4k8lv4z13p"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-auto-complete emacs-company emacs-dash emacs-f emacs-helm
           emacs-php-mode emacs-popup emacs-s emacs-xcscope))
    (home-page "https://github.com/xcwen/ac-php")
    (synopsis "emacs auto-complete & company-mode for php")
    (description
     "emacs auto-complete & company-mode for php")
    (license license:gpl3+)))

(define-public emacs-treemacs-extra
  (package
    (inherit emacs-treemacs)
    (name "emacs-treemacs-extra")
    (propagated-inputs
     `(,@(package-propagated-inputs emacs-treemacs)
       ("emacs-all-the-icons" ,emacs-all-the-icons)
       ("emacs-evil" ,emacs-evil)
       ("emacs-magit" ,emacs-magit)
       ("emacs-projectile" ,emacs-projectile)
       ("emacs-perspective" ,emacs-perspective)
       ("emacs-persp-mode" ,emacs-persp-mode)
       ("mu" ,mu)))
    (arguments
     (substitute-keyword-arguments
         (package-arguments emacs-treemacs)
       ((#:phases phases)
        `(modify-phases ,phases
           (add-after 'chdir-elisp 'copy-extra
             (lambda _
               ;; the files are copied, it's just that they are not found by spacemacs
               (copy-recursively "../extra" ".")))))))))


;; 000000000000000000000000000000000000000

(define-public emacs-color-theme-sanityinc-tomorrow
  (package
    (name "emacs-color-theme-sanityinc-tomorrow")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/purcell/color-theme-sanityinc-tomorrow")
               (commit
                 "96dbaa43ff1326879e76a7943b8ae27265ae84e8")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "161hd0nfwb6wv2ldml74kgzmpilb6rc0ldiv0vsqklvi781dsbr1"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/purcell/color-theme-sanityinc-tomorrow")
    (synopsis "Emacs color themes based on Chris Kempson's 'tomorrow' themes")
    (description
     "An Emacs version of Chris Kempson's \"Tomorrow\" themes, with much more
extensive face definitions than the \"official\" Emacs variant.")
    (license license:gpl3+)))

(define-public emacs-color-identifiers-mode
  (let ((commit
         "a26d00d898e0a3295cb7da9323046397223ea1fe")
        (revision "0"))
    (package
      (name "emacs-color-identifiers-mode")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ankurdave/color-identifiers-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1kky827f922ziiwasrfnv97vqdf62fp9yml36x1fjsm2h6qw0c8v"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-dash))
      (home-page
       "https://github.com/ankurdave/color-identifiers-mode")
      (synopsis "Emacs minor mode to highlight each source code identifier uniquely based on
its name")
      (description
       "Emacs minor mode that highlights each source code identifier uniquely based
on its name. It is inspired by a post by Evan Brooks. Currently it supports
Scala (scala-mode2), JavaScript (js-mode and js2-mode), Ruby, Python, Emacs
Lisp, Clojure, C, C++, Rust, Java, and Go. You can add support for your
favorite mode by modifying `color-identifiers:modes-alist' and optionally
calling `color-identifiers:set-declaration-scan-fn'.")
      (license license:gpl3+))))

(define-public emacs-color-theme-sanityinc-solarized
  (let ((commit
         "b8f4a65bd53b97b56b93fff2fb14f71b2831aa6f")
        (revision "0"))
    (package
      (name "emacs-color-theme-sanityinc-solarized")
      (version (git-version "2.29" revision commit))
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
      (home-page
       "https://github.com/purcell/color-theme-sanityinc-solarized")
      (synopsis
       "Emacs color themes based on Ethan Schoonover's 'solarized' theme")
      (description
       "An alternate Emacs color-theme version of Ethan Schoonover's \"Solarized\"
theme pair.")
      (license license:gpl3+))))

(define-public emacs-anaconda-mode
  (let ((commit "ca8edbaa7662d97e4a4416ec9a8d743863303911")
        (revision "0"))
      (package
        (name "emacs-anaconda-mode")
        (version (git-version "0.1.15" revision commit))
        (source
         (origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/proofit404/anaconda-mode")
                 (commit commit)))
           (file-name (git-file-name name version))
           (sha256
            (base32
             "1vlqrpxsy0xydm29vl39blwp7y82x9cr4mmaj8mji3hgjyfwph9m"))))
        (build-system emacs-build-system)
        (arguments
         (list
          #:include #~(cons "^anaconda-mode\\.py$" %default-include)
          #:phases
          #~(modify-phases %standard-phases
              (add-after 'unpack 'substitute-anaconda-mode-installation-directory
                (lambda* (#:key outputs #:allow-other-keys)
                  (let* ((out (assoc-ref outputs "out"))
                         ;; this path must be writable probably
                         (inst-dir (string-append
                                        out
                                        "/share/emacs/site-lisp/anaconda-mode-"
                                        #$version)))
                    (emacs-substitute-variables "anaconda-mode.el"
                      ("anaconda-mode-installation-directory"
                       inst-dir)))))
;;; sys.executable is an implicit dependency.
;;; See:
;;; https://github.com/pythonic-emacs/anaconda-mode/pull/422
;;; https://github.com/pythonic-emacs/anaconda-mode/issues/421
              ;; def install_deps_pip():
              ;;   import subprocess
              ;;   # import sys
              ;;   cmd = [sys.executable, '-m', 'pip', 'install', '--target', server_directory]
              ;;   cmd.extend(missing_dependencies)
              ;;   subprocess.check_call(cmd)
              ;;   instrument_installation()

              ;; (add-after 'unpack 'substitute-python-path
              ;;   (lambda* (#:key inputs #:allow-other-keys)
              ;;     (emacs-substitute-variables "pippel.el"
              ;;       ("pippel-python-command"
              ;;        (search-input-file
              ;;         inputs
              ;;         "/bin/python")))))
              )))
        ;; To use this package you need to install setuptools
        (inputs (list ))
        (propagated-inputs
         (list
          emacs-dash
          emacs-f
          emacs-pythonic
          emacs-s
          emacs-tramp
          emacs-xref
          ))
        (home-page
         "https://github.com/proofit404/anaconda-mode")
        (synopsis
         "Python code navigation, documentation lookup & completion in Emacs")
        (description
         "Anaconda mode provides the following features:
* context-sensitive code completion
* jump to definitions
* find references
* view documentation
* virtual environment
* eldoc mode
* all this stuff inside vagrant, docker and remote hosts")
        (license license:gpl3+))))
;; (format #t "(defined? 'emacs-anaconda-mode): ~a \n" (defined? 'emacs-anaconda-mode))


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
  (package
    (name "emacs-zop-to-char")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/thierryvolpiatto/zop-to-char")
               (commit
                 "00152aa666354b27e56e20565f186b363afa0dce")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1s4adi9hyhxn7ynx195mgg10h817hxdmlzlp09633bj0llr1mjn3"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/thierryvolpiatto/zop-to-char")
    (synopsis "A visual zap-to-char command for Emacs.")
    (description "A visual zap-to-char command for Emacs.")
    (license license:gpl3+)))

(define-public emacs-font-utils
  (package
    (name "emacs-font-utils")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "http://github.com/rolandwalker/font-utils")
               (commit
                 "abc572eb0dc30a26584c0058c3fe6c7273a10003")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0hx3k2zx2kdavivr1b957jq7kcwk301yzw77aprxzbs7jz73a35x"))))
    (build-system emacs-build-system)
    (home-page
      "http://github.com/rolandwalker/font-utils")
    (synopsis "Utility functions for working with fonts in Emacs.")
    (description "Utility functions for working with fonts in Emacs.")
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
    (license license:bsd-2)))

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
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/emacsorphanage/popwin")
               (commit
                 "1e57430615b60bf33e85228f7cc625537f468241")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "10p4mvn9hva6ji7xvmbhdyjysdcmmr5m2787277mkl8cw1fhfdxz"))))
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

(define-public emacs-treemacs-magit
  (package
    (name "emacs-treemacs-magit")
    (version "0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs")
               (commit
                 "9986d6cd3d2822db7ae0e6d8a275db7057f3e828")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0s9i5amc4bx223d3abikyr8cdkzpzbirfb3x6m26l6i430j8zsal"))))
    (build-system emacs-build-system)
    (propagated-inputs
      (list emacs-magit emacs-pfuture emacs-treemacs))
    (home-page
      "https://github.com/Alexander-Miller/treemacs")
    (synopsis "")
    (description "")
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

(define-public emacs-tangotango
  (package
    (name "emacs-tangotango")
    (version "0.0.7")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/juba/color-theme-tangotango")
               (commit
                 "dbefd8638c36595467efbce5a26da208320ac30a")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "093izf3zppfcb85bgdmq516sarkmwvwfi4b6jnpd6cnj7wl9zr1j"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/juba/color-theme-tangotango")
    (synopsis "")
    (description "")
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

(define-public emacs-twilight-bright
  (package
    (name "emacs-twilight-bright")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jimeh/twilight-bright-theme.el")
             (commit
              "322157cb2f3bf7920ecd209dafc31bc1c7959f49")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1awqc4rvg8693myynb1d4y4dfdaxkd5blnixxs3mdv81l07zyn8c"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/jimeh/twilight-bright-theme.el")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-haskell-snippets
  (package
    (name "emacs-haskell-snippets")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/haskell/haskell-snippets")
             (commit
              "1c29c4a68ce89848b8d371c6510d1de3b586c8b3")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1lwnggarmavyf164cfzbzzkq9ffahhd3bz7gw644czs49sndcawf"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-yasnippet))
    (home-page
     "https://github.com/haskell/haskell-snippets")
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

(define-public emacs-darkmine
  (package
    (name "emacs-darkmine")
    (version "0.5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/pierre-lecocq/darkmine-theme")
               (commit
                 "7f7e82ca03bcad52911fa41fb3e204e32d6ee63e")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0d2g4iyp8gyfrcc1gkvl40p1shlw1sadswzhry0m1lgbyxiiklrz"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/pierre-lecocq/darkmine-theme")
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

(define-public emacs-soft-stone
  (package
    (name "emacs-soft-stone")
    (version "0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mswift42/soft-stone-theme")
             (commit
              "fb475514cfb02cf30ce358a61c48e46614344d48")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "030mf8b0sf9mmzwhg85zh0ccvcg768kckwvbm0yzg7vmq1x46hjl"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/mswift42/soft-stone-theme")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-twilight-anti-bright
  (package
    (name "emacs-twilight-anti-bright")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jimeh/twilight-anti-bright-theme")
             (commit
              "523b95fcdbf4a6a6483af314ad05354a3d80f23f")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0g6qqfgbg507r8lgq99zj2b5n3r9m23hpx19m36c3i55mh94dl2h"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/jimeh/twilight-anti-bright-theme")
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

(define-public emacs-soft-charcoal
  (package
    (name "emacs-soft-charcoal")
    (version "0.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mswift42/soft-charcoal-theme")
               (commit
                 "5607ab977fae6638e78b1495e02da8955c9ba19f")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "07056pnjgsgw06c67776qp7jci96iqbzlprbavzz2l1j8ywz8cwm"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/mswift42/soft-charcoal-theme")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-clues
  (package
    (name "emacs-clues")
    (version "1.0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/emacsfodder/emacs-clues-theme")
               (commit
                 "abd61f2b7f3e98de58ca26e6d1230e70c6406cc7")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "118k5bnlk9sc2n04saaxjncmc1a4m1wlf2y7xyklpffkazbd0m72"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/emacsfodder/emacs-clues-theme")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-planet
  (package
    (name "emacs-planet")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/cmack/emacs-planet-theme")
               (commit
                 "b0a310ff36565fe22224c407cf59569986698a32")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1xdj59skmldq5dnarirhwq4qycipas86nbyqwl8zsv0bh20nl1rs"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/cmack/emacs-planet-theme")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-occidental
  (package
    (name "emacs-occidental")
    (version "1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/olcai/occidental-theme")
               (commit
                 "fd2db7256d4f78c43d99c3cddb1c39106d479816")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0pnliw02crqw8hbg088klz54z6s1ih8q2lcn9mq5f12xi752hxm8"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/olcai/occidental-theme")
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

;; emacs-pcase unbound
;; (define-public emacs-treemacs-icons-dired
;;   (package
;;     (name "emacs-treemacs-icons-dired")
;;     (version "0")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/Alexander-Miller/treemacs")
;;                (commit
;;                  "9986d6cd3d2822db7ae0e6d8a275db7057f3e828")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "0s9i5amc4bx223d3abikyr8cdkzpzbirfb3x6m26l6i430j8zsal"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-pcase
;;             emacs-dired
;;             emacs-hl-line
;;             emacs-treemacs))
;;     (home-page
;;       "https://github.com/Alexander-Miller/treemacs")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; (define-public emacs-treemacs-evil
;;   (package
;;     (name "emacs-treemacs-evil")
;;     (version "0")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/Alexander-Miller/treemacs")
;;                (commit
;;                  "9986d6cd3d2822db7ae0e6d8a275db7057f3e828")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "0s9i5amc4bx223d3abikyr8cdkzpzbirfb3x6m26l6i430j8zsal"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-treemacs emacs-evil))
;;     (home-page
;;       "https://github.com/Alexander-Miller/treemacs")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; emacs-color-theme unbound
;; (define-public emacs-molokai
;;   (package
;;     (name "emacs-molokai")
;;     (version "0.1")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/alloy-d/color-theme-molokai")
;;                (commit
;;                  "cc53e997e7eff93b58ad16a376a292c1dd66044b")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "109z13y6f54idzxk4incd4r0d3fr7wm7r8ifmd0s5hv1v1i93jc0"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-color-theme))
;;     (home-page
;;       "https://github.com/alloy-d/color-theme-molokai")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))

;; doesn't compile
;; (define-public emacs-treemacs-persp
;;   (package
;;     (name "emacs-treemacs-persp")
;;     (version "0")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/Alexander-Miller/treemacs")
;;                (commit
;;                  "9986d6cd3d2822db7ae0e6d8a275db7057f3e828")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "0s9i5amc4bx223d3abikyr8cdkzpzbirfb3x6m26l6i430j8zsal"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list ;; emacs-eieio
;;             emacs-persp-mode
;;             emacs-treemacs))
;;     (home-page
;;       "https://github.com/Alexander-Miller/treemacs")
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

;; emacs-color unbound
;; (define-public emacs-color-identifiers-mode
;;   (package
;;     (name "emacs-color-identifiers-mode")
;;     (version "1.1")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/ankurdave/color-identifiers-mode")
;;                (commit
;;                  "1bc474bdbb1086a73638effde51f37a9da748173")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "113nnfi8jdxp7a8m7jjsn0ww2fqymk2ai4nzfdxzdfsk0q0bp49y"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;       (list emacs-dash
;;             emacs-color
;;             ))
;;     (home-page
;;       "https://github.com/ankurdave/color-identifiers-mode")
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

;; emacs-solarized unbound
;; (define-public emacs-solarized-theme
;;   (package
;;     (name "emacs-solarized-theme")
;;     (version "1.3.0")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/bbatsov/solarized-emacs")
;;                (commit
;;                  "94e7c342da1b04326028708e5503973d554bd828")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1a5s9j32v04sc5adly98y1zlx3q9i4m3b0zggrbgy56qk10yqdx4"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-solarized))
;;     (home-page
;;       "https://github.com/bbatsov/solarized-emacs")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))


(define-public emacs-writeroom-mode
  (package
    (inherit emacs-writeroom)
    (name "emacs-writeroom-mode")))

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

(define-public emacs-xcscope
  (let ((commit "d228d7593d762e457340f678d14b663ef66d7cee")
        (revision "0"))
    (package
      (name "emacs-xcscope")
      (version (git-version "1.5" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/dkogan/xcscope.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0pr85ywp585imjzswm04647nb4iqqvg8jgmbcs5210qmr9kh0z8d"))))
      (build-system emacs-build-system)
      (inputs (list cscope))
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'substitute-cscope-path
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "xcscope.el"
                  ("cscope-program" (search-input-file
                                     inputs "/bin/cscope"))))))))
      (home-page "https://github.com/dkogan/xcscope.el")
      (synopsis "Interface to the source cross-referencing tool Cscope")
      (description
       "Xcscope is an Emacs interface to Cscope, the source cross-referencing
tool.  See https://cscope.sf.net")
      (license license:gpl2+))))

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

(define-public emacs-pythonic
  (let ((commit "c18a5bd8cb2ba59014b6b29b5bf1903bd2476a07")
        (revision "0"))
    (package
      (name "emacs-pythonic")
      (version (git-version "0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/proofit404/pythonic")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "11fps8ah3xmacfd9bglq8yaafzh37i1qpiyhfdphhsy0jqy990wz"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-f
             emacs-s
             emacs-tramp))
      (home-page
       "https://github.com/proofit404/pythonic")
      (synopsis "Utility functions for writing Pythonic Emacs package.")
      (description
       "The Pythonic Emacs package provides function for convenient running
Python on different platforms on local and remote hosts including Docker
containers and Vagrant virtual machines.  To use Pythonic with Docker you need
to install docker-tramp Emacs package.")
      (license license:gpl3+))))

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

(define-public emacs-afternoon-theme
  (let ((commit
          "89b1d778a1f8b385775c122f2bd1c62f0fbf931a")
        (revision "0"))
    (package
      (name "emacs-afternoon-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/osener/emacs-afternoon-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "19d5d6qs5nwmpf26rsb86ranb5p4236qp7p2b4i88cimcmzspylb"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/osener/emacs-afternoon-theme")
      (synopsis "Dark color theme with a deep blue background")
      (description
       "Dark color theme with a deep blue background")
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

(define-public emacs-chocolate-theme
  (let ((commit
          "ccc05f7ad96d3d1332727689bf6250443adc7ec0")
        (revision "0"))
    (package
      (name "emacs-chocolate-theme")
      (version (git-version "0.2.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/SavchenkoValeriy/emacs-chocolate-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1d8a9jwv9y0sncw24k840c8yyrig30f2d6q2zqlc09f05yzq9p9p"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-autothemer))
      (home-page
        "http://github.com/SavchenkoValeriy/emacs-chocolate-theme")
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

(define-public emacs-exotica-theme
  (let ((commit
          "ff3ef4f6fa38c93b99becad977c7810c990a4d2f")
        (revision "0"))
    (package
      (name "emacs-exotica-theme")
      (version (git-version "1.0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jbharat/exotica-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1kp6q55g3dcya4y79x877vqwxa4z2rkkvhs49pkwr3wljf4af2pd"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jbharat/exotica-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

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

(define-public emacs-majapahit-theme
  (let ((commit
          "7200f16f0fd4cc18e8c7d82b62cc351b610609af")
        (revision "0"))
    (package
      (name "emacs-majapahit-theme")
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

;; doesn't compile
;; (define-public emacs-molokai-theme
;;   (let ((commit
;;           "cc53e997e7eff93b58ad16a376a292c1dd66044b")
;;         (revision "0"))
;;     (package
;;       (name "emacs-molokai-theme")
;;       (version (git-version "0.1" revision commit))
;;       (source
;;         (origin
;;           (method git-fetch)
;;           (uri (git-reference
;;                  (url "https://github.com/alloy-d/color-theme-molokai")
;;                  (commit commit)))
;;           (file-name (git-file-name name version))
;;           (sha256
;;             (base32
;;               "109z13y6f54idzxk4incd4r0d3fr7wm7r8ifmd0s5hv1v1i93jc0"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs (list))
;;       (home-page
;;         "https://github.com/alloy-d/color-theme-molokai")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

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

;; doesn't compile
;; (define-public emacs-noctilux-theme
;;   (let ((commit
;;           "a3265a1be7f4d73f44acce6d968ca6f7add1f2ca")
;;         (revision "0"))
;;     (package
;;       (name "emacs-noctilux-theme")
;;       (version (git-version "" revision commit))
;;       (source
;;         (origin
;;           (method git-fetch)
;;           (uri (git-reference
;;                  (url "https://github.com/sjrmanning/noctilux-theme")
;;                  (commit commit)))
;;           (file-name (git-file-name name version))
;;           (sha256
;;             (base32
;;               "12xx0v8d97kjvlkj0ii78vxxvzgmcfc4hzv4yvxymg50rsy0zzqi"))))
;;       (build-system emacs-build-system)
;;       (home-page
;;         "https://github.com/sjrmanning/noctilux-theme")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

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

(define (build pkg-or-pkgs)
  "Usage
(build emacs-treemacs)"
  (let [(daemon ((@ (guix store) open-connection)))]
    (define (partial fun . args) (lambda x (apply fun (append args x))))
    (map (compose
          (lambda (p) (format #t "3 p: ~a\n" p) p)
          (partial (@ (guix derivations) build-derivations) daemon)
          (lambda (p) (format #t "2 p: ~a\n" p) p)
          list
          (lambda (p) (format #t "1 p: ~a\n" p) p)
          (partial (@ (guix packages) package-derivation) daemon)
          (lambda (p)
            (format #t "0 p: ~a\n" p)
            (format #t "(record? p: ~a\n" (record? p))
            (format #t "(package? p) p: ~a\n" (package? p))
            p)
          )
         (if (list? pkg-or-pkgs) pkg-or-pkgs
             (list pkg-or-pkgs)))

    #;
    ((compose
      (lambda (p) (format #t "3 p: ~a\n" p) p)
      (partial (@ (guix derivations) build-derivations) daemon)
      (lambda (p) (format #t "2 p: ~a\n" p) p)
      list
      (lambda (p) (format #t "1 p: ~a\n" p) p)
      (partial (@ (guix packages) package-derivation) daemon)
      (lambda (p)
        (format #t "0 p: ~a\n" p)
        (format #t "(record? p: ~a\n" (record? p))
        (format #t "(package? p) p: ~a\n" (package? p))
        p)
      )
     (specification->package
      (format #f "(@ (bost packages emacs-xyz) ~a)" (symbol->string pkg-or-pkgs))
      ))
    ))
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
             (bost packages emacs-xyz)
             (utils)
             ;; ((utils) #:prefix bo:)
             )
(build emacs-copilot)
(build emacs-pythonic)
|#

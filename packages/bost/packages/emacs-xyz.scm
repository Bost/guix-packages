(define-module (bost packages emacs-xyz)
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
    (inputs (list emacs-eval-sexp-fu-el))
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
    (inputs (list
      emacs-s
      emacs-dash
      emacs-posframe))
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
    (inputs (list emacs-auto-complete))
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
    (inputs (list emacs-avy emacs-helm))
    (home-page "https://github.com/cute-jumper/ace-jump-helm-line")
    (synopsis "Ace-jump to a candidate in helm window")
    (description
     "Ace-jump to a candidate in helm window")
    (license license:gpl3+)))

(define-public emacs-xcscope
  (package
    (name "emacs-xcscope")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dkogan/xcscope.el")
             (commit "d228d7593d762e457340f678d14b663ef66d7cee")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pr85ywp585imjzswm04647nb4iqqvg8jgmbcs5210qmr9kh0z8d"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/dkogan/xcscope.el")
    (synopsis "cscope interface for (X)Emacs")
    (description
     "cscope interface for (X)Emacs")
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
    (inputs (list
             emacs-auto-complete
             emacs-company
             emacs-helm
             emacs-dash
             emacs-php-mode
             emacs-s
             emacs-f
             emacs-popup
             emacs-xcscope
             ))
    (home-page "https://github.com/xcwen/ac-php")
    (synopsis "emacs auto-complete & company-mode for php")
    (description
     "emacs auto-complete & company-mode for php")
    (license license:gpl3+)))

(define-public emacs-afternoon-theme
  (package
    (name "emacs-afternoon-theme")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "http://github.com/osener/emacs-afternoon-theme")
             (commit "89b1d778a1f8b385775c122f2bd1c62f0fbf931a")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19d5d6qs5nwmpf26rsb86ranb5p4236qp7p2b4i88cimcmzspylb"))))
    (build-system emacs-build-system)
    (home-page "http://github.com/osener/emacs-afternoon-theme")
    (synopsis "Dark color theme with a deep blue background")
    (description
     "Dark color theme with a deep blue background")
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

;; $ git --git-dir=/tmp/railscasts-theme/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/railscasts-theme

(define-public emacs-railscasts-theme
  (package
    (name "emacs-railscasts-theme")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mikenichols/railscasts-theme")
               (commit
                 "1340c3f6c2717761cab95617cf8dcbd962b1095b")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "021x1l5kzsbm0qj5a3bngxa7ickm4lbwsdz81a2ks9pi1ivmw205"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/mikenichols/railscasts-theme")
    (synopsis "Railscasts color theme for GNU Emacs.")
    (description "Railscasts color theme for GNU Emacs.")
    (license license:expat-0)))

;; $ git --git-dir=/tmp/color-theme-sanityinc-tomorrow/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/color-theme-sanityinc-tomorrow

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

;; $ git --git-dir=/tmp/emacs-theme-gruvbox/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/emacs-theme-gruvbox

(define-public emacs-gruvbox
  (package
    (name "emacs-gruvbox")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "http://github.com/greduan/emacs-theme-gruvbox")
               (commit
                 "736729265bfe5e247cf1b48bcf996e56516b0d89")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0dgjf86i8179l1nsjyc20chysqmy8yhphpd5lzv2ypx79l4z3jka"))))
    (build-system emacs-build-system)
    (inputs (list emacs-autothemer))
    (home-page
      "http://github.com/greduan/emacs-theme-gruvbox")
    (synopsis "Retro groove color scheme for Emacs. Port of the Vim version.")
    (description
     "Gruvbox is a retro groove color scheme for Emacs. It is a port of the Vim
version originally by Pavel Pertsev found here.")
    (license license:expat-0)))

;; $ git --git-dir=/tmp/sphinx-doc.el/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/sphinx-doc.el

(define-public emacs-sphinx-doc
  (package
    (name "emacs-sphinx-doc")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/naiquevin/sphinx-doc.el")
               (commit
                 "1eda612a44ef027e5229895daa77db99a21b8801")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0q72i95yx3xa57jlgr7dik6prf20hi8bp8xf3f5c6ificv7i5378"))))
    (build-system emacs-build-system)
    (inputs (list
             emacs-dash
             emacs-s))
    (home-page
      "https://github.com/naiquevin/sphinx-doc.el")
    (synopsis
     "Generate Sphinx friendly docstrings for Python functions in Emacs.")
    (description
     "Emacs minor mode for inserting docstring skeleton for Python functions
and methods. The structure of the docstring is as per the requirement of the
Sphinx documentation generator.")
    (license license:expat)))

;; $ git --git-dir=/tmp/anaconda-mode/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/anaconda-mode

;; Missing:
;; emacs-ansi-color
;; emacs-pythonic
;; (define-public emacs-anaconda-mode
;;   (package
;;     (name "emacs-anaconda-mode")
;;     (version "0.1.15")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;                (url "https://github.com/proofit404/anaconda-mode")
;;                (commit
;;                  "ca8edbaa7662d97e4a4416ec9a8d743863303911")))
;;         (file-name (git-file-name name version))
;;         (sha256
;;           (base32
;;             "1vlqrpxsy0xydm29vl39blwp7y82x9cr4mmaj8mji3hgjyfwph9m"))))
;;     (build-system emacs-build-system)
;;     (inputs (list
;;              emacs-ansi-color
;;              emacs-pythonic
;;              emacs-tramp
;;              emacs-xref
;;              emacs-json
;;              emacs-dash
;;              emacs-url
;;              emacs-s
;;              emacs-f
;;              ))
;;     (home-page
;;       "https://github.com/proofit404/anaconda-mode")
;;     (synopsis "")
;;     (description "")
;;     (license license:gpl3+)))
;; (format #t "(defined? 'emacs-anaconda-mode): ~a \n" (defined? 'emacs-anaconda-mode))

;; $ git --git-dir=/tmp/pippel/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/pippel

(define-public emacs-pippel
  (package
    (name "emacs-pippel")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/arifer612/pippel")
               (commit
                 "cb194952ee150e77601d3233dabdb521b976ee79")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "17606l24yyrjxa4rc0p2zj50lfbayqldw4phhi59yqf61289d520"))))
    (build-system emacs-build-system)
    (inputs (list
             emacs-dash
             emacs-s
             ))
    (home-page "https://github.com/arifer612/pippel")
    (synopsis "Emacs frontend to python package manager pip.")
    (description
     "Emacs frontend for the Python package manager pip. As pippel also uses
tabulated-list-mode, it provides a similiar package menu like
package-list-packages.")
    (license license:gpl3+)))

;; $ git --git-dir=/tmp/column-enforce-mode/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/column-enforce-mode

(define-public emacs-column-enforce-mode
  (package
    (name "emacs-column-enforce-mode")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/jordonbiondo/column-enforce-mode")
               (commit
                 "14a7622f2268890e33536ccd29510024d51ee96f")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1vxra5vk78yns2sw89m41bggczqg1akq6xvzfs9kylhkg5yz3g7g"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/jordonbiondo/column-enforce-mode")
    (synopsis
     "Highlight text that extends beyond a certain column.")
    (description
     "Highlight text that extends beyond a certain column. Can be used to
enforce 80 column rule (well more like suggest, not enforce). Meant to be a
very lightweight, zero configuration, way to help enforce the 80 column
rule. It can be configured for any N-column rule however.")
    (license license:gpl3+)))

;; 111111111111111111111111111111111111111

;; $ git --git-dir=/tmp/eziam-theme-emacs/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/eziam-theme-emacs

(define-public emacs-eziam-theme-emacs
  (package
    (name "emacs-eziam-theme-emacs")
    (version "0.1")
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
    (synopsis "")
    (description "")
    (license license:gpl3+)))

;; $ git --git-dir=/tmp/lsp-python-ms/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/lsp-python-ms

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
    (inputs (list
             emacs-lsp-mode))
    (home-page
      "https://github.com/emacs-lsp/lsp-python-ms")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

;; $ git --git-dir=/tmp/moe-theme.el/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/moe-theme.el

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
    (synopsis "")
    (description "")
    (license license:gpl3+)))

;; $ git --git-dir=/tmp/emacs-slim/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/emacs-slim

(define-public emacs-emacs-slim
  (package
    (name "emacs-emacs-slim")
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
    (home-page
      "http://github.com/slim-template/emacs-slim")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

;; $ git --git-dir=/tmp/zop-to-char/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/zop-to-char

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
    (synopsis "")
    (description "")
    (license license:gpl3+)))

;; $ git --git-dir=/tmp/font-utils/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/font-utils

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
    (synopsis "")
    (description "")
    (license license:gpl3+)))

;; $ git --git-dir=/tmp/emacs-lush-theme/.git log -n 1 --format=%H
;; $ guix hash -x --serializer=nar /tmp/emacs-lush-theme

(define-public emacs-lush
  (package
    (name "emacs-lush")
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
    (synopsis "")
    (description "")
    (license license:gpl3+)))

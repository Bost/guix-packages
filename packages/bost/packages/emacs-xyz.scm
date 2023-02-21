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

#|
Create a guix package emacs-afternoon-theme from http://github.com/osener/emacs-afternoon-theme using the latest commit on the master branch
|#

(define (build pkg-or-pkgs)
  "Move this function to the utils module"
  (load "/home/bost/dev/guix-packages/packages/bost/packages/emacs-xyz.scm")
  (use-modules (guix store)
               (guix derivations)
               (guix packages)
               (guix utils)
               (gnu packages emacs-xyz)
               (gnu packages mail)
               (bost packages emacs-xyz)
               )
  (let [(daemon (open-connection))]
    (define (partial fun . args) (lambda x (apply fun (append args x))))
    (format #t "(defined? 'partial): ~a\n" (defined? 'partial))
    (map (compose
          (partial build-derivations daemon)
          list
          (partial package-derivation daemon))
         (if (list? pkg-or-pkgs) pkg-or-pkgs
             (list pkg-or-pkgs)))))

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

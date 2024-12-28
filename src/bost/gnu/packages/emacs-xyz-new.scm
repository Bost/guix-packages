(define-module (bost gnu packages emacs-xyz-new)
  ;; #:use-module (utils)

  #:use-module (gnu packages emacs-xyz)

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
  )

(format #t "############## emacs-xyz-new \n")

(define-public emacs-code-review
  (let ((commit "26f426e99221a1f9356aabf874513e9105b68140")
        (revision "0"))
    (package
     (name "emacs-code-review")
     (version (git-version "0.0.7" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wandersoncferreira/code-review")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256 (base32 "1031sq40kysbkvl0cl4lq39ls13n0y3kafbmf4c30grbydljbd52"))))
     (build-system emacs-build-system)
     (propagated-inputs
      (list
       ;; emacs-code-review-actions
       ;; emacs-code-review-faces
       ;; emacs-code-review-interfaces
       ;; emacs-code-review-db
       ;; emacs-code-review-utils
       ;; emacs-code-review-comment
       ;; emacs-code-review-section
       ;; emacs-code-review-gitlab
       ;; emacs-code-review-github
       emacs-deferred  ;; seems to be in Emacs, however also in Guix (require 'deferred)
       emacs-emojify
       emacs-let-alist
       emacs-ghub
       emacs-a
       emacs-dash
       emacs-magit-section
       emacs-markdown-mode
       emacs-closql

       emacs-uuidgen           ; missing
       emacs-magit-diff        ; missing
       emacs-magit-git         ; missing
       emacs-forge-pullreq
       emacs-forge-post
       emacs-forge-core
       emacs-forge-github

       ))
     (home-page "https://github.com/wandersoncferreira/code-review")
     (synopsis "")
     (description "")
     (license license:gpl3+))))

;; (define-public emacs-auctex-latexmk
;;   (let ((commit "4d353522650d7685acbf1d38f7dbc504f734bd84")
;;         (revision "0"))
;;     (package
;;       (name "emacs-auctex-latexmk")
;;       (version (git-version "20220529.161054" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/tom-tan/auctex-latexmk")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "0qvscgffmzqk8lkcg3yk91vciim5ygk2m4crk02qn72ipkw5q13m"))))
;;       (build-system emacs-build-system)
;;       (home-page "https://github.com/tom-tan/auctex-latexmk")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

(define-public emacs-clean-aindent-mode
  (let ((commit "a97bcae8f43a9ff64e95473e4ef0d8bafe829211")
        (revision "0"))
    (package
      (name "emacs-clean-aindent-mode")
      (version (git-version "1.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pmarinov/clean-aindent-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07dgx09j6nn5dl9vpqfcs5yqm79kza3h3r1lb7r09wpkmrg0c2cr"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/pmarinov/clean-aindent-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-codegpt
  (let ((commit "55ccb75cf4c01d95c5e5cdad026c62ce484a8ca5")
        (revision "0"))
    (package
      (name "emacs-codegpt")
      (version (git-version "20240101.102013\n0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/codegpt")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1f5ld4p278nx2rc705am72mc1kdshbccwmy414kzihwy2xk43isn"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-spinner
             emacs-markdown-mode
             emacs-openai-completion
             emacs-openai-chat
             emacs-openai))
      (home-page "https://github.com/emacs-openai/codegpt")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-company-shell
  (let ((commit "5f959a63a6e66eb0cbdac3168cad523a62cc2ccd")
        (revision "0"))
    (package
      (name "emacs-company-shell")
      (version (git-version "1.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/company-shell")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lrkvfg0z9gwfcj90yihanysg8icxpbqq3wqyb734bi5fpmgmzr4"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-company))
      (home-page "https://github.com/Alexander-Miller/company-shell")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-concurrent
  (let ((commit "2239671d94b38d92e9b28d4e12fd79814cfb9c16")
        (revision "0"))
    (package
      (name "emacs-concurrent")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kiwanami/emacs-deferred")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vz59lm7pfz0gbsgrb44y555js85wbdjn0zm6p8wfqjiqf63ds3i"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-deferred  ;; seems to be in Emacs, however also in Guix (require 'deferred)
        emacs-lib       ;; doesn't exist
        ))
      (home-page "https://github.com/kiwanami/emacs-deferred")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-dall-e
  (let ((commit "98743d452ba8644d0da9f5ebbed1adfe79b65f32")
        (revision "0"))
    (package
      (name "emacs-dall-e")
      (version (git-version "20240101.102018\n0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/dall-e")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0qgyf0z3pwz03bnfbs88kcijg9s0lhn8fryr5cywrx9nipzn7d7n"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-async
        emacs-reveal-in-folder
        emacs-spinner
        emacs-ht
        emacs-lv
        emacs-openai-image
        emacs-openai
        emacs-let-alist
        emacs-image
        ))
      (home-page "https://github.com/emacs-openai/dall-e")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-define-word
  (let ((commit "31a8c67405afa99d0e25e7c86a4ee7ef84a808fe")
        (revision "0"))
    (package
      (name "emacs-define-word")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/abo-abo/define-word")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0h3dasg81f1b08xvz38nyd887pdlv60kj8q50kk2aqlpkr8j0y18"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-nxml-mode
        emacs-url-http
        emacs-url-parse
        ))
      (home-page "https://github.com/abo-abo/define-word")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-dired-quick-sort
  (let ((commit "eaeab1021b391e3d6275ba7c186c5ac95fb8a10e")
        (revision "0"))
    (package
      (name "emacs-dired-quick-sort")
      (version (git-version "0.2+" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/xuhdev/dired-quick-sort.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1sxdiw1qwpr49a0l2q899r78mnwcwqhj4dfs22261acw7ifk07yb"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-hydra
        emacs-savehist
        emacs-ls-lisp
        emacs-dired
        ))
      (home-page "https://gitlab.com/xuhdev/dired-quick-sort.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

;; (define-public emacs-drupal-mode
;;   (let ((commit "3f91d1d44df11ebd0137a896055fca6a1bb2f554")
;;         (revision "0"))
;;     (package
;;       (name "emacs-drupal-mode")
;;       (version (git-version "0.8.1" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/arnested/drupal-mode")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "0gia6qrzdai0qa903gnxvnfn5mnva577jdf8zccz3i3f2ki02ygb"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs (list sql json format-spec php-mode))
;;       (home-page "https://github.com/arnested/drupal-mode")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

(define-public emacs-elisp-def
  (let ((commit "1ad4baccbf3d0d13e7607d332ae6bc60a5dd7360")
        (revision "0"))
    (package
      (name "emacs-elisp-def")
      (version (git-version "1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Wilfred/elisp-def")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0k1r4fyai53p7y5vqwqjxdiqlnmrrxqaxglc22j54kdic8j1lbl7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacsert
        emacs-xref
        emacs-find-func
        emacs-f
        emacs-s
        emacs-dash
        ))
      (home-page "https://github.com/Wilfred/elisp-def")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-ellama
  (let ((commit "882b0b241c2f69124edce70d41dc95ff49cb40e8")
        (revision "0"))
    (package
      (name "emacs-ellama")
      (version (git-version "20241025.2349" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/s-kostyaev/ellama")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0b55m87dqrc07y6jbjf3lf4d2gjyd0s6ndvap43y3fpwz1yq28fp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-compat
        emacs-transient
        emacs-spinner
        emacs-llm-provider-utils
        emacs-llm
        ))
      (home-page "https://github.com/s-kostyaev/ellama")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-emacsql
  (let ((commit "fb05d0f72729a4b4452a3b1168a9b7b35a851a53")
        (revision "0"))
    (package
      (name "emacs-emacsql")
      (version (git-version "4.0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/emacsql")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "15nmp5dl2a1iyc99wlaywclnqsi2p34vgrp2x62671ccxnvzg8ii"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacsql-compiler
        ))
      (home-page "https://github.com/magit/emacsql")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-emr
  (let ((commit "cac1b52932926f56d7f6d2923732d20bbd20670d")
        (revision "0"))
    (package
      (name "emacs-emr")
      (version (git-version "0.4.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Wilfred/emacs-refactor")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "06rmknnhzcm3fy1iipvryl85fcshpalz50500rrz8k3vkl2dps2i"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-popup
        emacs-s
        emacs-dash))
      (home-page "https://github.com/Wilfred/emacs-refactor")
      (synopsis "Framework for language-specific code refactoring in Emacs")
      (description
       "This package provides Emacs Refactor (EMR), a framework that offers
 language-specific refactoring commands within Emacs. It supports various
 programming languages, including Emacs Lisp, JavaScript, Ruby, and Scheme,
 enabling context-sensitive refactoring operations such as extracting
 functions or variables, inlining code, and tidying imports. EMR enhances code
 maintainability and development efficiency by integrating refactoring tools
 directly into the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-erc-tweet
  (let ((commit "91fed61e139fa788d66a7358f0d50acc896414b8")
        (revision "0"))
    (package
      (name "emacs-erc-tweet")
      (version (git-version "0.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kidd/erc-tweet.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "118q4zj9dh5xnimcsi229j5pflhcd8qz0p212kc4p9dmyrx2iw0n"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-erc ;; missing
        ))
      (home-page "https://github.com/kidd/erc-tweet.el")
      (synopsis "Display inline tweets in ERC buffers")
      (description
       "This package enhances Emacs' ERC (Emacs IRC client) by displaying
 tweet content directly within IRC buffers. When a Twitter URL is detected in
 the chat, the corresponding tweet text is fetched and shown inline, providing
 immediate context without the need to open external links. This feature
 improves the chat experience by integrating external content seamlessly into
 the conversation.")
      (license license:gpl3+))))

(define-public emacs-erc-view-log
  (let ((commit "c5a25f0cbca84ed2e4f72068c02b66bd0ea3b266")
        (revision "0"))
    (package
      (name "emacs-erc-view-log")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Niluge-KiWi/erc-view-log")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bzi2sh2fhrz49j5y53h6jgf41av6rx78smb3bbk6m74is8vim2y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-erc ;; missing
        ))
      (home-page "https://github.com/Niluge-KiWi/erc-view-log")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-erc-yt
  (let ((commit "43e7d49325b17a3217a6ffb4a9daf75c5ff4e6f8")
        (revision "0"))
    (package
      (name "emacs-erc-yt")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yhvh/erc-yt.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dlw34kaslyvnsrahf4rm76r2b7qqqn589i4mmhr23prl8xbz9z9"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-erc ;; missing
        ))
      (home-page "https://github.com/yhvh/erc-yt.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-evil-easymotion
  (let ((commit "f96c2ed38ddc07908db7c3c11bcd6285a3e8c2e9")
        (revision "0"))
    (package
      (name "emacs-evil-easymotion")
      (version (git-version "20160228" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pythonnut/evil-easymotion")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0xsva9bnlfwfmccm38qh3yvn4jr9za5rxqn4pwxbmhnx4rk47cch"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/pythonnut/evil-easymotion")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-evil-lisp-state
  (let ((commit "3c65fecd9917a41eaf6460f22187e2323821f3ce")
        (revision "0"))
    (package
      (name "emacs-evil-lisp-state")
      (version (git-version "8.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/evil-lisp-state")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1n6r8xs670r5qp4b5f72nr9g8nlqcrx1v7yqqlbkgv8gns8n5xgh"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-bind-map
        emacs-smartparens
        emacs-evil))
      (home-page "https://github.com/syl20bnr/evil-lisp-state")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-evil-textobj-line
  (let ((commit "9eaf9a5485c2b5c05e16552b34632ca520cd681d")
        (revision "0"))
    (package
      (name "emacs-evil-textobj-line")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/evil-textobj-line")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1w98gc1sqik8ab35a1hg5853dwar98a8qd94lxpq4ckabpgypins"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil))
      (home-page "https://github.com/emacsorphanage/evil-textobj-line")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-evil-tutor
  (let ((commit "4e124cd3911dc0d1b6817ad2c9e59b4753638f28")
        (revision "0"))
    (package
      (name "emacs-evil-tutor")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/evil-tutor")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00yfq8aflxvp2nnz7smgq0c5wlb7cips5irj8qs6193ixlkpffvx"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil))
      (home-page "https://github.com/syl20bnr/evil-tutor")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-evil-visual-mark-mode
  (let ((commit "2bbaaae56ae53e68a8bcc7bc2cfe830a14843b4d")
        (revision "0"))
    (package
      (name "emacs-evil-visual-mark-mode")
      (version (git-version "0.0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/roman/evil-visual-mark-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ggxifiz2qm26v2fw8m9ccjp3jbmhyhb8wv93m8k1pnyh8b7la2m"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-evil))
      (home-page "https://github.com/roman/evil-visual-mark-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flx-ido
  (let ((commit "4b1346eb9a8a76ee9c9dede69738c63ad97ac5b6")
        (revision "0"))
    (package
      (name "emacs-flx-ido")
      (version (git-version "0.6.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/lewang/flx")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q49p1y3kpx140h0f97kfw4kfx8mlzzxbninbarvygmlg2fkfi1n"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flx))
      (home-page "https://github.com/lewang/flx")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flycheck-bashate
  (let ((commit "5e673c591d017329d0a07a61dc1223fa98639ee2")
        (revision "0"))
    (package
      (name "emacs-flycheck-bashate")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alexmurray/flycheck-bashate")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1gaih50mkyby0r4qnmc03dy111ik4and5p6r3lvsflpvd3hcxjn3"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck))
      (home-page "https://github.com/alexmurray/flycheck-bashate")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flycheck-credo
  (let ((commit "e285bd042a535d0f13e0b4c5226df404cdda4033")
        (revision "0"))
    (package
      (name "emacs-flycheck-credo")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/aaronjensen/flycheck-credo")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1n41liayykjmh1xwfnhdvw9bdxjca7d274gkpjfzhvhmbv7dig19"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck))
      (home-page "https://github.com/aaronjensen/flycheck-credo")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flycheck-elsa
  (let ((commit "d60db9544d0c4213f2478bcea0fd0e668e31cf34")
        (revision "0"))
    (package
      (name "emacs-flycheck-elsa")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-elsa/flycheck-elsa")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ig9dc7ch3cdxp4p24v21h7hrdph9y5jy9421bfww6agymbj8i85"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck))
      (home-page "https://github.com/emacs-elsa/flycheck-elsa")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flycheck-pos-tip
  (let ((commit "dc57beac0e59669926ad720c7af38b27c3a30467")
        (revision "0"))
    (package
      (name "emacs-flycheck-pos-tip")
      (version (git-version "0.4-cvs" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/flycheck/flycheck-pos-tip")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "15h4m5cfk0vh1g630vlwfxmcpa1jdalrrldnvijsqla99mb2jm1w"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pos-tip
        emacs-flycheck))
      (home-page "https://github.com/flycheck/flycheck-pos-tip")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flyspell-correct-helm
  (let ((commit "1e7a5a56362dd875dddf848b9a9e25d1395b9d37")
        (revision "0"))
    (package
      (name "emacs-flyspell-correct-helm")
      (version (git-version "0.6.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/d12frosted/flyspell-correct")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q6y40mm6z5ifngwzah9ax6z9dlka3rw3q1am08hmia15vk7bx4g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        emacs-flyspell-correct))
      (home-page "https://github.com/d12frosted/flyspell-correct")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-gh-md
  (let ((commit "e721fd5e41e682f47f2dd4ce26ef2ba28c7fa0b5")
        (revision "0"))
    (package
      (name "emacs-gh-md")
      (version (git-version "0.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-pe/gh-md.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xnfq6bbc5bgkd0mzkr7r66sd85qfn859swpsp6sr0xfl8cq12wm"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/emacs-pe/gh-md.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-gitignore-templates
  (let ((commit "d28cd1cec00242b688861648d36d086818b06099")
        (revision "0"))
    (package
      (name "emacs-gitignore-templates")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/xuchunyang/gitignore-templates.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x4pg4jpgmbvfw854ps9w3xgp8bgm7n7vmcvk3kp7h2s56l8s2xb"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/xuchunyang/gitignore-templates.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-haml-mode
  (let ((commit "a64d58df8f098f858c6c11fa1629a90969f9c7e8")
        (revision "0"))
    (package
      (name "emacs-haml-mode")
      (version (git-version "3.2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nex3/haml-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0d0b8xy8d6vd79y0vcjbgjgakn3nz5vdysw5m1ci2xz31agggf6f"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/nex3/haml-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-helm-comint
  (let ((commit "5f435ede181818b6f8c58ad7b45f47acd2721daf")
        (revision "0"))
    (package
      (name "emacs-helm-comint")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/benedicthw/helm-comint.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0k95q7hdy7sp3l8yifjnc6f7xfplnqy8qff806yfgqiyy7gpx72p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm-elisp
        emacs-helm-help
        emacs-helm-lib
        emacs-helm))
      (home-page "https://github.com/benedicthw/helm-comint.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-helm-purpose
  (let ((commit "9ff4c21c1e9ebc7afb851b738f815df7343bb287")
        (revision "0"))
    (package
      (name "emacs-helm-purpose")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bmag/helm-purpose")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xh6v5xlf1prgk6mrvkc6qa0r0bz74s5f4z3dl7d00chsi7i2m5v"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-window-purpose
        emacs-helm-buffers))
      (home-page "https://github.com/bmag/helm-purpose")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-hungry-delete
  (let ((commit "d919e555e5c13a2edf4570f3ceec84f0ade71657")
        (revision "0"))
    (package
      (name "emacs-hungry-delete")
      (version (git-version "1.1.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/nflath/hungry-delete")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1hjihncj6q971zj1xfnfmyvx8wv19wdnglnmz1278fwsgrcs050d"))))
      (build-system emacs-build-system)
      (home-page "http://github.com/nflath/hungry-delete")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-impatient-mode
  (let ((commit "7b54b015de4b3b81266291e9cfe688f7e20eb40a")
        (revision "0"))
    (package
      (name "emacs-impatient-mode")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/netguy204/imp.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0qcrza3c4iigzv79mqy2xqi1x2fgvz2b2hmfsjaig6z9w5lgfnz8"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-htmlize
        emacs-simple-httpd))
      (home-page "https://github.com/netguy204/imp.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-importmagic
  (let ((commit "570fb4f519d5e84dd681f932447cb995e8460840")
        (revision "0"))
    (package
      (name "emacs-importmagic")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/anachronic/importmagic.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xrlnighvzgmfb4fwnp07bnj1wyym1pn4ap62swq0h0mcq8gjr80"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-f
        emacs-epc))
      (home-page "https://github.com/anachronic/importmagic.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-journalctl-mode
  (let ((commit "631d10a5c8f466c94c38c3cd7410a27026f5f822")
        (revision "0"))
    (package
      (name "emacs-journalctl-mode")
      (version (git-version "1.1\n1.1 New features:" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/SebastianMeisel/journalctl-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1p3mgza73yls8f7v063jb49z0ylmvni4v812abqvvvrn5q396286"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/SebastianMeisel/journalctl-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-kbd-mode
  (let ((commit "b07f3e16043fbb268b3e47fb49abc419e8b7e2d7")
        (revision "0"))
    (package
      (name "emacs-kbd-mode")
      (version (git-version "20241014.215821\n0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kmonad/kbd-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lnnr71g1nvqlyvzaiq7nqcnwhwh34xg2wfig1j5xb9wvblrg621"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/kmonad/kbd-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-live-py-mode
  (let ((commit "931fcff56a2fc22059f77b3ddde4ecc38f3d7e24")
        (revision "0"))
    (package
      (name "emacs-live-py-mode")
      (version (git-version "4.10.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/donkirkby/live-py-plugin")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0mhdsd3p5mp1xa4q4vxrjp06xnd800rmn3jm4ij82jl72wkf025i"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/donkirkby/live-py-plugin")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-livid-mode
  (let ((commit "dfe5212fa64738bc4138bfebf349fbc8bc237c26")
        (revision "0"))
    (package
      (name "emacs-livid-mode")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pandeiro/livid-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "178ldzpk8a9m9abn8xlplxn5jgcca71dpkp82bs5g7bsccp3rx6p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        emacs-skewer-mode))
      (home-page "https://github.com/pandeiro/livid-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-llm
  (let ((commit "14dbbde595adbcb621e0bb0429f4982c9a9bc2cc")
        (revision "0"))
    (package
      (name "emacs-llm")
      (version (git-version "0.17.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ahyatt/llm")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1x43ghb5lg3y7p6jwz52lyy5rwyy245lm7kdbwwx3alisdn21nmj"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/ahyatt/llm")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-lsp-mode
  (let ((commit "9b104105adecf637188f4e3bf5cc228bda12374a")
        (revision "0"))
    (package
      (name "emacs-lsp-mode")
      (version (git-version "9.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lgkj8czspjscyj090g9kwcqb7j01l7cgx89m8ac5n715lk7n9nd"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-lsp-protocol
        emacs-spinner
        emacs-s
        emacs-markdown-mode
        emacs-ht
        emacs-f
        emacs-dash))
      (home-page "https://github.com/emacs-lsp/lsp-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-maven-test-mode
  (let ((commit "a19151861df2ad8ae4880a2e7c86ddf848cb569a")
        (revision "0"))
    (package
      (name "emacs-maven-test-mode")
      (version (git-version "0.1.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/rranelli/maven-test-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xn2yyr8mr90cynbxgv0h5v180pzf0ydnjr9spg34mrdicqlki6c"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s))
      (home-page "http://github.com/rranelli/maven-test-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-molokai
  (let ((commit "cc53e997e7eff93b58ad16a376a292c1dd66044b")
        (revision "0"))
    (package
      (name "emacs-molokai")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alloy-d/color-theme-molokai")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "109z13y6f54idzxk4incd4r0d3fr7wm7r8ifmd0s5hv1v1i93jc0"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/alloy-d/color-theme-molokai")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-nose
  (let ((commit "3b517aff31529bab33f8d7b562bd17aff0107fd1")
        (revision "0"))
    (package
      (name "emacs-nose")
      (version (git-version "0.3\n20150423.34839" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rasmus-toftdahl-olesen/iss-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0992lzgar0kz9i1sk5vz17q9qzfgl8fkyxa1q0hmhgnpjf503cnj"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/rasmus-toftdahl-olesen/iss-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-org-projectile
  (let ((commit "bf1c30b750020ab8dd634dd66b2c7b76c56286c5")
        (revision "0"))
    (package
      (name "emacs-org-projectile")
      (version (git-version "3.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/colonelpanic8/org-project-capture")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1wvw5y5s37p9j0m2ljp7n1s1casbhiyrcnfpvdghvdd0fk8wcybp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-org-category-capture
        emacs-org-project-capture
        emacs-org-project-capture-backend
        emacs-projectile))
      (home-page "https://github.com/colonelpanic8/org-project-capture")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-overseer
  (let ((commit "7fdcf1a6fba6b1569a09c1666b4e51bcde266ed9")
        (revision "0"))
    (package
      (name "emacs-overseer")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tonini/overseer.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1f0nm253n0k2rcx0zydj8c4nn5gmvhabzraajxdqycb2ak77nbif"))))
      (build-system emacs-build-system)
      (propagated-inputs (list ansi-color pkg-info f dash compile))
      (home-page "https://github.com/tonini/overseer.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-pdf-view-restore
  (let ((commit "5a1947c01a3edecc9e0fe7629041a2f53e0610c9")
        (revision "0"))
    (package
      (name "emacs-pdf-view-restore")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/007kevin/pdf-view-restore")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1b9zzvfsprf7x0v7l4dabdh5qdfhl7mm30vvqah8l10jvlf2wlc7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pdf-view))
      (home-page "https://github.com/007kevin/pdf-view-restore")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-php-extras
  (let ((commit "d410c5af663c30c01d461ac476d1cbfbacb49367")
        (revision "0"))
    (package
      (name "emacs-php-extras")
      (version (git-version "2.2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/arnested/php-extras")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0mcgwisnqplav0ga8xqqw72523iv841wp2cyw7d4lkzgpiav51dg"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/arnested/php-extras")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-phpunit
  (let ((commit "650a50898de1fa4eeb47360b12aeb1126b2448c2")
        (revision "0"))
    (package
      (name "emacs-phpunit")
      (version (git-version "0.17.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nlamirault/phpunit.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03vs9ni9nhm7rzr3qkgcjbldqxcds20ai2c52sw8wc6zpp5qijsc"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-f
        emacs-s))
      (home-page "https://github.com/nlamirault/phpunit.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-pip-requirements
  (let ((commit "31e0dc62abb2d88fa765e0ea88b919d756cc0e4f")
        (revision "0"))
    (package
      (name "emacs-pip-requirements")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Wilfred/pip-requirements.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08q225h8kahh632qkzpb1ih3jqg5imlzgrrh8ynkyxrr710madkl"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emasc-dash))
      (home-page "https://github.com/Wilfred/pip-requirements.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-pipenv
  (let ((commit "3af159749824c03f59176aff7f66ddd6a5785a10")
        (revision "0"))
    (package
      (name "emacs-pipenv")
      (version (git-version "0.0.1-beta" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pwalsh/pipenv.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ak9dvjqhdm12i7yamgbqjmc4zmvy2f0gd1nia1q9dy3n6576ryq"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pyvenv
        emacs-s))
      (home-page "https://github.com/pwalsh/pipenv.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-poetry
  (let ((commit "1dff0d4a51ea8aff5f6ce97b154ea799902639ad")
        (revision "0"))
    (package
      (name "emacs-poetry")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cybniv/poetry.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0n5v6c75pal2xd8p453jrd046zkv0y1pzgn5w2n2ws1009pw6crs"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pyvenv))
      (home-page "https://github.com/cybniv/poetry.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-py-isort
  (let ((commit "e67306f459c47c53a65604e4eea88a3914596560")
        (revision "0"))
    (package
      (name "emacs-py-isort")
      (version (git-version "2016.1\n0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/paetzke/py-isort.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08i55gv392wc12x8v3dca0dmz8a8p9ljsqhyajsb6qv1k120wqhx"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/paetzke/py-isort.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-pytest
  (let ((commit "8692f965bf4ddf3d755cf1fbf77a7a768e22460e")
        (revision "0"))
    (package
      (name "emacs-pytest")
      (version (git-version "0.2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ionrock/pytest-el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "13s3zqxjlas4rq70gxgl8nrhasrx8j8ml9xls7lgghk12ppiqil9"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s))
      (home-page "https://github.com/ionrock/pytest-el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-reformatter
  (let ((commit "8962e1dd0c949997413380ea1f8d8a25ada5f624")
        (revision "0"))
    (package
      (name "emacs-reformatter")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/emacs-reformatter")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lp7lmfaq23hpk5lvl0b291jnky1xq7ixi8ry2lrxdl64rr9fwvf"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/purcell/emacs-reformatter")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-reveal-in-folder
  (let ((commit "f5991b8e4f4e86bd47629688a05fabd92dfe25ac")
        (revision "0"))
    (package
      (name "emacs-reveal-in-folder")
      (version (git-version "20240226.13721\n0.1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jcs-elpa/reveal-in-folder")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "156fb1zcjr2i1f6dv10vnz74wbiylawi7npd2kwr2zrpdf8sflqi"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        emacs-f))
      (home-page "https://github.com/jcs-elpa/reveal-in-folder")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-sass-mode
  (let ((commit "247a0d4b509f10b28e4687cd8763492bca03599b")
        (revision "0"))
    (package
      (name "emacs-sass-mode")
      (version (git-version "3.0.16" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nex3/sass-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1nhk12lhvkwdk8s8fx33p6rssi0gcfx2zkanq23rz6k28v5zi5yp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-haml-mode))
      (home-page "https://github.com/nex3/sass-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-shell-maker
  (let ((commit "f0f4ff4c0b14d933f83b3a39043722c9869da0e5")
        (revision "0"))
    (package
      (name "emacs-shell-maker")
      (version (git-version "20241011.805" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/xenodium/chatgpt-shell")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1w15y2x3j5d3ac6lagmc3qa2n7gpyjp0bk0dn3kinrpj0sqcnds9"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/xenodium/chatgpt-shell")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-shfmt
  (let ((commit "78a96e66d2685672de3d0b7d627cd57a3b0caaf2")
        (revision "0"))
    (package
      (name "emacs-shfmt")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/emacs-shfmt")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x96q2ag85859mzfqjq4gy7s2h883nwc99nw4l4r9cfw7hpplwxb"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-reformatter))
      (home-page "https://github.com/purcell/emacs-shfmt")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-string-edit-at-point
  (let ((commit "87936d816ae24184dd83688136531b6b6f1943fe")
        (revision "0"))
    (package
      (name "emacs-string-edit-at-point")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magnars/string-edit.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ggn7l3bisjx1ab4jrhija3z3bh6zbafhzjl5cq92n7i2plz8qdm"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash))
      (home-page "https://github.com/magnars/string-edit.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-systemd
  (let ((commit "8742607120fbc440821acbc351fda1e8e68a8806")
        (revision "0"))
    (package
      (name "emacs-systemd")
      (version (git-version "1.6.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/holomorph/systemd-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cf63r0f8mg4zl6min48f8wby2k7g4v60lyw6j8gsjz8ppww8gx2"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/holomorph/systemd-mode")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-transient
  (let ((commit "a541b996bd03a21a81edc02f333016fd906b91b6")
        (revision "0"))
    (package
      (name "emacs-transient")
      (version (git-version "0.7.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/transient")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0d86dpws6bvv5qy7xfc3j8iljgckqqd0a17zvrrgsq92ky28s5n1"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
         emacs-compat))
      (home-page "https://github.com/magit/transient")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-treemacs-evil
  (let ((commit "2f0668439dfa246b2807497f2824ec7c7fbbeb49")
        (revision "0"))
    (package
      (name "emacs-treemacs-evil")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dhxg30jiix9s94al2n88nafm9vs4p1343lqnx1pi729zqkxc5yf"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-treemacs
        emacs-evil))
      (home-page "https://github.com/Alexander-Miller/treemacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-treemacs-icons-dired
  (let ((commit "2f0668439dfa246b2807497f2824ec7c7fbbeb49")
        (revision "0"))
    (package
      (name "emacs-treemacs-icons-dired")
      (version (git-version "20241017.2046" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dhxg30jiix9s94al2n88nafm9vs4p1343lqnx1pi729zqkxc5yf"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-treemacs))
      (home-page "https://github.com/Alexander-Miller/treemacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-treemacs-persp
  (let ((commit "2f0668439dfa246b2807497f2824ec7c7fbbeb49")
        (revision "0"))
    (package
      (name "emacs-treemacs-persp")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dhxg30jiix9s94al2n88nafm9vs4p1343lqnx1pi729zqkxc5yf"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-persp-mode
        emacs-treemacs))
      (home-page "https://github.com/Alexander-Miller/treemacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-treemacs-projectile
  (let ((commit "2f0668439dfa246b2807497f2824ec7c7fbbeb49")
        (revision "0"))
    (package
      (name "emacs-treemacs-projectile")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dhxg30jiix9s94al2n88nafm9vs4p1343lqnx1pi729zqkxc5yf"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-projectile
        emacs-treemacs))
      (home-page "https://github.com/Alexander-Miller/treemacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

;; (define-public emacs-helm-git-grep
;; ;;; guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz) emacs-helm-git-grep)'
;; ;;; doesn't compile:
;; ;;;   Error: void-variable (helm-git-grep-with-exclude-file-pattern-obsolete-message)
;;   (let ((commit "744cea07dba6e6a5effbdba83f1b786c78fd86d3")
;;         (revision "0"))
;;     (package
;;       (name "emacs-helm-git-grep")
;;       (version (git-version "0.10.1" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/yasuyk/helm-git-grep")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "172m7wbgx9qnv9n1slbzpd9j24p6blddik49z6bq3zdg1vlnf3dv"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs
;;        (list
;;         emacs-helm-files
;;         (@(gnu packages emacs-xyz) emacs-helm)))
;;       (home-page "https://github.com/yasuyk/helm-git-grep")
;;       (synopsis "Helm interface for Git grep in Emacs")
;;       (description
;;        "This package provides a Helm interface for Git's grep functionality
;;  within Emacs. It allows users to perform searches across a Git repository,
;;  including submodules, and view results in an interactive Helm buffer.
;;  Features include opening results in other windows or frames, toggling case
;;  sensitivity during searches, and saving search results to a writable grep
;;  buffer for further editing. Integration with tools like wgrep enhances the
;;  usability of search results.")
;;       (license license:gpl3+))))

;; (define-public emacs-helm-git-grep
;; ;;; guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz) emacs-helm-git-grep)'
;; ;;; doesn't compile:
;; ;;;   Error: void-variable (helm-git-grep-with-exclude-file-pattern-obsolete-message)
;;   (let ((commit "e3ae5f60585ac0213876dca5093aca467db1ac5b")
;;         (revision "0"))
;;     (package
;;       (name "emacs-helm-git-grep")
;;       (version (git-version "0.10.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/yasuyk/helm-git-grep")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "0bld5kjzgjhkjcjc7b66kg55yb7pzrbnxfqx79f5glxckbp2pxjr"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs
;;        (list
;;         emacs-helm-files
;;         (@(gnu packages emacs-xyz) emacs-helm)))
;;       (home-page
;;        "https://github.com/yasuyk/helm-git-grep")
;;       (synopsis "Helm interface for Git grep in Emacs")
;;       (description
;;        "This package provides a Helm interface for Git's grep functionality
;;  within Emacs. It allows users to perform searches across a Git repository,
;;  including submodules, and view results in an interactive Helm buffer.
;;  Features include opening results in other windows or frames, toggling case
;;  sensitivity during searches, and saving search results to a writable grep
;;  buffer for further editing. Integration with tools like wgrep enhances the
;;  usability of search results.")
;;       (license license:gpl3+))))

;; (define-public emacs-helm-git-grep
;; ;;; guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz) emacs-helm-git-grep)'
;; ;;; doesn't compile:
;; ;;;   Error: file-missing ("Cannot open load file" "No such file or directory" "helm-elscreen")
;;   (let ((commit "6ca2fcd44510305cf019815d61bf65eca200c238")
;;         (revision "0"))
;;     (package
;;       (name "emacs-helm-git-grep")
;;       (version (git-version "0.9.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/yasuyk/helm-git-grep")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "0qmxccwpv7l5lbhv9n7ylikzcggdr99qzci868ghf33p4zhqyrj5"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs
;;        (list
;;         emacs-helm-files
;;         (@(gnu packages emacs-xyz) emacs-helm)))
;;       (home-page
;;        "https://github.com/yasuyk/helm-git-grep")
;;       (synopsis "Helm interface for Git grep in Emacs")
;;       (description
;;        "This package provides a Helm interface for Git's grep functionality
;;  within Emacs. It allows users to perform searches across a Git repository,
;;  including submodules, and view results in an interactive Helm buffer.
;;  Features include opening results in other windows or frames, toggling case
;;  sensitivity during searches, and saving search results to a writable grep
;;  buffer for further editing. Integration with tools like wgrep enhances the
;;  usability of search results.")
;;       (license license:gpl3+))))

(format #t "############## emacs-xyz-new done.\n")

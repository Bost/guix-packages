(define-module (bost gnu packages emacs-xyz)
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

  ;; #:use-module (gnu packages emacs-xyz)
  #:use-module (bost gnu packages emacs-xyz-done)
  #:use-module (bost gnu packages emacs-xyz--dap-mode)
  #:re-export
  (
   emacs-lsp-ui

   emacs-dap-launch
   emacs-dap-tasks
   emacs-lsp-docker
   emacs-dap-mode
   emacs-dap-utils
   emacs-dap-chrome
   emacs-dap-overlays
   emacs-lsp-mode
   emacs-helm-lsp

   emacs-lsp-lens
   emacs-lsp-protocol
   emacs-lsp-java
   emacs-lsp-metals
   emacs-lsp-metals-protocol
   emacs-lsp-metals-treeview
   emacs-treemacs-treelib

   emacs-auto-highlight-symbol
   emacs-color-theme-sanityinc-tomorrow
   emacs-color-theme-sanityinc-solarized
   emacs-lsp-python-ms
   emacs-moe-theme
   emacs-slim-mode
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
   emacs-term-cursor
   emacs-lsp-pyright
   emacs-lsp-origami
   emacs-winum
   emacs-frame-fns
   emacs-frame-cmds
   emacs-zoom-frm
   ))

;;; Multiple possibilities: 1. either add a single from from URI:
;; (define-public emacs-zoom-frm
;;   (package
;;     (name "emacs-zoom-frm")
;;     (version "0")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri "https://www.emacswiki.org/emacs/download/zoom-frm.el")
;;        (sha256
;;         (base32
;;          "1l39hw0n3w96980varljd3z37d8a2x0yj577hcaf3qbwqywfgv9v"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-frame-cmds))
;;     (home-page "https://www.emacswiki.org/emacs/zoom-frm.el")
;;     (synopsis "Commands to zoom frame font size")
;;     (description "Commands to zoom frame font size.")
;;     (license license:gpl3+)))

;;; Multiple possibilities: 2. or inherit from an empty non-public package:
;; (define emacs-dap-base
;;   (let ((commit
;;          "2f0c5b28578ce65ec746e4084ba72ba5c652ea79")
;;         (revision "0"))
;;     (package
;;       (name "emacs-dap-base")
;;       (version (git-version "0.7" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/emacs-lsp/dap-mode.git")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "0jkfj8x2ng8dbww4pscl1qqp3s1k3gzy3rv58fpagl9x38rb7h5h"))))
;;       (build-system emacs-build-system)
;;       (arguments
;;        (list
;;         ;; Exclusions are done on top of the inclusions. However using
;;         ;; (inherit emacs-dap-base) we can effectivelly invert that. So then
;;         ;; the order is will be:
;;         ;; 1. emacs-dap-base include
;;         ;; 2. emacs-dap-base exclude
;;         ;; 3. emacs-dap-<..> include

;;         ;; Exclude all;
;;         ;; Also, matching every string except "foo" using lookahead assertion
;;         ;; "^\\(?!foo$\\).*" doesn't work. Lookahead assertions are not
;;         ;; supported in POSIX regular expressions used by Guile
;;         #:exclude #~(cons*
;;                      "^[^/]*\\.el$"
;;                      %default-exclude)))
;;       (home-page
;;        "https://github.com/emacs-lsp/dap-mode.git")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

(define emacs-spacemacs-base
  (let ((commit
         "2254b9c16150165f459895bb49bc309b029b54e4")
        (revision "0"))
    (package
      (name "emacs-spacemacs-base")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/spacemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "07mnf0669awwr454s94qyd4j2kzcfg8hc7q98lii9lf66fyaciyb"))))
      (build-system emacs-build-system)
      (arguments
       (list
;;; Exclusions are done on top of the inclusions. However using (inherit
;;; emacs-dap-base) we can effectivelly invert that. So then the order is will
;;; be:
;;; 1. emacs-dap-base include
;;; 2. emacs-dap-base exclude
;;; 3. emacs-dap-<..> include

        ;; Exclude all;
        ;; Also, matching every string except "foo" using lookahead assertion
        ;; "^\\(?!foo$\\).*" doesn't work. Lookahead assertions are not
        ;; supported in POSIX regular expressions used by Guile
        #:exclude #~(cons*
                     "^[^/]*\\.el$"
                     %default-exclude)))
      (home-page "http://spacemacs.org/")
      (synopsis "Community-driven Emacs distribution - The best editor is neither Emacs nor
Vim, it's Emacs *and* Vim!")
      (description
       "Spacemacs is a new way of experiencing Emacs -- it's a sophisticated
 and polished set-up, focused on ergonomics, mnemonics and consistency.")
      (license license:gpl3+))))

(define all-info-include (quote (list "^[^/]*\\.info$" "^doc/.*\\.info$")))

(define-public emacs-rst-lists
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-lists")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+lang/restructuredtext/local/rst-lists/rst-lists\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-versions
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-versions")
    (arguments
     (list #:include `(cons*
                       "^core/core-versions\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-load-paths
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-load-paths")
    (arguments
     (list #:include `(cons*
                       "^core/core-load-paths\\.el$"
                       ,all-info-include)))))

(define-public emacs-spacemacs-ht
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-ht")
    (arguments
     (list #:include `(cons*
                       "^core/libs/forks/spacemacs-ht\\.el$"
                       ,all-info-include)))))

(define-public emacs-persistent-soft
  (let ((commit
         "a1e0ddf2a12a6f18cab565dee250f070384cbe02")
        (revision "0"))
    (package
      (name "emacs-persistent-soft")
      (version (git-version "0.8.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rolandwalker/persistent-soft.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "14p20br8vzxs39d4hswzrrkgwql5nnmn5j17cpbabzjvck42rixc"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/rolandwalker/persistent-soft.git")
      (synopsis "Persistent storage for Emacs, returning nil on failure")
      (description "Wrapper around pcache.el, providing \"soft\" fetch and
 store routines which never throw an error, but instead return nil on failure.")
      (license license:gpl3+))))

#|
The license was identified as 'bsd-2' by ChatGPT using following prompt:

Have a look at the BSD License definitions 'bsd-0', 'bsd-1', 'bsd-2',
'bsd-3', 'bsd-4', in the 'guix/guix/licenses.scm' from the source code of the
GNU Guix project identify the definition to which the text bellow
corresponds. The solution MUST be one of the aforementioned 'bsd-0', 'bsd-1',
'bsd-2', 'bsd-3', 'bsd-4'.

----------------------------

Text between the lines 98 - 129:
https://github.com/rolandwalker/font-utils/blob/abc572eb0dc30a26584c0058c3fe6c7273a10003/font-utils.el#L98-L129
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
      (propagated-inputs
       (list emacs-persistent-soft))
      (home-page "http://github.com/rolandwalker/font-utils")
      (synopsis "Utility functions for working with fonts in Emacs")
      (description
       "Font-utils is a collection of functions for working with fonts.  This library
has no user-level interface, it is only useful for programming in Emacs Lisp.")
      (license license:bsd-2))))

(define-public emacs-ucs-utils
  (let ((commit
         "91b9e0207fff5883383fd39c45ad5522e9b90e65")
        (revision "0"))
    (package
      (name "emacs-ucs-utils")
      (version (git-version "0.9.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rolandwalker/ucs-utils")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "18yqzy8w4icp60z25ckbrx6wradm3m26vic35kmzr88msc0qdsva"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/rolandwalker/ucs-utils")
      (synopsis "Utilities for Unicode characters in Emacs")
      (description
       "Utilities for manipulating Unicode characters, with integrated ability
 to return fallback characters when Unicode display is not possible.")
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
      (propagated-inputs
       (list
        emacs-ucs-utils))
      (home-page
       "https://github.com/rolandwalker/unicode-fonts")
      (synopsis "Configure Unicode fonts for Emacs")
      (description
       "Mappings for 233 of the 255 blocks in the Unicode 8.0 standard which
 are public and have displayable characters.")
      (license license:gpl3+))))

(define-public emacs-magit
    ;; Use this unreleased commit to benefit from a recent improvements with
    ;; regard to adding git trailers such as "Reviewed-by".
  (let ((commit "b9948f9571928bb7f39f4b3a112bd76e52a072ce")
        (revision "8"))
    (package
      (name "emacs-magit")
      (version (git-version "3.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0yw62knfz5xvmfbcvdg2li1lla5hkyfnz0cmc6lqzisy4yscjjyr"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #t
        #:test-command #~(list "make" "test")
        #:exclude #~(cons* "magit-libgit.el"
                           "magit-libgit-pkg.el"
                           %default-exclude)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'build-info-manual
              (lambda _
                (invoke "make" "info")
                ;; Copy info files to the lisp directory, which acts as
                ;; the root of the project for the emacs-build-system.
                (for-each (lambda (f)
                            (install-file f "lisp"))
                          (find-files "docs" "\\.info$"))))
            (add-after 'build-info-manual 'set-magit-version
              (lambda _
                (make-file-writable "lisp/magit.el")
                (emacs-substitute-variables "lisp/magit.el"
                  ("magit-version" #$version))))
            (add-after 'set-magit-version 'patch-exec-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (for-each make-file-writable
                          (list "lisp/magit-git.el" "lisp/magit-sequence.el"))
                (emacs-substitute-variables "lisp/magit-git.el"
                  ("magit-git-executable"
                   (search-input-file inputs "/bin/git")))
                (emacs-substitute-variables "lisp/magit-sequence.el"
                  ("magit-perl-executable"
                   (search-input-file inputs "/bin/perl")))))
            (add-before 'check 'configure-git
              (lambda _
                ;; Otherwise some tests fail with error "unable to auto-detect
                ;; email address".
                (setenv "HOME" (getcwd))
                (invoke "git" "config" "--global" "user.name" "toto")
                (invoke "git" "config" "--global" "user.email"
                        "toto@toto.com")))
            (replace 'expand-load-path
              (lambda args
                (with-directory-excursion "lisp"
                  (apply (assoc-ref %standard-phases 'expand-load-path) args))))
            (replace 'make-autoloads
              (lambda args
                (with-directory-excursion "lisp"
                  (apply (assoc-ref %standard-phases 'make-autoloads) args))))
            (replace 'install
              (lambda args
                (with-directory-excursion "lisp"
                  (apply (assoc-ref %standard-phases 'install) args))))
            (replace 'build
              (lambda args
                (with-directory-excursion "lisp"
                  (apply (assoc-ref %standard-phases 'build) args)))))))
      (native-inputs
       (list texinfo))
      (inputs
       (list git perl))
      (propagated-inputs
       ;; Note: the 'git-commit' and 'magit-section' dependencies are part of
       ;; magit itself.
       (list
        (@(gnu packages emacs-xyz) emacs-compat)
        (@(gnu packages emacs-xyz) emacs-dash)
        (@(gnu packages emacs-xyz) emacs-transient)
        (@(gnu packages emacs-xyz) emacs-with-editor)
        ))
      (home-page "https://magit.vc/")
      (synopsis "Emacs interface for the Git version control system")
      (description
       "With Magit, you can inspect and modify your Git repositories
with Emacs.  You can review and commit the changes you have made to
the tracked files, for example, and you can browse the history of past
changes.  There is support for cherry picking, reverting, merging,
rebasing, and other common Git operations.")
      (license license:gpl3+))))

(define-public emacs-forge
  (package
     (name "emacs-forge")
     (version "0.3.2")
     (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/magit/forge")
              (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "0p1jlq169hpalhzmjm3h4q3x5xr9kdmz0qig8jwfvisyqay5vbih"))))
     (build-system emacs-build-system)
     (arguments
      `(#:tests? #f                     ;no tests
        #:phases
        (modify-phases %standard-phases
          (add-after 'unpack 'build-info-manual
            (lambda _
              (invoke "make" "info")
              ;; Move the info file to lisp so that it gets installed by the
              ;; emacs-build-system.
              (rename-file "docs/forge.info" "lisp/forge.info")))
          (add-after 'build-info-manual 'chdir-lisp
            (lambda _
              (chdir "lisp"))))))
     (native-inputs
      (list texinfo))
     (propagated-inputs
      (list
       emacs-magit
       (@(gnu packages emacs-xyz) emacs-closql)
       (@(gnu packages emacs-xyz) emacs-dash)
       (@(gnu packages emacs-xyz) emacs-emacsql)
       (@(gnu packages emacs-xyz) emacs-ghub)
       (@(gnu packages emacs-xyz) emacs-let-alist)
       (@(gnu packages emacs-xyz) emacs-markdown-mode)
       (@(gnu packages emacs-xyz) emacs-yaml)
       ))
     (home-page "https://github.com/magit/forge/")
     (synopsis "Access Git forges from Magit")
     (description "Work with Git forges, such as Github and Gitlab, from the
comfort of Magit and the rest of Emacs.")
     (license license:gpl3+)))

(define-public emacs-magit-annex
  (package
    (name "emacs-magit-annex")
    (version "1.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magit/magit-annex")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1amr2c08mq1nnn6k66mgz4rzyni4np7gxm96g4qyla2cbfbachgk"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-magit))
    (home-page "https://github.com/magit/magit-annex/")
    (synopsis "Git-annex support for Magit")
    (description
     "Magit-annex adds a few git-annex operations to the Magit interface.")
    (license license:gpl3+)))

(define-public emacs-magit-svn
  (package
    (name "emacs-magit-svn")
    (version "2.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/magit/magit-svn")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1v1y4fir1plz4kj0cvkcd29wibli4dw7vp4fmbxq4df76d8iy8yd"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-dash)
      (@(gnu packages emacs-xyz) emacs-with-editor)
      emacs-magit
      ))
    (home-page "https://github.com/magit/magit-svn")
    (synopsis "Git-SVN extension to Magit")
    (description
     "This package is an extension to Magit, the Git Emacs mode, providing
support for Git-SVN.")
    (license license:gpl3+)))

(define-public emacs-taxy
  (package
    (name "emacs-taxy")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://elpa.gnu.org/packages/taxy-" version ".tar"))
       (sha256
        (base32
         "05czw8fkifb25rwl99dmncr1g0rjfx1bqijl7igqs9j6h9ia2xvg"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-magit))
    (home-page "https://github.com/alphapapa/taxy.el")
    (synopsis "Programmable taxonomical grouping for arbitrary objects")
    (description
     "Taxy provides a programmable way to classify arbitrary objects into
a hierarchical taxonomy.  Allows you to automatically put things in nested
groups.")
    (license license:gpl3+)))

(define-public emacs-taxy-magit-section
  (package
    (name "emacs-taxy-magit-section")
    (version "0.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://elpa.gnu.org/packages/taxy-magit-section-" version
                    ".tar"))
              (sha256
               (base32
                "1712hbcna0ph9chaq28a6fanv4sccdiphd5z0hg34ig3g6pslgn9"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-magit emacs-taxy))
    (home-page "https://github.com/alphapapa/taxy.el")
    (synopsis "View Taxy structs in a Magit Section buffer")
    (description
     "This library provides a way to view @code{taxy} structs in a column-based,
@code{magit-section} buffer.  Columns are defined using simple top-level
forms, and new columns may be easily defined by users in their
configurations.")
    (license license:gpl3+)))

(define-public emacs-magit-gerrit
  (let ((commit "a97521574c5b7d4b7ab89e25c358c87fd5b1887f")
        (revision "1"))
    (package
      (name "emacs-magit-gerrit")
      (version (git-version "0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/magit-gerrit")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0p6h67x7f6iraw6jqn7dmqy2m2mwwvbwcs61hq8jc602v6hkslqn"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-magit))
      (home-page "https://github.com/emacsorphanage/magit-gerrit")
      (synopsis "Magit extension for Gerrit")
      (description "This Magit extension provides integration with Gerrit,
which makes it possible to conduct Gerrit code reviews directly from within
Emacs.")
      (license license:gpl3+))))

(define-public emacs-magit-org-todos-el
  (package
    (name "emacs-magit-org-todos-el")
    (version "0.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/danielma/magit-org-todos.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "07r5x256k1fjjxs1yfg41kc94nwvnjlk2vvknkra3j8v9p0j88m7"))))
    (propagated-inputs
     (list emacs-magit))
    (build-system emacs-build-system)
    (home-page "https://github.com/danielma/magit-org-todos.el")
    (synopsis "Get todo.org into Emacs Magit status")
    (description "This package allows you to get @file{todo.org} into your
magit status.

If you have a @file{todo.org} file with @code{TODO} items in the root of your
repository, @code{magit-org-todos} will create a section in your Magit status
buffer with each of your todos.")
    (license license:gpl3+)))

(define-public emacs-magit-todos
  (package
    (name "emacs-magit-todos")
    (version "1.7.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alphapapa/magit-todos")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1ygn1498ji785bkbi7ziazk1bkzinq5srpjh2yhw70v3cr5sfk8g"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-magit
      (@(gnu packages emacs-xyz) emacs-async)
      (@(gnu packages emacs-xyz) emacs-dash)
      (@(gnu packages emacs-xyz) emacs-f)
      (@(gnu packages emacs-xyz) emacs-hl-todo)
      (@(gnu packages emacs-xyz) emacs-pcre2el)
      (@(gnu packages emacs-xyz) emacs-s)
      ))
    (home-page "https://github.com/alphapapa/magit-todos")
    (synopsis "Show source files' TODOs (and FIXMEs, etc) in Magit status buffer")
    (description "This package displays keyword entries from source code
comments and Org files in the Magit status buffer.  Activating an item jumps
to it in its file.  By default, it uses keywords from @code{hl-todo}, minus a
few (like NOTE).")
    (license license:gpl3)))

(define-public emacs-orgit
  (package
    (name "emacs-orgit")
    (version "1.9.0")
    (home-page "https://github.com/magit/orgit")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url home-page)
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "00fkj88yddan80q8zbx0jy66d958srkm06jiy1nraamxqr15mmyz"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-dash)
      emacs-magit))
    (synopsis "Support for Org links to Magit buffers")
    (description "This package defines several Org link types, which can be
used to link to certain Magit buffers.  Use the command
@command{org-store-link} while such a buffer is current to store a link.
Later you can insert it into an Org buffer using the command
@code{org-insert-link}.")
    (license license:gpl3+)))

(define-public emacs-treemacs-extra
  (package
    (inherit emacs-treemacs)
    (name "emacs-treemacs-extra")
    (arguments
     (substitute-keyword-arguments
         (package-arguments emacs-treemacs)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'chdir-elisp 'copy-extra
              (lambda _
                (copy-recursively "../extra" ".")))))))
    (propagated-inputs
     (modify-inputs (package-propagated-inputs emacs-treemacs)
       (append
        emacs-magit
        (@(gnu packages emacs-xyz) emacs-all-the-icons)
        (@(gnu packages emacs-xyz) emacs-evil)
        (@(gnu packages emacs-xyz) emacs-projectile)
        (@(gnu packages emacs-xyz) emacs-persp-mode)
        (@(gnu packages emacs-xyz) emacs-perspective)
        (@(gnu packages mail) mu)
        )))))

(define-public emacs-evil-collection
  (package
    (name "emacs-evil-collection")
    (version "0.0.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-evil/evil-collection")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09hnxb8nh3g0hi93fz9f1y164gv9iyh5994wfn6fsq2v1xdz8phm"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include #~(cons* "^modes\\/" %default-include)
      #:tests? #true
      #:test-command #~(list "emacs" "-Q" "--batch"
                             "-L" "."
                             "-L" "./test"
                             "-l" "evil-collection-test.el"
                             "-l" "evil-collection-magit-tests.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (native-inputs
     (list emacs-magit))
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-annalist)
      (@(gnu packages emacs-xyz) emacs-evil)
      ))
    (home-page "https://github.com/emacs-evil/evil-collection")
    (synopsis "Collection of Evil bindings for many major and minor modes")
    (description "This is a collection of Evil bindings for the parts of
Emacs that Evil does not cover properly by default, such as @code{help-mode},
@code{M-x calendar}, Eshell and more.")
    (license license:gpl3+)))

(define-public emacs-vdiff-magit
  ;; Need to use a more recent commit than the latest release version because
  ;; of Magit and Transient
  (let ((commit "b100d126c69e5c26a61ae05aa1778bcc4302b597")
        (version "0.3.2")
        (revision "8"))
    (package
      (name "emacs-vdiff-magit")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/justbur/emacs-vdiff-magit/")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "16cjmrzflf2i1w01973sl944xrfanakba8sb4dpwi79d92xp03xy"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-vdiff)
        emacs-magit
        ))
      (home-page "https://github.com/justbur/emacs-vdiff-magit/")
      (synopsis "Frontend for diffing based on vimdiff")
      (description "This package permits comparisons of two or three buffers
based on diff output.")
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
        (@(gnu packages emacs-xyz) emacs-drag-stuff)
        (@(gnu packages emacs-xyz) emacs-evil)
        emacs-evil-iedit-state
        emacs-jump-last
        emacs-kill-buffers
        emacs-magit
        (@(gnu packages emacs-xyz) emacs-yasnippet)
        emacs-zoom-frm
        ))
      (home-page "https://github.com/Bost/tweaks")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-use-package
  ;; XXX: Upstream did not tag latest release.  Using commit matching exact
  ;; version bump.
  (let ((commit "a6e856418d2ebd053b34e0ab2fda328abeba731c"))
    (package
      (name "emacs-use-package")
      (version "2.4.4")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jwiegley/use-package")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0g1smk27ry391gk8bb8q3i42s0p520zwhxfnxvzv5cjj93mcpd8f"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #t
        #:test-command #~(list "emacs" "--batch"
                               "-l" "use-package-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'install 'install-manual
              (lambda _
                (let ((info-dir (string-append #$output "/share/info")))
                  (install-file "use-package.info" info-dir))))
            (add-before 'install-manual 'build-manual
              (lambda _
                (invoke "make" "info" "use-package.texi"))))))
      (native-inputs
       (list
        (@(gnu packages texinfo) texinfo)))
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-diminish)))
      (home-page "https://github.com/jwiegley/use-package")
      (synopsis "Declaration for simplifying your .emacs")
      (description "The use-package macro allows you to isolate package
configuration in your @file{.emacs} file in a way that is both
performance-oriented and tidy.")
      (license license:gpl2+))))

(define-public emacs-git-commit
  (package
    (inherit emacs-magit)
    (name "emacs-git-commit")))

(define-public emacs-treemacs-magit
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-magit")))

(define-public emacs-helm-files
  (package
    (inherit (@(gnu packages emacs-xyz) emacs-helm))
    (name "emacs-helm-files")))

(define-public emacs-helm-core
  (package
    (inherit (@(gnu packages emacs-xyz) emacs-helm))
    (name "emacs-helm-core")))

(define-public emacs-use-package-chords
  (package
    (inherit emacs-use-package)
    (name "emacs-use-package-chords")))

(define-public emacs-magit-section
  (package
    (inherit emacs-magit)
    (name "emacs-magit-section")))

;; helm-comint-20231102.2029
;; helm-core-20240712.1822
;; helm-dictionary-20230922.1111
;; helm-git-grep-20170614.1411
;; helm-purpose-20170114.1636
;; helm-pydoc-20220721.433

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
   emacs-company-anaconda
   emacs-dap-launch
   emacs-dap-tasks
   emacs-dap-utils
   emacs-dap-chrome
   emacs-dap-overlays

   emacs-lsp-lens
   emacs-lsp-protocol
   emacs-lsp-metals
   emacs-lsp-metals-protocol
   emacs-lsp-metals-treeview
   emacs-treemacs-treelib

   emacs-auto-highlight-symbol
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
   emacs-flycheck-joker
   emacs-kaocha-runner
   emacs-sayid
   emacs-kaolin-themes
   emacs-emacsql-sqlite3
   emacs-zonokai-emacs
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

(define-public emacs-scss-mode
  (let ((commit "cf58dbec5394280503eb5502938f3b5445d1b53d")
        (revision "0"))
    (package
      (name "emacs-scss-mode")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/antonj/scss-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0raja19l0igwr0pn0ghr1pj1d8i9k3m3764ma4r8nwzxcj9qw4ja"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/antonj/scss-mode.git")
      (synopsis "Major mode for editing SCSS files in Emacs")
      (description
       "This package provides a major mode for editing SCSS (Sassy CSS) files
 in Emacs.  It includes syntax highlighting, indentation support, and
 integration with compilation commands, helping developers work more
 efficiently with SCSS code.  The mode is designed to make SCSS editing in
 Emacs convenient and productive.")
      (license license:gpl3+))))

(define-public emacs-php-auto-yasnippets
  (let ((commit "03e1f0899c081813901ac15c2f7a675a37cca9f5")
        (revision "0"))
    (package
      (name "emacs-php-auto-yasnippets")
      (version (git-version "2.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/php-auto-yasnippets.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0d7y6njsd1s2r5df2k8wvvwgxpwwyaqkhdd2b3p1php8rrbj3mg8"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-yasnippet)
        (@(gnu packages emacs-xyz) emacs-php-mode)
        ))
      (home-page "https://github.com/emacs-php/php-auto-yasnippets.git")
      (synopsis "Auto-generate Yasnippets for PHP in Emacs")
      (description
       "This package provides functionality to quickly generate Yasnippets for
 PHP code in Emacs.  It allows users to create code snippets on the fly by
 typing a trigger key and template code, making repetitive PHP coding tasks
 faster and more efficient.  The package integrates with YASnippet, enhancing
 productivity for PHP developers.")
      (license license:gpl3+))))

(define-public emacs-js-doc
  (let ((commit "f0606e89d5aa89146f96edb38cf69af0068a9d1e")
        (revision "0"))
    (package
      (name "emacs-js-doc")
      (version (git-version "0.0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mooz/js-doc.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ffayl6hca9zanbznh6rkql7fbr53id1lyrj2vllx8zakfac4dyv"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/mooz/js-doc.git")
      (synopsis "Generate JSDoc comments for JavaScript in Emacs")
      (description
       "This package provides tools to automatically generate JSDoc comments
 for JavaScript code in Emacs.  It helps streamline documentation by creating
 standardized comment templates based on function and variable definitions,
 allowing developers to maintain consistent and informative documentation in
 their code.")
      (license license:gpl3+))))

(define-public emacs-multi-line
  (let ((commit "06ea7294c4e4ace0c3253b7952a6d937a169eb55")
        (revision "0"))
    (package
      (name "emacs-multi-line")
      (version (git-version "0.1.5" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/colonelpanic8/multi-line")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32 "0iby3h9ypmnd35f9mvs53cghlpl9jjj97z5p191y99k3w4dzp4z1"))))
      (build-system emacs-build-system)
      (propagated-inputs
        (list
         (@(gnu packages emacs-xyz) emacs-shut-up)
         (@(gnu packages emacs-xyz) emacs-dash)
         (@(gnu packages emacs-xyz) emacs-s)
         ;; emacs-multi-line-shared
         ;; emacs-multi-line-respace
         ;; emacs-multi-line-find
         ;; emacs-multi-line-enter
         ;; emacs-multi-line-decorator
         ;; emacs-multi-line-cycle
         ))
      (home-page "https://github.com/colonelpanic8/multi-line")
      (synopsis
       "Emacs package for splitting single-line statements into multiple lines")
      (description
       "This package provides functionality for splitting single-line
 statements into multiple lines in Emacs, improving code readability and
 organization.  It is especially useful for languages with long expressions or
 complex statements, allowing users to easily format code for better clarity.")
      (license license:gpl3+))))

(define-public emacs-helm-dictionary
  (let ((commit "fefacdd5955e4c3cb69623b04f25f673748552a8")
        (revision "0"))
    (package
      (name "emacs-helm-dictionary")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-dictionary")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0xg3p72vph9gbm9yj54xrnkcn13bq1lj4np3zlspzwg8raj02g74"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-helm)
        ;; emacs-helm-easymenu ;; apparently not needed
        ;; emacs-helm-net      ;; apparently not needed
        ))
      (home-page "https://github.com/emacs-helm/helm-dictionary")
      (synopsis "Dictionary search interface for Emacs using Helm")
      (description
       "This package provides a dictionary search interface for
 Emacs,utilizing Helm for quick and efficient lookups.  It allows users to
 search and browse dictionary definitions directly within Emacs, enhancing
 productivity by integrating language resources into the editing environment.
 The package supports various dictionary sources and offers an intuitive way
 to access definitions.")
      (license license:gpl3+))))

(define-public emacs-pcache
  (let ((commit "507230d094cc4a5025fe09b62569ad60c71c4226")
        (revision "0"))
    (package
      (name "emacs-pcache")
      (version (git-version "0.5.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sigma/pcache")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fjdn4g9ww70f3x6vbzi3gqs9dsmqg16isajlqlflzw2716zf2nh"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/sigma/pcache")
      (synopsis "Persistent caching library for Emacs")
      (description
       "This package provides a persistent caching library for Emacs, enabling
 data to be stored and retrieved across Emacs sessions.  It supports storing
 arbitrary objects in a cache that persists on disk, improving performance for
 tasks that benefit from cached data.  The library is designed to be flexible
 and easily integrated into other Emacs packages.")
      (license license:gpl3+))))

(define-public emacs-groovy-imports
  (let ((commit "a60c3202973e3185091db623d960f71840a22205")
        (revision "0"))
    (package
      (name "emacs-groovy-imports")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mbezjak/emacs-groovy-imports.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1bsmf64ycmfnsb0r0nyaky1h3x2fpr4qyck3ihw16pa6d7spaw8c"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pcache
        (@(gnu packages emacs-xyz) emacs-s)))
      (home-page "https://github.com/mbezjak/emacs-groovy-imports.git")
      (synopsis "Automatic import management for Groovy in Emacs")
      (description
       "This package provides automatic import management for Groovy files in
 Emacs.  It enables users to add and manage import statements based on the
 classes used in the code, streamlining the development process for Groovy
 projects.  The package helps keep imports organized and reduces the need for
 manual import adjustments.")
      (license license:gpl3+))))

;; (replace 'install
;;   (lambda* (#:key outputs #:allow-other-keys)
;;     (let* ((out (assoc-ref outputs "out"))
;;            (el-dir (emacs:elpa-directory out))
;;            (doc (string-append
;;                  out "/share/doc/haskell-mode-" #$version))
;;            (info (string-append out "/share/info")))
;;       (define (copy-to-dir dir files)
;;         (for-each (lambda (f)
;;                     (install-file f dir))
;;                   files))

;;       (with-directory-excursion "doc"
;;         (invoke "makeinfo" "haskell-mode.texi")
;;         (install-file "haskell-mode.info" info))
;;       (copy-to-dir doc '("CONTRIBUTING.md" "NEWS" "README.md"))
;;       (copy-to-dir el-dir (find-files "." "\\.elc?")))))

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

        ;; Exclude all el-files
        #:exclude #~(cons*
                     "^.*\\.el$"
                     %default-exclude)))
      (home-page "http://spacemacs.org/")
      (synopsis
       "Community-driven Emacs distribution - The best editor is neither Emacs
 nor Vim, it's Emacs *and* Vim!")
      (description
       "Spacemacs is a new way of experiencing Emacs - it's a sophisticated
 and polished set-up, focused on ergonomics, mnemonics and consistency.")
      (license license:gpl3+))))

(define all-info-include (quote (list "^.*\\.info$")))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-rst-lists)'
(define-public emacs-rst-lists
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-lists")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+lang/restructuredtext/local/rst-lists/rst-lists\\.el$"
                       ,all-info-include)))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-versions)'
(define-public emacs-core-versions
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-versions")
    (arguments
     (list #:include `(cons*
                       "^core/core-versions\\.el$"
                       ,all-info-include)))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-load-paths)'
(define-public emacs-core-load-paths
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-load-paths")
    (arguments
     (list #:include `(cons*
                       "^core/core-load-paths\\.el$"
                       ,all-info-include)))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-spacemacs-ht)'
(define-public emacs-spacemacs-ht
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-ht")
    (arguments
     (list #:include `(cons*
                       "^core/libs/forks/spacemacs-ht\\.el$"
                       ,all-info-include)))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-dotspacemacs)'
(define-public emacs-core-dotspacemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-dotspacemacs")
    (arguments
     (list #:include `(cons*
                       "^core/core-dotspacemacs\\.el$"
                       ,all-info-include)))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-spacemacs-buffer)'
(define-public emacs-core-spacemacs-buffer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacemacs-buffer")
    (arguments
     (list #:include `(cons*
                       "^core/core-spacemacs-buffer\\.el$"
                       ,all-info-include)))
    (propagated-inputs
     (list emacs-core-dotspacemacs))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-use-package-ext)'
(define-public emacs-core-use-package-ext
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-use-package-ext")
    (arguments
     (list #:include `(cons*
                       "^core/core-use-package-ext\\.el$"
                       ,all-info-include)))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-fonts-support)'
(define-public emacs-core-fonts-support
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-fonts-support")
    (arguments
     (list #:include `(cons*
                       "^core/core-fonts-support\\.el$"
                       ,all-info-include)))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-command-line)'
(define-public emacs-core-command-line
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-command-line")
    (arguments
     (list #:include `(cons*
                       "^core/core-command-line\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-transient-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-transient-state")
    (arguments
     (list #:include `(cons*
                       "^core/core-transient-state\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-early-funcs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-early-funcs")
    (arguments
     (list #:include `(cons*
                       "^core/core-early-funcs\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-documentation
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-documentation")
    (arguments
     (list #:include `(cons*
                       "^core/core-documentation\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-compilation
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-compilation")
    (arguments
     (list #:include `(cons*
                       "^core/core-compilation\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-env
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-env")
    (arguments
     (list #:include `(cons*
                       "^core/core-env\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-hooks
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-hooks")
    (arguments
     (list #:include `(cons*
                       "^core/core-hooks\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-display-init
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-display-init")
    (arguments
     (list #:include `(cons*
                       "^core/core-display-init\\.el$"
                       ,all-info-include)))))

(define-public emacs-zemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-zemacs")
    (arguments
     (list #:include `(cons*
                       "^core/aprilfool/zemacs\\.el$"
                       ,all-info-include)))))

;; Upstream uses https://www.emacswiki.org/emacs/download/irfc.el
(define-public emacs-irfc
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-irfc")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+misc/ietf/local/irfc/irfc\\.el$"
                       ,all-info-include)))))

;; Upstream uses https://github.com/melpa/package-build
(define-public emacs-package-build
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-build")
    (arguments
     (list #:include `(cons*
                       "^core/libs/package-build\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-spacebind
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacebind")
    (arguments
     (list #:include `(cons*
                       "^core/core-spacebind\\.el$"
                       ,all-info-include)))))

(define-public emacs-package-build-badges
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-build-badges")
    (arguments
     (list #:include `(cons*
                       "^core/libs/package-build-badges\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-custom-settings
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-custom-settings")
    (arguments
     (list #:include `(cons*
                       "^core/core-custom-settings\\.el$"
                       ,all-info-include)))))

;; Upstream uses https://github.com/creichert/ido-vertical-mode.el
(define-public emacs-ido-vertical-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ido-vertical-mode")
    (arguments
     (list #:include `(cons*
                       "^core/libs/ido-vertical-mode\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-configuration-layer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-configuration-layer")
    (arguments
     (list #:include `(cons*
                       "^core/core-configuration-layer\\.el$"
                       ,all-info-include)))
    (propagated-inputs
     (list
      emacs-core-load-paths
      emacs-core-spacemacs-buffer
      emacs-core-progress-bar
      emacs-core-funcs
      emacs-core-dotspacemacs
      emacs-spacemacs-ht))))

(define-public emacs-core-customization
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-customization")
    (arguments
     (list #:include `(cons*
                       "^core/core-customization\\.el$"
                       ,all-info-include)))
    (propagated-inputs
     (list (@(gnu packages emacs-xyz) emacs-validate)))))

(define-public emacs-spacemacs-common
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-common")
    (arguments
     (list #:include `(cons*
                       "^core/libs/spacemacs-theme/spacemacs-common\\.el$"
                       ,all-info-include)))))

;; Upstream uses https://github.com/nashamri/spacemacs-theme
(define-public emacs-spacemacs-theme
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-theme")
    (arguments
     (list #:include `(cons*
                       "^core/libs/spacemacs-theme/spacemacs-theme\\.el$"
                       ,all-info-include)))))

;; Upstream uses https://github.com/purcell/page-break-lines
(define-public emacs-page-break-lines
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-page-break-lines")
    (arguments
     (list #:include `(cons*
                       "^core/libs/page-break-lines\\.el$"
                       ,all-info-include)))))

(define-public emacs-package-recipe-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-recipe-mode")
    (arguments
     (list #:include `(cons*
                       "^core/libs/package-recipe-mode\\.el$"
                       ,all-info-include)))))

;; Upstream uses https://github.com/TeMPOraL/nyan-mode/
(define-public emacs-nyan-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-nyan-mode")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+themes/colors/local/nyan-mode/nyan-mode\\.el$"
                       ,all-info-include)))))

(define-public emacs-erc-yank
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-yank")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+chat/erc/local/erc-yank/erc-yank\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-debug
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-debug")
    (arguments
     (list #:include `(cons*
                       "^core/core-debug\\.el$"
                       ,all-info-include)))))

(define-public emacs-load-env-vars
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-load-env-vars")
    (arguments
     (list #:include `(cons*
                       "^core/libs/forks/load-env-vars\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-themes-support
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-themes-support")
    (arguments
     (list #:include `(cons*
                       "^core/core-themes-support\\.el$"
                       ,all-info-include)))))

;; Upstream uses https://github.com/sigma/mocker.el
(define-public emacs-mocker
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-mocker")
    (arguments
     (list #:include `(cons*
                       "^core/libs/mocker\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-release-management
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-release-management")
    (arguments
     (list #:include `(cons*
                       "^core/core-release-management\\.el$"
                       ,all-info-include)))))

(define-public emacs-compleseus-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-compleseus-spacemacs-help")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+completion/compleseus/local/compleseus-spacemacs-help/compleseus-spacemacs-help\\.el$"
                       ,all-info-include)))
    (propagated-inputs
     (list (@(gnu packages emacs-xyz) emacs-consult)
           emacs-core-configuration-layer))))

(define-public emacs-erc-tex
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-tex")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+chat/erc/local/erc-tex/erc-tex\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-keybindings
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-keybindings")
    (arguments
     (list #:include `(cons*
                       "^core/core-keybindings\\.el$"
                       ,all-info-include)))))


;; Upstream uses https://elpa.gnu.org/packages/spinner-1.7.4.tar
(define-public emacs-spinner
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spinner")
    (arguments
     (list #:include `(cons*
                       "^core/libs/spinner\\.el$"
                       ,all-info-include)))))

(define-public emacs-erc-sasl
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-sasl")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+chat/erc/local/erc-sasl/erc-sasl\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-dumper
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-dumper")
    (arguments
     (list #:include `(cons*
                       "^core/core-dumper\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-cycle
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-cycle")
    (arguments
     (list #:include `(cons*
                       "^core/core-cycle\\.el$"
                       ,all-info-include)))))

;; Upstream uses https://github.com/larstvei/ox-gfm
(define-public emacs-ox-gfm
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ox-gfm")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+emacs/org/local/ox-gfm/ox-gfm\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-jump
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-jump")
    (arguments
     (list #:include `(cons*
                       "^core/core-jump\\.el$"
                       ,all-info-include)))))

(define-public emacs-package-recipe
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-recipe")
    (arguments
     (list #:include `(cons*
                       "^core/libs/package-recipe\\.el$"
                       ,all-info-include)))))

(define-public emacs-helm-spacemacs-faq
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-spacemacs-faq")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+completion/helm/local/helm-spacemacs-help/helm-spacemacs-faq\\.el$"
                       ,all-info-include)))))

(define-public emacs-quelpa
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-quelpa")
    (arguments
     (list #:include `(cons*
                       "^core/libs/quelpa\\.el$"
                       ,all-info-include)))))

(define-public emacs-helm-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-spacemacs-help")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+completion/helm/local/helm-spacemacs-help/helm-spacemacs-help\\.el$"
                       ,all-info-include)))))

(define-public emacs-ivy-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ivy-spacemacs-help")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+completion/ivy/local/ivy-spacemacs-help/ivy-spacemacs-help\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-funcs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-funcs")
    (arguments
     (list #:include `(cons*
                       "^core/core-funcs\\.el$"
                       ,all-info-include)))))

(define-public emacs-tmux
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-tmux")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+tools/tmux/local/tmux/tmux\\.el$"
                       ,all-info-include)))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-progress-bar)'
(define-public emacs-core-progress-bar
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-progress-bar")
    (arguments
     (list #:include `(cons*
                       "^core/core-progress-bar\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-micro-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-micro-state")
    (arguments
     (list #:include `(cons*
                       "^core/core-micro-state\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-toggle
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-toggle")
    (arguments
     (list #:include `(cons*
                       "^core/core-toggle\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-emacs-backports
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-emacs-backports")
    (arguments
     (list #:include `(cons*
                       "^core/core-emacs-backports\\.el$"
                       ,all-info-include)))))

(define-public emacs-spacemacs-purpose-popwin
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-purpose-popwin")
    (propagated-inputs
     (list (@(gnu packages emacs-xyz) emacs-window-purpose)))
    (arguments
     (list
      #:include
      #~(cons*
        "^layers/\\+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin/spacemacs-purpose-popwin\\.el$"
        %default-include)
      #:phases
      #~(modify-phases %standard-phases
          (replace 'expand-load-path
            (lambda args
              (with-directory-excursion
                  "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
                (apply (assoc-ref %standard-phases 'expand-load-path) args))))
          (replace 'make-autoloads
            (lambda args
              (with-directory-excursion
                  "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
                (apply (assoc-ref %standard-phases 'make-autoloads) args))))
          (replace 'install
            (lambda args
              (with-directory-excursion
                  "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
                (apply (assoc-ref %standard-phases 'install) args))))
          (replace 'build
            (lambda args
              (with-directory-excursion
                  "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
                (apply (assoc-ref %standard-phases 'build) args)))))))))

(define-public emacs-spacemacs-whitespace-cleanup
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-whitespace-cleanup")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup/spacemacs-whitespace-cleanup\\.el$"
                       ,all-info-include)))))

(define-public emacs-help-fns-plus
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-help-fns-plus")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+spacemacs/spacemacs-defaults/local/help-fns\\+/help-fns\\+\\.el$"
                       ,all-info-include)))))

(define-public emacs-helm-games
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-games")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+fun/games/local/helm-games/helm-games\\.el$"
                       ,all-info-include)))))

(define-public emacs-hybrid-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-hybrid-mode")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+distributions/spacemacs-bootstrap/local/hybrid-mode/hybrid-mode\\.el$"
                       ,all-info-include)))))

(define-public emacs-vim-colors
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-vim-colors")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+spacemacs/spacemacs-modeline/local/vim-powerline/vim-colors\\.el$"
                       ,all-info-include)))))

(define-public emacs-space-doc
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-space-doc")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+spacemacs/spacemacs-org/local/space-doc/space-doc\\.el$"
                       ,all-info-include)))))

(define-public emacs-rst-sphinx
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-sphinx")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+tools/sphinx/local/rst-sphinx/rst-sphinx\\.el$"
                       ,all-info-include)))))

;; (define-public emacs-vim-powerline-theme
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-vim-powerline-theme")
;;     (arguments
;;      (list #:include `(cons*
;;                        "^layers/\\+spacemacs/spacemacs-modeline/local/vim-powerline/vim-powerline-theme\\.el$"
;;                        ,all-info-include)))))

;; emacs-vim-powerline-theme not loaded by Spguimacs
;;
;; NOTE: This project is in maintenance mode and not currently being developed
;; or maintained. Pull requests will be reviewed and accepted but may not get
;; an immediate response. Sorry for the inconvenience.
(define-public emacs-vim-powerline-theme
  (let ((commit "c35c35bdf5ce2d992882c1f06f0f078058870d4a")
        (revision "0"))
    (package
      (name "emacs-vim-powerline-theme")
      (version (git-version "2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/milkypostman/powerline.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0k1n5pg8v3ybkqxcipw80jqv94ka0dp63qxl0hvjwlxk16gxp8kb"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-vim-colors))
      (home-page "https://github.com/milkypostman/powerline")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-evil-unimpaired
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-evil-unimpaired")
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-dash)
      (@(gnu packages emacs-xyz) emacs-f)))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'expand-load-path
            (lambda args
              (with-directory-excursion
                  "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
                (apply (assoc-ref %standard-phases 'expand-load-path) args))))
          (replace 'make-autoloads
            (lambda args
              (with-directory-excursion
                  "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
                (apply (assoc-ref %standard-phases 'make-autoloads) args))))
          (replace 'install
            (lambda args
              (with-directory-excursion
                  "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
                (apply (assoc-ref %standard-phases 'install) args))))
          (replace 'build
            (lambda args
              (with-directory-excursion
                  "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
                (apply (assoc-ref %standard-phases 'build) args)))))))))

(define-public emacs-pylookup
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-pylookup")
    (arguments
     (list
      #:include
      #~(cons*
         ;; "^layers\\/\\+lang\\/python\\/local\\/pylookup\\/pylookup\\.py$" ;; doesn't work
         ;; "^layers/\\+lang/python/local/pylookup/pylookup\\.py$"           ;; doesn't work
         ;; "^layers/.*\\.py$"                                               ;; doesn't work
         ;; "^.*\\.py$"                                                      ;; works
         "\\.py$"
         %default-include)
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'specify-python-location
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((python3 (search-input-file inputs "/bin/python3")))
                (substitute* '("layers/+lang/python/local/pylookup/pylookup.py")
                  (("/usr/bin/env python3?") python3)))))
          (replace 'expand-load-path
            (lambda args
              (with-directory-excursion
                  "layers/+lang/python/local/pylookup"
                (apply (assoc-ref %standard-phases 'expand-load-path) args))))
          (replace 'make-autoloads
            (lambda args
              (with-directory-excursion
                  "layers/+lang/python/local/pylookup"
                (apply (assoc-ref %standard-phases 'make-autoloads) args))))
          (replace 'install
            (lambda args
              (with-directory-excursion
                  "layers/+lang/python/local/pylookup"
                (apply (assoc-ref %standard-phases 'install) args))))
          (replace 'build
            (lambda args
              (with-directory-excursion
                  "layers/+lang/python/local/pylookup"
                (apply (assoc-ref %standard-phases 'build) args)))))))
    ;; (propagated-inputs
    ;;  (list
    ;;   emacs-browse-url ;; missing
    ;;   emacs-simple     ;; missing
    ;;   ))
    (inputs (list python))))

(define-public emacs-evil-evilified-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-evil-evilified-state")
    (propagated-inputs
     (list
      (@(gnu packages emacs-xyz) emacs-evil)
      (@(gnu packages emacs-xyz) emacs-bind-map)))
    (arguments
     (list #:include `(cons*
                       "^layers/\\+distributions/spacemacs-bootstrap/local/evil-evilified-state/evil-evilified-state\\.el$"
                       ,all-info-include)))))

(define-public emacs-spacemacs-xclipboard
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-xclipboard")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+tools/xclipboard/local/spacemacs-xclipboard/spacemacs-xclipboard\\.el$"
                       ,all-info-include)))))

(define-public emacs-theme-changer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-theme-changer")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+tools/geolocation/extensions/theme-changer/theme-changer\\.el$"
                       ,all-info-include)))))

(define-public emacs-jr-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-jr-mode")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+lang/jr/local/jr-mode/jr-mode\\.el$"
                       ,all-info-include)))))

(define-public emacs-rst-directives
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-directives")
    (arguments
     (list #:include `(cons*
                       "^layers/\\+lang/restructuredtext/local/rst-directives/rst-directives\\.el$"
                       ,all-info-include)))))

(define-public emacs-core-spacemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacemacs")
    (arguments
     (list #:include `(cons*
                       "^core/core-spacemacs\\.el$"
                       ,all-info-include)))
    (propagated-inputs
     (list
      emacs-core-versions
      emacs-core-versions
      emacs-core-load-paths
      emacs-core-emacs-backports
      emacs-core-env
      emacs-page-break-lines
      emacs-core-hooks
      emacs-core-debug
      emacs-core-command-line
      emacs-core-configuration-layer
      emacs-core-dotspacemacs
      emacs-core-custom-settings
      emacs-core-release-management
      emacs-core-jump
      emacs-core-display-init
      emacs-core-themes-support
      emacs-core-fonts-support
      emacs-core-spacemacs-buffer
      emacs-core-keybindings
      emacs-core-toggle
      emacs-core-early-funcs
      emacs-core-cycle
      emacs-core-funcs
      emacs-core-micro-state
      emacs-core-transient-state
      emacs-core-use-package-ext
      emacs-core-spacebind
      emacs-core-compilation
      emacs-core-dumper
      ))))

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
        (@(gnu packages emacs-xyz) emacs-magit)
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
    (inherit
     (@(gnu packages emacs-xyz) emacs-magit)
     )
    (name "emacs-git-commit")))

(define-public emacs-treemacs-magit
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-treemacs-extra))
    (name "emacs-treemacs-magit")))

(define-public emacs-helm-files
  (package
    (inherit (@(gnu packages emacs-xyz) emacs-helm))
    (name "emacs-helm-files")))

(define-public emacs-helm-core
  (package
    (inherit (@(gnu packages emacs-xyz) emacs-helm))
    (name "emacs-helm-core")))

(define-public emacs-helm-pydoc
  (let ((commit "cac7b8953adcab85e898bc42b699c3afde5d33c6")
        (revision "0"))
    (package
      (name "emacs-helm-pydoc")
      (version (git-version "0.07" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-pydoc.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "11d34283zh1yffrb2ad4h1ib1n00yx5avas0l39hm56m2gvx6d89"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^helm-pydoc\\.py$" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-exec-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((python (search-input-file inputs "bin/python")))
                  (substitute* "helm-pydoc.py"
                    (("/usr/bin/env python") python))
                  (substitute* "helm-pydoc.el"
                    (("/bin/python") python))))))))
      (inputs (list python-wrapper))
      (propagated-inputs (list emacs-helm-core))
      (home-page "https://github.com/emacsorphanage/helm-pydoc.git")
      (synopsis "Python documentation lookup with Helm in Emacs")
      (description
       "This package provides an interface for searching and viewing Python
 documentation within Emacs using Helm.  It enables quick access to Python
 docstrings, module documentation, and function descriptions, improving
 efficiency by integrating comprehensive documentation lookup directly into
 the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-use-package-chords
  (package
    (inherit emacs-use-package)
    (name "emacs-use-package-chords")))

(define-public emacs-magit-section
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-magit)
     )
    (name "emacs-magit-section")))

(define-public emacs-chatgpt-shell ;; PR sent
  (package
    (name "emacs-chatgpt-shell")
    (version "1.20.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xenodium/chatgpt-shell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "161q8d2b4sq481jh4zwagvh88wg51dsnf76n2l2b7wv3nh7cjh2m"))))
    (build-system emacs-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
;;                (add-after 'unpack 'disable-save-variables
;;                  (lambda _
;; ;;; Override chatgpt-shell--save-variables chatgpt-shell--load-variables to
;; ;;; prevent writing to ~/.emacs.d
;; ;;; TODO try (locate-user-emacs-file "chatgpt-shell") however this may not be
;; ;;; needed after all.
;;                    (substitute* "chatgpt-shell.el"
;;                      (("\\(provide 'chatgpt-shell\\)")
;;                       (string-append
;;                        "(defun chatgpt-shell--save-variables () nil)"
;;                        "(defun chatgpt-shell--load-variables () nil)"
;;                        "(provide 'chatgpt-shell)")))))

               ;; (add-before 'build 'inspect-environment-before-build
               ;;   (lambda* (#:key inputs #:allow-other-keys)
               ;;     (let* (
               ;;            (h                  "/homeless-shelter")
               ;;            (d (string-append h "/.emacs.d"))
               ;;            (f (string-append d "/.chatgpt-shell.el")))
               ;;       (format #t "### ~a exists?   ~a\n" h (access? h F_OK))
               ;;       (format #t "### ~a writable? ~a\n" h (access? h W_OK))
               ;;       (format #t "### ~a exists?   ~a\n" d (access? d F_OK))
               ;;       (format #t "### ~a writable? ~a\n" d (access? d W_OK))
               ;;       (format #t "### ~a exists?   ~a\n" f (access? f F_OK))
               ;;       (format #t "### ~a writable? ~a\n" f (access? f W_OK)))
               ;;     (substitute* "chatgpt-shell.el"
               ;;       #;(("user-emacs-directory") ".")
               ;;       (("user-emacs-directory") "\"./\""))
               ;;     ))

               ;; This phase prevents build phase failure.
               (add-before 'build 'generate-empty-config-file
                 ;; (lambda _
                 ;;   (call-with-output-file
                 ;;       (string-append
                 ;;        "~/.emacs.d.distros/spguimacs/" ;; user-emacs-directory
                 ;;        ".chatgpt-shell.el")
                 ;;     (lambda (port)
                 ;;       (display "nil" port))))
                 (lambda _
                   (setenv "HOME" (getcwd))
                   (mkdir-p ".emacs.d")
                   (call-with-output-file ".emacs.d/.chatgpt-shell.el"
                     (lambda (port)
                       (display "nil" port))))
                 ))))
    (home-page "https://github.com/xenodium/chatgpt-shell")
    (synopsis "ChatGPT and DALL-E Emacs shells and Org Babel libraries")
    (description
     "Chatgpt Shell is a Comint-based ChatGPT shell for Emacs.")
    (license license:gpl3+)))

(define-public emacs-markdown-toc
  (let ((commit "3d724e518a897343b5ede0b976d6fb46c46bcc01")
        (revision "0"))
    (package
      (name "emacs-markdown-toc")
      (version (git-version "0.1.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ardumont/markdown-toc.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "01l48njg0x7gkssvw9nv3yq97866r945izbggx9y3z5ckr1w4hlc"))))
      (build-system emacs-build-system)
      (propagated-inputs (list (@ (gnu packages emacs-xyz) emacs-dash)
                               (@ (gnu packages emacs-xyz) emacs-markdown-mode)
                               (@ (gnu packages emacs-xyz) emacs-s)))
      (home-page "https://github.com/ardumont/markdown-toc")
      (synopsis "Generate a table of contents for Markdown files in Emacs")
      (description
       "This package provides a tool to generate and update a table of
 contents (TOC) for Markdown files within Emacs.  It automatically creates TOC
 entries based on the headers in the document and updates them as the file
 changes.  This simplifies navigation and organization in large Markdown
 documents.")
      (license license:gpl3+))))

;; (define-public emacs-ac-php-core
;;   (package
;;     (inherit (@ (gnu packages emacs-xyz) emacs-ac-php))
;;     (name "emacs-ac-php-core")))

(define-public emacs-ac-php-core
  (package
    (name "emacs-ac-php-core")
    (version "2.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xcwen/ac-php")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1yn5cc6cmj3hwqgmjj44dz847xn5k99kirj36qwc04q7vhl8z8k7"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #true
      #:test-command #~(list "ert-runner")
      #:phases
      #~(modify-phases %standard-phases
          (replace
              'ensure-package-description
            (lambda* (#:key outputs #:allow-other-keys)

              (define (emacs-package? name)
                "Check if NAME correspond to the name of an Emacs package."
                (string-prefix? "emacs-" name))

              (define (package-name-version->elpa-name-version name-ver)
                "Convert the Guix package NAME-VER to the corresponding ELPA name-version
format.  Essentially drop the prefix used in Guix."
                (if (emacs-package? name-ver)  ; checks for "emacs-" prefix
                    (string-drop name-ver (string-length "emacs-"))
                    name-ver))

              (define (find-root-library-file name)
                (format #t "#### [find-root-library-file] name : ~a\n" name)
                (format #t "#### [find-root-library-file] #$name : ~a\n" #$name)
                ;; (format #t "#### [find-root-library-file] (package-name-version->elpa-name-version #$name) : ~a\n" (package-name-version->elpa-name-version #$name))
                (let [(candidate (package-name-version->elpa-name-version #$name))]
                  (format #t "#### [find-root-library-file] candidate : ~a\n" candidate)
                  (if (file-exists? (string-append candidate ".el"))
                      candidate
                      (let loop ((parts (string-split
                                         (package-name-version->elpa-name-version name) #\-))
                                 (candidate ""))
                        (format #t "#### [find-root-library-file] parts : ~a\n" parts)
                        (format #t "#### [find-root-library-file] candidate : ~a\n" candidate)
                        (format #t "#### [find-root-library-file] (null? parts) : ~a\n" (null? parts))
                        (format #t "#### [find-root-library-file] (string-null? candidate) : ~a\n" (string-null? candidate))
                        (let* [(f (string-append candidate ".el"))]
                          (format #t "#### [find-root-library-file] (file-exists? ~a) : ~a\n" f (file-exists? f)))
                        (format #t "\n")
                        (cond
                         ;; at least one version part is given, so we don't terminate "early"
                         ((null? parts) #f)
                         ((string-null? candidate) (loop (cdr parts) (car parts)))
                         ((file-exists? (string-append candidate ".el")) candidate)
                         (else
                          (loop (cdr parts) (string-append candidate "-" (car parts)))))))))

              (define (store-file->elisp-source-file file)
                "Convert FILE, a store file name for an Emacs Lisp source file, into a file
name that has been stripped of the hash and version number."
                (let ((suffix ".el"))
                  (let-values (((name version)
                                (package-name->name+version
                                 (basename
                                  (strip-store-file-name file) suffix))))
                    (string-append name suffix))))

              (define (store-directory->elpa-name-version store-dir)
                "Given a store directory STORE-DIR return the part of the basename after the
second hyphen.  This corresponds to 'name-version' as used in ELPA packages."
                ((compose package-name-version->elpa-name-version
                          strip-store-file-name)
                 store-dir))

              (define (write-pkg-file name)
                (format #t "#### [write-pkg-file] name : ~a\n" name)
                (define summary-regexp
                  "^;;; [^ ]*\\.el ---[ \t]*\\(.*?\\)[ \t]*\\(-\\*-.*-\\*-[ \t]*\\)?$")
                (define %write-pkg-file-form
                  `(progn
                    (require 'lisp-mnt)
                    (require 'package)

                    (defun build-package-desc-from-library (name)
                      (package-desc-from-define
                       name
                       ;; Workaround for malformed version string (for example "24 (beta)"
                       ;; in paredit.el), try to parse version obtained by lm-version,
                       ;; before trying to create package-desc.  Otherwise the whole process
                       ;; of generation -pkg.el will fail.
                       (condition-case
                        nil
                        (let ((version (lm-version)))
                          ;; raises an error if version is invalid
                          (and (version-to-list version) version))
                        (error "0.0.0"))
                       (or (save-excursion
                            (goto-char (point-min))
                            (and (re-search-forward ,summary-regexp nil t)
                                 (match-string-no-properties 1)))
                           package--default-summary)
                       (let ((require-lines (lm-header-multiline "package-requires")))
                         (and require-lines
                              (package--prepare-dependencies
                               (package-read-from-string
                                (mapconcat 'identity require-lines " ")))))
                       :kind       'single
                       :url        (lm-homepage)
                       :keywords   (lm-keywords-list)
                       :maintainer (lm-maintainer)
                       :authors    (lm-authors)))

                    (defun generate-package-description-file (name)
                      (package-generate-description-file
                       (build-package-desc-from-library name)
                       (concat name "-pkg.el")))

                    (condition-case
                     err
                     (progn
                      (message "#### [write-pkg-file-form] (buffer-file-name) : %s" (buffer-file-name))
                      (let ((name (file-name-base (buffer-file-name))))
                        (generate-package-description-file name)
                        (message (concat name "-pkg.el file generated."))))
                     (error
                      (message "Some errors during generation of -pkg.el file occured:")
                      (message "%s" (error-message-string err))))))

                (format #t "#### [write-pkg-file-form] (file-exists? \"~a\") : ~a\n"
                        (string-append name "-pkg.el")
                        (file-exists? (string-append name "-pkg.el")))
                (unless (file-exists? (string-append name "-pkg.el"))
                  (emacs-batch-edit-file (string-append name ".el")
                    %write-pkg-file-form)))

              (let ((name (store-directory->elpa-name-version (assoc-ref outputs "out"))))
                (format #t "#### [ensure-package-description] name: ~a\n" name)

                (let* [(r (find-root-library-file name))]
                  (format #t "#### [ensure-package-description] (find-root-library-file \"~a\"): ~a\n" name r)
                  (and=> r write-pkg-file)))
              )))
      ))
    (inputs
     (list
      (@ (gnu packages emacs-xyz) emacs-auto-complete)
      (@ (gnu packages emacs-xyz) emacs-company)
      (@ (gnu packages emacs-xyz) emacs-dash)
      (@ (gnu packages emacs-xyz) emacs-f)
      (@ (gnu packages emacs-xyz) emacs-helm)
      (@ (gnu packages emacs-xyz) emacs-php-mode)
      (@ (gnu packages emacs-xyz) emacs-popup)
      (@ (gnu packages emacs-xyz) emacs-s)
      (@ (gnu packages emacs-xyz) emacs-xcscope)
      ))
    (native-inputs
     (list
      (@ (gnu packages emacs-xyz) emacs-ert-runner)
      ))
    (home-page "https://github.com/xcwen/ac-php")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-company-php
  (package
    (inherit (@ (gnu packages emacs-xyz) emacs-ac-php))
    (name "emacs-company-php")))

;; (define-public emacs-company-phpactor
;;   (package
;;     (name "emacs-company-phpactor")
;;     (version "2.7.0")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/xcwen/ac-php")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "1yn5cc6cmj3hwqgmjj44dz847xn5k99kirj36qwc04q7vhl8z8k7"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list
;;       #:tests? #true
;;       #:test-command #~(list "ert-runner")
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           (replace
;;               'ensure-package-description
;;               (lambda* (#:key outputs #:allow-other-keys)

;;                 (define (find-root-library-file name)
;;                   (let loop ((parts (string-split
;;                                      (package-name-version->elpa-name-version name) #\-))
;;                              (candidate ""))
;;                     (format #t "#### [find-root-library-file] parts : ~a\n" parts)
;;                     (format #t "#### [find-root-library-file] candidate : ~a\n" candidate)
;;                     (format #t "#### [find-root-library-file] (null? parts) : ~a\n" (null? parts))
;;                     (format #t "#### [find-root-library-file] (string-null? candidate) : ~a\n" (string-null? candidate))
;;                     (let* [(f (string-append candidate ".el"))]
;;                       (format #t "#### [find-root-library-file] (file-exists? ~a) : ~a\n" f (file-exists? f)))
;;                     (format #t "\n")
;;                     (cond
;;                      ;; at least one version part is given, so we don't terminate "early"
;;                      ((null? parts) #f)
;;                      ((string-null? candidate) (loop (cdr parts) (car parts)))
;;                      ((file-exists? (string-append candidate ".el")) candidate)
;;                      (else
;;                       (loop (cdr parts) (string-append candidate "-" (car parts)))))))

;;                 (define (emacs-package? name)
;;                   "Check if NAME correspond to the name of an Emacs package."
;;                   (string-prefix? "emacs-" name))

;;                 (define (package-name-version->elpa-name-version name-ver)
;;                   "Convert the Guix package NAME-VER to the corresponding ELPA name-version
;; format.  Essentially drop the prefix used in Guix."
;;                   (if (emacs-package? name-ver)  ; checks for "emacs-" prefix
;;                       (string-drop name-ver (string-length "emacs-"))
;;                       name-ver))

;;                 (define (store-file->elisp-source-file file)
;;                   "Convert FILE, a store file name for an Emacs Lisp source file, into a file
;; name that has been stripped of the hash and version number."
;;                   (let ((suffix ".el"))
;;                     (let-values (((name version)
;;                                   (package-name->name+version
;;                                    (basename
;;                                     (strip-store-file-name file) suffix))))
;;                       (string-append name suffix))))

;;                 (define (store-directory->elpa-name-version store-dir)
;;                   "Given a store directory STORE-DIR return the part of the basename after the
;; second hyphen.  This corresponds to 'name-version' as used in ELPA packages."
;;                   ((compose package-name-version->elpa-name-version
;;                             strip-store-file-name)
;;                    store-dir))

;;                 (define (write-pkg-file name)
;;                   (define summary-regexp
;;                     "^;;; [^ ]*\\.el ---[ \t]*\\(.*?\\)[ \t]*\\(-\\*-.*-\\*-[ \t]*\\)?$")
;;                   (define %write-pkg-file-form
;;                     `(progn
;;                       (require 'lisp-mnt)
;;                       (require 'package)

;;                       (defun build-package-desc-from-library (name)
;;                         (package-desc-from-define
;;                          name
;;                          ;; Workaround for malformed version string (for example "24 (beta)"
;;                          ;; in paredit.el), try to parse version obtained by lm-version,
;;                          ;; before trying to create package-desc.  Otherwise the whole process
;;                          ;; of generation -pkg.el will fail.
;;                          (condition-case
;;                           nil
;;                           (let ((version (lm-version)))
;;                             ;; raises an error if version is invalid
;;                             (and (version-to-list version) version))
;;                           (error "0.0.0"))
;;                          (or (save-excursion
;;                               (goto-char (point-min))
;;                               (and (re-search-forward ,summary-regexp nil t)
;;                                    (match-string-no-properties 1)))
;;                              package--default-summary)
;;                          (let ((require-lines (lm-header-multiline "package-requires")))
;;                            (and require-lines
;;                                 (package--prepare-dependencies
;;                                  (package-read-from-string
;;                                   (mapconcat 'identity require-lines " ")))))
;;                          :kind       'single
;;                          :url        (lm-homepage)
;;                          :keywords   (lm-keywords-list)
;;                          :maintainer (lm-maintainer)
;;                          :authors    (lm-authors)))

;;                       (defun generate-package-description-file (name)
;;                         (package-generate-description-file
;;                          (build-package-desc-from-library name)
;;                          (concat name "-pkg.el")))

;;                       (condition-case
;;                        err
;;                        (let ((name (file-name-base (buffer-file-name))))
;;                          (generate-package-description-file name)
;;                          (message (concat name "-pkg.el file generated.")))
;;                        (error
;;                         (message "There are some errors during generation of -pkg.el file:")
;;                         (message "%s" (error-message-string err))))))

;;                   (format #t "#### [%write-pkg-file-form] file-exists?: ~a\n" (file-exists? (string-append name "-pkg.el")))
;;                   (unless (file-exists? (string-append name "-pkg.el"))
;;                     (emacs-batch-edit-file (string-append name ".el")
;;                       %write-pkg-file-form)))

;;                 (let ((name (store-directory->elpa-name-version (assoc-ref outputs "out"))))
;;                   (format #t "#### [ensure-package-description] name: ~a\n" name)

;;                   (let* [(r (find-root-library-file name))]
;;                     (format #t "#### [ensure-package-description] (find-root-library-file name): ~a\n" r)
;;                     (and=> r write-pkg-file)))
;;                 )))
;;       ))
;;     (inputs
;;      (list
;; (@ (gnu packages emacs-xyz) emacs-auto-complete)
;; (@ (gnu packages emacs-xyz) emacs-company)
;; (@ (gnu packages emacs-xyz) emacs-dash)
;; (@ (gnu packages emacs-xyz) emacs-f)
;; (@ (gnu packages emacs-xyz) emacs-helm)
;; (@ (gnu packages emacs-xyz) emacs-php-mode)
;; (@ (gnu packages emacs-xyz) emacs-popup)
;; (@ (gnu packages emacs-xyz) emacs-s)
;; (@ (gnu packages emacs-xyz) emacs-xcscope)
;;       ))
;;     (native-inputs
;;      (list
;; (@ (gnu packages emacs-xyz) emacs-ert-runner)
;;       ))
;;     (home-page "https://github.com/xcwen/ac-php")
;;     (synopsis "Emacs Auto Complete & Company mode for PHP")
;;     (description
;;      "This package provides Auto Complete and Company back-ends for PHP.")
;;     (license license:gpl3+)))

(define-public emacs-php-runtime
  (let ((commit
         "37beef404c70d7b80dc085b1ee1e13fd9c375fe6")
        (revision "0"))
    (package
      (name "emacs-php-runtime")
      (version (git-version "0.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/php-runtime.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1sd65nhbcxr5r935z1ik3skz73kkpyr4r259nahn5gjvvww3if20"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/emacs-php/php-runtime.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-phpactor
  (let ((commit
         "47c4311843dd523f0409016a1f2c93c9d13b213a")
        (revision "0"))
    (package
      (name "emacs-phpactor")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/phpactor.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ax1i0s2ckhif6q9ps3pdbdi5xlp4w0dyysy81hmjn5x6y987ksj"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@ (gnu packages emacs-xyz) emacs-xref)
        (@ (gnu packages emacs-xyz) emacs-async)
        (@ (gnu packages emacs-xyz) emacs-composer)
        emacs-php-runtime
        (@ (gnu packages emacs-xyz) emacs-f)
        ))
      (home-page
       "https://github.com/emacs-php/phpactor.el")
      (synopsis "Interface to Phpactor (an intelligent code-completion and refactoring tool for PHP)")
      (description "")
      (license license:gpl3+))))

(define-public emacs-company-phpactor
  (package
    (inherit emacs-phpactor)
    (name "emacs-company-phpactor")))

(define-public emacs-auto-dictionary
  (let ((commit "b364e08009fe0062cf0927d8a0582fad5a12b8e7")
        (revision "0"))
    (package
      (name "emacs-auto-dictionary")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nschum/auto-dictionary-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0rfjx0x2an28821shgb4v5djza4kwn5nnrsl2cvh3px4wrvw3izp"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/nschum/auto-dictionary-mode.git")
      (synopsis "Automatic dictionary switcher for Emacs")
      (description
       "This package provides an automatic dictionary switcher for Emacs.  It
 detects the language of the text being edited and automatically selects the
 appropriate dictionary for spell-checking.  This is especially useful for
 multilingual users who frequently switch between languages, ensuring that the
 correct dictionary is always in use.")
      (license license:gpl3+))))

(define-public emacs-tblui
  (let ((commit
         "62ab5f62982c061a902fd3e54d94a68a4706572c")
        (revision "0"))
    (package
      (name "emacs-tblui")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Yuki-Inoue/tblui.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1fq0dsvh9a8h7n4d4cj7sn73nzbg5chqjby9pzpbs5grx4kf0zi6"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-magit-popup)
        (@(gnu packages emacs-xyz) emacs-dash)
        (@(gnu packages emacs-xyz) emacs-tablist)
        ))
      (home-page
       "https://github.com/Yuki-Inoue/tblui.el")
      (synopsis "Emacs library for building table-based user interfaces")
      (description
       "This package provides a library for building table-based user
 interfaces in Emacs.  It allows users to create and manipulate tables within
 Emacs buffers, offering an easy way to organize and display data in a
 structured format.  The package is designed to be flexible and integrates
 well with other Emacs features, making it a useful tool for developers and
 users who need to present tabular data in their workflows.")
      (license license:gpl3+))))

(define-public emacs-openai
  (let ((commit
         "04296c91c1517fb3d8a6297a1073684039773dae")
        (revision "0"))
    (package
      (name "emacs-openai")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/openai")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0gki266kpdf05pxdy1shbirw1z65xq5hqwn6n324simaznbjqbla"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-tblui
        (@ (gnu packages emacs-xyz) emacs-request)
        (@ (gnu packages emacs-xyz) emacs-let-alist)
        ))
      (home-page
       "https://github.com/emacs-openai/openai")
      (synopsis "Emacs client for OpenAI API interaction")
      (description
       "This package provides an Emacs client for interacting with the OpenAI
 API, allowing users to send requests and receive responses directly within
 the Emacs environment.  It supports a range of OpenAI services, including
 text completion, code generation, and more, enabling seamless integration of
 AI-powered tools into various Emacs workflows.")
      (license license:gpl3+))))

(define-public emacs-lv
  (package
    (inherit (@ (gnu packages emacs-xyz) emacs-hydra))
    (name "emacs-lv")))

(define-public emacs-chatgpt
  (let ((commit
         "5c1b8568f79147d25e43e317e161a6f19109e9a2")
        (revision "0"))
    (package
      (name "emacs-chatgpt")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/chatgpt.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0f8p7isssig3kxy89xj69fbjliwqjdww1r7spvslw6xbiac51dxa"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@ (gnu packages emacs-xyz) emacs-ht)
        (@ (gnu packages emacs-xyz) emacs-let-alist)
        emacs-lv
        (@ (gnu packages emacs-xyz) emacs-markdown-mode)
        emacs-openai
        (@ (gnu packages emacs-xyz) emacs-spinner)
        ))
      (home-page
       "https://github.com/emacs-openai/chatgpt.git")
      (synopsis "Emacs client for interacting with ChatGPT")
      (description
       "This package provides an Emacs client for interacting with ChatGPT,
 allowing users to send prompts and receive AI-generated responses directly
 within Emacs.  It supports maintaining conversations, integrating AI-driven
 assistance into various text-based workflows, and enhancing productivity by
 making AI tools easily accessible in the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-uuidgen
  (let ((commit "cebbe09d27c63abe61fe8c2e2248587d90265b59")
        (revision "0"))
    (package
     (name "emacs-uuidgen")
     (version (git-version "1.3" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kanru/uuidgen-el")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1ih6kj3inwdxypbqj2n5vnfxmc6rfrx114w8bdy60yd8klx7273d"))))
     (build-system emacs-build-system)
     (home-page "https://github.com/kanru/uuidgen-el")
     (synopsis "UUID generation library for Emacs")
     (description
      "This package provides functions to generate Universally Unique
Identifiers (UUIDs) within Emacs.  It supports the creation of UUIDs
conforming to RFC 4122, including versions 1, 3, 4, and 5.  The
library allows for time-based, name-based (using MD5 or SHA-1
hashing), and random UUID generation, facilitating the creation of
unique identifiers directly in Emacs.")
     (license license:gpl3+))))

(define-public emacs-vline
  (let ((commit "f5d7b5743dceca75b81c8c95287cd5b0341debf9")
        (revision "0"))
    (package
      (name "emacs-vline")
      (version (git-version "1.11" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/buzztaiki/vline")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "06qqpjaxsacslxb3f2bm790lwygbq6387n9ccn4v9vz9xlyn9dmi"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/buzztaiki/vline")
      (synopsis "Column highlighting mode for Emacs")
      (description
       "This package provides `vline-mode`, a minor mode for Emacs that
 highlights the entire column at the cursor's current position.  It enhances
 text editing by visually indicating the vertical line, aiding in code
 readability and alignment.  The mode is customizable, allowing users to
 adjust the appearance and behavior of the column highlighting to suit their
 preferences.")
      (license license:gpl3+))))

(define-public emacs-xhair
  (let ((commit "c7bd7c501c3545aa99dadac386c882fe7c5edd9c")
        (revision "0"))
    (package
      (name "emacs-xhair")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Boruch-Baum/emacs-xhair")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "03m15lbspk73x59wvb77wgvnkrmrlq4w6kmnrr2i69jgafqh0421"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-vline
        ))
      (home-page "https://github.com/Boruch-Baum/emacs-xhair")
      (synopsis "Highlight current line and column in Emacs")
      (description
       "This package provides functionality to highlight the current line and
 column in Emacs, creating a crosshair effect at the point.  It combines
 `vline-mode` and `hl-line-mode` to visually emphasize the cursor position,
 aiding in text navigation and editing.  The highlighting can be toggled
 manually, set to activate until the next keypress, or applied for a specified
 interval, enhancing the user's focus on the active point in the buffer.")
      (license license:gpl3+))))

(define-public emacs-insert-shebang
  (let ((commit "cc8cea997a8523bce9f303de993af3a73eb0d2e2")
        (revision "0"))
    (package
      (name "emacs-insert-shebang")
      (version (git-version "0.9.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/psachin/insert-shebang.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0wvcdv2lfv68r3zyfzr9yahm3gvc60yzk8zi39l70vsgzh4yfq91"))))
      (build-system emacs-build-system)
      (home-page
       "https://gitlab.com/psachin/insert-shebang.git")
      (synopsis "Automatic shebang line insertion for Emacs")
      (description
       "This package provides an Emacs extension that automatically inserts
 shebang lines into scripts based on their file types.  It supports various
 scripting languages and can be customized to recognize additional file types
 or headers.  The extension streamlines script creation by ensuring the
 correct interpreter is specified, enhancing workflow efficiency.")
      (license license:gpl3+))))

(define-public emacs-indent-guide
  (let ((commit "d388c3387781a370ca13233ff445d03f3c5cf12f")
        (revision "0"))
    (package
      (name "emacs-indent-guide")
      (version (git-version "2.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/zk-phi/indent-guide")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0r303mzxj57l8rclzsmvhnx2p3lhf2k4zvn8a6145wb10jvcwfxi"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/zk-phi/indent-guide")
      (synopsis "Show vertical lines to guide indentation in Emacs")
      (description
       "This package provides a minor mode for Emacs that displays vertical
 lines to visually guide indentation levels.  It enhances code readability by
 indicating indentation depth, making it easier to understand code structure.
  The mode is customizable, allowing users to adjust the appearance of the
 guide lines to fit their preferences.")
      (license license:gpl3+))))

(define-public emacs-wfnames
  (let ((commit "164e4efa2a96bed201a0a5402e137ebeef15bcc6")
        (revision "0"))
    (package
      (name "emacs-wfnames")
      (version (git-version "1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/thierryvolpiatto/wfnames")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bv0jky553kyvp8g2fhglnq5af6nqassswmjxlr8vz3ahyy06l3y"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/thierryvolpiatto/wfnames")
      (synopsis "Edit multiple filenames directly within Emacs buffers")
      (description
       "This package allows users to edit multiple filenames directly within
 an Emacs buffer. It supports editing lists of absolute file paths, enabling
 modifications to both filenames and their directory components. Changes are
 highlighted, and file completion is provided to streamline the renaming
 process. This tool is particularly useful for batch renaming files across
 various directories without leaving the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-yapfify
  (let ((commit "c9347e3b1dec5fc8d34883e206fcdc8500d22368")
        (revision "0"))
    (package
      (name "emacs-yapfify")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/JorisE/yapfify")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0gkz4f0yfpfchh78v1c0plbjafag23y18gcg8a8rc5s21nqqhkj4"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/JorisE/yapfify")
      (synopsis "Emacs minor mode for formatting Python code with YAPF")
      (description
       "This package provides an Emacs minor mode, `yapf-mode`, which formats
 Python code using YAPF. It can be configured to automatically format buffers
 before saving, ensuring consistent code style. Unlike similar tools, `yapfify`
 operates directly on the original file, respecting project-specific YAPF
 configurations.")
      (license license:gpl3+))))

(define-public emacs-smeargle
  (let ((commit "afe34e7e3ce811d44880bca11f9fe1e3d91e272f")
        (revision "0"))
    (package
      (name "emacs-smeargle")
      (version (git-version "0.03" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/smeargle")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1yy2lqvn67dr6jhbyqv3zd93rmpw7bggklb1hbhp8spagflvj6li"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/emacsorphanage/smeargle")
      (synopsis "Highlighting regions in Emacs based on version control history")
      (description
       "This package provides an Emacs minor mode that highlights regions of a
 buffer based on version control history.  It visually indicates lines
 modified since the last commit, helping users quickly identify recent
 changes.  The mode supports various version control systems and offers
 customizable highlighting styles.")
      (license license:gpl3+))))

(define-public emacs-pcsv
  (let ((commit "aa421d12c0da0adb9bc74a050a591dcbabf934ae")
        (revision "0"))
    (package
      (name "emacs-pcsv")
      (version (git-version "1.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mhayashi1120/Emacs-pcsv")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "15pwxzr8k98k82p9ni49hh84fh4mrcdcd7nx7xgv3lpm5nj0ix9z"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/mhayashi1120/Emacs-pcsv")
      (synopsis "RFC 4180-compliant CSV parser for Emacs")
      (description
       "This package provides a CSV parser for Emacs that adheres to RFC 4180
 standards.  It offers functions to parse CSV data from buffers, files, and
 regions, facilitating the handling of CSV content within Emacs.  For large
 CSV files, it includes a lazy parser to efficiently process data without
 excessive memory usage.")
      (license license:gpl3+))))

(define-public emacs-mvn
  (let ((commit "223723d9ceeb2878b884e83abb8ca74ad2e42081")
        (revision "0"))
    (package
      (name "emacs-mvn")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/apgwoz/mvn-el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1sl7kfg5w73cw9mv4x1m497dg27h42zgx2ywl4s8fmx2k9f2pq1q"))))
      (build-system emacs-build-system)
      ;; contains (defvar mvn-command "mvn")
      (home-page "https://github.com/apgwoz/mvn-el")
      (synopsis "Emacs integration for Apache Maven build automation")
      (description
       "This package provides Emacs helpers for interacting with Apache Maven,
 facilitating build automation within the editor.  It allows users to execute
 Maven commands directly from Emacs, such as compile, clean, and test, and
 integrates with Emacs' compilation mode for streamlined development
 workflows.  The package supports customization for non-standard Maven setups
 and offers functions for running specific Maven goals.")
      (license license:gpl3+))))

(define-public emacs-systemd
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-systemd-mode))
    (name "emacs-systemd")))

(define-public emacs-prettier-js
  (let ((commit "e9b73e81d3e1642aec682195f127a42dfb0b5774")
        (revision "0"))
    (package
      (name "emacs-prettier-js")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/prettier/prettier-emacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0hj4fv3fgc60i6jrsx4a81s5c9fsxxafhhs3q2q1dypsscjci9ph"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/prettier/prettier-emacs")
      (synopsis "Emacs minor mode for formatting code with Prettier")
      (description
       "This package provides an Emacs minor mode that formats code using
 Prettier, an opinionated code formatter supporting multiple languages. It
 enables automatic code formatting on file save, ensuring consistent code
 style across JavaScript, TypeScript, JSON, CSS, and other supported
 languages. The package allows customization of Prettier's command-line
 arguments and integrates seamlessly with popular Emacs modes like `js2-mode`
 and `web-mode`. For optimal performance, ensure that the Prettier executable
 is installed and accessible in your system's PATH.")
      (license license:gpl3+))))

(define-public emacs-lsp-latex
  (let ((commit "36a37a8e0a6b0edbea8e67dab89d12980d2a368f")
        (revision "0"))
    (package
      (name "emacs-lsp-latex")
      (version (git-version "20241006.800" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ROCKTAKEY/lsp-latex")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0yfmqjp1bmp8rp9vl9y5qmic3wr2f5p10gyb2rlmpgfnx5c8575g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-consult)
        (@(gnu packages emacs-xyz) emacs-lsp-mode)))
      (home-page "https://github.com/ROCKTAKEY/lsp-latex")
      (synopsis "Enhanced LSP support for LaTeX in Emacs using Texlab")
      (description
       "This package provides comprehensive Language Server Protocol (LSP)
 support for LaTeX editing in Emacs, utilizing the Texlab server. It extends
 the basic functionality offered by lsp-mode's lsp-tex.el, delivering features
 such as real-time syntax checking, code completion, and document formatting.
 Additionally, it supports forward and inverse search between Emacs and PDF
 viewers, enhancing the LaTeX editing workflow.")
      (license license:gpl3+))))

(define-public emacs-sqlite3
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-sqlite3-api))
    (name "emacs-sqlite3")))

(define-public emacs-geben
  (let ((commit "1779492d73534e18fbcfdd7c6cc175859527d019")
        (revision "0"))
    (package
      (name "emacs-geben")
      (version (git-version "1.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ahungry/geben")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "161916kz125ah5msh8c02inmlr3rr858k6ywb18x27pnqx6n8lvg"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/ahungry/geben")
      (synopsis "DBGp protocol debugger integration for Emacs")
      (description
       "Geben is an Emacs package that interfaces with the DBGp protocol,
 enabling interactive debugging of scripts within Emacs. It supports multiple
 scripting languages through DBGp-compatible extensions, including PHP with
 Xdebug, and Perl, Python, Ruby, and Tcl with Komodo Debugger Extensions. Key
 features include setting and managing breakpoints, stepping through code,
 evaluating expressions, inspecting variables, and viewing backtraces, all
 within the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-cython-mode
  (let ((commit "3e4790559d3168fe992cf2aa62f01423038cedb5")
        (revision "0"))
    (package
      (name "emacs-cython-mode")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cython/emacs-cython-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03kilbl9mp1hs7mpqb6vs6sbmhplpm4qg93sn1vhn34q710iccb0"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/cython/emacs-cython-mode")
      (synopsis "Major mode for editing Cython files in Emacs")
      (description
       "This package provides `cython-mode`, a major mode for Emacs tailored
 for editing Cython source files. It offers syntax highlighting, indentation
 support, and integration with Emacs' compilation framework, enhancing the
 development experience for Cython code.")
      (license license:gpl3+))))

(define-public emacs-eval-sexp-fu
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-eval-sexp-fu-el))
    (name "emacs-eval-sexp-fu")))

(define-public emacs-pyenv-mode
  (let ((commit "76787ea44f633426df402341663784db3a9e9639")
        (revision "0"))
    (package
      (name "emacs-pyenv-mode")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/proofit404/pyenv-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07nm4a5g6krflsyn232sg3zyzf79djf4pfwdwzlph4r3wspr9ix9"))))
      (build-system emacs-build-system)
      ;; contains (executable-find "pyenv")
      (propagated-inputs (list
                          (@(gnu packages emacs-xyz) emacs-pythonic)
                          ))
      (home-page "https://github.com/proofit404/pyenv-mode")
      (synopsis "Integrate pyenv with Emacs python-mode")
      (description
       "This package integrates pyenv with Emacs' python-mode, allowing
 seamless switching between different Python versions and virtual environments
 within Emacs. It sets the `PYENV_VERSION` environment variable and
 `python-shell-virtualenv-path` based on user input, enabling packages that
 utilize python.el to support pyenv virtual environments out-of-the-box. This
 integration enhances the Python development workflow by providing flexibility
 in managing Python versions directly from the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-groovy-mode
  (package
    (inherit
     (@(gnu packages emacs-xyz) emacs-groovy-modes))
    (name "emacs-groovy-mode")))

(define-public emacs-orgit-forge
  (let ((commit "2718a6aaf0f64cb52c64c419053fbc80eb358c8d")
        (revision "0"))
    (package
      (name "emacs-orgit-forge")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/orgit-forge")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xcv7kqsrv39rk8fjd2sbl2wrr8mdb6y1xipifki4q7mry1c6v6w"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(gnu packages emacs-xyz) emacs-orgit)
        (@(gnu packages emacs-xyz) emacs-forge)
        (@(gnu packages emacs-xyz) emacs-compat)
        ))
      (home-page "https://github.com/magit/orgit-forge")
      (synopsis "Org links to Forge topic buffers in Emacs")
      (description
       "This package defines the Org link type `orgit-topic`, enabling users
 to create links to Forge topic buffers within Org-mode documents in Emacs.
 Similar to the `orgit` package, which links to various Magit buffers,
 `orgit-forge` facilitates seamless navigation between Org documents and Forge
 topics, enhancing integration between version control and documentation
 workflows.")
      (license license:gpl3+))))

(define-public emacs-ob-elixir
  (let ((commit "8990a8178b2f7bd93504a9ab136622aab6e82e32")
        (revision "0"))
    (package
      (name "emacs-ob-elixir")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/zweifisch/ob-elixir")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "19awvfbjsnd5la14ad8cfd20pdwwlf3d2wxmz7kz6x6rf48x38za"))))
      (build-system emacs-build-system)
      (home-page "http://github.com/zweifisch/ob-elixir")
      (synopsis "Org-babel support for Elixir code blocks in Emacs")
      (description
       "This package enables the execution of Elixir code blocks within
 Org-mode documents using org-babel in Emacs. It allows users to write and
 evaluate Elixir code seamlessly alongside documentation, supporting
 interactive and reproducible workflows. The package also facilitates
 connections to remote Elixir shells, enhancing the integration between
 Org-mode and Elixir development.")
      (license license:gpl3+))))

(define-public emacs-open-junk-file
  (let ((commit "558bec7372b0fed4c4cb6074ab906535fae615bd")
        (revision "0"))
    (package
      (name "emacs-open-junk-file")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rubikitch/open-junk-file")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0kcgkxn5v9bsbkcvpjxjqhj1w3c29bfb33bmiw32gzbfphmrvhh1"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/rubikitch/open-junk-file")
      (synopsis "Quickly open a new buffer for temporary notes in Emacs")
      (description
       "This package provides a command to open a new buffer with a unique
 name based on the current date and time, allowing users to quickly jot down
 temporary notes or test code snippets without disrupting their workflow. The
 buffers are saved in a designated directory, making it easy to review or
 manage them later.")
      (license license:gpl3+))))

(define-public emacs-omtose-phellack-themes
  (let ((commit "b96905deb9b2bef097e0c573100874812c1e9aa8")
        (revision "0"))
    (package
      (name "emacs-omtose-phellack-themes")
      (version (git-version "20240928.1241" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/omtose-phellack-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1kyg55njj19licj4wkp5ahabnbmpjfksv89l75axcib6hj3rgk5k"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/emacsorphanage/omtose-phellack-themes")
      (synopsis "Dark, soothing themes for Emacs with a cold bluish touch")
      (description
       "This package provides two dark themes for Emacs, 'omtose-darker' and
 'omtose-softer', both featuring a cold bluish aesthetic. Inspired by the
 'Omtose Phellack' realm from the Malazan Book of the Fallen series by Steven
 Erikson, these themes aim to offer a visually soothing coding environment.
 They require Emacs version 24.0 or higher and can be installed via MELPA.
 Users can switch between the darker and softer variants to suit their
 preferences.")
      (license license:gpl3+))))

(define-public emacs-org-project-capture
  (let ((commit "bf1c30b750020ab8dd634dd66b2c7b76c56286c5")
        (revision "0"))
    (package
      (name "emacs-org-project-capture")
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
        (@(gnu packages emacs-xyz) emacs-dash)
        (@(gnu packages emacs-xyz) emacs-helm)
        (@(gnu packages emacs-xyz) emacs-helm-org)
        (@(gnu packages emacs-xyz) emacs-projectile)
        (@(gnu packages emacs-xyz) emacs-s)
        ))
      (home-page "https://github.com/colonelpanic8/org-project-capture")
      (synopsis "Integrate Org-mode TODOs with project management in Emacs")
      (description
       "This package integrates Org-mode TODOs with project management tools
 like Projectile and project.el in Emacs. It allows maintaining
 project-specific TODO lists, specifying storage locations for these lists,
 and offers customizable capture strategies. Keybindings can be established
 for easy access, enhancing the organization and management of tasks within
 Emacs.")
      (license license:gpl3+))))

(define-public emacs-org-category-capture
  (package
    (inherit emacs-org-project-capture)
    (name "emacs-org-category-capture")))

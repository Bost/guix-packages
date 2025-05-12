(define-module (bost gnu packages emacs-xyz-1)
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
  #:use-module (gnu packages emacs-xyz)
  #:use-module (bost gnu packages emacs-xyz-done)
  )

;; c -r 113082:113101 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
        emacs-yasnippet
        emacs-php-mode
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

;; bat -r 68039:68058 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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

;; bat -r 82671:82693 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
         emacs-shut-up
         emacs-dash
         emacs-s
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

;; bat -r 98865:98884 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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

;; bat -r 53684:53705 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
        emacs-s
        ))
      (home-page "https://github.com/mbezjak/emacs-groovy-imports.git")
      (synopsis "Automatic import management for Groovy in Emacs")
      (description
       "This package provides automatic import management for Groovy files in
 Emacs.  It enables users to add and manage import statements based on the
 classes used in the code, streamlining the development process for Groovy
 projects.  The package helps keep imports organized and reduces the need for
 manual import adjustments.")
      (license license:gpl3+))))

(define emacs-spacemacs-base
  (let ((commit "2254b9c16150165f459895bb49bc309b029b54e4")
        (revision "0"))
    (package
      (name "emacs-spacemacs-base")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/spacemacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07mnf0669awwr454s94qyd4j2kzcfg8hc7q98lii9lf66fyaciyb"))))
      (build-system emacs-build-system)
      (home-page "http://spacemacs.org/")
      (synopsis
       "Community-driven Emacs distribution - The best editor is neither Emacs
 nor Vim, it's Emacs *and* Vim!")
      (description
       "Spacemacs is a new way of experiencing Emacs - it's a sophisticated
 and polished set-up, focused on ergonomics, mnemonics and consistency.")
      (license license:gpl3+))))

(define all-info-include (quote (list "^.*\\.info$")))

(define-public emacs-rst-lists
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-lists")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+lang/restructuredtext/local/rst-lists"
                      "rst-lists\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; gx build -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-core-versions)'
(define-public emacs-core-versions
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-versions")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-versions\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-load-paths
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-load-paths")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-load-paths\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-spacemacs-ht
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-ht")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs/forks"
                      "spacemacs-ht\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-dotspacemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-dotspacemacs")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-dotspacemacs\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-spacemacs-buffer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacemacs-buffer")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-spacemacs-buffer\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list emacs-core-dotspacemacs))))

(define-public emacs-core-use-package-ext
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-use-package-ext")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-use-package-ext\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-fonts-support
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-fonts-support")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-fonts-support\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-command-line
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-command-line")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-command-line\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-transient-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-transient-state")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-transient-state\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-early-funcs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-early-funcs")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-early-funcs\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-documentation
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-documentation")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-documentation\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-compilation
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-compilation")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-compilation\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-env
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-env")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-env\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-hooks
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-hooks")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-hooks\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-display-init
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-display-init")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-display-init\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-zemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-zemacs")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/aprilfool"
                      "zemacs\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://www.emacswiki.org/emacs/download/irfc.el
(define-public emacs-irfc
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-irfc")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+misc/ietf/local/irfc"
                      "irfc\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/melpa/package-build
(define-public emacs-package-build
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-build")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "package-build\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-spacebind
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacebind")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-spacebind\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-package-build-badges
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-build-badges")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "package-build-badges\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-custom-settings
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-custom-settings")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-custom-settings\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/creichert/ido-vertical-mode.el
(define-public emacs-ido-vertical-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ido-vertical-mode")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "ido-vertical-mode\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-configuration-layer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-configuration-layer")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-configuration-layer\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-core-load-paths
      emacs-core-spacemacs-buffer
      emacs-core-progress-bar
      emacs-core-funcs
      emacs-core-dotspacemacs
      emacs-spacemacs-ht
      ))))

(define-public emacs-core-customization
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-customization")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-customization\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list emacs-validate))))

(define-public emacs-spacemacs-common
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-common")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs/spacemacs-theme"
                      "spacemacs-common\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/nashamri/spacemacs-theme
(define-public emacs-spacemacs-theme
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-theme")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs/spacemacs-theme"
                      "spacemacs-theme\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/purcell/page-break-lines
(define-public emacs-page-break-lines
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-page-break-lines")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "page-break-lines\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-package-recipe-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-recipe-mode")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "package-recipe-mode\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/TeMPOraL/nyan-mode/
(define-public emacs-nyan-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-nyan-mode")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+themes/colors/local/nyan-mode"
                      "nyan-mode\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-erc-yank
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-yank")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+chat/erc/local/erc-yank"
                      "erc-yank\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-debug
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-debug")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-debug\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-load-env-vars
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-load-env-vars")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs/forks"
                      "load-env-vars\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-themes-support
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-themes-support")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-themes-support\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/sigma/mocker.el
(define-public emacs-mocker
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-mocker")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "mocker\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-release-management
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-release-management")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-release-management\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-compleseus-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-compleseus-spacemacs-help")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+completion/compleseus/local/compleseus-spacemacs-help"
                      "compleseus-spacemacs-help\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-consult
      emacs-core-configuration-layer
      ))))

(define-public emacs-erc-tex
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-tex")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+chat/erc/local/erc-tex"
                      "erc-tex\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-keybindings
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-keybindings")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-keybindings\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-erc-sasl
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-sasl")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+chat/erc/local/erc-sasl"
                      "erc-sasl\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-dumper
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-dumper")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-dumper\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-cycle
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-cycle")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-cycle\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/larstvei/ox-gfm
(define-public emacs-ox-gfm
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ox-gfm")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+emacs/org/local/ox-gfm"
                      "ox-gfm\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-jump
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-jump")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-jump\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-package-recipe
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-recipe")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "package-recipe\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-helm-spacemacs-faq
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-spacemacs-faq")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+completion/helm/local/helm-spacemacs-help"
                      "helm-spacemacs-faq\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-quelpa
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-quelpa")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "quelpa\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-helm-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-spacemacs-help")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+completion/helm/local/helm-spacemacs-help"
                      "helm-spacemacs-help\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-ivy-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ivy-spacemacs-help")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+completion/ivy/local/ivy-spacemacs-help"
                      "ivy-spacemacs-help\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-funcs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-funcs")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-funcs\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-tmux
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-tmux")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+tools/tmux/local/tmux"
                      "tmux\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-progress-bar
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-progress-bar")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-progress-bar\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-micro-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-micro-state")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-micro-state\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-toggle
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-toggle")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-toggle\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-emacs-backports
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-emacs-backports")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-emacs-backports\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-spacemacs-purpose-popwin
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-purpose-popwin")
    (propagated-inputs
     (list emacs-window-purpose))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
                      "spacemacs-purpose-popwin\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-spacemacs-whitespace-cleanup
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-whitespace-cleanup")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup"
                      "spacemacs-whitespace-cleanup\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-help-fns-plus
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-help-fns-plus")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-defaults/local/help-fns+"
                      "help-fns\\+\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-helm-games
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-games")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+fun/games/local/helm-games"
                      "helm-games\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-hybrid-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-hybrid-mode")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode"
                      "hybrid-mode\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files))
              (substitute* "hybrid-mode.el"
                ((";;; Code:")
                 ;; The following doesn't work. The macro must be autoloaded
                 ;; ";;; Code:\n(require 'core-funcs)"
                 (string-append
                  ";;; Code:\n\n"
                  ";;;###autoload\n"
                  "(defmacro spacemacs|dotspacemacs-backward-compatibility (variable default)
  \"Return `if' sexp for backward compatibility with old dotspacemacs
  values.\"
  `(if (boundp ',variable) ,variable ',default))"))))))))
    (propagated-inputs
     (list
      ;; emacs-core-funcs ;; Doesn't work - see above
      emacs-evil))))

(define-public emacs-vim-colors
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-vim-colors")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-modeline/local/vim-powerline"
                      "vim-colors\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-space-doc
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-space-doc")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-org/local/space-doc"
                      "space-doc\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-rst-sphinx
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-sphinx")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+tools/sphinx/local/rst-sphinx"
                      "rst-sphinx\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-vim-powerline
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-vim-powerline")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-modeline/local/vim-powerline"
                      "vim-powerline-theme\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-vim-colors))))

(define-public emacs-evil-unimpaired
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-evil-unimpaired")
    (propagated-inputs
     (list
      emacs-dash
      emacs-f))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
                      "evil-unimpaired\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

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
    (inputs
     (list
      python
      ))))

;; bat -r 34665:34685 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-erc-image
  (let ((commit "883084f0801d46a5ccf183e51ae9a734755bbb97")
        (revision "4"))
    (package
      (name "emacs-erc-image")
      (version (git-version "0.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kidd/erc-image.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "081c8pjmpwnmqah7dbpkj20bk7ln57g4n7c1zxzdlsz80pxnfay4"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            ;; The package autoloader fails to provide the image module when
            ;; handled by Guix. Don't autoload the (eval-after-load 'erc ...),
            ;; and let the package handle the `eval-after-load' procedure.
            (add-before 'make-autoloads 'patch-autoloads
              (lambda _
                (lambda _
                  (substitute* "erc-image.el"
                    ((";;;###autoload")
                     ";; do not autoload this ;;;###autoload"))))))))
      (home-page "https://github.com/kidd/erc-image.el")
      (synopsis "Show inlined images (png/jpg/gif/svg) in ERC buffers")
      (description "This plugin subscribes to hooks @code{erc-insert-modify-hook}
and @code{erc-send-modify-hook} to download and show images.")
      (license license:gpl3+))))

(define-public emacs-evil-evilified-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-evil-evilified-state")
    (propagated-inputs
     (list
      emacs-evil
      emacs-bind-map))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state"
                      "evil-evilified-state\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-spacemacs-xclipboard
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-xclipboard")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+tools/xclipboard/local/spacemacs-xclipboard"
                      "spacemacs-xclipboard\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-theme-changer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-theme-changer")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+tools/geolocation/extensions/theme-changer"
                      "theme-changer\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-holy-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-holy-mode")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+distributions/spacemacs-bootstrap/local/holy-mode"
                      "holy-mode\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-jr-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-jr-mode")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+lang/jr/local/jr-mode"
                      "jr-mode\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-rst-directives
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-directives")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+lang/restructuredtext/local/rst-directives"
                      "rst-directives\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-spacemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacemacs")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-spacemacs\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
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

;; bat -r 99599:99622 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-persistent-soft
  (let ((commit "a1e0ddf2a12a6f18cab565dee250f070384cbe02")
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
          (base32 "14p20br8vzxs39d4hswzrrkgwql5nnmn5j17cpbabzjvck42rixc"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/rolandwalker/persistent-soft")
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
;; bat -r 46683:46706 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "http://github.com/rolandwalker/font-utils.git")
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

;; bat -r 128301:128325 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-ucs-utils
  (let ((commit "91b9e0207fff5883383fd39c45ad5522e9b90e65")
        (revision "0"))
    (package
      (name "emacs-ucs-utils")
      (version (git-version "0.9.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rolandwalker/ucs-utils.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "18yqzy8w4icp60z25ckbrx6wradm3m26vic35kmzr88msc0qdsva"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/rolandwalker/ucs-utils")
      (synopsis "Utilities for Unicode characters in Emacs")
      (description
       "Utilities for manipulating Unicode characters, with integrated ability
 to return fallback characters when Unicode display is not possible.")
      (license license:gpl3+))))

;; bat -r 128853:128879 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-unicode-fonts
  (let ((commit "6245b97d8ddaeaf1de4dbe2cd85ca0f3b20ef81b")
        (revision "0"))
    (package
      (name "emacs-unicode-fonts")
      (version (git-version "0.4.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rolandwalker/unicode-fonts.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ckcvy10sz4qvjy1bqrpvaijw92q2da4b6bxbgxaxvrw5d0ih81f"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-ucs-utils
        ;; the guix-dev channel lists also the following 4 inputs:
        ;; emacs-font-utils
        ;; emacs-list-utils
        ;; emacs-persistent-soft
        ;; emacs-pcache
        ))
      (home-page "https://github.com/rolandwalker/unicode-fonts")
      (synopsis "Configure Unicode fonts for Emacs")
      (description
       "Mappings for 233 of the 255 blocks in the Unicode 8.0 standard which
 are public and have displayable characters.")
      (license license:gpl3+))))

(define-public emacs-use-package
  ;; XXX: Upstream did not tag latest release.  Using commit matching exact
  ;; version bump.
  (let ((commit "a6e856418d2ebd053b34e0ab2fda328abeba731c")
        (revision "0"))
    (package
      (name "emacs-use-package")
      (version (git-version "2.4.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jwiegley/use-package.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0g1smk27ry391gk8bb8q3i42s0p520zwhxfnxvzv5cjj93mcpd8f"))))
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
        (@(gnu packages texinfo) texinfo)
        ))
      (propagated-inputs
       (list
        emacs-diminish
        ))
      (home-page "https://github.com/jwiegley/use-package")
      (synopsis "Declaration for simplifying your .emacs")
      (description "The use-package macro allows you to isolate package
configuration in your @file{.emacs} file in a way that is both
performance-oriented and tidy.")
      (license license:gpl2+))))

(define-public emacs-use-package-chords
  (package
    (inherit emacs-use-package)
    (name "emacs-use-package-chords")))

;; TODO compare emacs-use-package-chords with:
;; bat -r 129644:129667 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
;; (define-public emacs-use-package-chords
;;   (package
;;     (name "emacs-use-package-chords")
;;     (version "20250330.1852")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/waymondo/use-package-chords.git")
;;              (commit
;;               "0793b50e2bf1ec8bfc532b10baeef716c5aa947a")))
;;        (sha256
;;         (base32
;;          "0dkiic5yrdmjkyrahm10ggx0scp4ixqbb184i55f6fpf8yvy6nd8"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list
;;       emacs-bind-chord
;;       emacs-key-chord
;;       ))
;;     (arguments '(#:files ("use-package-chords.el")))
;;     (home-page
;;      "https://github.com/jwiegley/use-package")
;;     (synopsis "Key-chord keyword for use-package")
;;     (description
;;      "Documentation at https://melpa.org/#/use-package-chords")
;;     (license #f)))

;; bat -r 12662:12693 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-chatgpt-shell ;; PR sent
  (let ((commit "3c8d95d9a550d2fb278bdf32e8446fed1974af03")
        (revision "0"))
    (package
      (name "emacs-chatgpt-shell")
      (version (git-version "2.18.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/xenodium/chatgpt-shell.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fdav9jj06nav696xlqq4shmqshchsxyankmbllz6hlsjyxgfwvm"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            ;; (add-after 'unpack 'disable-save-variables
            ;;   (lambda _
            ;; ;;; Override chatgpt-shell--save-variables chatgpt-shell--load-variables to
            ;; ;;; prevent writing to ~/.emacs.d
            ;; ;;; TODO try (locate-user-emacs-file "chatgpt-shell") however this may not be
            ;; ;;; needed after all.
            ;;     (substitute* "chatgpt-shell.el"
            ;;       (("\\(provide 'chatgpt-shell\\)")
            ;;        (string-append
            ;;         "(defun chatgpt-shell--save-variables () nil)"
            ;;         "(defun chatgpt-shell--load-variables () nil)"
            ;;         "(provide 'chatgpt-shell)")))))

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
                    (display "nil" port))))))))
      (propagated-inputs
       (list
        emacs-shell-maker
        ))
      (home-page "https://github.com/xenodium/chatgpt-shell")
      (synopsis "ChatGPT and DALL-E Emacs shells and Org Babel libraries")
      (description
       "Chatgpt Shell is a Comint-based ChatGPT shell for Emacs.")
      (license license:gpl3+))))

;; bat -r 77928:77951 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-markdown-toc
  (let ((commit "1b0c5ae7f306f60b909390cad009b76660dd5acd")
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
          (base32 "03z4yayf2wvpbig8s4z07pz4hy83vsf4pbq4gn56yz64qxv03jh5"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-markdown-mode
        emacs-s
        ))
      (home-page "https://github.com/ardumont/markdown-toc")
      (synopsis "Generate a table of contents for Markdown files in Emacs")
      (description
       "This package provides a tool to generate and update a table of
 contents (TOC) for Markdown files within Emacs.  It automatically creates TOC
 entries based on the headers in the document and updates them as the file
 changes.  This simplifies navigation and organization in large Markdown
 documents.")
      (license license:gpl3+))))

;; bat -r 100343:100364 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-php-runtime
  (let ((commit "37beef404c70d7b80dc085b1ee1e13fd9c375fe6")
        (revision "0"))
    (package
      (name "emacs-php-runtime")
      (version (git-version "0.3.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/php-runtime.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1sd65nhbcxr5r935z1ik3skz73kkpyr4r259nahn5gjvvww3if20"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/emacs-php/php-runtime.el")
      (synopsis "Evaluate PHP code from Emacs using php-runtime.el")
      (description
       "Functions to evaluate PHP code directly from Emacs.  It enables
 executing PHP expressions and scripts, retrieving results, and interacting
with PHP's standard input.  Users can specify the PHP executable path and
construct PHP expressions programmatically, facilitating seamless integration
between Emacs and PHP.")
      (license license:gpl3+))))

;; bat -r 100390:100418 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-phpactor
  (let ((commit "037187f9e204d3ed17017e7fb54236c005725fb7")
        (revision "0"))
    (package
      (name "emacs-phpactor")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/phpactor.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vz9ckpkbqcf30aca7swizc1nx2jaghmyr4b1s64cncwr8z4jg5h"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-f
        emacs-async
        emacs-composer
        emacs-php-runtime
        ))
      (home-page "https://github.com/emacs-php/phpactor.el")
      (synopsis "Emacs interface to Phpactor for PHP code introspection and refactoring")
      (description
       "Emacs interface to Phpactor, an intelligent code-completion and
 refactoring tool for PHP.  It enables features such as class navigation,
 method extraction, variable renaming, and code generation through Phpactor's
 RPC protocol.  Note: This package is in alpha stage and may be superseded by
 LSP-based alternatives.")
      (license license:gpl3+))))

(define-public emacs-company-phpactor
  (package
    (inherit emacs-phpactor)
    (name "emacs-company-phpactor")))

;; bat -r 5586:5607 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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

;; bat -r 123218:123240 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-tblui
  (let ((commit "62ab5f62982c061a902fd3e54d94a68a4706572c")
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
          (base32 "1fq0dsvh9a8h7n4d4cj7sn73nzbg5chqjby9pzpbs5grx4kf0zi6"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-magit-popup
        emacs-dash
        emacs-tablist
        ))
      (home-page "https://github.com/Yuki-Inoue/tblui.el")
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
  (let ((commit "91115cd20781b2db9febadadc4ae89c35a9a6df5")
        (revision "0"))
    (package
      (name "emacs-openai")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/openai.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0146abvgygs787x75jlqhgp0qz77jw0mjn3n7y7zsarxrb2c5hqh"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-tblui
        emacs-request
        emacs-let-alist
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
    (inherit emacs-hydra)
    (name "emacs-lv")))

;; bat -r 12662:12693 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-chatgpt
  (let ((commit "05957238635b1b9087ca3486761f9e3f534cea37")
        (revision "1"))
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
          (base32 "19ccm7f870dlvsbk5pg3r0sx4v2xwp7pd94n9i3cx6zwphvl7l23"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-lv
        emacs-ht
        emacs-let-alist
        emacs-markdown-mode
        emacs-spinner
        emacs-openai
        ))
      (home-page "https://github.com/emacs-openai/chatgpt")
      (synopsis "Emacs client for interacting with ChatGPT")
      (description
       "This package provides an Emacs client for interacting with ChatGPT,
 allowing users to send prompts and receive AI-generated responses directly
 within Emacs.  It supports maintaining conversations, integrating AI-driven
 assistance into various text-based workflows, and enhancing productivity by
 making AI tools easily accessible in the Emacs environment.")
      (license license:gpl3+))))

;; bat -r 131490:131511 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-vline ;; PR sent https://issues.guix.gnu.org/78044
  (let ((commit "f5d7b5743dceca75b81c8c95287cd5b0341debf9")
        (revision "0"))
    (package
      (name "emacs-vline")
      (version (git-version "1.11" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/buzztaiki/vline.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "06qqpjaxsacslxb3f2bm790lwygbq6387n9ccn4v9vz9xlyn9dmi"))))
      (build-system emacs-build-system)
      (home-page "https://www.emacswiki.org/emacs/VlineMode")
      (synopsis "Column highlighting (vertical line displaying) mode")
      (description
       "Emacs minor mode for highlighting column at cursor position.  It
 enhances text editing by visually indicating the vertical line.")
      (license license:gpl3+))))

;; bat -r 135318:135350 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-xhair ;; PR sent https://issues.guix.gnu.org/issue/78045
  (let ((commit "c7bd7c501c3545aa99dadac386c882fe7c5edd9c")
        (revision "0"))
    (package
      (name "emacs-xhair")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Boruch-Baum/emacs-xhair.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03m15lbspk73x59wvb77wgvnkrmrlq4w6kmnrr2i69jgafqh0421"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-vline
        ))
      (home-page "https://github.com/Boruch-Baum/emacs-xhair")
      (synopsis "Highlight the current line and column")
      (description
       "Simultaneously apply `vline-mode and `hl-line-mode', with tweaks,to
 present POINT in highlighted cross-hairs, reporting the value of POINT as a
message in the echo area.  This will remain in effect until toggled
manually (function `xhair-mode by default), or until the next
keypress (function `xhair by default), or for a set interval (function
`xhair-flash by default).")
      (license license:gpl3+))))

;; bat -r 64818:64838 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
          (base32 "0wvcdv2lfv68r3zyfzr9yahm3gvc60yzk8zi39l70vsgzh4yfq91"))))
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

;; bat -r 63823:63843 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/zk-phi/indent-guide.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0r303mzxj57l8rclzsmvhnx2p3lhf2k4zvn8a6145wb10jvcwfxi"))))
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

;; bat -r 133178:133198 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/thierryvolpiatto/wfnames.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bv0jky553kyvp8g2fhglnq5af6nqassswmjxlr8vz3ahyy06l3y"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/thierryvolpiatto/wfnames")
      (synopsis "Edit multiple filenames directly within Emacs buffers")
      (description
       "Edit multiple filenames directly within an Emacs buffer. It supports
 editing lists of absolute file paths, enabling modifications to both
filenames and their directory components. Changes are highlighted, and file
completion is provided to streamline the renaming process. This tool is
particularly useful for batch renaming files across various directories
without leaving the Emacs environment.")
      (license license:gpl3+))))

;; bat -r 136224:136244 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/JorisE/yapfify.git")
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

;; bat -r 117444:117465 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/emacsorphanage/smeargle.git")
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

;; bat -r 99016:99036 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/mhayashi1120/Emacs-pcsv.git")
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

;; bat -r 83083:83102 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/apgwoz/mvn-el.git")
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
    (inherit emacs-systemd-mode)
    (name "emacs-systemd")))

;; bat -r 103243:103264 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/prettier/prettier-emacs.git")
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

;; bat -r 75388:75410 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-lsp-latex
  (let ((commit "36a37a8e0a6b0edbea8e67dab89d12980d2a368f")
        (revision "0"))
    (package
      (name "emacs-lsp-latex")
      (version (git-version "3.10.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ROCKTAKEY/lsp-latex.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0yfmqjp1bmp8rp9vl9y5qmic3wr2f5p10gyb2rlmpgfnx5c8575g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-consult
        emacs-lsp-mode
        ))
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
    (inherit emacs-sqlite3-api)
    (name "emacs-sqlite3")))

;; bat -r 48473:48493 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/ahungry/geben.git")
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

;; bat -r 22060:22079 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/cython/emacs-cython-mode.git")
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
      (license license:asl2.0))))

(define-public emacs-eval-sexp-fu
  (package
    (inherit emacs-eval-sexp-fu-el)
    (name "emacs-eval-sexp-fu")))

;; bat -r 105754:105775 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-pyenv-mode
  (let ((commit "ba1a8c7bd7d03c006f8411c856990c083c814c9c")
        (revision "0"))
    (package
      (name "emacs-pyenv-mode")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/proofit404/pyenv-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0yzz0fhbcknlf7ms9f00151iwz31avniaaa6793gxhqdkzd9i5wc"))))
      (build-system emacs-build-system)
      ;; contains (executable-find "pyenv")
      (propagated-inputs
       (list
        emacs-pythonic
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
    (inherit emacs-groovy-modes)
    (name "emacs-groovy-mode")))

;; bat -r 87152:87173 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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

;; bat -r 89347:89368 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/rubikitch/open-junk-file.git")
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

;; bat -r 89142:89163 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/emacsorphanage/omtose-phellack-themes.git")
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

;; bat -r 60220:60240 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-highlight-parentheses
  (let ((commit "965b18dd69eff4457e17c9e84b3cbfdbfca2ddfb")
        (revision "0"))
    (package
      (name "emacs-highlight-parentheses")
      (version (git-version "2.2.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://sr.ht/~tsdh/highlight-parentheses.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wvhr5gzaxhn9lk36mrw9h4qpdax5kpbhqj44745nvd75g9awpld"))))
      (build-system emacs-build-system)
      (home-page "https://sr.ht/~tsdh/highlight-parentheses.el")
      (synopsis "Highlight surrounding parentheses in Emacs")
      (description
       "This package provides an Emacs minor mode that dynamically highlights
 the parentheses surrounding the point, based on nesting level. It uses
 configurable lists of colors and other properties to enhance code readability
 by visually indicating the scope of nested expressions.")
      (license license:gpl3+))))

;; bat -r 61724:61744 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "http://github.com/nflath/hungry-delete.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1hjihncj6q971zj1xfnfmyvx8wv19wdnglnmz1278fwsgrcs050d"))))
      (build-system emacs-build-system)
      (home-page "http://github.com/nflath/hungry-delete")
      (synopsis "Minor mode for hungry deletion of whitespace in Emacs")
      (description
       "This package provides a minor mode for Emacs that enables hungry
 deletion, allowing the deletion of all contiguous whitespace characters with
 a single keystroke. It enhances editing efficiency by reducing the number of
 key presses needed to remove unwanted spaces.")
      (license license:gpl3+))))

;; bat -r 106096:106117 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/ionrock/pytest-el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "13s3zqxjlas4rq70gxgl8nrhasrx8j8ml9xls7lgghk12ppiqil9"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        ))
      (home-page "https://github.com/ionrock/pytest-el")
      (synopsis "Emacs integration for running pytest on Python code")
      (description
       "Set of functions to run pytest on Python code within Emacs. It allows
executing tests on specific functions, classes,modules, or entire suites
directly from the editor. Users can configure the test runner executable,
integrate with project-specific virtual environments,and define custom
keybindings for test operations, enhancing the Python development workflow in
Emacs.")
      (license license:gpl3+))))

;; bat -r 63632:63655 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-impatient-mode
  (let ((commit "a4e4e12852840996b027cb8e9fb2b809c37a0ee3")
        (revision "0"))
    (package
      (name "emacs-impatient-mode")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/skeeto/impatient-mode.git")
               (commit commit)))
         (sha256
          (base32
           "1cwascc08pzmvgjf0z5fh3w3jf85rgk13haz085qbdkhxsbivav2"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-simple-httpd
        emacs-htmlize
        ))
      (home-page "https://github.com/netguy204/imp.el")
      (synopsis "Live preview of Emacs buffers in a web browser")
      (description
       "Enables real-time preview of Emacs buffers in a web browser.  It
 utilizes an internal HTTP server to serve buffer contents,allowing users to
see changes as they type.  Designed primarily for HTML editing, it can be
extended to support other formats like Markdown by customizing the content
filter.  Note: Activating this mode exposes the buffer's directory over HTTP,
which may have security implications.")
      (license license:gpl3))))

;; bat -r 63730:63754 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/anachronic/importmagic.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xrlnighvzgmfb4fwnp07bnj1wyym1pn4ap62swq0h0mcq8gjr80"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-f
        emacs-epc
        ))
      (home-page "https://github.com/anachronic/importmagic.el")
      (synopsis "Suggest and insert missing Python imports in Emacs buffers")
      (description
       "Emacs interface to the Python importmagic library.  It analyzes Python
 buffers to identify unresolved symbols and suggests appropriate import
statements.  Users can automatically insert missing imports, customize import
formatting styles, and configure the Python interpreter path.  The package
requires the `importmagic` and `epc` Python packages to be installed in the
active environment.")
      (license license:gpl3+))))

;; bat -r 67812:67833 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-journalctl-mode
  (let ((commit "631d10a5c8f466c94c38c3cd7410a27026f5f822")
        (revision "0"))
    (package
      (name "emacs-journalctl-mode")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/SebastianMeisel/journalctl-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1p3mgza73yls8f7v063jb49z0ylmvni4v812abqvvvrn5q396286"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/SebastianMeisel/journalctl-mode")
      (synopsis "Major mode for viewing journalctl logs in Emacs")
      (description
       "Emacs major mode for viewing systemd's journalctl output. It offers
features like syntax highlighting, chunked loading for performance,
keyword-based highlighting, and a follow mode to simulate 'tail -f'
functionality.  Users can customize log level appearances and define keywords
for different log severities.  The mode includes keybindings for navigating
through log chunks and integrates a transient interface for journalctl
command-line options.")
      (license license:gpl3+))))

(define-public emacs-kbd-mode
  (let ((commit "f8951b2efc5c29954b0105a9e57e973515125b0d")
        (revision "0"))
    (package
      (name "emacs-kbd-mode")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kmonad/kbd-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mzq240fz7z5m78qqlldvx3pw98kw9dg8a0zcip62gb1jd957b4g"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/kmonad/kbd-mode")
      (synopsis "Major mode for editing KMonad .kbd configuration files in Emacs")
      (description "Emacs major mode for editing KMonad `.kbd` configuration
files.  It offers syntax highlighting tailored to KMonad's Lisp-like
configuration language, facilitating easier reading and editing.
Additionally, it includes a demo mode that allows users to test configurations
within Emacs by starting and stopping KMonad processes directly from the
editor.")
      (license license:gpl3+))))

;; bat -r 78404:78426 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "http://github.com/rranelli/maven-test-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xn2yyr8mr90cynbxgv0h5v180pzf0ydnjr9spg34mrdicqlki6c"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        ))
      (home-page "http://github.com/rranelli/maven-test-mode")
      (synopsis "Minor mode for running Maven tests in Emacs")
      (description
       "Emacs minor mode that enhances `java-mode` by integrating Maven test
 tasks. It offers keybindings to toggle between test and implementation files,
run tests at various scopes (method, class, project), and re-run the last test
command.  Inspired by `rspec-mode`, it streamlines the testing workflow for
Java projects using Maven.")
      (license license:gpl3+))))

;; bat -r 14175:14196 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/pmarinov/clean-aindent-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07dgx09j6nn5dl9vpqfcs5yqm79kza3h3r1lb7r09wpkmrg0c2cr"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/pmarinov/clean-aindent-mode")
      (synopsis "Minor mode for clean auto-indent and unindent in Emacs")
      (description
       "Minor mode for Emacs that enhances indentation behavior.  It offers an
auto-indent function that removes unused whitespace when pressing RET and an
unindent function (M-backspace) that aligns the cursor with the best
indentation candidate from previous lines.  A simple auto-indent mode is
available, which aligns lines based solely on the indentation of the line
above, disregarding language-specific rules.")
      (license license:gpl3+))))

;; bat -r 100949:100970 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/pwalsh/pipenv.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ak9dvjqhdm12i7yamgbqjmc4zmvy2f0gd1nia1q9dy3n6576ryq"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pyvenv
        emacs-s
        ))
      (home-page "https://github.com/pwalsh/pipenv.el")
      (synopsis "Emacs integration for Pipenv-based Python workflows")
      (description
       "Pipenv integration into Emacs. It provides commands to manage virtual
environments and dependencies directly from the editor.  It offers a minor
mode with keybindings for common Pipenv operations, seamless integration with
Projectile and Flycheck, and functions to activate or deactivate environments
using pyvenv.  The package also includes an Emacs-native implementation of
`pipenv open`, allowing users to open modules within Emacs.")
      (license license:gpl3+))))

;; bat -r 101877:101897 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/cybniv/poetry.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0n5v6c75pal2xd8p453jrd046zkv0y1pzgn5w2n2ws1009pw6crs"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pyvenv
        ))
      (home-page "https://github.com/cybniv/poetry.el")
      (synopsis "Emacs interface for Python dependency management with Poetry")
      (description
       "Emacs interface to Poetry, a Python dependency management and
 packaging tool.  It offers a transient-based UI for common tasks such as
adding dependencies, building packages, and running scripts.  Additionally, it
includes a global minor mode to automatically activate the appropriate virtual
environment when visiting project files.")
      (license license:gpl3+))))

;; bat -r 109979:110001 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-reveal-in-folder
  (let ((commit "cfa667ad1ef488e68c30f67e280985f205629dc3")
        (revision "0"))
    (package
      (name "emacs-reveal-in-folder")
      (version (git-version "0.1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jcs-elpa/reveal-in-folder.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1wmszjc54bvsgrcfci606z0qb4jrdjd51myqkc91wf21vmi8g1rw"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-f
        emacs-s
        ))
      (home-page "https://github.com/jcs-elpa/reveal-in-folder")
      (synopsis "Reveal current file or directory in system file manager from Emacs")
      (description
       "Provides commands to reveal the current file or directory in the
 system's file manager directly from Emacs.  It supports various contexts,
including the current buffer, point location, and default directory.  Unlike
platform-specific alternatives, it aims to offer cross-platform compatibility,
enhancing navigation between Emacs and the operating system's file explorer.")
      (license license:gpl3+))))

;; bat -r 54504:54523 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/nex3/haml-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0d0b8xy8d6vd79y0vcjbgjgakn3nz5vdysw5m1ci2xz31agggf6f"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/nex3/haml-mode")
      (synopsis "Major mode for editing Haml files in Emacs")
      (description
       "Emacs major mode for editing Haml files.  It offers syntax
highlighting and indentation support tailored to Haml's indentation-based
syntax.  Optional integration with Flycheck and Flymake enables real-time
syntax checking.  Additional syntax highlighting is available for embedded
`:javascript`, `:markdown`, and `:textile` blocks when corresponding modes are
installed.")
      (license license:expat)))) ; MIT

;; bat -r 112243:112264 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/nex3/sass-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1nhk12lhvkwdk8s8fx33p6rssi0gcfx2zkanq23rz6k28v5zi5yp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-haml-mode
        ))
      (home-page "https://github.com/nex3/sass-mode")
      (synopsis "Major mode for editing Sass files in Emacs")
      (description
       "Major mode for editing Sass files in Emacs.  It offers syntax
 highlighting for selectors, variables, and directives, as well as indentation
support tailored to Sass's indentation-based syntax.  The mode is derived from
`haml-mode` and requires it as a dependency.  Users can customize indentation
levels and other settings to fit their preferences.")
      (license license:expat)))) ; MIT

;; bat -r 114781:114802 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/purcell/emacs-shfmt.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x96q2ag85859mzfqjq4gy7s2h883nwc99nw4l4r9cfw7hpplwxb"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-reformatter
        ))
      (home-page "https://github.com/purcell/emacs-shfmt")
      (synopsis "Emacs integration for formatting shell scripts using shfmt")
      (description
       "Emacs commands and a minor mode for formatting shell script source code
 using the external `shfmt` program.  Users can format entire buffers or
selected regions, and enable automatic formatting on save in `sh-mode`
buffers.  The `shfmt-command` variable allows customization of the formatter's
invocation.")
      (license license:gpl3+))))

;; bat -r 120658:120679 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/magnars/string-edit.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ggn7l3bisjx1ab4jrhija3z3bh6zbafhzjl5cq92n7i2plz8qdm"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        ))
      (home-page "https://github.com/magnars/string-edit.el")
      (synopsis "Edit string literals in a separate buffer with unescaped content")
      (description
       "Command to edit string literals in Emacs by opening their unescaped
 content in a temporary buffer.  After editing, the content is re-escaped and
inserted back into the original string.  It is particularly useful for editing
embedded HTML or JavaScript templates within code.")
      (license license:gpl3+))))

;; bat -r 96170:96192 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/tonini/overseer.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1f0nm253n0k2rcx0zydj8c4nn5gmvhabzraajxdqycb2ak77nbif"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pkg-info
        emacs-f
        emacs-dash
        ))
      (home-page "https://github.com/tonini/overseer.el")
      (synopsis "Integrate ert-runner with Emacs for running ERT tests")
      (description
       "Integrate the ert-runner test framework into Emacs, allowing users to
 run ERT tests directly from the editor.  It provides a minor mode with
keybindings for executing tests at point, in the current buffer, or across the
project.  The package leverages Cask for managing dependencies and supports
interactive commands for various test operations.")
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
               (url "https://github.com/arnested/php-extras.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0mcgwisnqplav0ga8xqqw72523iv841wp2cyw7d4lkzgpiav51dg"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-php-mode
        ))
      (home-page "https://github.com/arnested/php-extras")
      (synopsis "Extra features for Emacs php-mode")
      (description
       "Additional features for Emacs' php-mode.  It includes a command to
 insert the most recently used variable, support for eldoc-mode to display PHP
function signatures in the minibuffer, and completion backends for
auto-complete and company-mode based on core PHP functions.  The package can
generate a local function signature database by downloading and parsing the
PHP manual.")
      (license license:gpl3+))))

;; bat -r 33957:33986 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/Wilfred/emacs-refactor.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "06rmknnhzcm3fy1iipvryl85fcshpalz50500rrz8k3vkl2dps2i"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-popup
        emacs-s
        emacs-dash
        emacs-list-utils
        emacs-iedit
        ))
      (home-page "https://github.com/Wilfred/emacs-refactor")
      (synopsis "Framework for language-specific code refactoring in Emacs")
      (description
       "Emacs Refactor framework offering language-specific refactoring
commands. It supports various programming languages, including Emacs Lisp,
JavaScript, Ruby, and Scheme, enabling context-sensitive refactoring
operations such as extracting functions or variables, inlining code, and
tidying imports.")
      (license license:gpl3+))))

;; bat -r 34802:34822 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/kidd/erc-tweet.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "118q4zj9dh5xnimcsi229j5pflhcd8qz0p212kc4p9dmyrx2iw0n"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/kidd/erc-tweet.el")
      (synopsis "Display inline tweets in ERC buffers")
      (description
       "Enhance ERC (Emacs IRC client) by displaying tweet content directly
 within IRC buffers. When a Twitter URL is detected in the chat, the
corresponding tweet text is fetched and shown inline, providing immediate
context without the need to open external links. This feature improves the
chat experience by integrating external content seamlessly into the
conversation.")
      (license license:gpl3+))))

;; bat -r 34846:34866 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/Niluge-KiWi/erc-view-log.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bzi2sh2fhrz49j5y53h6jgf41av6rx78smb3bbk6m74is8vim2y"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/Niluge-KiWi/erc-view-log")
      (synopsis "Major mode for viewing ERC logs with syntax highlighting")
      (description
       "Major mode for viewing logs generated by ERC (Emacs IRC client).  It
applies syntax highlighting to nicknames, timestamps, and messages, enhancing
readability.  Users can customize nickname highlighting and integrate with
`auto-revert-tail-mode` for real-time log updates.  Note: This mode is
incompatible with `erc-fill-mode`.")
      (license license:gpl3+))))

;; bat -r 34913:34934 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
        ))
      (home-page "https://github.com/yhvh/erc-yt")
      (synopsis "Display inline YouTube previews in ERC buffers")
      (description
       "Enhances Emacs' ERC (IRC client) by displaying inline clickable YouTube
thumbnails, titles, and descriptions when YouTube links are shared in chat.
It uses the YouTube Data API v3 to fetch video metadata and supports
customization of thumbnail click behavior, image caching, and description
length.")
      (license license:gpl3+))))

;; bat -r 32008:32030 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/Wilfred/elisp-def.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0k1r4fyai53p7y5vqwqjxdiqlnmrrxqaxglc22j54kdic8j1lbl7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-f
        emacs-s
        emacs-dash
        ))
      (home-page "https://github.com/Wilfred/elisp-def")
      (synopsis "Enhanced Emacs Lisp symbol definition navigation")
      (description
       "Enhance navigation for Emacs Lisp development by accurately locating
definitions of functions, variables, and macros.  It supports global and local
bindings, handles macro-generated code, and distinguishes between function and
variable namespaces.  Additionally, it integrates with various Emacs modes to
improve the developer experience.")
      (license license:gpl3+))))

;; bat -r 22261:22282 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-dall-e
  (let ((commit "24b1315b57d8e9329f5af1c9d7f8be9e8a6f932e")
        (revision "0"))
    (package
      (name "emacs-dall-e")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/dall-e.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03b9r8am5i4rkf3hqvnqzslbh1636vidlsmqkzyqk73a5hhvhqnd"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-lv
        emacs-openai
        emacs-reveal-in-folder
        emacs-async
        emacs-ht
        emacs-spinner
        ))
      (home-page "https://github.com/emacs-openai/dall-e")
      (synopsis "Generate images from text prompts using DALL·E in Emacs")
      (description
       "Emacs interface to OpenAI's DALL·E API, enabling users to generate
 images from text prompts directly within the editor.  It supports
customization options such as the number of images, image size, and display
width.  Generated images are cached locally and displayed in a dedicated
buffer.  An OpenAI API key is required for usage.")
      (license license:gpl3+))))

;; bat -r 49221:49241 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/emacs-pe/gh-md.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xnfq6bbc5bgkd0mzkr7r66sd85qfn859swpsp6sr0xfl8cq12wm"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/emacs-pe/gh-md.el")
      (synopsis "Render Markdown using GitHub API in Emacs")
      (description
       "Functions to render Markdown content in Emacs using GitHub's Markdown
 API.  It offers commands to preview Markdown from a region or buffer,
displaying the rendered HTML within Emacs.  The package supports GitHub
Flavored Markdown (GFM) and allows exporting the rendered content to an HTML
file.")
      (license license:gpl3+))))

;; bat -r 41925:41945 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-flx
  (let ((commit "4b1346eb9a8a76ee9c9dede69738c63ad97ac5b6")
        (revision "0"))
    (package
      (name "emacs-flx")
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
      (home-page "https://github.com/lewang/flx")
      (synopsis "Fuzzy matching for Emacs")
      (description
       "Flx provides fuzzy matching for emacs a la sublime text.
The sorting algorithm is a balance between word beginnings (abbreviation)
and contiguous matches (substring).  The longer the substring match,
the higher it scores. This maps well to how we think about matching.
Flx has support for ido (interactively do things) through flx-ido.")
      (license license:gpl3+))))

;; bat -r 41947:41968 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/lewang/flx.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q49p1y3kpx140h0f97kfw4kfx8mlzzxbninbarvygmlg2fkfi1n"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flx
        ))
      (home-page "https://github.com/lewang/flx")
      (synopsis "Flx integration for ido")
      (description
       "Fuzzy matching for Emacs a la Sublime Text.  A more powerful
alternative to `ido-mode''s built-in flex matching.")
      (license license:gpl3+))))

;; bat -r 23602:23623 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/abo-abo/define-word.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0h3dasg81f1b08xvz38nyd887pdlv60kj8q50kk2aqlpkr8j0y18"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/abo-abo/define-word")
      (synopsis "Display word definitions in Emacs using online dictionaries")
      (description
       "Commands to display the definition of the word or phrase at point
 within Emacs.  It retrieves definitions from online dictionary services and
presents them in a popup buffer, eliminating the need to switch to a web
browser.  Users can customize the backend service and keybindings to suit
their workflow.")
      (license license:gpl3+))))

;; (define-public emacs-concurrent
;;   (let ((commit "2239671d94b38d92e9b28d4e12fd79814cfb9c16")
;;         (revision "0"))
;;     (package
;;       (name "emacs-concurrent")
;;       (version (git-version "0.5.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/kiwanami/emacs-deferred")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "0vz59lm7pfz0gbsgrb44y555js85wbdjn0zm6p8wfqjiqf63ds3i"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs
;;        (list
;;         emacs-deferred
;;         ))
;;       (home-page "https://github.com/kiwanami/emacs-deferred")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

;; bat -r 17763:17786 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/Alexander-Miller/company-shell.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lrkvfg0z9gwfcj90yihanysg8icxpbqq3wqyb734bi5fpmgmzr4"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-company
        ))
      (home-page "https://github.com/Alexander-Miller/company-shell")
      (synopsis "Company-mode backends for shell command and environment completion")
      (description
       "Company-mode backends for shell scripting in Emacs.  It offers
 completions for shell commands available in the system's PATH, environment
variables, and fish shell functions.  The completions are cached for
performance, and optional documentation strings can be retrieved from man
pages or the '--help' output of commands.")
      (license license:gpl3+))))

;; bat -r 37134:37155 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/pythonnut/evil-easymotion.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0xsva9bnlfwfmccm38qh3yvn4jr9za5rxqn4pwxbmhnx4rk47cch"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-avy
        emacs-evil
        ))
      (home-page "https://github.com/pythonnut/evil-easymotion")
      (synopsis "Vim-style quick navigation for evil-mode in Emacs")
      (description
       "Port of Vim's EasyMotion for Emacs' evil-mode.  It enables rapid cursor
 movement by displaying target labels for jump points, allowing users to
navigate efficiently with minimal keystrokes.  The package supports most
standard motions and offers macros for defining custom motions with optional
scoping and hooks.  It leverages avy for visual selection and can be
configured with a prefix key using `evilem-default-keybindings`.")
      (license license:gpl3+))))

;; bat -r 38633:38650 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/syl20bnr/evil-tutor.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00yfq8aflxvp2nnz7smgq0c5wlb7cips5irj8qs6193ixlkpffvx"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        ))
      (home-page "https://github.com/syl20bnr/evil-tutor")
      (synopsis "Interactive Evil-mode tutorial inspired by Vimtutor")
      (description
       "Interactive tutorial for Emacs users learning Evil-mode, modeled after
 Vim's vimtutor.  It guides users through modal editing concepts within a
dedicated major mode, allowing navigation between lessons using `C-j` and
`C-k`.  The tutorial preserves progress between sessions and is accessible via
`M-x evil-tutor-start`.")
      (license license:gpl3+))))

(define-public emacs-codegpt
  (let ((commit "4c2af3fc359afb90d2da21653a52e17a128e0249")
        (revision "0"))
    (package
      (name "emacs-codegpt")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/codegpt.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "17pb2khgxl4x3cvmi6bsi345fqi4g9bwx1cfr0xivr2vgd434l8m"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-spinner
        emacs-markdown-mode
        emacs-openai
        ))
      (home-page "https://github.com/emacs-openai/codegpt")
      (synopsis "Emacs interface to OpenAI's GPT models for code generation and editing")
      (description
       "Integrates OpenAI's GPT models into Emacs, allowing users to generate,
 explain, refactor, and document code directly within the editor.  It provides
commands such as `codegpt-explain`, `codegpt-fix`, and `codegpt-doc`, and
supports both completion and chat-based interactions.  Users can customize the
model, temperature, and token limits, and an OpenAI API key is required for
usage.")
      (license license:gpl3+))))

;; bat -r 25658:25678 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-dired-quick-sort
  (let ((commit "611acc82919e99ac37ce504934f5e8c605ad7efa")
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
          (base32 "176zr0qcagfcmiqx5hg3vzbw41xfdmc8ws0sr6drc00izl8kj5jp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-hydra
        ))
      (home-page "https://gitlab.com/xuhdev/dired-quick-sort")
      (synopsis "Hydra-based quick sorting for Dired buffers in Emacs")
      (description
       "Persistent quick sorting of Dired buffers in Emacs using Hydra.  It
 allows users to sort files by various criteria—such as name, size, or
modification time—via an interactive menu.  The last used sorting preference
is remembered across sessions when `savehist-mode` is enabled.  The package
requires GNU `ls` and is compatible with TRAMP, though with limited
functionality.")
      (license license:gpl3+))))

;; bat -r 37562:37586 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/syl20bnr/evil-lisp-state.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1n6r8xs670r5qp4b5f72nr9g8nlqcrx1v7yqqlbkgv8gns8n5xgh"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-bind-map
        emacs-smartparens
        emacs-evil
        ))
      (home-page "https://github.com/syl20bnr/evil-lisp-state")
      (synopsis "Evil-mode state for structured Lisp editing with smartparens")
      (description
       "Dedicated Evil-mode state for structured editing of Lisp code using
 smartparens.  It provides keybindings for operations like slurping, barfing,
wrapping, and transposing s-expressions.")
      (license license:gpl3+))))

;; bat -r 38510:38530 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/emacsorphanage/evil-textobj-line.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1w98gc1sqik8ab35a1hg5853dwar98a8qd94lxpq4ckabpgypins"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        ))
      (home-page "https://github.com/emacsorphanage/evil-textobj-line")
      (synopsis "Evil-mode text object for entire lines")
      (description
       "Emacs port of Vim's textobj-line, introducing a line-based text object
 for evil-mode.  It allows users to select entire lines using the 'vil' (inner
line) and 'val' (a line) motions.  The default keybinding is 'l' for both
inner and outer line objects, customizable via `evil-textobj-line-i-key` and
`evil-textobj-line-a-key`.")
      (license license:gpl3+))))

;; bat -r 38733:38753 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/roman/evil-visual-mark-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ggxifiz2qm26v2fw8m9ccjp3jbmhyhb8wv93m8k1pnyh8b7la2m"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-evil
        ))
      (home-page "https://github.com/roman/evil-visual-mark-mode")
      (synopsis "Display Evil-mode marks visually in Emacs buffers")
      (description
       "Minor mode for Emacs that displays all active Evil-mode marks directly
 within the buffer.  It enhances navigation by making marks visible, allowing
users to track important positions without manually cycling through them.
Users can customize which marks are displayed by modifying the
`evil-visual-mark-exclude-marks` list.")
      (license license:gpl3+))))

;; bat -r 100472:100494 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/nlamirault/phpunit.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03vs9ni9nhm7rzr3qkgcjbldqxcds20ai2c52sw8wc6zpp5qijsc"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-f
        emacs-s
        ))
      (home-page "https://github.com/nlamirault/phpunit.el")
      (synopsis "Run PHPUnit tests from Emacs")
      (description
       "Emacs commands to execute PHPUnit tests directly from the editor.  It
 allows running tests in the current buffer or project, supports customizable
test commands, and integrates with `php-mode`.  Users can configure the
PHPUnit executable path and additional options to suit their development
environment.")
      (license license:gpl2))))

;; bat -r 100926:100947 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/Wilfred/pip-requirements.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08q225h8kahh632qkzpb1ih3jqg5imlzgrrh8ynkyxrr710madkl"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        ))
      (home-page "https://github.com/Wilfred/pip-requirements.el")
      (synopsis "Major mode for editing pip requirements files in Emacs")
      (description
       "Major mode for editing pip requirements files in Emacs.  It offers
syntax highlighting, toggling of comments, and auto-completion of package
names from PyPI using Emacs' built-in completion mechanisms.  The mode
supports files like `requirements.txt` and `requirements.in`, and integrates
with completion frameworks such as Company and Auto Complete.")
      (license license:gpl3+))))

;; bat -r 42133:42154 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/alexmurray/flycheck-bashate.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1gaih50mkyby0r4qnmc03dy111ik4and5p6r3lvsflpvd3hcxjn3"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck
        ))
      (home-page "https://github.com/alexmurray/flycheck-bashate")
      (synopsis "Flycheck checker for Bash scripts using bashate")
      (description
       "Integrate the `bashate` linter with Flycheck in Emacs, enabling
 real-time syntax checking of Bash scripts.  It helps enforce coding style
guidelines and detect common issues in shell scripts.  The checker activates
automatically in `sh-mode` buffers when `bashate` is available in the system
path.")
      (license license:gpl3+))))

;; bat -r 42468:42489 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/aaronjensen/flycheck-credo.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1n41liayykjmh1xwfnhdvw9bdxjca7d274gkpjfzhvhmbv7dig19"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck
        ))
      (home-page "https://github.com/aaronjensen/flycheck-credo")
      (synopsis "Flycheck checker for Elixir using Credo")
      (description
       "Integrate the Credo static code analysis tool with Flycheck in Emacs,
 enabling real-time linting of Elixir code.  It provides a Flycheck checker
that runs Credo, allowing developers to identify code issues and maintain code
quality directly within the editor.  Users can configure the checker to run in
strict mode and customize its behavior through Flycheck variables.")
      (license license:gpl3+))))

;; bat -r 42908:42929 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/emacs-elsa/flycheck-elsa.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ig9dc7ch3cdxp4p24v21h7hrdph9y5jy9421bfww6agymbj8i85"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck
        ))
      (home-page "https://github.com/emacs-elsa/flycheck-elsa")
      (synopsis "Flycheck integration for Elsa, the Emacs Lisp static analyzer")
      (description
       "Integrate Elsa, a static analysis and gradual type system for Emacs
 Lisp, with Flycheck to provide real-time linting and type checking within
Emacs.  It supports both Eask and Cask backends for dependency management.  To
enable, install `flycheck-elsa` from MELPA and add `flycheck-elsa-setup` to
your `emacs-lisp-mode-hook`.  Elsa analyzes code without executing it,
ensuring safe and side-effect-free checks.")
      (license license:gpl3+))))

;; bat -r 44002:44025 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/flycheck/flycheck-pos-tip.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "15h4m5cfk0vh1g630vlwfxmcpa1jdalrrldnvijsqla99mb2jm1w"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pos-tip
        emacs-flycheck
        ))
      (home-page "https://github.com/flycheck/flycheck-pos-tip")
      (synopsis "Display Flycheck errors using pos-tip tooltips")
      (description
       "Flycheck extension that displays syntax errors and warnings in
graphical popups using the pos-tip library.  When enabled, it shows error
messages at point in a tooltip, offering a more visually integrated
alternative to the minibuffer.  The extension is particularly useful in GUI
environments and can be customized via the `flycheck-pos-tip-timeout` variable
to control the duration of tooltip visibility.")
      (license license:gpl3+))))

;; bat -r 50529:50550 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/xuchunyang/gitignore-templates.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x4pg4jpgmbvfw854ps9w3xgp8bgm7n7vmcvk3kp7h2s56l8s2xb"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/xuchunyang/gitignore-templates.el")
      (synopsis
       "Create .gitignore files in Emacs from GitHub or gitignore.io templates")
      (description
       "Generate .gitignore files by fetching templates from either GitHub's
gitignore repository or the gitignore.io API.  Users can insert templates
directly into the current buffer or create new .gitignore files based on
specified templates.  The package offers customization options to select the
preferred API source and supports proxy configurations for network access.")
      (license license:gpl3+))))

;; bat -r 74213:74236 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
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
               (url "https://github.com/pandeiro/livid-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "178ldzpk8a9m9abn8xlplxn5jgcca71dpkp82bs5g7bsccp3rx6p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        emacs-skewer-mode
        ))
      (home-page "https://github.com/pandeiro/livid-mode")
      (synopsis "Live JavaScript evaluation in Emacs via Skewer integration")
      (description
       "Minor mode for Emacs that automatically evaluates JavaScript code in the
browser whenever the buffer changes.  Built on top of `skewer-mode`, it
compares the current buffer content to the previously evaluated version,
checks for syntax errors using the external `js` command, and sends the code
to the browser for evaluation if valid.  This facilitates a live coding
experience similar to browser-based HTML/JS/CSS editors.")
      (license license:gpl3+))))

;; bat -r 81159:81181 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-molokai-theme
  (let ((commit "cc53e997e7eff93b58ad16a376a292c1dd66044b")
        (revision "0"))
    (package
      (name "emacs-molokai-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alloy-d/color-theme-molokai.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "109z13y6f54idzxk4incd4r0d3fr7wm7r8ifmd0s5hv1v1i93jc0"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:exclude #~(cons* "^color-theme-molokai.el$" %default-exclude)))
      (home-page "https://github.com/alloy-d/color-theme-molokai")
      (synopsis "Molokai color theme for Emacs")
      (description
       "Molokai color theme for Emacs, inspired by the popular Molokai theme
 from Vim.  It features a dark background with vibrant, contrasting colors,
 designed to reduce eye strain and improve code readability, especially during
 long coding sessions.  The theme is well-suited for developers who prefer a
 visually appealing and functional dark theme in their Emacs setup.")
      (license license:gpl3+))))

;; bat -r 131167:131195 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-vimish-fold
  (let ((commit "a6501cbfe3db791f9ca17fd986c7202a87f3adb8") (revision "0"))
    (package
      (name "emacs-vimish-fold")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mrkkrp/vimish-fold.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256 (base32 "0w0r951c6vn890h1cz5l8rl6hicna6rbdzfgbg4lpm280yds9lpb"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-f
        ))
      (home-page "https://github.com/mrkkrp/vimish-fold")
      (synopsis "Persistent, Vim-style text folding for Emacs")
      (description
       "Vim-like text folding capabilities in Emacs.  It allows users to fold
 active regions, automatically create folds from markers like `{{{` and `}}}`,
and persist folds across sessions.  Features include visual indicators for
folded regions, mouse support for toggling folds, and integration with `avy`
for quick fold navigation.  The package is lightweight and scales well, making
it suitable for managing folds in large projects.")
      (license license:gpl3+))))

;; bat -r 38709:38731 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-evil-vimish-fold
  (let ((commit "b6e0e6b91b8cd047e80debef1a536d9d49eef31a")
        (revision "0"))
    (package
      (name "emacs-evil-vimish-fold")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alexmurray/evil-vimish-fold.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "14qhfhk3d4c7v4jhr909dbxy8222flpqwk73bwg0pqwpkcifyv7n"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-vimish-fold
        emacs-evil
        ))
      (home-page "https://github.com/alexmurray/evil-vimish-fold")
      (synopsis "Vim-style folding for Evil-mode using vimish-fold")
      (description
       "Integrate vimish-fold with Evil-mode in Emacs, providing Vim-like
folding commands.  It enables users to create and delete folds using `zf` and
`zd`, toggle folds with `za`, open and close folds with `zo` and `zc`, and
navigate between folds using `zj` and `zk`.  The mode can be activated
globally for specified major modes or configured per mode.  It requires both
`evil` and `vimish-fold` to function.")
      (license license:gpl3+))))

(define-public emacs-hide-comnt
  (package
    (name "emacs-hide-comnt")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.emacswiki.org/emacs/download/hide-comnt.el")
       (sha256
        (base32 "0v3wgl9r9w0qbvs1cxgl7am9hvpy6hyhvfbsjqix5n0zmdg68s4n"))))
    (build-system emacs-build-system)
    (home-page "https://www.emacswiki.org/emacs/download/hide-comnt.el")
    (synopsis "Hide or show comments in code buffers")
    (description
     "Commands to hide or show comments in the current buffer or active region.
  It allows toggling comment visibility to reduce visual clutter when editing
code.  The package also offers an option to hide whitespace preceding
comments.")
    (license license:gpl3+)))

(define-public emacs-info+
  (package
    (inherit emacs-info-plus)
    (name "emacs-info+")))

;; bat -r 74119:74143 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-live-py-mode
  (let ((commit "fa2ea9a45738012d4a391e0a35809a655692b0fc")
        (revision "0"))
    (package
      (name "emacs-live-py-mode")
      (version (git-version "4.12" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/donkirkby/live-py-plugin.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03gk9nxjafgzgqrch159zf1r1575wf50pc5yjc9q4qmvcisyaf6j"))))
      (build-system emacs-build-system)
      (arguments
       '(#:include (cons* "^emacs-live-py-mode/live-py-mode.el$"
                          "^plugin/PySrc/[^/]+$"
                          %default-include)))
      (home-page "http://donkirkby.github.io/live-py-plugin/")
      (synopsis "Live Python coding with real-time visualization in Emacs")
      (description
       "Minor mode for Emacs that enables live coding in Python.  As you type,
 your code is continuously executed, and the results are displayed in
real-time, including variable states, exceptions, and graphical outputs like
matplotlib plots and turtle graphics.  This immediate feedback loop aids in
understanding and debugging code more efficiently.  The mode is particularly
beneficial for learning, teaching, and rapid prototyping in Python.")
      (license license:expat-0))))

;; bat -r 84174:84195 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-nerd-icons
  (let ((commit "1cb883d928ec046358d2b65db0bb898a1dfffd0a")
        (revision "0"))
    (package
      (name "emacs-nerd-icons")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rainstormstudio/nerd-icons.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0r3gv9z04asqjsnasjm2avk9gllqkng6ns14l0svrqxac4c2pp70"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons* "^data/" %default-include)))
      (home-page "https://github.com/rainstormstudio/nerd-icons.el")
      (synopsis "Nerd Font icon library for Emacs")
      (description
       "Library for integrating Nerd Font icons into Emacs.  It serves as an
 alternative to all-the-icons, offering compatibility with both GUI and
terminal environments.  The package includes functions to retrieve icons for
files, modes, and URLs, enhancing the visual experience in Emacs interfaces
such as Dired, Eshell, and modelines.")
      (license license:gpl3+))))

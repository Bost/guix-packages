(define-module (bost gnu packages emacs-xyz-2)
  #:use-module (bost gnu packages emacs-xyz-1)
  #:use-module (bost gnu packages emacs-xyz-done)
  #:use-module (bost gnu packages emacs-xyz-lsp)
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
  )

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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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

(define-public emacs-spacemacs-base
  (let ((commit "6751dae7ab8785f90edea585160926bad5e3e2ff")
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
          (base32 "054zsdfyfqg00wh0k5hj2cxnq9njjghsy8ji4fl5j3qwwv6y0cba"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include
        #~(cons*
           "^layers/\\+lang/python/local/pylookup/pylookup\\.py$"
           "^layers/\\+lang/c-c\\+\\+/global_conf\\.py$"
           "^layers/\\+lang/python/local/pylookup/pylookup\\.el$"
           %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-exec-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((python (search-input-file inputs "bin/python")))
                  (substitute* "layers/+lang/python/local/pylookup/pylookup.py"
                    (("/usr/bin/env python") python))
                  (substitute* "layers/+lang/c-c++/global_conf.py"
                    (("/usr/bin/env python") python))))))))
      (propagated-inputs
       (list
        python-wrapper
        ))
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
      #:tests? #f
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

(define-public emacs-core-versions
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-versions")
    (arguments
     (list
      #:tests? #f
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
      #:tests? #f
      #:include #~(cons* "^core/.*" %default-include)
      #:phases
      #~(modify-phases %standard-phases
          ;; ;; Move the source files to the top level, which is included in
          ;; ;; the EMACSLOADPATH.
          ;; (add-after 'unpack 'move-source-files
          ;;   (lambda _
          ;;     (let ((el-files
          ;;            (find-files
          ;;             "core"
          ;;             "core-load-paths\\.el$")))
          ;;       (for-each (lambda (f) (rename-file f (basename f)))
          ;;                 el-files))))
          ;; ;; TODO check user-emacs-directory
          ;; (add-after 'move-source-files 'fix-user-emacs-directory
          ;;   (lambda _
          ;;     (substitute* "core-load-paths.el"
          ;;       (("user-emacs-directory") "\"./\""))))

          ;; (add-after 'unpacs 'fix-user-emacs-directory
          ;;   (lambda _
          ;;     (substitute* "core/core-load-paths.el"
          ;;       (("user-emacs-directory") "\"./\""))))
          )))
    (propagated-inputs
     (list
      emacs-spacemacs-theme
      ;; emacs-core-spacemacs-buffer
      ;; emacs-core-progress-bar
      ;; emacs-core-funcs
      ;; emacs-core-dotspacemacs
      ;; emacs-spacemacs-ht
      ;; python-wrapper
      ))
    ))

(define-public emacs-spacemacs-ht
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-ht")
    (arguments
     (list
      #:tests? #f
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
      #:tests? #f
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
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-core-load-paths
      ;; emacs-core-spacemacs-buffer
      ;; emacs-core-progress-bar
      ;; emacs-core-funcs
      ;; emacs-core-dotspacemacs
      ;; emacs-spacemacs-ht
      python-wrapper
      ))))

(define-public emacs-core-spacemacs-buffer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacemacs-buffer")
    (arguments
     (list
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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

;; (define-public emacs-page-break-lines
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-page-break-lines")
;;     (arguments
;;      (list
;;       #:tests? #f
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           ;; Move the source files to the top level, which is included in
;;           ;; the EMACSLOADPATH.
;;           (add-after 'unpack 'move-source-files
;;             (lambda _
;;               (let ((el-files
;;                      (find-files
;;                       "core/libs"
;;                       "page-break-lines\\.el$"
;;                       )))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

(define-public emacs-page-break-lines
  (let ((commit "982571749c8fe2b5e2997dd043003a1b9fe87b38")
        (revision "0"))
    (package
      (name "emacs-page-break-lines")
      (version (git-version "0.15" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/page-break-lines.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0d74j7mqgzbwj00sirz3wa37f5yv0y48lgp2v20k61lq54sxk75g"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/purcell/page-break-lines")
      (synopsis "Display page breaks as tidy horizontal lines")
      (description
       "This library provides a global mode which displays form feed characters
as horizontal rules.")
      (license license:gpl3+))))

(define-public emacs-package-recipe-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-recipe-mode")
    (arguments
     (list
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
                          el-files))))
          ;; TODO check user-emacs-directory
          (add-after 'move-source-files 'fix-user-emacs-directory
            (lambda _
              (substitute* "quelpa.el"
                (("user-emacs-directory") "\"./\"")))))))))

(define-public emacs-helm-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-spacemacs-help")
    (arguments
     (list
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
                          el-files))))
          ;; TODO check user-emacs-directory
          (add-after 'move-source-files 'fix-user-emacs-directory
            (lambda _
              (substitute* "core-funcs.el"
                (("user-emacs-directory") "\"./\"")))))))))

(define-public emacs-tmux
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-tmux")
    (arguments
     (list
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-defaults/local/help-fns+"
                      "help-fns+\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-helm-games
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-games")
    (arguments
     (list
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
      #:include
      #~(cons*
         "^layers/\\+lang/python/local/pylookup/pylookup\\.el$"
         "^layers/\\+lang/python/local/pylookup/pylookup\\.py$"
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
    (native-inputs
     (list
      python-wrapper
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      #:tests? #f
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
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list emacs-persistent-soft))
      (home-page "http://github.com/rolandwalker/font-utils")
      (synopsis "Utility functions for working with fonts in Emacs")
      (description
       "Font-utils is a collection of functions for working with fonts.  This library
has no user-level interface, it is only useful for programming in Emacs Lisp.")
      (license license:bsd-2))))

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
      (arguments (list #:tests? #f))
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
      (native-inputs (list texinfo))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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
      (arguments (list #:tests? #f))
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

(define-public emacs-pet
  (let ((commit "0b2baf67579f6db874c6d89c5ac848e68f9334c1")
        (revision "0"))
    (package
      (name "emacs-pet")
      (version (git-version "3.4.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/wyuenho/emacs-pet.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08mxq4kffa9fip2klpb5bkj45k85m0vv6wldclkhsz3hm316dcc6"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-f emacs-map))
      (home-page "https://github.com/wyuenho/emacs-pet/")
      (synopsis "Automatically configure Python tooling paths in Emacs")
      (description
       "Minor mode for Emacs that automatically detects and sets the correct
 paths to Python tooling executables (e.g., linters, formatters) based on the
project's virtual environment.  It supports various virtual environment tools
such as poetry, pipenv, conda, and direnv, ensuring seamless integration with
Emacs packages like flycheck and lsp-mode.")
      (license license:gpl3+))))

(define-public emacs-marshal
  (let ((commit
         "bc00044d9073482f589aad959e34d563598f682a")
        (revision "0"))
    (package
      (name "emacs-marshal")
      (version (git-version "0.9.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sigma/marshal.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0v5ncg88bghn4rpqw6fnvxpd0276mwn2bh6fpch7s1ibpaj2bsp0"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-ht))
      (home-page "https://github.com/sigma/marshal.el")
      (synopsis "Eieio extension for automatic (un)marshalling")
      (description
       "Inspired by Go tagged structs.  alist, plist and json drivers are provided, but
implementing others just requires to inherit from `marshal-driver'.  Sometimes
the types are not enough (for example with lists, whose elements are not
explicitly typed.  In those cases, a small extension on top of types can be
used.")
      (license license:gpl2+))))

(define-public emacs-gh
  (let ((commit
         "b5a8d8209340d49ad82dab22d23dae0434499fdf")
        (revision "0"))
    (package
      (name "emacs-gh")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sigma/gh.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1vab2qdjyv4c3hfp09vbkqanfwj8ip7zi64gqbg93kf1aig1qgl9"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "gh-api")
                (bst:write-pkg-file "gh-auth")
                (bst:write-pkg-file "gh-cache")
                (bst:write-pkg-file "gh-comments")
                (bst:write-pkg-file "gh-common")
                (bst:write-pkg-file "gh-gist")
                (bst:write-pkg-file "gh-issue-comments")
                (bst:write-pkg-file "gh-issues")
                (bst:write-pkg-file "gh-oauth")
                (bst:write-pkg-file "gh-orgs")
                (bst:write-pkg-file "gh-pkg")
                (bst:write-pkg-file "gh-profile")
                (bst:write-pkg-file "gh-pull-comments")
                (bst:write-pkg-file "gh-pulls")
                (bst:write-pkg-file "gh-repos")
                (bst:write-pkg-file "gh-search")
                (bst:write-pkg-file "gh-url")
                (bst:write-pkg-file "gh-users")
                )))))
      (propagated-inputs
       (list
        emacs-marshal
        emacs-pcache
        emacs-logito
        ))
      (home-page "https://github.com/sigma/gh.el")
      (synopsis "Emacs client for GitHub API")
      (description
       "Emacs interface to the GitHub API, enabling users to create issues, list
repositories, manage pull requests, and more, directly from Emacs.  It
supports authentication with GitHub credentials and integration with other
Emacs tools, facilitating seamless GitHub workflows within the editor.")
      (license license:gpl2+))))

(define-public emacs-gist
  (let ((commit
         "314fe6ab80fae35b95f0734eceb82f72813b6f41")
        (revision "0"))
    (package
      (name "emacs-gist")
      (version (git-version "1.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/defunkt/gist.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vbyzww9qmsvdpdc6d6wq6drlq1r9y92807fjhs0frgzmq6dg0rh"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-gh))
      (home-page "https://github.com/defunkt/gist.el")
      (synopsis "Emacs integration for gist.github.com")
      (description
       "An Emacs interface for managing gists (http://gist.github.com).")
      (license license:gpl2+))))

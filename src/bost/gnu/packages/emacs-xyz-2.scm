(define-module (bost gnu packages emacs-xyz-2)
  #:use-module (bost gnu packages emacs-xyz-1)
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
         (@(bost gnu packages emacs-build) emacs-dash)
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
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      ))
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-f)
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
        (@(bost gnu packages emacs-build) emacs-dash)
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

(define-public emacs-ht
  (package
    (name "emacs-ht")
    (version "2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Wilfred/ht.el")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0can9v336lgnq0q2ha3js0565jzp3dlwwqxhcbx5swk5kp148f07"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (native-inputs
     (list emacs-ert-runner))
    (home-page "https://github.com/Wilfred/ht.el")
    (synopsis "Hash table library for Emacs")
    (description
     "This package simplifies the use of hash tables in elisp.  It also
provides functions to convert hash tables from and to alists and plists.")
    (license license:gpl3+)))

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
        (@(bost gnu packages emacs-build) emacs-f)
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
        (@(bost gnu packages emacs-build) emacs-f)
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-f)
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-s
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-f)
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
  (let ((commit "a6501cbfe3db791f9ca17fd986c7202a87f3adb8")
        (revision "0"))
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
      (arguments
       (list
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
                (bst:write-pkg-file "vimish-fold"))))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
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
      (arguments
       (list
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
                (bst:write-pkg-file "evil-vimish-fold"))))))
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
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-map
        ))
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

(define-public emacs-with-editor
  (let ((commit "ca902ae02972bdd6919a902be2593d8cb6bd991b")
        (revision "0"))
    (package
      (name "emacs-with-editor")
      (version (git-version "3.4.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/with-editor.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0h21qs60qihv4p72x5wbmc0xly4g74wc25qj8m9slfbc4am9mwys"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f                       ; no test suite
        #:lisp-directory "lisp"
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
            (add-before 'install 'make-info
              (lambda _
                (with-directory-excursion "../docs"
                  (invoke "makeinfo" "--no-split"
                          "-o" "with-editor.info" "with-editor.texi")
                  (install-file "with-editor.info" "../lisp"))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "with-editor")))
            )))
      (native-inputs (list texinfo))
      (propagated-inputs
       (list
        emacs-async
        emacs-compat
        ))
      (home-page "https://github.com/magit/with-editor")
      (synopsis "Emacs library for using Emacsclient as EDITOR")
      (description
       "This package provides an Emacs library to use the Emacsclient as
@code{$EDITOR} of child processes, making sure they know how to call home.
For remote processes a substitute is provided, which communicates with Emacs
on stdout instead of using a socket as the Emacsclient does.")
      (license license:gpl3+))))

(define-public emacs-magit
  (let ((commit "9e6791796facd87d6d46abca2628e802edf01ec4")
        (revision "0"))
    (package
      (name "emacs-magit")
      (version (git-version "4.3.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "191j1azzvd9jvycdgxlqrswj2hn03ak3hrdqs6wqgb5f0q2i9zvs"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; #:tests? #t
        #:lisp-directory "lisp"
        #:test-command #~(list "make" "-C" ".." "test")
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
            (add-after 'unpack 'build-info-manual
              (lambda _
                (invoke "make" "-C" ".." "info")
                ;; Copy info files to the lisp directory, which acts as
                ;; the root of the project for the emacs-build-system.
                (rename-file "../docs/magit.info" "../lisp/magit.info")))
            (add-after 'unpack 'patch-version-executables
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "magit.el"
                  ("magit-version" #$version))
                (emacs-substitute-variables "magit-git.el"
                  ("magit-git-executable"
                   (search-input-file inputs "/bin/git")))
                (emacs-substitute-variables "magit-sequence.el"
                  ("magit-perl-executable"
                   (search-input-file inputs "/bin/perl")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "git-commit")
                ;; `guix build ... emacs-magit-section` doesn't automatically
                ;; create the magit-section-pkg.el
                (bst:write-pkg-file "magit-section")
                )))))
      (native-inputs
       ;; (list texinfo pkg-config)
       (list texinfo))
      (inputs
       (list git perl))
      (propagated-inputs
       ;; Note: the 'git-commit' and 'magit-section' dependencies are part of
       ;; magit itself.
       (list
        emacs-compat
        emacs-transient
        emacs-with-editor
        emacs-llama
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

;; Required by <path/to/spacemacs>/layers/+source-control/git/packages.el
(define-public emacs-magit-section
  (package
    (inherit emacs-magit)
    (name "emacs-magit-section")))

(define-public emacs-taxy
  (package
    (name "emacs-taxy")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://elpa.gnu.org/packages/taxy-" version ".tar"))
       (sha256
        (base32
         "1nmlx2rvlgzvmz1h3s5yn3qnad12pn2a83gjzxf3ln79p8rv1mj6"))))
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
    (version "0.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://elpa.gnu.org/packages/taxy-magit-section-" version
                    ".tar"))
              (sha256
               (base32
                "16j1a2vx9awr5vk1x3i1m526ym6836zxlypx1f50fcwjy0w8q8a3"))))
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

(define-public emacs-tweaks
  (let ((commit "29352eba87ca21be17e818532edc72684926bff1")
        (revision "0"))
    (package
      (name "emacs-tweaks")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/tweaks.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "09n4z9ax3bs5a8x03s9f4mwcdqdna3wyqrm11sdfscgvysr0ryv4"))))
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
        emacs-zoom-frm
        ))
      (home-page "https://github.com/Bost/tweaks")
      (synopsis "Various tweaks")
      (description "Various tweaks")
      (license license:gpl3+))))

(define-public emacs-forge
  (package
    (name "emacs-forge")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magit/forge")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02ks8zc3nqqqqfq2picf0pxsw7wygb5hv9abnva1cv44x091w6zw"))))
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
    (native-inputs (list texinfo))
    (propagated-inputs
     (list
      emacs-closql
      emacs-emacsql
      emacs-ghub
      emacs-llama
      emacs-let-alist
      emacs-magit
      emacs-markdown-mode
      emacs-yaml
      ))
    (home-page "https://github.com/magit/forge/")
    (synopsis "Access Git forges from Magit")
    (description "Work with Git forges, such as Github and Gitlab, from the
comfort of Magit and the rest of Emacs.")
    (license license:gpl3+)))

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
             (url "https://github.com/kanru/uuidgen-el.git")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ih6kj3inwdxypbqj2n5vnfxmc6rfrx114w8bdy60yd8klx7273d"))))
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

(define-public emacs-code-review
  (let ((commit "fba8fe3343665cb8000781590b2f20dc0351acb9")
        (revision "0"))
    (package
      (name "emacs-code-review")
      (version (git-version "0.0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/doomelpa/code-review.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0fgsbdydhsv15c0i9bajkshgf6cyijky5pdziq03jx7h3ph9y5fs"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-uuidgen
        emacs-deferred
        (@(bost gnu packages emacs-xyz-dash-s) emacs-emojify)
        emacs-forge
        emacs-closql
        emacs-magit
        emacs-a
        emacs-ghub
        emacs-transient
        emacs-markdown-mode
        ))
      (home-page "https://github.com/doomelpa/code-review")
      (synopsis "Perform code reviews from Emacs for GitHub, GitLab, and Bitbucket")
      (description
       "Emacs interface for conducting code reviews directly within the editor.  It
supports reviewing pull requests from GitHub,GitLab, and Bitbucket, offering
features such as reading and replying to comments, adding suggestions,
approving or requesting changes, and editing pull request metadata.  The
interface leverages `magit-section` and `transient` for a modern user
experience, enabling developers to manage code reviews without leaving Emacs.")
      (license license:gpl3+))))

(define-public emacs-magit-annex
  (let ((commit "83f438af33442c0ebc92922a562dad66208a45ff")
        (revision "0"))
    (package
      (name "emacs-magit-annex")
      (version (git-version "1.9.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit-annex.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "143y8kwbfgwq5zjg6v2gxxdrwwgllf4qarp60av2w186jr1j9zyw"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-magit))
      (home-page "https://github.com/magit/magit-annex/")
      (synopsis "Git-annex support for Magit")
      (description
       "Magit-annex adds a few git-annex operations to the Magit interface.")
      (license license:gpl3+))))

(define-public emacs-magit-tbdiff
  (let ((commit "1cb315269df2df2382edc3db21ed52418f13a0d6")
        (revision "0"))
      (package
        (name "emacs-magit-tbdiff")
        (version (git-version "1.2.0" revision commit))
        (source
         (origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/magit/magit-tbdiff.git")
                 (commit commit)))
           (file-name (git-file-name name version))
           (sha256
            (base32 "10qgl5mg8dj7g1yg0qc1aqraj96pywkj142i8xgnrdp6yngv8g56"))))
        (build-system emacs-build-system)
        (arguments (list #:tests? #f))
        (propagated-inputs (list emacs-magit))
        (home-page "https://github.com/magit/magit-tbdiff")
        (synopsis "Magit extension for range diffs")
        (description
         "Magit-tbdiff provides a Magit interface to @code{git-range-diff} (and its
third-party predecessor @code{git-tbdiff}), a Git subcommand for comparing two
versions of a topic branch.")
        (license license:gpl3+))))

(define-public emacs-magit-gerrit
  (let ((commit "07307dbdff9ec8042457dbeed21281c336fba104")
        (revision "1"))
    (package
      (name "emacs-magit-gerrit")
      (version (git-version "0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/magit-gerrit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "175vw3khs3bcm4ry98bcpd8dw7n1y8al01z4p5xcrlrzfp21cn0y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-magit))
      (home-page "https://github.com/emacsorphanage/magit-gerrit")
      (synopsis "Magit extension for Gerrit")
      (description "This Magit extension provides integration with Gerrit,
which makes it possible to conduct Gerrit code reviews directly from within
Emacs.")
      (license license:gpl3+))))

(define-public emacs-magit-stgit
  (let ((commit "b19d96f8f62bd4def83eb1c09e9cd2582856351e")
        (revision "0"))
    (package
      (name "emacs-magit-stgit")
      (version (git-version "3.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/stacked-git/magit-stgit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "10ql7gi586w65vds6wsh8bw5nr444xqhgh87khzcpfaglnw2lyaf"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f)) ;no tests
      (propagated-inputs
       (list
        emacs-magit
        emacs-transient
        emacs-llama
        ))
      (home-page "https://github.com/stacked-git/magit-stgit")
      (synopsis "StGit extension for Magit")
      (description
       "This package provides basic support for @code{stgit} in
@code{emacs-magit}.  When @code{magit-stgit-mode} is turned on, the
current patch series is displayed in the status buffer.  While point is on a
patch the changes it introduces can be shown using @code{RET}, it can be selected
as the current patch using @code{a}, and it can be discarded using @code{k}.  Other
@code{StGit} commands are available from the @code{StGit} transient on @code{/}.")
      (license license:gpl3+))))

(define-public emacs-magit-svn
  (let ((commit "ca637c648835eddbeb277cc8089d3ffd6f75ae13")
        (revision "0"))
    (package
      (name "emacs-magit-svn")
      (version (git-version "2.2.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit-svn.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x419qz80ir9ni94j3n08a5ygfq1265fpr13dsnxjjnlwjbq7sx7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-with-editor
        emacs-magit))
      (home-page "https://github.com/magit/magit-svn")
      (synopsis "Git-SVN extension to Magit")
      (description
       "This package is an extension to Magit, the Git Emacs mode, providing
support for Git-SVN.")
      (license license:gpl3+))))

(define-public emacs-evil-collection
  (let ((commit "fca81ddb2ca1ac3838aa7e8969b2313712807a45")
        (revision "0"))
    (package
      (name "emacs-evil-collection")
      (version (git-version "0.0.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-evil/evil-collection.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0grp87nb9pxx47rzclhngqn9gvgbn39yfk0szz6a4xh0pf56f100"))))
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
      (native-inputs (list emacs-magit))
      (propagated-inputs
       (list
        emacs-annalist
        emacs-evil
        ))
      (home-page "https://github.com/emacs-evil/evil-collection")
      (synopsis "Collection of Evil bindings for many major and minor modes")
      (description "This is a collection of Evil bindings for the parts of
Emacs that Evil does not cover properly by default, such as @code{help-mode},
@code{M-x calendar}, Eshell and more.")
      (license license:gpl3+))))

(define-public emacs-magit-org-todos-el
  (let ((commit "9ffa3efb098434d837cab4bacd1601fdfc6fe999")
        (revision "0"))
    (package
      (name "emacs-magit-org-todos-el")
      (version (git-version "0.1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/danielma/magit-org-todos.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0kxz5q8q5np4zm1ls4hx1h53vlnhj0mnmbq12p5nzk5zcxycbcpz"))))
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
      (license license:gpl3+))))

(define-public emacs-magit-todos
  (let ((commit "bd27c57eada0fda1cc0a813db04731a9bcc51b7b")
        (revision "0"))
    (package
      (name "emacs-magit-todos")
      (version (git-version "1.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/magit-todos.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q3rplkvd4ny02zpnrzkfhflg8yx7zq2brq15c603f2yjiwiy7xl"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-async
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-hl-todo
        emacs-magit
        emacs-pcre2el
        emacs-s
        ))
      (home-page "https://github.com/alphapapa/magit-todos")
      (synopsis "Show source files' TODOs (and FIXMEs, etc) in Magit status buffer")
      (description "This package displays keyword entries from source code
comments and Org files in the Magit status buffer.  Activating an item jumps
to it in its file.  By default, it uses keywords from @code{hl-todo}, minus a
few (like NOTE).")
      (license license:gpl3))))

(define-public emacs-nix-mode
  (let ((commit "719feb7868fb567ecfe5578f6119892c771ac5e5")
        (revision "0"))
    (package
      (name "emacs-nix-mode")
      (version (git-version "1.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/NixOS/nix-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1i2yh8wgn97q9hwaihznb5d7jql9acdjyj5q375gqwpq144g3xjv"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-company
        emacs-json-mode
        emacs-magit
        emacs-mmm-mode
        ))
      (home-page "https://github.com/NixOS/nix-mode")
      (synopsis "Emacs major mode for editing Nix expressions")
      (description "@code{nixos-mode} provides an Emacs major mode for editing
Nix expressions.  It supports syntax highlighting, indenting and refilling of
comments.")
      (license license:lgpl2.1+))))

(define-public emacs-orgit
  (let ((commit "efd98e5caaac1d08677dae95be40fab65dcda2c8")
        (revision "0"))
    (package
      (name "emacs-orgit")
      (version (git-version "2.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/orgit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0pzcmd4d82nmg98nrnk73qr02k1hy0qyagsbrxyjdpfzrg3ysmp9"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-magit
        ))
      (home-page "https://github.com/magit/orgit")
      (synopsis "Support for Org links to Magit buffers")
      (description "This package defines several Org link types, which can be
used to link to certain Magit buffers.  Use the command
@command{org-store-link} while such a buffer is current to store a link.
Later you can insert it into an Org buffer using the command
@code{org-insert-link}.")
      (license license:gpl3+))))

(define-public emacs-orgit-forge
  (let ((commit "764820769e321a76622aaafe7617b4231985b5f0")
        (revision "0"))
    (package
      (name "emacs-orgit-forge")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/orgit-forge.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0v79xc4ss9c4wz6spplrlfzzgynfs264c6gxhzjffpa9vqnvbc6g"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-orgit
        emacs-forge
        emacs-compat
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

(define-public emacs-vdiff-magit
  ;; Need to use a more recent commit than the latest release version because
  ;; of Magit and Transient
  (let ((commit "cc9e2dbd81d7f717381981501472808b7a4c6d79")
        (revision "0"))
    (package
      (name "emacs-vdiff-magit")
      (version (git-version "0.3.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/justbur/emacs-vdiff-magit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jybs0ddgvl1xfa750prw3phvilqxq3a4gpjpcljyjbjdqhdfrym"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-vdiff
        emacs-magit
        ))
      (home-page "https://github.com/justbur/emacs-vdiff-magit/")
      (synopsis "Frontend for diffing based on vimdiff")
      (description "This package permits comparisons of two or three buffers
based on diff output.")
      (license license:gpl3+))))

(define-public emacs-undo-tree
  (package
    (name "emacs-undo-tree")
    (version "0.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://gitlab.com/tsc25/undo-tree")
              (commit "42aab056e37e033816b2d192f9121b89410b958e"))) ; no 0.8.2 tag
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xvkxc078b4z5zqwndz6jcv4ga8yd2ci32v7l8pdvqjmz7fq7bfz"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-queue
      ))
    (home-page "https://www.dr-qubit.org/undo-tree.html")
    (synopsis "Treat undo history as a tree")
    (description
     "Tree-like interface to Emacs undo system, providing
graphical tree presentation of all previous states of buffer that
allows easily move between them.")
    (license license:gpl3+)))

(define-public emacs-evil-nerd-commenter
  (package
    (name "emacs-evil-nerd-commenter")
    (version "3.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/redguardtoo/evil-nerd-commenter")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1xi4sd75pzhgcd9lzhx18hlzbrwh5q9gbscb1971qn94mzxwd60r"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")
                     #:tests? #f        ; XXX: broken docstring
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-after 'unpack 'patch-Makefile
                           (lambda _
                             (substitute* "Makefile"
                               (("-Q") "")
                               (("-L [^.]*") "")
                               (("deps/") "")
                               ((" deps") "")))))))
    (propagated-inputs
     (list
      emacs-evil
      ))
    (native-inputs (list emacs-web-mode))
    (home-page "https://github.com/redguardtoo/evil-nerd-commenter")
    (synopsis "Comment and uncomment lines efficiently")
    (description
     "This package provides text objects and operators for comments within
@code{evil-mode}.")
    (license license:gpl3+)))

(define-public emacs-zenburn-theme
  (package
    (name "emacs-zenburn-theme")
    (version "2.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/bbatsov/zenburn-emacs")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00zyx2knfchxkml19kf4wfgigsbgzqf47mvbgrmk3nfznnnnyvmf"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/bbatsov/zenburn-emacs")
    (synopsis "Low contrast color theme for Emacs")
    (description
     "Zenburn theme is a port of the popular Vim Zenburn theme for Emacs.
It is built on top of the custom theme support in Emacs 24 or later.")
    (license license:gpl3+)))

(define-public emacs-loop
  (package
    (name "emacs-loop")
    (version "1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Wilfred/loop.el")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gs95xnmnn8aa4794k7h8mw1sz1nfdh9v0caqj6yvnsdnwy74n5x"))))
    (build-system emacs-build-system)
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (home-page "https://github.com/Wilfred/loop.el")
    (synopsis "Imperative loop structures for Emacs")
    (description "Loop structures familiar to users of other languages.  This
library adds a selection of popular loop structures as well as break and
continue.")
    (license license:gpl3+)))

(define-public emacs-vterm
  (let ((commit "056ad74653704bc353d8ec8ab52ac75267b7d373")
        (revision "2"))
    (package
      (name "emacs-vterm")
      (version (git-version "0.0.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/akermu/emacs-libvterm")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0mh1xx3ggrr3kampm1b9cxydbn6csihipaa2bpjv08py98wi0434"))))
      (build-system emacs-build-system)
      (arguments
       `(#:modules ((guix build emacs-build-system)
                    ((guix build cmake-build-system) #:prefix cmake:)
                    (guix build emacs-utils)
                    (guix build utils))
         #:imported-modules (,@%emacs-build-system-modules
                             (guix build cmake-build-system))
         ;; Include the `etc' folder for shell-side configuration files
         #:include (cons* "^etc/.*" %default-include)
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'replace-bin-bash
             ;; This is necessary to avoid errors in phase 'patch-el-files'.
             (lambda* (#:key inputs #:allow-other-keys)
               (substitute* "vterm.el"
                 (("\\/bin\\/bash") (search-input-file inputs "/bin/bash")))))
           (add-after 'unpack 'substitute-vterm-module-path
             (lambda* (#:key outputs #:allow-other-keys)
               (chmod "vterm.el" #o644)
               (emacs-substitute-sexps "vterm.el"
                 ("(require 'vterm-module nil t)"
                  `(module-load
                    ,(string-append (assoc-ref outputs "out")
                                    "/lib/vterm-module.so"))))))
           (add-after 'build 'configure
             ;; Run cmake.
             (lambda* (#:key outputs #:allow-other-keys)
               ((assoc-ref cmake:%standard-phases 'configure)
                #:outputs outputs
                #:out-of-source? #f
                #:configure-flags '("-DUSE_SYSTEM_LIBVTERM=ON"))))
           (add-after 'configure 'make
             ;; Run make.
             (lambda* (#:key (make-flags '()) outputs #:allow-other-keys)
               ;; Compile the shared object file.
               (apply invoke "make" "all" make-flags)
               ;; Move the file into /lib.
               (install-file
                "vterm-module.so"
                (string-append (assoc-ref outputs "out") "/lib")))))
         #:tests? #f))
      (native-inputs
       (list cmake-minimal libtool libvterm))
      (home-page "https://github.com/akermu/emacs-libvterm")
      (synopsis "Emacs libvterm integration")
      (description "This package implements a bridge to @code{libvterm} to
display a terminal in an Emacs buffer.")
      (license license:gpl3+))))

(define-public emacs-elisp-refs
  (package
    (name "emacs-elisp-refs")
    (version "1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/elisp-refs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1670jj0pya74gb0xbjlfmka4w06hzh6ya1ai9f4brxp4n9knc13i"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-list-utils
      emacs-loop
      emacs-s
      emacs-shut-up
      ))
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (home-page "https://github.com/Wilfred/elisp-refs")
    (synopsis "Find callers of elisp functions or macros")
    (description "@code{elisp-refs} finds references to functions, macros or
variables.  Unlike a dumb text search, it actually parses the code, so it's
never confused by comments or @code{foo-bar} matching @code{foo}.")
    (license license:gpl3+)))

(define-public emacs-paradox
  (let ((commit "dec73d4ba3512e0f85983a4b992080b225d199ee")
        (revision "0"))
    (package
      (name "emacs-paradox")
      (version (git-version "2.5.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Malabarba/paradox.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0dnfyfznps3p15zn3g4ay2y1wsrnkwrplsg0ramby4pkm61a5a5m"))))
      (build-system emacs-build-system)
      ;; (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-hydra
        emacs-let-alist
        emacs-spinner
        ))
      (native-inputs (list emacs-ert-runner emacs-undercover))
      (home-page "https://github.com/Malabarba/paradox")
      (synopsis "Paradox is an extension to Emacs packages menu")
      (description
       "Paradox is a project for modernizing Emacs' Package menu.  It provides
improved appearance, mode-line information, GitHub integration,
customizability and asynchronous upgrading.")
      (license license:gpl2+))))

(define-public emacs-json-reformat
  (package
    (name "emacs-json-reformat")
    (version "0.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gongo/json-reformat")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gaifz1brh7yh1wk1c02gddwis4ab6bggv27gy7gcd2s861f8bkx"))
       (patches (search-patches "emacs-json-reformat-fix-tests.patch"))))
    (build-system emacs-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'make-tests-writable
           (lambda _
             (for-each make-file-writable (find-files "test"))))
         (add-before 'check 'delete-json-objects-order-test
           (lambda _
             (emacs-batch-edit-file "test/json-reformat-test.el"
               `(progn (progn (goto-char (point-min))
                              (re-search-forward
                               "ert-deftest json-reformat-test:json-reformat-region")
                              (beginning-of-line)
                              (kill-sexp))
                       (basic-save-buffer)))))
         (add-before 'check 'delete-json-reformat-region-occur-error-test
           (lambda _
             (emacs-batch-edit-file "test/json-reformat-test.el"
               `(progn (goto-char (point-min))
                       (re-search-forward
                        "ert-deftest json-reformat-test:json-reformat-region-occur-error")
                       (beginning-of-line)
                       (kill-sexp)
                       (basic-save-buffer))))))))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-ert-runner
      emacs-shut-up
      ))
    (propagated-inputs
     (list emacs-undercover))
    (home-page "https://github.com/gongo/json-reformat")
    (synopsis "Reformatting tool for JSON")
    (description "@code{json-reformat} provides a reformatting tool for
@url{http://json.org/, JSON}.")
    (license license:gpl3+)))

(define-public emacs-yasnippet-snippets
  (package
    (name "emacs-yasnippet-snippets")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AndreaCrotti/yasnippet-snippets")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0p38k8a3l9vpph1g2a6wz40y30wb2nhp770rv8947bxzjc5xc0gf"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include #~(cons* "^snippets\\/" %default-include)
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'set-home
            (lambda _
              (setenv "HOME" (getcwd)))))))
    (propagated-inputs
     (list
      emacs-yasnippet
      ))
    (home-page "https://github.com/AndreaCrotti/yasnippet-snippets")
    (synopsis "Collection of YASnippet snippets for many languages")
    (description "This package provides an extensive collection of YASnippet
snippets.  When this package is installed, the extra snippets it provides are
automatically made available to YASnippet.")
    (license license:gpl3+)))

(define-public emacs-volatile-highlights
  (let ((commit "3952439feb0173745ce36c1fc192c84494186b55")
        (revision "0"))
    (package
      (name "emacs-volatile-highlights")
      (version (git-version "1.18" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "http://github.com/k-talo/volatile-highlights.el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ykjry3adcc7k6bmhxixr1xykpp83n7m8nwd7kpqhq35f4w8pmfm"))))
      (build-system emacs-build-system)
      (home-page "http://github.com/k-talo/volatile-highlights.el")
      (synopsis "Emacs minor mode for visual feedback on some operations")
      (description "@code{volatile-highlights-mode} brings visual feedback to
some operations by highlighting portions relating to the operations.  All of
highlights made by this library will be removed when any new operation is
executed.")
      (license license:gpl3+))))

(define-public emacs-suggest
  (package
    (name "emacs-suggest")
    (version "0.7")
    (home-page "https://github.com/Wilfred/suggest.el")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "01v8plska5d3g19sb1m4ph1i3ayprfzk8mi6mpabjy6zad397xjl"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-loop
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-spinner
      emacs-shut-up
      ))
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (synopsis "Suggest Elisp functions that give the output requested")
    (description "Suggest.el will find functions that give the output
requested.  It's a great way of exploring list, string and arithmetic
functions.")
    (license license:gpl3+)))

(define-public emacs-vundo
  (let ((commit "30f85b4ae1f2a7189d44bb738b49559928d046cb")
        (revision "0"))
    (package
      (name "emacs-vundo")
      (version (git-version "2.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/casouri/vundo.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1a2y73xf6bb37mp15w40mh21x0zlzvyf4a4j0r9psyfhi145c1cy"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "vundo.el"
                               "-l" "test/vundo-test.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (home-page "https://github.com/casouri/vundo/")
      (synopsis "Visualize the undo tree")
      (description
       "Vundo (visual undo) displays the undo history as a tree and lets you
move in the tree to go back to previous buffer states.  To use vundo, type
@kbd{M-x vundo RET} in the buffer you want to undo.  An undo tree buffer
should pop up.")
      (license license:gpl3+))))

(define-public emacs-unfill
  (let ((commit "4a15511876983eeaa75e57fcab8d4d51fe9b3840")
        (revision "0"))
    (package
      (name "emacs-unfill")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/purcell/unfill.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cj8xdkg39ja6f29ws67bqrvjy2gzk45yimcqmj0xv3v66r555lg"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        ;; #:test-command #~(list "make" "unit" "INIT_PACKAGES=t")
        ))
      (home-page "https://github.com/purcell/unfill")
      (synopsis "Inverse of Emacs' @code{fill-paragraph} and @code{fill-region}")
      (description
       "The functions in this package provide the inverse of Emacs'
@code{fill-paragraph} and @code{fill-region}.")
      (license license:gpl3+))))

(define-public emacs-yaml-mode
  (package
    (name "emacs-yaml-mode")
    (version "0.0.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yoshiki/yaml-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jqg2hmh7qsgqywwd6fy3k8z8j45nqhpdzr3hw4hd5s2hry3zhg1"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")))
    (home-page "https://github.com/yoshiki/yaml-mode")
    (synopsis "Major mode for editing YAML files")
    (description
     "Yaml mode is an Emacs major mode for editing files in the YAML data
serialization format.  As YAML and Python share the fact that indentation
determines structure, this mode provides indentation and indentation command
behavior very similar to that of Python mode.")
    (license license:gpl3+)))

(define-public emacs-evil-matchit
  (package
    (name "emacs-evil-matchit")
    (version "4.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/redguardtoo/evil-matchit")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06ayyw8nim5fi819hr30x54wx2ba6aqvlh7r0vld06xc0zsjdhm3"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-after 'unpack 'patch-Makefile
                           (lambda _
                             (substitute* "Makefile"
                               (("-Q") "")
                               (("-L [^.]*") "")
                               (("deps/") "")
                               ((" deps") "")))))))
    (propagated-inputs
     (list
      emacs-evil
      ))
    (native-inputs
     (list
      emacs-lua-mode
      emacs-markdown-mode
      emacs-tuareg
      emacs-yaml-mode
      ))
    (home-page "https://github.com/redguardtoo/evil-matchit")
    (synopsis "Vim matchit ported into Emacs")
    (description
     "@code{evil-matchit} is a minor mode for jumping between matching tags in
evil mode using @kbd{%}.  It is a port of @code{matchit} for Vim.")
    (license license:gpl3+)))

(define-public emacs-xterm-color
  (package
    (name "emacs-xterm-color")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atomontage/xterm-color")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "127lq50q62x06kd1xrf8lyc4rkqbfhfy86gsx1x4x169am2xk397"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/atomontage/xterm-color")
    (synopsis "ANSI & xterm-256 color text property translator for Emacs")
    (description "@code{xterm-color.el} is an ANSI control sequence to
text-property translator.")
    (license license:bsd-2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; beg: done
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
  (let ((commit "8bd216bd12655828a07917a498052f5959515efd")
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
           "133wa7lxvb2bk7ba5yvdnfz4hf7l1zpdmakidg1b3ca9rcprivvq"))))
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
                (map bst:write-pkg-file
                     (list
                      "farmhouse-light-mod-a-theme"
                      "farmhouse-light-mod-b-theme"
                      "farmhouse-light-mod-c-theme")))))))
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
        (@(bost gnu packages emacs-build) emacs-dash)
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
      (inputs (list node-lts))
      (propagated-inputs
       (list
        ;; emacs-copilot-balancer
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-editorconfig
        emacs-s
        (@(bost gnu packages emacs-build) emacs-f)
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
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
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
        emacs-eval-sexp-fu))
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
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
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

(define-public emacs-lsp-mode
  (package
    (inherit (@(gnu packages emacs-xyz) emacs-lsp-mode))
    (name "emacs-lsp-mode")
    ;; TODO how to inherit from arguments
    (arguments
     (list
      #:emacs emacs                   ;need libxml support
      #:test-command #~(list "ert-runner"
                             "-L" "."
                             "-L" "clients"
                             "-t" "!no-win"
                             "-t" "!org")
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
          ;; Move libraries to the top-level.
          (add-after 'unpack 'move-libraries
            (lambda _
              ;; REVIEW; Improve style, pair-for-each ?
              (for-each (lambda (d)
                          (for-each (lambda (f)
                                      (rename-file f (basename f)))
                                    (find-files d "\\.el$")))
                        (list "use-package/" "clients/"))))
          (add-before 'check 'skip-failing-tests
            (lambda _
              (substitute* "test/lsp-mock-server-test.el"
                (("\\(ert-deftest lsp-mock-server-reports.*" all)
                 (string-append all "(skip-unless nil)"))
                (("\\(ert-deftest lsp-mock-server-updates-.*" all)
                 (string-append all "(skip-unless nil)")))
              (substitute* "test/lsp-common-test.el"
                (("\\(require 'elenv" all)
                 (string-append all " nil t"))
                (("\\(ert-deftest lsp--path-to-uri-1 .*" all)
                 (string-append all "(skip-unless (featurep 'elenv))"))
                (("\\(ert-deftest lsp-byte-compilation-test .*" all)
                 (string-append all "(skip-unless nil)"))
                (("\\(ert-deftest lsp--build-.*-response-test-[34] .*" all)
                 (string-append all "(skip-unless nil)")))
              (substitute* "test/lsp-mode-test.el"
                (("\\(ert-deftest lsp--merge-results .*" all)
                 (string-append all "(skip-unless nil)")))
              (substitute* "test/lsp-integration-test.el"
                (("\\(ert-deftest lsp-.*-hover-request(-tick)? .*" all)
                 (string-append all "(skip-unless nil)"))
                (("\\(ert-deftest lsp-test-current-buffer-mode .*" all)
                 (string-append all "(skip-unless nil)")))
              (delete-file "test/lsp-clangd-test.el")))
          (add-before 'check 'set-home
            (lambda _ (setenv "HOME" (getenv "TMPDIR"))))
          (add-after 'unpack 'enable-plists
            (lambda _
              (substitute* "lsp-protocol.el"
                ;; This is faster, and it's officially recommended,
                ;; and it's required by emacs-lsp-booster.
                ;; See also:
                ;; <https://emacs-lsp.github.io/lsp-mode/page/performance/>.
                (("\\(getenv \"LSP_USE_PLISTS\"\\)") "t"))))
          (add-before 'move-libraries 'fix-patch-el-files
            ;; /bin/ksh is only used on macOS, which we don't support, so we
            ;; don't want to add it as input.
            (lambda _
              (substitute* '("clients/lsp-csharp.el"
                             "clients/lsp-fsharp.el")
                (("/bin/ksh") "ksh"))))
          (add-after 'ensure-package-description 'add-needed-pkg-descriptions
            (lambda* (#:key outputs #:allow-other-keys)
              ;; (format #t "(getcwd) : ~a\n" (getcwd))
              ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
              (bst:write-pkg-file "lsp-mode"))))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-ht
      emacs-hydra
      emacs-markdown-mode
      emacs-spinner
      ))))

(define-public emacs-lsp-ui
  (let ((commit "a0dde8b52b4411cbac2eb053ef1515635ea0b7ed")
        (revision "0"))
    (package
      (name "emacs-lsp-ui")
      (version (git-version "9.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-ui.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0zyv1rar9vmxxs5n0mly5m9k5m8gia85c8c5rjap8fvrrbmjcfaa"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-lsp-mode
        emacs-markdown-mode
        emacs-flycheck
        ))
      (home-page "https://github.com/emacs-lsp/lsp-ui")
      (synopsis "User interface extensions for @code{lsp-mode}")
      (description
       "@code{LSP-ui} contains several enhancements and integrations for
@code{lsp-mode}, such as visual flychecking, displaying references in-line,
and code peeking.")
      (license license:gpl3+))))

(define-public emacs-lsp-haskell
  (let ((commit "081d5115ceb1f1647497a8a3de4ca0702aaadb48")
        (revision "0"))
    (package
      (name "emacs-lsp-haskell")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-haskell.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cjxf2xqdmhi1mq4d1k4k8xh1lqglr8s6r1yw12b8956sjm9ykv9"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-haskell-mode
        emacs-lsp-mode
        ))
      (home-page "https://github.com/emacs-lsp/lsp-haskell")
      (synopsis "LSP client integration for Haskell in Emacs")
      (description
       "Emacs integration for the Haskell Language Server (HLS) via lsp-mode.
  It facilitates features such as code completion,diagnostics, and formatting
 by launching and configuring HLS automatically.  Users can customize server
 settings through Emacs' customization system, and support is provided for
 both haskell-mode and haskell-literate-mode.")
      (license license:gpl3+))))

(define-public emacs-lsp-pyright
  (let ((commit "73377169beff8fe22cc6d52d65099db88bf49679")
        (revision "0"))
    (package
      (name "emacs-lsp-pyright")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-pyright.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1nbvl850ifnzfbncbl9wvarbh3l8r3yapj6c0pxk2r5b9mifgp75"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-ht
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-lsp-mode
        ))
      (home-page "https://github.com/emacs-lsp/lsp-pyright")
      (synopsis "LSP client integration for Python using (Based)Pyright")
      (description
       "This package integrates the Pyright and BasedPyright language servers
 with Emacs' lsp-mode, providing advanced Python language support.  It offers
features such as type checking, auto-import completions, inlay hints, and
diagnostics.  The package automatically detects virtual environments and
supports extensive customization through Emacs variables and
pyrightconfig.json.")
      (license license:gpl3+))))

(define-public emacs-lsp-origami
  (let ((commit "f757a7b45538b6cf1da04183e99171e59e92c9a7")
        (revision "0"))
    (package
      (name "emacs-lsp-origami")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-origami.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "05lfm13bg7na7p0372p5arjbyr9m9fyrq3v7q1aavrg6vd2bdc6q"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-lsp-mode
        emacs-origami
        ))
      (home-page "https://github.com/emacs-lsp/lsp-origami")
      (synopsis "Origami-based code folding integration for lsp-mode in Emacs")
      (description
       "This package integrates origami.el with Emacs' lsp-mode by utilizing
 the Language Server Protocol's textDocument/foldingRange feature.  It enables
 structural code folding based on language server data, providing accurate and
 efficient folding capabilities.  Users can activate it by adding
 `lsp-origami-try-enable` to `lsp-after-open-hook`, enhancing code navigation
 and readability.")
      (license license:gpl3+))))

(define-public emacs-lsp-python-ms
  (let ((commit "7bda327bec7b219d140c34dab4b1e1fbd41bc516")
        (revision "0"))
    (package
      (name "emacs-lsp-python-ms")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-python-ms.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1i7l06cw25fb202fbhqhx8xyfynz6sinka9ybh8n4cxjq19ffm8b"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-lsp-mode))
      (home-page "https://github.com/emacs-lsp/lsp-python-ms")
      (synopsis "LSP client integration for Microsoft's Python Language
 Server in Emacs")
      (description
       "This package integrates Microsoft's Python Language Server with Emacs'
 lsp-mode, providing features such as code completion, diagnostics, and
 navigation for Python development.  It is now deprecated in favor of
 lsp-pyright, which offers improved performance and ongoing support.")
      (license license:bsd-3))))

(define-public emacs-lsp-lens
  (package
    (inherit
     emacs-lsp-mode
     )
    (name "emacs-lsp-lens")))

(define-public emacs-lsp-protocol
  (package
    (inherit
     emacs-lsp-mode
     )
    (name "emacs-lsp-procotol")))

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

(define-public emacs-org-cliplink
  (let ((commit "13e0940b65d22bec34e2de4bc8cba1412a7abfbc")
        (revision "0"))
    (package
      (name "emacs-org-cliplink")
      (version (git-version "0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/rexim/org-cliplink")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1avyiw8vlv4n1r7zqvc6wjlsz7jl2pqaprzpm782gzp0c999pssl"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-curl-executable
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "org-cliplink-transport.el"
                  (("\\(executable-find \"curl\"\\)")
                   (let ((curl (search-input-file inputs "/bin/curl")))
                     (string-append "\"" curl "\""))))))
            (add-before 'check 'fix-failing-test
              ;; XXX: Fix randomly (!) failing test, which doesn't account for
              ;; the fact that (random) may return a negative number.
              (lambda _
                (substitute* "test/org-cliplink-transport-test.el"
                  (("curl-rexim.me-\\[a-z0-9\\]\\+")
                   "curl-rexim.me--?[a-z0-9]+")))))))
      (native-inputs
       (list
        emacs-el-mock
        emacs-ert-runner
        emacs-undercover
        ))
      (inputs
       (list curl))
      (home-page "https://github.com/rexim/org-cliplink/")
      (synopsis "Insert Org mode links from the clipboard")
      (description
       "Org Cliplink provides a simple command that takes a URL from the
clipboard and inserts an Org mode link with a title of a page found by the URL
into the current buffer.")
      (license license:expat))))

(define-public emacs-terminal-here
  (package
    (name "emacs-terminal-here")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/davidshepherd7/terminal-here")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1iv1c2mbvhn00ha46c6f98j9syc71xhjpk8m5wa5p32sk4wcc9f4"))))
    (build-system emacs-build-system)
    (native-inputs (list emacs-el-mock emacs-ert-runner emacs-validate))
    (home-page "https://github.com/davidshepherd7/terminal-here")
    (synopsis "Open external terminals from Emacs")
    (description
     "This package provides commands to open external terminal emulators from
Emacs, whose initial working directories are determined in relation to the
current buffer.")
    (license license:gpl3+)))

(define-public emacs-dumb-jump
  (package
    (name "emacs-dumb-jump")
    (version "0.5.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jacktasia/dumb-jump")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18d2ll5wlll6pm909hiw8w9ijdbrjvy86q6ljzx8yyrjphgn0y1y"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f                      ; FIXME: Tests freeze when run.
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-shell
           (lambda _
             ;; Setting the SHELL environment variable is required for the
             ;; tests to find sh.
             (setenv "SHELL" (which "sh")))))))
    (native-inputs
     (list emacs-el-mock emacs-ert-runner emacs-noflet emacs-undercover))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-popup
      ))
    (home-page "https://github.com/jacktasia/dumb-jump")
    (synopsis "Jump to definition for multiple languages without configuration")
    (description "Dumb Jump is an Emacs \"jump to definition\" package with
support for multiple programming languages that favors \"just working\" over
speed or accuracy.  This means minimal --- and ideally zero --- configuration
with absolutely no stored indexes (tags) or persistent background processes.
Dumb Jump performs best with The Silver Searcher @command{ag} or ripgrep
@command{rg} installed.")
    (license license:gpl3+)))

(define-public emacs-repo
  (let ((commit "1572f3ee82eaadc06e741f03e1889281308c79fa")
        (revision "0"))
    (package
      (name "emacs-repo")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/canatella/repo-el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0y8j3hf5r69fxj2vsbaxwr9qdchddn53w25xzmxv1kfh6hbagzv3"))))
      (build-system emacs-build-system)
      (native-inputs
       (list
        emacs-el-mock
        emacs-ert-runner))
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-magit))
      (home-page "https://github.com/canatella/repo-el")
      (synopsis "Emacs interface for the Google Repo tool")
      (description "This package provides integration of the Google Repo tool
with emacs.  It displays the output of the @code{repo status} command in a
buffer and launches Magit from the status buffer for the project at point.")
      (license license:gpl3+))))

(define-public emacs-google-translate
  (package
    (name "emacs-google-translate")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atykhonov/google-translate/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0rwpij2bm8d4jq2w5snkp88mfryplw8166dsrjm407n2p6xr48zx"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-bump-version
            (lambda* (#:key inputs #:allow-other-keys)
              ;; Needed for `guix build --with-input=emacs-minimal=emacs emacs-google-translate`
              (substitute* ".bump-version.el"
                (("^") ";; -*- no-byte-compile: t -*-\n"))))
          (add-before 'check 'disable-failing-tests
            (lambda _
              (let-syntax
                  ((disable-tests
                    (syntax-rules ()
                      ((_ file ())
                       (syntax-error "test names list must not be empty"))
                      ((_ file (test-name ...))
                       (substitute* file
                         (((string-append "^\\(ert-deftest " test-name ".*") all)
                          (string-append all "(skip-unless nil)\n")) ...)))))
                ;; These tests fail due to a missing requirement:
                ;;   (void-function facemenu-set-face)
                (disable-tests
                 "test/google-translate-core-ui-test.el"
                 ("test-google-translate--suggestion"
                  "test-google-translate--text-phonetic/show-phonetic"
                  "test-google-translate--translation-phonetic/show-phonetic"
                  "test-google-translate--translated-text"))))))))
    (native-inputs (list emacs-el-mock emacs-ert-runner))
    (home-page "https://github.com/atykhonov/google-translate")
    (synopsis "Emacs interface to Google Translate")
    (description
     "This package provides an Emacs interface to the Google Translate
on-line service.")
    (license license:gpl3+)))

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
    (propagated-inputs (list emacs-lsp-mode))
    (home-page
     "https://github.com/jadestrong/lsp-volar")
    (synopsis "Language support for Vue3")
    (description "Language support for Vue3
This package has been merged into lsp-mode, so you can use lsp-mode
directly. There will only be some experimental updates here. Once stable, they
will be submitted to lsp-mode.")
    (license license:gpl3+)))

(define-public emacs-helm-lsp
  (let ((commit "54926afd10da52039f8858a99d426cae2aa4c07d")
        (revision "0"))
    (package
      (name "emacs-helm-lsp")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/helm-lsp.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x3fwp059whrrqmdciacvchin5pfkvdv93ayw9vhvxzispp5nyw7"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-helm
        emacs-lsp-mode
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/emacs-lsp/helm-lsp")
      (synopsis "Provide LSP-enhanced completion for symbols")
      (description
       "This package enhances @code{helm} with completion for symbols from
workspaces with a LSP-compliant server running.")
      (license license:gpl3+))))

(define-public emacs-lsp-docker
  (let ((commit "ff41f4a76b640d39dc238bacba7f654c297827fa")
        (revision "0"))
    (package
      (name "emacs-lsp-docker")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/emacs-lsp/lsp-docker.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1frlfcy5vwn8rprgfyrh2qjp2cwwyjsgsp112cxws98s91601v1j"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-lsp-mode
        emacs-yaml
        ))
      (home-page "https://github.com/emacs-lsp/lsp-docker")
      (synopsis "Leverage LSP mode in Docker environment")
      (description
       "This package provides scripts and configurations to leverage LSP mode
in Docker environment.")
      (license license:gpl3+))))

(define-public emacs-dap-mode
  (let ((commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0"))
    (package
      (name "emacs-dap-mode")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cgqhv036fzcv9dg89k5czcfx5w56jkm4rm216lra004nph0sj82"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include #~(cons* "\\.png$" %default-include)))
      (propagated-inputs
       (list emacs-bui
             emacs-lsp-docker
             emacs-lsp-mode
             emacs-posframe
             emacs-lsp-treemacs))
      (home-page "https://emacs-lsp.github.io/dap-mode")
      (synopsis "Emacs client/library for Debug Adapter Protocol")
      (description
       "Dap mode is an Emacs client/library for Debug Adapter
Protocol (DAP), a wire protocol for communication between client and
debug server.  It is similar to the LSP but provides integration with
Debug server.")
      (license license:gpl3+))))

(define emacs-dap-base
  (let ((commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0"))
    (package
      (name "emacs-dap-base")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cgqhv036fzcv9dg89k5czcfx5w56jkm4rm216lra004nph0sj82"))))
      (build-system emacs-build-system)
      (arguments
       (list
;;; Exclusions are done on top of the inclusions. However using (inherit
;;; emacs-dap-base) we can effectivelly invert that. So then the order is will
;;; be:
;;; 1. emacs-dap-base include
;;; 2. emacs-dap-base exclude
;;; 3. emacs-dap-<..> include

        ;; Exclude all el-files in the working directory. el-files in the
        ;; subdirectories are NOT excluded.
        ;; Also, matching every string except "foo" using lookahead assertion
        ;; "^\\(?!foo$\\).*" doesn't work. Lookahead assertions are not
        ;; supported in POSIX regular expressions used by Guile
        #:exclude #~(cons*
                     "^[^/]*\\.el$"
                     %default-exclude)))
      (home-page "https://github.com/emacs-lsp/dap-mode")
      (synopsis "Debug Adapter Protocol client integration for Emacs")
      (description
       "Emacs client for the Debug Adapter Protocol (DAP),enabling interactive
debugging capabilities within the editor.  It integrates with lsp-mode and
supports various programming languages, including Java,Python, Ruby, Elixir,
and C/C++.  Features include breakpoints, call stacks,variable inspection, and
a hydra-based UI for controlling debug sessions. Users can define reusable
debug templates and configure per-language adapters to streamline the
debugging workflow.")
      (license license:gpl3+))))

(define all-info-include (quote (list "^[^/]*\\.info$" "^doc/.*\\.info$")))

(define-public emacs-dap-launch
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-launch")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-launch\\.el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-dap-tasks
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-tasks")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-tasks.\\el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-dap-overlays
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-overlays")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-overlays\\.el$"
                       ,all-info-include)))))

(define-public emacs-dap-utils
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-utils")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                  "^dap-utils\\.el$"
                  ,all-info-include)))
    (propagated-inputs (list emacs-dap-mode))))

(define-public emacs-dap-chrome
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-chrome")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                  "^dap-chrome\\.el$"
                  ,all-info-include)))
    (propagated-inputs
     (list
      emacs-dap-utils
      emacs-dap-mode))))

(define-public emacs-treemacs
  (let ((commit "820b09db106a48db76d95e3a266d1e67ae1b6bdb")
        (revision "0"))
    (package
      (name "emacs-treemacs")
      (version (git-version "3.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1gmp3dvji3ank0qh0fhygla2iy9pc2pg07d342wzs1mysgcdj2l8"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "make" "-C" "../.." "test")
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
                   (string-append (elpa-directory #$output) "/scripts"))
                  ;; (copy-recursively
                  ;;  "src/extra"
                  ;;  (string-append (elpa-directory #$output) "/extra"))
                  )))
            ;; (add-after 'ensure-package-description 'add-needed-pkg-descriptions
            ;;   (lambda* (#:key outputs #:allow-other-keys)
            ;;     ;; (format #t "(getcwd) : ~a\n" (getcwd))
            ;;     ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
            ;;     (bst:write-pkg-file "treemacs-treelib")
            ;;     (with-directory-excursion "../extra"
            ;;       (bst:write-pkg-file "treemacs-all-the-icons")
            ;;       (bst:write-pkg-file "treemacs-evil")
            ;;       (bst:write-pkg-file "treemacs-icons-dired")
            ;;       (bst:write-pkg-file "treemacs-magit")
            ;;       (bst:write-pkg-file "treemacs-mu4e")
            ;;       (bst:write-pkg-file "treemacs-persp")
            ;;       (bst:write-pkg-file "treemacs-perspective")
            ;;       (bst:write-pkg-file "treemacs-projectile")
            ;;       (bst:write-pkg-file "treemacs-tab-bar")
            ;;       )))
            )))
      (native-inputs (list emacs-buttercup emacs-el-mock))
      (inputs (list python))
      (propagated-inputs
       (list
        ;; emacs-projectile    ; for src/extra
        ;; emacs-perspective   ; for src/extra
        ;; emacs-persp-mode    ; for src/extra
        ;; mu                  ; for src/extra ; emacs-lisp package providing mu4e
        ;; emacs-magit         ; for src/extra
        ;; emacs-evil          ; for src/extra
        ;; emacs-all-the-icons ; for src/extra
        emacs-ace-window
        emacs-cfrs
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
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
                (copy-recursively "../extra" ".")))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "treemacs-all-the-icons")
                (bst:write-pkg-file "treemacs-evil")
                (bst:write-pkg-file "treemacs-icons-dired")
                (bst:write-pkg-file "treemacs-magit")
                (bst:write-pkg-file "treemacs-mu4e")
                (bst:write-pkg-file "treemacs-persp")
                (bst:write-pkg-file "treemacs-perspective")
                (bst:write-pkg-file "treemacs-projectile")
                (bst:write-pkg-file "treemacs-tab-bar")))
            ))))
    (propagated-inputs
     (modify-inputs (package-propagated-inputs emacs-treemacs)
       (append
        emacs-all-the-icons
        emacs-evil
        emacs-magit
        emacs-projectile
        emacs-persp-mode
        emacs-perspective
        mu           ; emacs-lisp package which provides mu4e
        )))))

(define-public emacs-treemacs-evil
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-evil")))

(define-public emacs-treemacs-icons-dired
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-icons-dired")))

(define-public emacs-treemacs-magit
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-magit")))

(define-public emacs-treemacs-persp
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-persp")))

(define-public emacs-treemacs-projectile
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-projectile")))

(define-public emacs-lsp-java
  (let ((commit "21c89243adfca4b70e244b0a10cfaa0cd78c61e7")
        (revision "1"))
    (package
      (name "emacs-lsp-java")
      (version (git-version "3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-java.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mp99vyi104r3jm4dlg0c9ri6w543h70mi5qq797xlb70n3sxqw3"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-dap-mode
        emacs-lsp-mode
        emacs-markdown-mode
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-ht
        emacs-request
        emacs-treemacs
        ))
      (home-page "https://github.com/emacs-lsp/lsp-java/")
      (synopsis "Java support for lsp-mode")
      (description "Emacs Java IDE using Eclipse JDT Language Server.")
      (license license:gpl3+))))

(define-public emacs-lean4-mode
  (let ((commit "76895d8939111654a472cfc617cfd43fbf5f1eb6")
        (revision "0"))
    (package
      (name "emacs-lean4-mode")
      (version (git-version "1.1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/leanprover-community/lean4-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1i4l614n0hs02y0a4xfnzc4xkilkp6bzx28pys4jkp96vp2ivf0c"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      ;; TODO: Just emacs-magit-section instead of emacs-magit would be enough.
      (propagated-inputs
       (list
        emacs-compat
        emacs-lsp-mode
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-magit
        ))
      (synopsis "Lean 4 major mode for Emacs")
      (description "This package provides a major mode for the Lean theorem
prover, version 4.")
      (home-page "https://lean-lang.org/")
      (license license:asl2.0))))


(define-public emacs-lsp-metals
  (let ((commit "e1d9d04f3bab7e6e74916054b36ab1a87e831367")
        (revision "0"))
    (package
      (name "emacs-lsp-metals")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-metals.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00jyy2aqbci9k9x4rxxadpwlkpajg0xp0600ddk630nxfnr77vbv"))))
      (build-system emacs-build-system)
      (arguments
       (list
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
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "lsp-metals-protocol")
                (bst:write-pkg-file "lsp-metals-treeview")
                )))))
      (propagated-inputs
       (list
        emacs-scala-mode
        emacs-lsp-mode
        emacs-lsp-treemacs
        emacs-dap-mode
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-ht
        emacs-treemacs
        ))
      (home-page "https://github.com/emacs-lsp/lsp-metals")
      (synopsis "Scala support for LSP mode")
      (description "This package is an Emacs Scala IDE using LSP mode to connect
to Metals.")
      (license license:gpl3+))))

(define-public emacs-lsp-treemacs
  (let ((commit "3e5550f278db74f15ebe34add0138b138207ec08")
        (revision "0"))
    (package
      (name "emacs-lsp-treemacs")
      (version (git-version "0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-treemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dkbq1sc1xwlvy1baxc4px9yi6lp614nl3n9vidpxsmbryaapimq"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include #~(cons "^icons\\/" %default-include)
        )
       )
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-ht
        emacs-treemacs
        emacs-lsp-mode
        ))
      (home-page "https://github.com/emacs-lsp/lsp-treemacs")
      (synopsis "Integration between LSP mode and treemacs")
      (description
       "This package provides integration between LSP mode and treemacs, and
implementation of treeview controls using treemacs as a tree renderer.")
      (license (list license:gpl3+
                     license:cc-by4.0  ; microsoft/vscode-icons
                     license:expat)))))

;; (define* (%emacs-lsp-treemacs-upstream-source #:key commit version hash)
;;   (origin
;;     (method git-fetch)
;;     (uri (git-reference
;;           (url "https://github.com/emacs-lsp/lsp-treemacs.git")
;;           (commit commit)))
;;     (file-name (git-file-name "emacs-lsp-treemacs" version))
;;     (hash hash)))

;; (define-public emacs-lsp-treemacs
;;   (package
;;     (name "emacs-lsp-treemacs")
;;     (version "0.5")
;;     (source
;;      (origin
;;        (method (@@ (guix packages) computed-origin-method))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256 #f)
;;        (uri
;;         (delay
;;           (with-imported-modules '((guix build emacs-utils)
;;                                    (guix build utils))
;;             #~(begin
;;                 (use-modules (guix build utils)
;;                              (guix build emacs-utils))
;;                 (let* ((dir (string-append "emacs-lsp-treemacs-" #$version)))
;;                   (set-path-environment-variable
;;                    "PATH" '("bin")
;;                    (list #+emacs-minimal
;;                          #+(canonical-package bash)
;;                          #+(canonical-package coreutils)
;;                          #+(canonical-package gzip)
;;                          #+(canonical-package tar)))
;;                   ;; Copy the upstream source
;;                   (copy-recursively
;;                    #+(%emacs-lsp-treemacs-upstream-source
;;                       #:commit version #:version version
;;                       #:hash
;;                       (content-hash
;;                        "0clifff6xhi1irmx08wjdl13vlh05a7c108hmzzqmmklg76zyr04"))
;;                    dir)
;;                   (with-directory-excursion dir
;;                     ;; The icons are unclearly licensed and possibly non-free,
;;                     ;; see <https://github.com/emacs-lsp/lsp-treemacs/issues/123>
;;                     (with-directory-excursion "icons"
;;                       (for-each delete-file-recursively
;;                                 '("eclipse" "idea" "netbeans")))
;;                     ;; Also remove any mentions in the source code.
;;                     (make-file-writable "lsp-treemacs-themes.el")
;;                     (emacs-batch-edit-file "lsp-treemacs-themes.el"
;;                       '(progn
;;                         (while (search-forward-regexp
;;                                 "(treemacs-create-theme \"\\([^\"]*\\)\""
;;                                 nil t)
;;                           (pcase (match-string 1)
;;                                  ("Iconless" nil)
;;                                  (_ (beginning-of-line)
;;                                     (kill-sexp)))
;;                           (basic-save-buffer)))))
;;                   (invoke "tar" "cvfa" #$output
;;                           "--mtime=@0"
;;                           "--owner=root:0"
;;                           "--group=root:0"
;;                           "--sort=name"
;;                           "--hard-dereference"
;;                           dir))))))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list #:include #~(cons "^icons\\/" %default-include)))
;;     (propagated-inputs
;;      (list emacs-lsp-mode emacs-treemacs))
;;     (home-page "https://github.com/emacs-lsp/lsp-treemacs")
;;     (synopsis "Integration between LSP mode and treemacs")
;;     (description
;;      "This package provides integration between LSP mode and treemacs,
;; and implementation of treeview controls using treemacs as a tree renderer.")
;;     (license (list license:gpl3+
;;                    license:cc-by4.0  ; microsoft/vscode-icons
;;                    license:expat))))

(define-public emacs-pdf-tools
  (package
    (name "emacs-pdf-tools")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vedang/pdf-tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1v861fpzck3ky21m4g42h6a6y0cbhc4sjzpzqx0zxd7sfi7rn768"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; there are no tests
       #:modules ((guix build gnu-build-system)
                  ((guix build emacs-build-system) #:prefix emacs:)
                  (guix build utils)
                  (guix build emacs-utils)
                  ((bost guix build emacs-utils) #:prefix bst:))
       #:imported-modules (,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils)
                           (bost guix build emacs-utils))
       #:phases
       (modify-phases %standard-phases
         ;; Build server side using 'gnu-build-system'.
         (add-after 'unpack 'enter-server-dir
           (lambda _ (chdir "server")))
         (add-after 'enter-server-dir 'autogen
           (lambda _
             (invoke "bash" "autogen.sh")))
         ;; Build emacs side using 'emacs-build-system'.
         (add-after 'compress-documentation 'enter-lisp-dir
           (lambda _ (chdir "../lisp")))
         (add-after 'enter-lisp-dir 'emacs-patch-variables
           (lambda* (#:key outputs #:allow-other-keys)
             (for-each make-file-writable (find-files "."))

             ;; Set path to epdfinfo program.
             (emacs-substitute-variables "pdf-info.el"
               ("pdf-info-epdfinfo-program"
                (string-append (assoc-ref outputs "out")
                               "/bin/epdfinfo")))
             ;; Set 'pdf-tools-handle-upgrades' to nil to avoid "auto
             ;; upgrading" that pdf-tools tries to perform.
             (emacs-substitute-variables "pdf-tools.el"
               ("pdf-tools-handle-upgrades" '()))))
         (add-after 'enter-lisp-dir 'emacs-make-autoloads
           (assoc-ref emacs:%standard-phases 'make-autoloads))
         (add-after 'emacs-patch-variables 'emacs-expand-load-path
           (assoc-ref emacs:%standard-phases 'expand-load-path))
         (add-after 'emacs-expand-load-path 'emacs-add-install-to-native-load-path
           (assoc-ref emacs:%standard-phases 'add-install-to-native-load-path))
         (add-after 'emacs-add-install-to-native-load-path 'emacs-install
           (assoc-ref emacs:%standard-phases 'install))
         (add-after 'emacs-install 'emacs-build
           (assoc-ref emacs:%standard-phases 'build))
         ;; The `ensure-package-description' is defined in the
         ;; emacs-build-system The `gnu-build-system' doesn't contain it.
         (add-after 'unpack 'add-needed-pkg-descriptions
           (lambda* (#:key outputs #:allow-other-keys)
             (with-directory-excursion "lisp"
               (bst:write-pkg-file "pdf-tools")))))))
    (native-inputs
     (list
      autoconf
      automake
      emacs-minimal
      pkg-config
      ))
    (inputs
     (list
      cairo
      glib
      libpng
      poppler
      zlib
      ))
    (propagated-inputs
     (list
      emacs-tablist
      ))
    (home-page "https://github.com/vedang/pdf-tools")
    (synopsis "Emacs support library for PDF files")
    (description
     "PDF Tools is, among other things, a replacement of DocView for PDF
files.  The key difference is that pages are not pre-rendered by
e.g. ghostscript and stored in the file-system, but rather created on-demand
and stored in memory.")
    (license license:gpl3+)))

(define-public emacs-pdf-view-restore
  (let ((commit "758131fbcba6a16388e6dd6b55eb4a9998f57123")
        (revision "0"))
    (package
      (name "emacs-pdf-view-restore")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/007kevin/pdf-view-restore.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0z7yxc8pls6pc3zzm0g1g3xdrkj8mwjfsf2fvdqnj7cbv8c7krrb"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pdf-tools))
      (home-page "https://github.com/007kevin/pdf-view-restore")
      (synopsis "Support for opening last known pdf position in pdfview mode")
      (description
       "Support for saving and opening last known pdf position in pdfview mode.
Information will be saved relative to the pdf being viewed so ensure
`pdf-view-restore-filename is in the same directory as the viewing pdf.")
      (license license:gpl3+))))

(define-public emacs-helm
  (let ((commit "7f6137bb8e9fc9415cd1ffc53bb119f1c4ca4cc4")
        (revision "0"))
    (package
      (name "emacs-helm")
      (version (git-version "4.0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "19096kj95yn8l54bmab7b15xg5l1sfbpn8s5dq2dpi40k8flfgkh"))))
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
                (bst:write-pkg-file "helm-core")
                (bst:write-pkg-file "helm-easymenu")
                (bst:write-pkg-file "helm-files")
                (bst:write-pkg-file "helm-net")
                )))))
      (propagated-inputs
       (list
        emacs-async
        emacs-popup
        ))
      (home-page "https://emacs-helm.github.io/helm/")
      (synopsis "Incremental completion and selection narrowing framework for Emacs")
      (description
       "Helm is an incremental completion and selection narrowing framework for
Emacs.  It will help steer you in the right direction when you're looking for
stuff in Emacs (like buffers, files, etc).")
      (license license:gpl3+))))

;; 1. <path/to/spacemacs>/layers/+checkers/spell-checking/packages.el requires flyspell-correct-helm
;; 2. flyspell-correct-helm requires helm
;; 3. helm requires helm-core
;; See (configuration-layer//get-package-deps-from-archive 'flyspell-correct-helm)
(define-public emacs-helm-core
  (package
    (inherit emacs-helm)
    (name "emacs-helm-core")))

(define-public emacs-helm-sly
  (let ((commit "3691626c80620e992a338c3222283d9149f1ecb5")
        (revision "0"))
    (package
      (name "emacs-helm-sly")
      (version (git-version "0.7.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-sly.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "06x8wyx1r0s7askkvlbklgz1cszv34qsvv3gryndw350smk1v8kx"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-sly))
      (home-page "https://github.com/emacs-helm/helm-sly")
      (synopsis "Helm for SLY, a Common Lisp interaction mode for Emacs")
      (description "Helm-SLY defines a few new commands:

@itemize
@item @code{helm-sly-list-connections}: Yet another Lisp connection list with
Helm.
@item @code{helm-sly-apropos}: Yet another @command{apropos} with Helm.
@item @code{helm-sly-mini}: Like @command{helm-sly-list-connections}, but
include an extra source of Lisp-related buffers, like the events buffer or the
scratch buffer.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-slime
  (let ((commit "7886cc49906a87ebd73be3b71f5dd6b1433a9b7b")
        (revision "0"))
    (package
      (name "emacs-helm-slime")
      (version (git-version "0.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-slime.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1g9fnp818d677xhx2m4820742fyblvmnsygmkdb5530lacdaksh2"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-slime))
      (home-page "https://github.com/emacs-helm/helm-slime")
      (synopsis "Helm for SLIME, the Superior Lisp Interaction Mode for Emacs")
      (description "Helm-SLIME defines a few new commands:

@itemize
@item helm-slime-complete: Select a symbol from the SLIME completion systems.
@item helm-slime-list-connections: Yet another slime-list-connections with Helm.
@item: helm-slime-apropos: Yet another slime-apropos with Helm.
@item helm-slime-repl-history: Select an input from the SLIME REPL history and insert it.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-ls-git
  (let ((commit "754c0c27a11a416a1589ea67be7cd57ce5017d02")
        (revision "0"))
    (package
      (name "emacs-helm-ls-git")
      (version (git-version "1.9.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-ls-git.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0mx9mwgldmky4alyk0rc0908cih2ndpd4lxqrfj7m291dyxik458"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-ls-git")
      (synopsis "Helm interface for listing the files in a Git repository")
      (description
       "This package provides a Helm interface for Git files.
@itemize
@item Display the open buffers in project.
@item Display a status source showing state of project (modified files etc.).
@item Display a list of all files in project under git control.
@item Quickly look at diffs of modified files.
@item Allow switching to @code{git status} with your preferred frontend
(vc-dir, Magit,etc.).
@item Full integration of git-grep, also allow usage of @code{helm-grep} (you
can use ack-grep instead of grep).
@item Integrate usage of gid from id-utils.
@item Full integration with @code{helm-find-files}, allow you to browse
projects unrelated to current-buffer.
@item In addition, all actions of type files and buffers are provided.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-company
  (let ((commit "033be73f21778633813264ce1634a6e1ad873d8e")
        (revision "0"))
    (package
      (name "emacs-helm-company")
      (version (git-version "0.2.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Sodel-the-Vociferous/helm-company.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lschnr15c39bnfvm2zdp7f3qvyzrdk8gzzwcb1g2d9jy3mkcq05"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        emacs-company
        ))
      (native-inputs
       (list emacs-ert-runner))
      (arguments
       (list #:tests? #t
             #:test-command #~(list "ert-runner")))
      (home-page "https://github.com/Sodel-the-Vociferous/helm-company")
      (synopsis "Helm interface for Company mode")
      (description
       "This is a Helm interface to Company mode, a text completion framework.")
      (license license:gpl3+))))

(define-public emacs-helm-descbinds
  (let ((commit "c12bc85ef3ce342fe1c78cdd86117c05d5310789")
        (revision "1"))
    (package
      (name "emacs-helm-descbinds")
      (version (git-version "1.13" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-descbinds.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0dfm8a8dc3a75pizkjl6304aqx2m9yaqcjk8j0d802ad0zk31g64"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-descbinds")
      (synopsis "Convenient @code{describe-bindings} with Helm")
      (description
       "This package is a replacement of @code{describe-bindings} for Helm.
@code{describe-bindings} is replaced with @code{helm-descbinds}.  As usual,
type @code{C-h b}, or any incomplete key sequence plus @code{C-h}, to run
@code{helm-descbinds}.  The bindings are presented in a similar way as
@code{describe-bindings} does, but you can use completion to find the command
you searched for and execute it, or view its documentation.")
    (license license:gpl3+))))

;; XXX the repo https://github.com/istib/helm-mode-manager doesn't exist anymore?!?
(define-public emacs-helm-mode-manager
  (package
    (name "emacs-helm-mode-manager")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/istib/helm-mode-manager")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1srx5f0s9x7zan7ayqd6scxfhcvr3nkd4yzs96hphd87rb18apzk"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-helm))
    (home-page "https://github.com/istib/helm-mode-manager/")
    (synopsis "Switch and toggle Emacs major and minor modes using Helm")
    (description "This package provides a Helm interface for toggling Emacs
major or minor mode.

@itemize
@item @code{helm-switch-major-mode} list of all major modes
@item @code{helm-enable-minor-mode} list of all inactive minor modes
@item @code{helm-disable-minor-mode} list of all ACTIVE minor modes
@end itemize\n

Hitting @code{RET} enables the mode, @code{C-z} shows the mode
documentation.")
    (license license:gpl3+)))

(define-public emacs-helm-org-rifle
  (let ((commit "03a52265040b8c6510a8269213d750c451779c38")
        (revision "0"))
    (package
      (name "emacs-helm-org-rifle")
      (version (git-version "1.7.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/helm-org-rifle.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wgphpa9qymrc36i4wniwm9dddx6inmj2mdv7hkb1kbld3b5apsg"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-helm
        emacs-org
        emacs-s
        ))
      (home-page "https://github.com/alphapapa/helm-org-rifle")
      (synopsis "Rifle through Org files")
      (description "This package searches both headings and contents of entries
in Org buffers and displays matching entries.")
      (license license:gpl3+))))

(define-public emacs-helm-system-packages
  (let ((commit "6e02e90ff653f06f2bb469dac09d8c8ac8ce0982")
        (revision "0"))
    (package
      (name "emacs-helm-system-packages")
      (version (git-version "1.10.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-system-packages.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0c988h9sxcrdxriq3lp27vn0sgwdx5ln4l25m03zbi8fik46vr38"))))
      (build-system emacs-build-system)
      (inputs
       (list recutils))
      (propagated-inputs
       (list emacs-helm))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'configure
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let ((recutils (assoc-ref inputs "recutils")))
                 ;; Specify the absolute file names of the various
                 ;; programs so that everything works out-of-the-box.
                 (substitute* "helm-system-packages-guix.el"
                   (("recsel") (string-append recutils "/bin/recsel")))))))))
      (home-page "https://github.com/emacs-helm/helm-system-packages")
      (synopsis "Helm System Packages is an interface to your package manager")
      (description "List all available packages in Helm (with installed
packages displayed in their own respective face).  Fuzzy-search, mark and
execute the desired action over any selections of packages: Install,
uninstall, display packages details (in Org Mode) or insert details at point,
find files owned by packages...  And much more, including performing all the
above over the network.")
      (license license:gpl3+))))

(define-public emacs-helm-xref
  (let ((commit "ea0e4ed8a9baf236e4085cbc7178241f109a53fa")
        (revision "0"))
    (package
      (name "emacs-helm-xref")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/brotzeit/helm-xref.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xbz6idr1fnqkqh0fsn9bhwavng6b2s4idc2l302s2vziygcm42d"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/brotzeit/helm-xref")
      (synopsis "Helm interface for @code{xref}")
      (description "This package provides a Helm interface for selecting
@code{xref} results.")
      (license license:gpl3+))))

(define-public emacs-helm-cider
  (let ((commit "fe7e48befdb0b20ea1b0fb3626a8a725e54ae626")
        (revision "0"))
    (package
      (name "emacs-helm-cider")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/clojure-emacs/helm-cider.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0kj3465klq4a1awfp5xzk9rvrz3gv9n6d8b1k1lsmh4vvm4bsb6g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-cider))
      (home-page "https://github.com/clojure-emacs/helm-cider")
      (synopsis "Helm interface to Clojure's CIDER")
      (description "Helm-CIDER adds Helm interfaces to
@command{cider-apropos}, @command{cider-apropos-documentation},
@command{cider-browse-ns} (namespaces).

It also provides original Helm commands: @command{helm-cider-spec},
@command{helm-cider-spec-ns}, @command{helm-cider-repl-history},
@command{helm-cider-cheatsheet}.")
      (license license:gpl3+))))

(define-public emacs-helm-cider-history
  (let ((commit "c391fcb2e162a02001605a0b9449783575a831fd")
        (revision "0"))
    (package
      (name "emacs-helm-cider-history")
      (version "0.0.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Kungi/helm-cider-history.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "18j4ikb3q8ygdq74zqzm83wgb39x7w209n3186mm051n8lfmkaif"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        ))
      (home-page
       "https://github.com/Kungi/helm-cider-history")
      (synopsis "Helm interface for CIDER REPL input history in Emacs")
      (description
       "Helm interface to browse and reuse CIDER REPL input history within
 Emacs.  It displays past REPL inputs in a Helm buffer, allowing users to
search and insert previous expressions efficiently.  The interface supports
multiline entries and integrates seamlessly with CIDER and Helm.")
      (license license:gpl3+))))

(define-public emacs-helm-css-scss
  (let ((commit "2169d83d8fdc661241df208cb3235112735d936e")
        (revision "0"))
    (package
      (name "emacs-helm-css-scss")
      (version (git-version "1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-css-scss.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jjjw7fw2ngrpgvd599vjd291zr8zr1m7xnxfq2dpqc3mf0s397z"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-css-scss")
      (synopsis "Helm interface for navigating CSS/SCSS/LESS selectors in Emacs")
      (description
       "Helm-powered interface for browsing and navigating CSS, SCSS, and LESS
 selectors within Emacs.  It allows users to view all selectors at once, jump
 to their definitions, and insert closing comments after braces.  The tool
 supports multiple buffers, enhancing efficiency in managing stylesheets.")
      (license license:gpl3+))))

(define-public emacs-helm-dictionary
  (let ((commit "725cc0df42ad57a7902c330065d9e8ee1216791c")
        (revision "0"))
    (package
      (name "emacs-helm-dictionary")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-dictionary.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ipia68s5x1ny6w99g56hfcnhphlz7zh7bhmrrjyv3aflr7d3170"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        ;; emacs-helm-easymenu ;; part of emacs-helm
        ;; emacs-helm-net      ;; part of emacs-helm
        ))
      (home-page "https://github.com/emacs-helm/helm-dictionary")
      (synopsis "Dictionary search interface for Emacs using Helm")
      (description
       "Helm-powered dictionary search interface for Emacs with support for
 various dictionary sources and intuitive access of definitions.")
      (license license:gpl3+))))

(define-public emacs-helm-git-grep
  (let ((commit "744cea07dba6e6a5effbdba83f1b786c78fd86d3")
        (revision "0"))
    (package
      (name "emacs-helm-git-grep")
      (version (git-version "0.10.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yasuyk/helm-git-grep.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "172m7wbgx9qnv9n1slbzpd9j24p6blddik49z6bq3zdg1vlnf3dv"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'fix-make-obsolete
              (lambda _
                (invoke
                 "sed" "--in-place" "742s/make-obsolete/make-obsolete-variable/"
                 "helm-git-grep.el"))))))
      (propagated-inputs
       (list
        emacs-helm
        ;; emacs-helm-core  ;; part of emacs-helm
        ;; emacs-helm-files ;; part of emacs-helm
        ))
      (home-page "https://github.com/yasuyk/helm-git-grep")
      (synopsis "Helm interface for an incremental Git grep in Emacs")
      (description
       "This package provides a Helm interface for Git's grep functionality
 within Emacs.  It allows users to perform searches across a Git
 repository,including submodules, and view results in an interactive Helm
 buffer.  Features include opening results in other windows or frames,
 toggling case sensitivity during searches, and saving search results to a
 writable grep buffer for further editing.  Integration with tools like wgrep
 enhances the usability of search results.")
      (license license:gpl3+))))

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
      (propagated-inputs
       (list
        emacs-helm
        python-wrapper
        ;; emacs-helm-core  ;; part of emacs-helm
        ))
      (home-page "https://github.com/emacsorphanage/helm-pydoc.git")
      (synopsis "Python documentation lookup with Helm in Emacs")
      (description
       "Helm interface for searching and viewing Python
 documentation.  It enables quick access to Python docstrings, module
documentation, and function descriptions, improving efficiency by integrating
comprehensive documentation lookup directly into the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-php-mode
  (let ((commit "462b62248f7b3c6550ceea1b44760ddd951ab7ab")
        (revision "0"))
    (package
      (name "emacs-php-mode")
      (version (git-version "1.27.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/php-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1krm4gs0z2n02j64sx9brp98lqxl2ygbwcjm1bssqdw19c8p7kps"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #true
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "../tests/php-mode-test.el"
                               "-f" "ert-run-tests-batch-and-exit")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'prepare-testing-bed
              (lambda _
                ;; This file is necessary for `php-project-root' test.
                (call-with-output-file "tests/project/1/.git"
                  (const #t))))
            (add-after 'prepare-testing-bed 'enter-source-directory
              (lambda _
                (chdir "lisp")))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "php-mode")
                (bst:write-pkg-file "company-php")
                )))))
      (propagated-inputs
       (list
        emacs-projectile
        ))
      (home-page "https://github.com/emacs-php/php-mode")
      (synopsis "Major mode for editing PHP code")
      (description
       "PHP mode is a major mode for editing PHP source code.  It's an extension
of C mode; thus it inherits all C mode's navigation functionality.  But it
colors according to the PHP grammar and indents according to the PEAR coding
guidelines.  It also includes a couple handy IDE-type features such as
documentation search and a source and class browser.")
      (license license:gpl3+))))

(define-public emacs-ac-php
  ;; The latest commit "3d724e518a897343b5ede0b976d6fb46c46bcc01" contains
  ;; changes in the definition/declaration/inclusion-file provided by phpctags
  ;; which is a binary file not included in this package emacs-ac-php-core
  (package
    (name "emacs-ac-php")
    (version "2.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xcwen/ac-php.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1yn5cc6cmj3hwqgmjj44dz847xn5k99kirj36qwc04q7vhl8z8k7"))))
    (build-system emacs-build-system)
    (arguments
     (list
      ;; Leads to
      ;;     native-compiler-error-empty-byte (".../ac-php-comm-tags-data.el" ...)
      ;; guix build -c 24 --with-input=emacs-minimal=emacs -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-ac-php)'
      #:exclude #~(cons* "ac-php-comm-tags-data.el" %default-exclude)
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
              (bst:write-pkg-file "ac-php-core")
              (bst:write-pkg-file "company-php")
              )))))
    (inputs
     (list
      emacs-auto-complete
      emacs-company
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-helm
      emacs-php-mode
      emacs-popup
      emacs-s
      emacs-xcscope
      ))
    (native-inputs
     (list
      emacs-ert-runner
      ))
    (home-page "https://github.com/xcwen/ac-php")
    (synopsis "Emacs Auto Complete & Company mode for PHP")
    (description
     "This package provides Auto Complete and Company back-ends for PHP.")
    (license license:gpl3+)))

;; Required by <path/to/spacemacs>/layers/+lang/php/packages.el
(define-public emacs-company-php
  (package
    (inherit emacs-ac-php)
    (name "emacs-company-php")))

;; Required from company-php
;; See <path/to/spacemacs>/layers/+lang/php/packages.el
(define-public emacs-ac-php-core
  (package
    (inherit emacs-ac-php)
    (name "emacs-ac-php-core")))

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
      (arguments (list #:tests? #f))
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

(define-public emacs-helm-org
  (let ((commit "4744ca7f8b35e17bafce9cb0093deb87a232699d")
        (revision "3"))
    (package
      (name "emacs-helm-org")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-org.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1vn9jn8pkrcgi9ayzw0w69a69jygfs6cjxcrd8jcykh907bnq9sp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-org")
      (synopsis "Helm interface to the Silver Searcher")
      (description
       "This package provides a frontend for grepping tools like ag and ack,
as well as features for editing search results.")
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
               (url "https://github.com/colonelpanic8/org-project-capture.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1wvw5y5s37p9j0m2ljp7n1s1casbhiyrcnfpvdghvdd0fk8wcybp"))))
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
                (bst:write-pkg-file "org-projectile")
                (bst:write-pkg-file "org-category-capture")

                ;; needed by emacs-org-projectile
                (bst:write-pkg-file "org-project-capture")

                (bst:write-pkg-file "org-project-capture-backend")
                )))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-helm
        emacs-helm-org
        emacs-projectile
        emacs-s
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

;; Required by <path/to/spacemacs>/layers/+emacs/org/packages.el
(define-public emacs-org-projectile
  (package
    (inherit emacs-org-project-capture)
    (name "emacs-org-projectile")))

(define-public emacs-org-category-capture
  (package
    (inherit emacs-org-project-capture)
    (name "emacs-org-category-capture")))

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
        emacs-helm))
      (home-page "https://github.com/benedicthw/helm-comint.git")
      (synopsis "Helm interface for navigating Comint prompts in Emacs")
      (description
       "Helm interface for accessing prompts in Emacs' Comint buffers, such as
 shell or REPL sessions.  It allows users to quickly navigate to previous
prompts using Helm's incremental search capabilities.  Originally part of Helm
core, it now exists as a standalone user-contributed package.")
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
               (url "https://github.com/bmag/helm-purpose.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xh6v5xlf1prgk6mrvkc6qa0r0bz74s5f4z3dl7d00chsi7i2m5v"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-window-purpose
        emacs-helm
        ))
      (home-page "https://github.com/bmag/helm-purpose")
      (synopsis "Helm integration for Purpose-based window management in Emacs")
      (description
       "Helm commands and sources tailored for the Purpose window management system
 in Emacs.  It includes commands like
`helm-purpose-switch-buffer-with-purpose`to list buffers by purpose and
`helm-purpose-mini-ignore-purpose` to bypass Purpose constraints.  Users can
enable these features by calling `helm-purpose-setup` in their configuration.")
      (license license:gpl3+))))

(define-public emacs-helm-mu
  (let ((commit "d0bbc46338337d92b58708b906b40d0e12ae8006")
        (revision "1"))
    (package
      (name "emacs-helm-mu")
      (version (git-version  "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-mu.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0l7cysci0cmg0mg64gjxismkwqc3rfwl4ixjz5a0434zc1pg502j"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        mu))
      (home-page "https://github.com/emacs-helm/helm-mu")
      (synopsis "Helm sources for searching emails and contacts")
      (description
       "Helm sources for searching emails and contacts using @code{mu} and
@code{mu4e}.  Mu is an indexer for maildirs and mu4e is a mutt-like MUA for
Emacs build on top of mu.  Mu is highly efficient making it possible to get
instant results even for huge maildirs.  It also provides search operators,
e.g: @code{from:Peter to:Anne flag:attach search term}.")
      (license license:gpl3+))))

(define-public emacs-ace-jump-helm-line
  (let ((commit "1483055255df3f8ae349f7520f05b1e43ea3ed37")
        (revision "0"))
    (package
      (name "emacs-ace-jump-helm-line")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cute-jumper/ace-jump-helm-line")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "191a2g1if1jliikbxkpwmvlp4v1sp541j71xrlymili8ygm0idq5"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-avy emacs-helm))
      (home-page "https://github.com/cute-jumper/ace-jump-helm-line")
      (synopsis "Ace-jump to a candidate in Helm window")
      (description
       "This package allows using Ace jump to a candidate in Helm window.")
      (license license:gpl3+))))

(define-public emacs-helm-gtags
  (package
    (name "emacs-helm-gtags")
    (version "1.5.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/syohex/emacs-helm-gtags")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kc1jzk10nfd2v20g8dwnb6a944afrwdwnkzl06w4ba8k4yim7gi"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list emacs-helm))
    (home-page "https://github.com/syohex/emacs-helm-gtags")
    (synopsis "Emacs Helm interface to GNU Global")
    (description
     "@code{emacs-helm-gtags} provides a Emacs Helm interface to GNU Global.")
    (license license:gpl3+)))

(define-public emacs-flymake-easy
  (let ((commit "048482a97294585c4833d0311e9254a81db39b6b")
        (revision "0"))
    (package
      (name "emacs-flymake-easy")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/flymake-easy.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08ijmbdz0cybh9jicvl0hx8j2kc13rmv11z2igl1psmj472989f1"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/purcell/flymake-easy")
      (synopsis "Helper library for building Flymake checkers in Emacs")
      (description
       "This package provides a helper function, `flymake-easy-load`, to
 simplify the creation of Flymake syntax checkers in Emacs.  It streamlines
 the setup process by handling common boilerplate code, allowing developers to
 define new checkers with minimal effort.  This utility is particularly useful
 for integrating external linting tools into Emacs' on-the-fly syntax checking
 system.")
      (license license:gpl3+))))

(define-public emacs-flymake-phpcs
  (let ((commit "65ef3ff8ac1e1f48c8cbe66f273835c73680b991")
        (revision "0"))
    (package
      (name "emacs-flymake-phpcs")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/flymake/flymake-phpcs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "13w251mgr8lvlwa8nj51gyikaiqjbyggc4dh92phf148135jam3l"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-flymake-easy))
      (home-page "https://github.com/flymake/flymake-phpcs")
      (synopsis "Flymake integration for PHP CodeSniffer in Emacs")
      (description
       "This package integrates PHP CodeSniffer with Emacs' Flymake mode,
 providing on-the-fly syntax checking for PHP code. It highlights coding
 standard violations as you type, enhancing code quality and adherence to
 defined standards. Users can customize the coding standard and specify the
 location of the `phpcs` command. Note: The package requires `flymake-easy`
 and a working installation of PHP CodeSniffer.")
      (license license:gpl3+))))

(define-public emacs-drupal-mode
  (let ((commit "3f91d1d44df11ebd0137a896055fca6a1bb2f554")
        (revision "0"))
    (package
     (name "emacs-drupal-mode")
     (version (git-version "20240816.1236" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arnested/drupal-mode")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0gia6qrzdai0qa903gnxvnfn5mnva577jdf8zccz3i3f2ki02ygb"))))
     (build-system emacs-build-system)
     (arguments
      (list
       #:tests? #f
       #:include #~(cons* "^drupal/.*\\.el$" %default-include)
       #:phases
       #~(modify-phases
          %standard-phases
          (add-after
           'unpack 'move-source-files
           (lambda _
             (substitute*
              "drupal/flymake-phpcs.el"
              (("\\(define-obsolete-variable-alias 'drupal/flymake-phpcs-standard 'drupal/phpcs-standard\\)")
               "(define-obsolete-variable-alias 'drupal/flymake-phpcs-standard 'drupal/phpcs-standard \"28.1\")"
               )
              (("\\(define-obsolete-variable-alias 'drupal/flymake-phpcs-dont-show-trailing-whitespace 'drupal/phpcs-dont-show-trailing-whitespace\\)")
               "(define-obsolete-variable-alias 'drupal/flymake-phpcs-dont-show-trailing-whitespace 'drupal/phpcs-dont-show-trailing-whitespace \"28.1\")"
               )))))))
     (propagated-inputs
      (list
       emacs-flymake-phpcs
       emacs-helm-gtags
       emacs-ggtags
       emacs-flycheck
       emacs-php-mode
       global ;; provides gtags
       ))
     (home-page "https://github.com/arnested/drupal-mode")
     (synopsis "Advanced minor mode for Drupal development")
     (description
      "Drupal mode is an advanced minor mode for developing in Drupal.  Drupal mode is
based on top of PHP mode and defines among other things indentation etc.  to
match Drupal Coding Standards.")
     (license license:gpl3+))))

(define-public emacs-avy-menu
  (let ((commit "621052484b80cb13c12a368aedda1c3a209d2c88")
        (revision "0"))
    (package
      (name "emacs-avy-menu")
      (version (git-version "0.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mrkkrp/avy-menu.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0cap4xbn3irmgjazdjrw3mmw04ljx8wzlhs9f46avx7cj1hdh46i"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-avy))
      (home-page "https://github.com/mrkkrp/avy-menu")
      (synopsis "Library providing avy-powered popup menu")
      (description
       "The library provides an Avy-powered popup menu.  It is used in (at
 least) the following packages: * `ace-popup-menu * `char-menu *
 `hasky-extensions It can also be used directly.")
      (license license:gpl3))))

(define-public emacs-flyspell-correct
  (let ((commit "1e7a5a56362dd875dddf848b9a9e25d1395b9d37")
        (revision "0"))
    (package
      (name "emacs-flyspell-correct")
      (version (git-version "0.6.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/d12frosted/flyspell-correct.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q6y40mm6z5ifngwzah9ax6z9dlka3rw3q1am08hmia15vk7bx4g"))))
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
                (bst:write-pkg-file "flyspell-correct-avy-menu")
                (bst:write-pkg-file "flyspell-correct-helm"))))))
      (propagated-inputs
       (list
        emacs-avy-menu
        emacs-helm
        emacs-ivy
        emacs-popup
        ))
      (home-page "https://github.com/d12frosted/flyspell-correct")
      (synopsis "Correcting words with flyspell via custom interfaces")
      (description
       "This package provides functionality for correcting words via custom
interfaces.  Several interfaces are supported beside the classic Ido: Popup,
Helm and Ivy.")
      (license license:gpl3+))))

;; Required by <path/to/spacemacs>/layers/+checkers/spell-checking/packages.el
(define-public emacs-flyspell-correct-helm
  (package
    (inherit emacs-flyspell-correct)
    (name "emacs-flyspell-correct-helm")))

(define-public emacs-helm-fish-completion
  (let ((commit "1e7a5a56362dd875dddf848b9a9e25d1395b9d37")
        (revision "0"))
    (package
      (name "emacs-helm-fish-completion")
      (version (git-version "0.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-fish-completion.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1j2vfngq3512naaayv9kx0d1q2zg1xgs69l8afc7swg72h0l0imw"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-fish-completion))
      (home-page "https://github.com/emacs-helm/helm-fish-completion")
      (synopsis "Helm interface for Emacs fish-completion")
      (description "Helm Fish Completion is a Helm interface for Emacs
fish-completion.  It can be used in both Eshell and M-x shell.")
      (license license:gpl3+))))

(define-public emacs-helm-themes
  (let ((commit "1fc4a5d6114bc6c8c444c5ca73f22abe141a690d")
        (revision "0"))
    (package
      (name "emacs-helm-themes")
      (version (git-version "0.05" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-themes.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1j74a9ynhfcikl4r0v5lym2ansvgwm643qbmj5hknblpn8g6016c"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-themes")
      (synopsis "Emacs theme selection with Helm interface")
      (description
       "Helm Themes provide an Emacs theme selection with Helm interface.")
      (license license:gpl3+))))

(define-public emacs-helm-swoop
  (let ((commit "df90efd4476dec61186d80cace69276a95b834d2")
        (revision "0"))
    (package
      (name "emacs-helm-swoop")
      (version (git-version "3.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-swoop.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "01nrak72inmic9n30dval6608cfzsbv5izwzykbim46ifjhcipag"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-swoop")
      (synopsis "Filter and jump to lines in an Emacs buffer using Helm")
      (description
       "This package builds on the Helm interface to provide several commands
for search-based navigation of buffers.")
      (license license:gpl2+))))

(define-public emacs-helm-ag
  (let ((commit "a7b43d9622ea5dcff3e3e0bb0b7dcc342b272171")
       (revision "0"))
    (package
      (name "emacs-helm-ag")
      (version (git-version "0.64" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syohex/emacs-helm-ag.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1g2clyz5289wpahalvpdafz1d3cyqsm0g7ska0j2rlhqrcy9k2vc"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/syohex/emacs-helm-ag")
      (synopsis "Helm interface to the Silver Searcher")
      (description
       "This package provides a frontend for grepping tools like ag and ack,
as well as features for editing search results.")
      (license license:gpl3+))))

(define-public emacs-helm-projectile
  (let ((commit "041076e35a6663302a91a0fa672f847c7d64bf29")
        (revision "0"))
    (package
      (name "emacs-helm-projectile")
      (version (git-version "1.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bbatsov/helm-projectile.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1yhdc6h72crnlp46hbvs20c0fc9r1x7896z7rbp1z0i0hphsrs86"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-projectile))
      (home-page "https://github.com/bbatsov/helm-projectile")
      (synopsis "Helm integration for Projectile")
      (description
       "This Emacs library provides a Helm interface for Projectile.")
      (license license:gpl3+))))

(define-public emacs-helm-make
  (let ((commit "ebd71e85046d59b37f6a96535e01993b6962c559")
        (revision "0"))
    (package
      (name "emacs-helm-make")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/abo-abo/helm-make.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "14jvhhw4chl94dgfwbyy7yirwchvcz5zrsgr9w6qy4z0fhqba41a"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list emacs-helm emacs-ivy emacs-projectile))
      (home-page "https://github.com/abo-abo/helm-make")
      (synopsis "Select a Makefile target with helm")
      (description "@code{helm-make} or @code{helm-make-projectile} will give
you a @code{helm} selection of directory Makefile's targets.  Selecting a
target will call @code{compile} on it.")
      (license license:gpl3+))))

(define-public emacs-helm-c-yasnippet
  (let ((commit "65ca732b510bfc31636708aebcfe4d2d845b59b0")
        (revision "1"))
    (package
      (name "emacs-helm-c-yasnippet")
      (version (git-version "0.6.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-jp/helm-c-yasnippet.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cbafjqlzxbg19xfdqsinsh7afq58gkf44rsg1qxfgm8g6zhr7f8"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-yasnippet))
      (home-page "https://github.com/emacs-jp/helm-c-yasnippet")
      (synopsis "Helm integration for Yasnippet")
      (description "This Emacs library provides Helm interface for
Yasnippet.")
      (license license:gpl2+))))

(define-public emacs-avy-jump-helm-line
  (let ((commit "93a8c0039743a6fcf1f6a4eabe9736ed658b8da1")
        (revision "0"))
    (package
      (name "emacs-avy-jump-helm-line")
      (version (git-version "0.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sunlin7/avy-jump-helm-line.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256 (base32 "1d4dfjaxdp49xa50fhq4nm3q7iwpz9xsvp5qnqvicdk8dysdkr2p"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm emacs-avy))
      (home-page "https://github.com/sunlin7/avy-jump-helm-line")
      (synopsis "Helm interface for avy line-jumping in Emacs")
      (description
       "Interface combining Helm with avy for jumping to lines in Emacs.  It displays
line candidates in a Helm buffer and allows efficient navigation by selecting
a target line with avy-style key prompts.  The integration enhances movement
speed and accuracy within large buffers.")
      (license license:gpl3+))))

(define-public emacs-ellama
  (let ((commit "8281a9847b1a35df5433d93a8e7569bbe7ef1215")
        (revision "0"))
    (package
      (name "emacs-ellama")
      (version (git-version "1.8.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/s-kostyaev/ellama.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1abvrxa3np8aqkhfq8g7k7flavc5p70q2za1q9lsp5my1amnjy6p"))))
      (build-system emacs-build-system)
      (arguments
       (list
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
            (add-after 'unpack 'disable-failing-tests
              (lambda _
                (substitute* (find-files "tests/" "\\.el$")
                  (((string-append
                     "\\(ert-deftest "
                     "test-ellama-context-element-extract-info-node .*") all)
                   (string-append all "(skip-unless nil)\n")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "ellama")
                (bst:write-pkg-file "ellama-blueprint")
                (bst:write-pkg-file "ellama-community-prompts")
                (bst:write-pkg-file "ellama-context")
                (bst:write-pkg-file "ellama-manual")
                (bst:write-pkg-file "ellama-transient")
                )))
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "ellama.el"
                               "-l" "tests/test-ellama.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (propagated-inputs (list emacs-compat emacs-llm emacs-plz))
      (home-page "https://github.com/s-kostyaev/ellama")
      (synopsis "Tool for interacting with LLMs")
      (description
       "Ellama is a tool for interacting with large language models from Emacs.
It allows you to ask questions and receive responses from the LLMs.  Ellama
can perform various tasks such as translation, code review, summarization,
enhancing grammar/spelling or wording and more through the Emacs interface.
Ellama natively supports streaming output, making it effortless to use with
your preferred text editor.")
      (license license:gpl3+))))

(define-public emacs-gptel
  (let ((commit "73ee1f0f61187b7dd2640bd8192955e43922bf4f")
        (revision "0"))
    (package
      (name "emacs-gptel")
      (version (git-version "0.9.8.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/karthink/gptel.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0dn1qm18l4w4hrh8vdgpmxiyddym5mi08x9459lakyv7a6nimbv3"))))
      (build-system emacs-build-system)
      (arguments
       (list
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
            (add-after 'unpack 'use-appropriate-curl
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "gptel.el"
                  ("gptel-use-curl" (search-input-file inputs "/bin/curl")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "gptel")
                )))))
      (inputs (list curl))
      (propagated-inputs (list emacs-compat emacs-transient))
      (home-page "https://github.com/karthink/gptel")
      (synopsis "GPTel is a simple ChatGPT client for Emacs")
      (description
       "GPTel is a simple ChatGPT asynchronous client for Emacs with no external
dependencies.  It can interact with ChatGPT from any Emacs buffer with ChatGPT
responses encoded in Markdown or Org markup.  It supports conversations, not
just one-off queries and multiple independent sessions.  It requires an OpenAI
API key.")
      (license license:gpl3+))))

(define-public emacs-llm
  (let ((commit "6d6c88c20a2b485ade7bac53bdfb44ed8f91c279")
        (revision "0"))
    (package
      (name "emacs-llm")
      (version (git-version "0.27.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/ahyatt/llm.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0nxff3k43ccq7m75dd5d0lq47qi2wlbqpdvjkdnq1671xggaay1v"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; there are no tests
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
                (bst:write-pkg-file "llm")
                (bst:write-pkg-file "llm-azure")
                (bst:write-pkg-file "llm-claude")
                (bst:write-pkg-file "llm-deepseek")
                (bst:write-pkg-file "llm-fake")
                (bst:write-pkg-file "llm-gemini")
                (bst:write-pkg-file "llm-github")
                (bst:write-pkg-file "llm-gpt4all")
                ;; (bst:write-pkg-file "llm-integration-test")
                (bst:write-pkg-file "llm-llamacpp")
                (bst:write-pkg-file "llm-models")
                (bst:write-pkg-file "llm-ollama")
                (bst:write-pkg-file "llm-openai")
                ;; (bst:write-pkg-file "llm-prompt-test")
                (bst:write-pkg-file "llm-prompt")
                ;; (bst:write-pkg-file "llm-provider-utils-test")
                (bst:write-pkg-file "llm-provider-utils")
                (bst:write-pkg-file "llm-request-plz")
                ;; (bst:write-pkg-file "llm-test")
                ;; (bst:write-pkg-file "llm-tester")
                (bst:write-pkg-file "llm-vertex")
                )))))
      (propagated-inputs (list emacs-plz emacs-plz-event-source
                               emacs-plz-media-type))
      (home-page "https://github.com/ahyatt/llm")
      (synopsis "Emacs library abstracting Large Language Model capabilities")
      (description
       "This package provides interfaces to abstract various @acronym{LLM, large
language model}s out in the world.  To respect user freedom, it will warn you
before interacting with non-free LLMs.")
      (license license:gpl3+))))

(define-public emacs-transient
  (let ((commit "e9a636d3c7cbb9ac43ea4a08a1c252a02c7c3460")
        (revision "0"))
    (package
      (name "emacs-transient")
      (version (git-version "0.9.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/magit/transient.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1jadjjia70v9fk0wplhqmlfaqgfk6rm6ilxg7aq1xs3382yy5bv8"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f ;no test suite
        #:lisp-directory "lisp"
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
            (add-after 'unpack 'build-info-manual
              (lambda _
                (invoke "make" "--directory=.." "info")
                ;; Move the info file to lisp so that it gets
                ;; installed by the emacs-build-system.
                (rename-file "../docs/transient.info" "transient.info")))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "transient")
                )))))
      (native-inputs (list texinfo))
      (propagated-inputs (list emacs-compat))
      (home-page "https://magit.vc/manual/transient")
      (synopsis "Transient commands in Emacs")
      (description
       "Taking inspiration from prefix keys and prefix arguments
in Emacs, Transient implements a similar abstraction involving a prefix
command, infix arguments and suffix commands.  We could call this abstraction
a \"transient command\", but because it always involves at least two
commands (a prefix and a suffix) we prefer to call it just a \"transient\".")
      (license license:gpl3+))))

(define-public emacs-plz
  (let ((commit "e2d07838e3b64ee5ebe59d4c3c9011adefb7b58e")
        (revision "0"))
    (package
      (name "emacs-plz")
      (version (git-version "0.9.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/alphapapa/plz.el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "120q1443spcj153lns8ydwnpyrq6i5slpmsnm992anaxlf7drsdd"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f                       ;require internet access
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
            (add-after 'unpack 'substitute-curl-path
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "plz.el"
                  ("plz-curl-program" (search-input-file inputs "/bin/curl")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "plz")
                )))))
      (inputs (list curl))
      (home-page "https://github.com/alphapapa/plz.el")
      (synopsis "HTTP library for Emacs")
      (description
       "This package provides HTTP library for Emacs.  It uses Curl as a backend,
which avoids some of the issues with using Emacs’s built-in Url library.")
      (license license:gpl3+))))

(define-public emacs-plz-media-type
  (let ((commit "b1127982d53affff082447030cda6e8ead3899cb")
        (revision "0"))
      (package
        (name "emacs-plz-media-type")
        (version (git-version "0.2.4" revision commit))
        (source
         (origin
           (method git-fetch)
           (uri (git-reference
                  (url "https://github.com/r0man/plz-media-type.git")
                  (commit commit)))
           (file-name (git-file-name name version))
           (sha256
            (base32 "0k1c2z0minbaxdgfjxng8spivnnq8kqw6za4p46r7xlzx7m365qj"))))
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
                  (bst:write-pkg-file "plz-media-type")
                  )))))
        (propagated-inputs (list emacs-plz))
        (home-page "https://github.com/r0man/plz-media-type")
        (synopsis "HTTP media type extension for plz.el")
        (description
         "The @code{plz-media-type} library enhances MIME type handling for HTTP
requests within Emacs.  It leverages the Plz HTTP library for networking calls
and introduces a mechanism to process responses based on the content type
header.  This library defines various classes and methods for parsing and
processing standard MIME types, including JSON, XML, HTML, and binary data, in
a streaming and non-streaming way.")
        (license license:gpl3+))))

(define-public emacs-plz-event-source
  (let ((commit "de89214ce14e2b82cbfdc30e1adcf3e77b1f250a")
        (revision "0"))
    (package
      (name "emacs-plz-event-source")
      (version (git-version "0.1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/r0man/plz-event-source.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fh3pvksbyv16ml617wgwga2wjymvx0l6xyf7f4fyhffg5wkzbdl"))))
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
                (bst:write-pkg-file "plz-event-source")
                )))))
      (propagated-inputs (list emacs-plz-media-type))
      (home-page "https://github.com/r0man/plz-event-source")
      (synopsis "Server Sent Events extension for Plz")
      (description
       "The @code{plz-event-source} library provides a @code{plz-media-type},
a parser, and an event source implementation for the @acronym{SSE, Server Sent
Event} protocol.")
      (license license:gpl3+))))

(define-public emacs-org-rich-yank
  (let ((commit "8f73e833eac9c0eb686416962d5bdd369d80c1e8")
        (revision "0"))
    (package
      (name "emacs-org-rich-yank")
      (version (git-version "0.2.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/unhammer/org-rich-yank.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "09v5z7h2db5jllh3jy3wyprq9vs2xfv89zlxr74r3lsss0x0xnb5"))))
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
                (bst:write-pkg-file "org-rich-yank")
                )))))
      (home-page "https://github.com/unhammer/org-rich-yank")
      (synopsis "Surround source code pasted into Org with @code{#+BEGIN_SRC}
blocks")
      (description
       "This package provides a utility function for Org buffers that makes a
@code{_SRC} block with the appropriate language annotation for code that has
been copied from an Emacs major mode.")
      (license license:gpl2+))))

(define-public emacs-helpful
  (package
    (name "emacs-helpful")
    (version "0.21")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/helpful")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03afgdbs5nmhw833svrqky7fmfs1zlvqzcj7j5g29sakivs60xqc"))
       (patches (search-patches
                 "emacs-helpful-fix-signature.patch"
                 "emacs-helpful-fix-tests.patch"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-elisp-refs
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-s
      ))
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (home-page "https://github.com/Wilfred/helpful")
    (synopsis "More contextual information in Emacs help")
    (description "@code{helpful} is an alternative to the built-in Emacs help
that provides much more contextual information.

@itemize
@item Show the source code for interactively defined functions (unlike the
built-in Help).
@item Fall back to the raw sexp if no source is available.
@item Show where a function is being called.
@item Docstrings will Highlight the summary (the first sentence), include
cross-references, hide superfluous puncuation.
@item Show you the properties that have been applied to the current
symbol.  This provides visibility of features like edebug or byte-code
optimisation.
@item Provide a separate @code{helpful-command} function to view interactive
functions.
@item Display any keybindings that apply to interactive functions.
@item Trace, disassemble functions from inside Helpful.  This is discoverable
and doesn't require memorisation of commands.
@end itemize\n")
    (license license:gpl3+)))

(define-public emacs-mu4e-alert
  (let ((commit "d36eb0c1842dea51ee0465bb3751948c8886617c")
        (revision "1"))
    (package
      (name "emacs-mu4e-alert")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/xzz53/mu4e-alert")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "039kfpwgw0vi6fv2p4ixdh9qx9hdsahl48yl1niq00zmsp7rgg07"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ;no tests
      (propagated-inputs
       (list emacs-alert emacs-ht emacs-s mu))
      (home-page "https://github.com/xzz53/mu4e-alert")
      (synopsis "Desktop notifications and mode line display for mu4e")
      (description
       "This package provides desktop notifications for mu4e.
Additionally it can display the number of unread emails in the mode line.")
      (license license:gpl3+))))

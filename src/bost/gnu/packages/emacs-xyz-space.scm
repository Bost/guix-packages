(define-module (bost gnu packages emacs-xyz-space)
  #:use-module (utils)
  #:use-module (ice-9 pretty-print)
  #:use-module (srfi srfi-1) ;; sets, delete-duplicates
  #:use-module (srfi srfi-26)
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
  #:use-module (gnu packages emacs-xyz)
  )

;; rg --no-context-separator -A2 -N find-files emacs-xyz-space.scm --replace 'list'
(define paths-to-el-files
  (list
   (list "layers/+lang/restructuredtext/local/rst-lists" "rst-lists\\.el$")
   (list "core" "core-versions\\.el$")
   (list "core" "core-load-paths\\.el$")
   (list "core/libs/forks" "spacemacs-ht\\.el$")
   (list "core" "core-dotspacemacs\\.el$")
   (list "core" "core-spacemacs-buffer\\.el$")
   (list "core" "core-use-package-ext\\.el$")
   (list "core" "core-fonts-support\\.el$")
   (list "core" "core-command-line\\.el$")
   (list "core" "core-transient-state\\.el$")
   (list "core" "core-early-funcs\\.el$")
   (list "core" "core-documentation\\.el$")
   (list "core" "core-compilation\\.el$")
   (list "core" "core-env\\.el$")
   (list "core" "core-hooks\\.el$")
   (list "core" "core-display-init\\.el$")
   (list "core/aprilfool" "zemacs\\.el$")
   (list "layers/+misc/ietf/local/irfc" "irfc\\.el$")
   (list "core/libs" "package-build\\.el$")
   (list "core" "core-spacebind\\.el$")
   (list "core/libs" "package-build-badges\\.el$")
   (list "core" "core-custom-settings\\.el$")
   (list "core/libs" "ido-vertical-mode\\.el$")
   (list "core" "core-configuration-layer\\.el$")
   (list "core" "core-customization\\.el$")
   (list "core/libs/spacemacs-theme" "spacemacs-common\\.el$")
   (list "core/libs/spacemacs-theme" "spacemacs-theme\\.el$")
   ;; (list "core/libs" "page-break-lines\\.el$")
   (list "core/libs" "package-recipe-mode\\.el$")
   (list "layers/+themes/colors/local/nyan-mode" "nyan-mode\\.el$")
   (list "layers/+chat/erc/local/erc-yank" "erc-yank\\.el$")
   (list "core" "core-debug\\.el$")
   (list "core/libs/forks" "load-env-vars\\.el$")
   (list "core" "core-themes-support\\.el$")
   (list "core/libs" "mocker\\.el$")
   (list "core" "core-release-management\\.el$")
   (list "layers/+completion/compleseus/local/compleseus-spacemacs-help" "compleseus-spacemacs-help\\.el$")
   (list "layers/+chat/erc/local/erc-tex" "erc-tex\\.el$")
   (list "core" "core-keybindings\\.el$")
   (list "layers/+chat/erc/local/erc-sasl" "erc-sasl\\.el$")
   (list "core" "core-dumper\\.el$")
   (list "core" "core-cycle\\.el$")
   (list "layers/+emacs/org/local/ox-gfm" "ox-gfm\\.el$")
   (list "core" "core-jump\\.el$")
   (list "core/libs" "package-recipe\\.el$")
   (list "layers/+completion/helm/local/helm-spacemacs-help" "helm-spacemacs-faq\\.el$")
   (list "core/libs" "quelpa\\.el$")
   (list "layers/+completion/helm/local/helm-spacemacs-help" "helm-spacemacs-help\\.el$")
   (list "layers/+completion/ivy/local/ivy-spacemacs-help" "ivy-spacemacs-help\\.el$")
   (list "core" "core-funcs\\.el$")
   (list "layers/+tools/tmux/local/tmux" "tmux\\.el$")
   (list "core" "core-progress-bar\\.el$")
   (list "core" "core-micro-state\\.el$")
   (list "core" "core-toggle\\.el$")
   (list "core" "core-emacs-backports\\.el$")
   (list "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin" "spacemacs-purpose-popwin\\.el$")
   (list "layers/+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup" "spacemacs-whitespace-cleanup\\.el$")
   (list "layers/+spacemacs/spacemacs-defaults/local/help-fns+" "help-fns+\\.el$")
   (list "layers/+fun/games/local/helm-games" "helm-games\\.el$")
   (list "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode" "hybrid-mode\\.el$")
   (list "layers/+spacemacs/spacemacs-modeline/local/vim-powerline" "vim-colors\\.el$")
   (list "layers/+spacemacs/spacemacs-org/local/space-doc" "space-doc\\.el$")
   (list "layers/+tools/sphinx/local/rst-sphinx" "rst-sphinx\\.el$")
   (list "layers/+spacemacs/spacemacs-modeline/local/vim-powerline" "vim-powerline-theme\\.el$")
   (list "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired" "evil-unimpaired\\.el$")
   (list "layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state" "evil-evilified-state\\.el$")
   (list "layers/+tools/xclipboard/local/spacemacs-xclipboard" "spacemacs-xclipboard\\.el$")
   (list "layers/+tools/geolocation/extensions/theme-changer" "theme-changer\\.el$")
   (list "layers/+distributions/spacemacs-bootstrap/local/holy-mode" "holy-mode\\.el$")
   (list "layers/+lang/jr/local/jr-mode" "jr-mode\\.el$")
   (list "layers/+lang/restructuredtext/local/rst-directives" "rst-directives\\.el$")
   (list "core" "core-spacemacs\\.el$")
   ))

(define (listing-el-files)
  ((comp
    ;; (partial map (partial format #t "~s\n"))
    ;; (partial map (cut string-replace-substring <> "+" "\\+"))
    (cut sort <> string<?)
    (partial map (comp
                  (partial str "^")
                  (cut string-join <> "/"))))
   paths-to-el-files
   #;(take-smart 2 paths-to-el-files))
  )

(define (listing-el-paths)
  ((comp
    ;; (partial map (partial format #t "~s\n"))
    ;; (partial map (cut string-replace-substring <> "+" "\\+"))
    pretty-print
    (cut sort <> string<?)
    (partial map str)
    delete-duplicates
    (partial map car))
   paths-to-el-files
   ;; (take-smart 2 paths-to-el-files)
   )
  )

(define-public emacs-spacemacs
  (let ((commit "3792071e5912e88faf62b942396380e9bd223c67")
        (revision "0"))
    (package
      (name "emacs-spacemacs")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/spacemacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vjpjqw0s14iglnbyymjniix55ggr0jvbk5i4l9rvj3l0za3r7rr"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include
        #~(cons*
           ;; "core/core-versions\\.el$"

           "^layers/\\+lang/python/local/pylookup/pylookup\\.py$"
           "^layers/\\+lang/c-c\\+\\+/global_conf\\.py$"
           "^layers/\\+lang/python/local/pylookup/pylookup\\.el$"

           "^core/aprilfool/zemacs\\.el$"
           "^core/core-command-line\\.el$"
           "^core/core-compilation\\.el$"
           "^core/core-configuration-layer\\.el$"
           "^core/core-custom-settings\\.el$"
           "^core/core-customization\\.el$"
           "^core/core-cycle\\.el$"
           "^core/core-debug\\.el$"
           "^core/core-display-init\\.el$"
           "^core/core-documentation\\.el$"
           "^core/core-dotspacemacs\\.el$"
           "^core/core-dumper\\.el$"
           "^core/core-early-funcs\\.el$"
           "^core/core-emacs-backports\\.el$"
           "^core/core-env\\.el$"
           "^core/core-fonts-support\\.el$"
           "^core/core-funcs\\.el$"
           "^core/core-hooks\\.el$"
           "^core/core-jump\\.el$"
           "^core/core-keybindings\\.el$"
           "^core/core-load-paths\\.el$"
           "^core/core-micro-state\\.el$"
           "^core/core-progress-bar\\.el$"
           "^core/core-release-management\\.el$"
           "^core/core-spacebind\\.el$"
           "^core/core-spacemacs-buffer\\.el$"
           "^core/core-spacemacs\\.el$"
           "^core/core-themes-support\\.el$"
           "^core/core-toggle\\.el$"
           "^core/core-transient-state\\.el$"
           "^core/core-use-package-ext\\.el$"
           "^core/core-versions\\.el$"
           "^core/libs/forks/load-env-vars\\.el$"
           "^core/libs/forks/spacemacs-ht\\.el$"
           "^core/libs/ido-vertical-mode\\.el$"
           "^core/libs/mocker\\.el$"
           "^core/libs/package-build-badges\\.el$"
           "^core/libs/package-build\\.el$"
           "^core/libs/package-recipe-mode\\.el$"
           "^core/libs/package-recipe\\.el$"
           "^core/libs/quelpa\\.el$"
           "^core/libs/spacemacs-theme/spacemacs-common\\.el$"
           "^core/libs/spacemacs-theme/spacemacs-theme\\.el$"
           "^layers/\\+chat/erc/local/erc-sasl/erc-sasl\\.el$"
           "^layers/\\+chat/erc/local/erc-tex/erc-tex\\.el$"
           "^layers/\\+chat/erc/local/erc-yank/erc-yank\\.el$"
           "^layers/\\+completion/compleseus/local/compleseus-spacemacs-help/compleseus-spacemacs-help\\.el$"
           "^layers/\\+completion/helm/local/helm-spacemacs-help/helm-spacemacs-faq\\.el$"
           "^layers/\\+completion/helm/local/helm-spacemacs-help/helm-spacemacs-help\\.el$"
           "^layers/\\+completion/ivy/local/ivy-spacemacs-help/ivy-spacemacs-help\\.el$"
           "^layers/\\+distributions/spacemacs-bootstrap/local/evil-evilified-state/evil-evilified-state\\.el$"
           "^layers/\\+distributions/spacemacs-bootstrap/local/holy-mode/holy-mode\\.el$"
           "^layers/\\+distributions/spacemacs-bootstrap/local/hybrid-mode/hybrid-mode\\.el$"
           "^layers/\\+emacs/org/local/ox-gfm/ox-gfm\\.el$"
           "^layers/\\+fun/games/local/helm-games/helm-games\\.el$"
           "^layers/\\+lang/jr/local/jr-mode/jr-mode\\.el$"
           "^layers/\\+lang/restructuredtext/local/rst-directives/rst-directives\\.el$"
           "^layers/\\+lang/restructuredtext/local/rst-lists/rst-lists\\.el$"
           "^layers/\\+misc/ietf/local/irfc/irfc\\.el$"
           "^layers/\\+spacemacs/spacemacs-defaults/local/help-fns\\+/help-fns\\+\\.el$"
           "^layers/\\+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup/spacemacs-whitespace-cleanup\\.el$"
           "^layers/\\+spacemacs/spacemacs-evil/local/evil-unimpaired/evil-unimpaired\\.el$"
           "^layers/\\+spacemacs/spacemacs-modeline/local/vim-powerline/vim-colors\\.el$"
           "^layers/\\+spacemacs/spacemacs-modeline/local/vim-powerline/vim-powerline-theme\\.el$"
           "^layers/\\+spacemacs/spacemacs-org/local/space-doc/space-doc\\.el$"
           "^layers/\\+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin/spacemacs-purpose-popwin\\.el$"
           "^layers/\\+themes/colors/local/nyan-mode/nyan-mode\\.el$"
           "^layers/\\+tools/geolocation/extensions/theme-changer/theme-changer\\.el$"
           "^layers/\\+tools/sphinx/local/rst-sphinx/rst-sphinx\\.el$"
           "^layers/\\+tools/tmux/local/tmux/tmux\\.el$"
           "^layers/\\+tools/xclipboard/local/spacemacs-xclipboard/spacemacs-xclipboard\\.el$"
           %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-file
              (lambda* (#:key inputs #:allow-other-keys)

                ;; It seems like I need to add every directory-path to EMACSLOADPATH or
                ;; adjust the expand-load-path phase (see below)
                ;; (setenv "EMACSLOADPATH"
                ;;         (string-append (getcwd) "/test:"
                ;;                        (getenv "EMACSLOADPATH")))
                ;; (format #t "EMACSLOADPATH : ~a\n" (getenv "EMACSLOADPATH"))
                (define paths
                  (list
                   "core"
                   "core/aprilfool"
                   "core/libs"
                   "core/libs/forks"
                   "core/libs/spacemacs-theme"
                   "layers/+chat/erc/local/erc-sasl"
                   "layers/+chat/erc/local/erc-tex"
                   "layers/+chat/erc/local/erc-yank"
                   "layers/+completion/compleseus/local/compleseus-spacemacs-help"
                   "layers/+completion/helm/local/helm-spacemacs-help"
                   "layers/+completion/ivy/local/ivy-spacemacs-help"
                   "layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state"
                   "layers/+distributions/spacemacs-bootstrap/local/holy-mode"
                   "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode"
                   "layers/+emacs/org/local/ox-gfm"
                   "layers/+fun/games/local/helm-games"
                   "layers/+lang/jr/local/jr-mode"
                   "layers/+lang/restructuredtext/local/rst-directives"
                   "layers/+lang/restructuredtext/local/rst-lists"
                   "layers/+misc/ietf/local/irfc"
                   "layers/+spacemacs/spacemacs-defaults/local/help-fns+"
                   "layers/+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup"
                   "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
                   "layers/+spacemacs/spacemacs-modeline/local/vim-powerline"
                   "layers/+spacemacs/spacemacs-org/local/space-doc"
                   "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
                   "layers/+themes/colors/local/nyan-mode"
                   "layers/+tools/geolocation/extensions/theme-changer"
                   "layers/+tools/sphinx/local/rst-sphinx"
                   "layers/+tools/tmux/local/tmux"
                   "layers/+tools/xclipboard/local/spacemacs-xclipboard"))
                ;; (/ 1 0)

                (let ((python (search-input-file inputs "bin/python")))
                  (substitute* "layers/+lang/python/local/pylookup/pylookup.py"
                    (("/usr/bin/env python") python))
                  (substitute* "layers/+lang/c-c++/global_conf.py"
                    (("/usr/bin/env python") python))
                  (substitute* "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode/hybrid-mode.el"
                    ((";;; Code:")
                     ;; The following doesn't work. The macro must be autoloaded
                     ;; ";;; Code:\n(require 'core-funcs)"
                     (string-append
                      ";;; Code:\n\n"
                      ";;;###autoload\n"
                      "(defmacro spacemacs|dotspacemacs-backward-compatibility (variable default)
  \"Return `if' sexp for backward compatibility with old dotspacemacs
  values.\"
  `(if (boundp ',variable) ,variable ',default))"))))))
            ;; (replace 'expand-load-path
            ;;   (lambda args
            ;;     (with-directory-excursion
            ;;         "layers/+lang/python/local/pylookup"
            ;;       (apply (assoc-ref %standard-phases 'expand-load-path) args))))
            ;; (replace 'make-autoloads
            ;;   (lambda args
            ;;     (with-directory-excursion
            ;;         "layers/+lang/python/local/pylookup"
            ;;       (apply (assoc-ref %standard-phases 'make-autoloads) args))))
            ;; (replace 'install
            ;;   (lambda args
            ;;     (with-directory-excursion
            ;;         "layers/+lang/python/local/pylookup"
            ;;       (apply (assoc-ref %standard-phases 'install) args))))
            ;; (replace 'build
            ;;   (lambda args
            ;;     (with-directory-excursion
            ;;         "layers/+lang/python/local/pylookup"
            ;;       (apply (assoc-ref %standard-phases 'build) args))))
            )))
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

;; (define-public emacs-rst-lists
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-rst-lists")
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
;;                       "layers/+lang/restructuredtext/local/rst-lists"
;;                       "rst-lists\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-versions
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-versions")
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
;;                       "core"
;;                       "core-versions\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-load-paths
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-load-paths")
;;     (arguments
;;      (list
;;       #:tests? #f
;;       #:include #~(cons* "^core/.*" %default-include)
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           ;; Move the source files to the top level, which is included in
;;           ;; the EMACSLOADPATH.
;;           (add-after 'unpack 'move-source-files
;;             (lambda _
;;               (let ((el-files
;;                      (find-files
;;                       "core"
;;                       "core-load-paths\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files))))
;;           ;; TODO check user-emacs-directory
;;           (add-after 'move-source-files 'fix-user-emacs-directory
;;             (lambda _
;;               (substitute* "core-load-paths.el"
;;                 (("user-emacs-directory") "\"./\""))))

;;           (add-after 'unpacs 'fix-user-emacs-directory
;;             (lambda _
;;               (substitute* "core/core-load-paths.el"
;;                 (("user-emacs-directory") "\"./\""))))
;;           )))
;;     (propagated-inputs
;;      (list
;;       ;; emacs-spacemacs-theme
;;       ;; emacs-core-spacemacs-buffer
;;       ;; emacs-core-progress-bar
;;       ;; emacs-core-funcs
;;       ;; emacs-core-dotspacemacs
;;       ;; emacs-spacemacs-ht
;;       ;; python-wrapper
;;       ))
;;     ))

;; (define-public emacs-spacemacs-ht
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-spacemacs-ht")
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
;;                       "core/libs/forks"
;;                       "spacemacs-ht\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-dotspacemacs
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-dotspacemacs")
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
;;                       "core"
;;                       "core-dotspacemacs\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))
;;     (propagated-inputs
;;      (list
;;       emacs-core-load-paths
;;       ;; emacs-core-spacemacs-buffer
;;       ;; emacs-core-progress-bar
;;       ;; emacs-core-funcs
;;       ;; emacs-core-dotspacemacs
;;       ;; emacs-spacemacs-ht
;;       python-wrapper
;;       ))))

;; (define-public emacs-core-spacemacs-buffer
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-spacemacs-buffer")
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
;;                       "core"
;;                       "core-spacemacs-buffer\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))
;;     (propagated-inputs
;;      (list emacs-core-dotspacemacs))))

;; (define-public emacs-core-use-package-ext
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-use-package-ext")
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
;;                       "core"
;;                       "core-use-package-ext\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-fonts-support
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-fonts-support")
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
;;                       "core"
;;                       "core-fonts-support\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-command-line
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-command-line")
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
;;                       "core"
;;                       "core-command-line\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-transient-state
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-transient-state")
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
;;                       "core"
;;                       "core-transient-state\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-early-funcs
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-early-funcs")
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
;;                       "core"
;;                       "core-early-funcs\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-documentation
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-documentation")
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
;;                       "core"
;;                       "core-documentation\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-compilation
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-compilation")
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
;;                       "core"
;;                       "core-compilation\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-env
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-env")
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
;;                       "core"
;;                       "core-env\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-hooks
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-hooks")
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
;;                       "core"
;;                       "core-hooks\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-display-init
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-display-init")
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
;;                       "core"
;;                       "core-display-init\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-zemacs
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-zemacs")
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
;;                       "core/aprilfool"
;;                       "zemacs\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; ;; Upstream uses https://www.emacswiki.org/emacs/download/irfc.el
;; (define-public emacs-irfc
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-irfc")
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
;;                       "layers/+misc/ietf/local/irfc"
;;                       "irfc\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; ;; Upstream uses https://github.com/melpa/package-build
;; (define-public emacs-package-build
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-package-build")
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
;;                       "package-build\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-spacebind
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-spacebind")
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
;;                       "core"
;;                       "core-spacebind\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-package-build-badges
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-package-build-badges")
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
;;                       "package-build-badges\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-custom-settings
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-custom-settings")
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
;;                       "core"
;;                       "core-custom-settings\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; ;; Upstream uses https://github.com/creichert/ido-vertical-mode.el
;; (define-public emacs-ido-vertical-mode
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-ido-vertical-mode")
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
;;                       "ido-vertical-mode\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-configuration-layer
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-configuration-layer")
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
;;                       "core"
;;                       "core-configuration-layer\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))
;;     (propagated-inputs
;;      (list
;;       emacs-core-load-paths
;;       emacs-core-spacemacs-buffer
;;       emacs-core-progress-bar
;;       emacs-core-funcs
;;       emacs-core-dotspacemacs
;;       emacs-spacemacs-ht
;;       ))))

;; (define-public emacs-core-customization
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-customization")
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
;;                       "core"
;;                       "core-customization\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))
;;     (propagated-inputs
;;      (list emacs-validate))))

;; (define-public emacs-spacemacs-common
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-spacemacs-common")
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
;;                       "core/libs/spacemacs-theme"
;;                       "spacemacs-common\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; ;; Upstream uses https://github.com/nashamri/spacemacs-theme
;; (define-public emacs-spacemacs-theme
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-spacemacs-theme")
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
;;                       "core/libs/spacemacs-theme"
;;                       "spacemacs-theme\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; ;; (define-public emacs-page-break-lines
;; ;;   (package
;; ;;     (inherit emacs-spacemacs-base)
;; ;;     (name "emacs-page-break-lines")
;; ;;     (arguments
;; ;;      (list
;; ;;       #:tests? #f
;; ;;       #:phases
;; ;;       #~(modify-phases %standard-phases
;; ;;           ;; Move the source files to the top level, which is included in
;; ;;           ;; the EMACSLOADPATH.
;; ;;           (add-after 'unpack 'move-source-files
;; ;;             (lambda _
;; ;;               (let ((el-files
;; ;;                      (find-files
;; ;;                       "core/libs"
;; ;;                       "page-break-lines\\.el$")
;; ;;                      ))
;; ;;                 (for-each (lambda (f) (rename-file f (basename f)))
;; ;;                           el-files)))))))))

;; (define-public emacs-page-break-lines
;;   (let ((commit "982571749c8fe2b5e2997dd043003a1b9fe87b38")
;;         (revision "0"))
;;     (package
;;       (name "emacs-page-break-lines")
;;       (version (git-version "0.15" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/purcell/page-break-lines.git")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "0d74j7mqgzbwj00sirz3wa37f5yv0y48lgp2v20k61lq54sxk75g"))))
;;       (build-system emacs-build-system)
;;       (arguments (list #:tests? #f))
;;       (home-page "https://github.com/purcell/page-break-lines")
;;       (synopsis "Display page breaks as tidy horizontal lines")
;;       (description
;;        "This library provides a global mode which displays form feed characters
;; as horizontal rules.")
;;       (license license:gpl3+))))

;; (define-public emacs-package-recipe-mode
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-package-recipe-mode")
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
;;                       "package-recipe-mode\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; ;; Upstream uses https://github.com/TeMPOraL/nyan-mode/
;; (define-public emacs-nyan-mode
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-nyan-mode")
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
;;                       "layers/+themes/colors/local/nyan-mode"
;;                       "nyan-mode\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-erc-yank
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-erc-yank")
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
;;                       "layers/+chat/erc/local/erc-yank"
;;                       "erc-yank\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-debug
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-debug")
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
;;                       "core"
;;                       "core-debug\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-load-env-vars
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-load-env-vars")
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
;;                       "core/libs/forks"
;;                       "load-env-vars\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-themes-support
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-themes-support")
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
;;                       "core"
;;                       "core-themes-support\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; ;; Upstream uses https://github.com/sigma/mocker.el
;; (define-public emacs-mocker
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-mocker")
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
;;                       "mocker\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-release-management
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-release-management")
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
;;                       "core"
;;                       "core-release-management\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-compleseus-spacemacs-help
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-compleseus-spacemacs-help")
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
;;                       "layers/+completion/compleseus/local/compleseus-spacemacs-help"
;;                       "compleseus-spacemacs-help\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))
;;     (propagated-inputs
;;      (list
;;       emacs-consult
;;       emacs-core-configuration-layer
;;       ))))

;; (define-public emacs-erc-tex
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-erc-tex")
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
;;                       "layers/+chat/erc/local/erc-tex"
;;                       "erc-tex\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-keybindings
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-keybindings")
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
;;                       "core"
;;                       "core-keybindings\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-erc-sasl
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-erc-sasl")
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
;;                       "layers/+chat/erc/local/erc-sasl"
;;                       "erc-sasl\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-dumper
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-dumper")
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
;;                       "core"
;;                       "core-dumper\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-cycle
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-cycle")
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
;;                       "core"
;;                       "core-cycle\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; ;; Upstream uses https://github.com/larstvei/ox-gfm
;; (define-public emacs-ox-gfm
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-ox-gfm")
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
;;                       "layers/+emacs/org/local/ox-gfm"
;;                       "ox-gfm\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-jump
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-jump")
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
;;                       "core"
;;                       "core-jump\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-package-recipe
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-package-recipe")
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
;;                       "package-recipe\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-helm-spacemacs-faq
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-helm-spacemacs-faq")
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
;;                       "layers/+completion/helm/local/helm-spacemacs-help"
;;                       "helm-spacemacs-faq\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-quelpa
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-quelpa")
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
;;                       "quelpa\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files))))
;;           ;; TODO check user-emacs-directory
;;           (add-after 'move-source-files 'fix-user-emacs-directory
;;             (lambda _
;;               (substitute* "quelpa.el"
;;                 (("user-emacs-directory") "\"./\"")))))))))

;; (define-public emacs-helm-spacemacs-help
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-helm-spacemacs-help")
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
;;                       "layers/+completion/helm/local/helm-spacemacs-help"
;;                       "helm-spacemacs-help\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-ivy-spacemacs-help
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-ivy-spacemacs-help")
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
;;                       "layers/+completion/ivy/local/ivy-spacemacs-help"
;;                       "ivy-spacemacs-help\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-funcs
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-funcs")
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
;;                       "core"
;;                       "core-funcs\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files))))
;;           ;; TODO check user-emacs-directory
;;           (add-after 'move-source-files 'fix-user-emacs-directory
;;             (lambda _
;;               (substitute* "core-funcs.el"
;;                 (("user-emacs-directory") "\"./\"")))))))))

;; (define-public emacs-tmux
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-tmux")
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
;;                       "layers/+tools/tmux/local/tmux"
;;                       "tmux\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-progress-bar
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-progress-bar")
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
;;                       "core"
;;                       "core-progress-bar\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-micro-state
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-micro-state")
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
;;                       "core"
;;                       "core-micro-state\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-toggle
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-toggle")
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
;;                       "core"
;;                       "core-toggle\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-emacs-backports
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-emacs-backports")
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
;;                       "core"
;;                       "core-emacs-backports\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-spacemacs-purpose-popwin
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-spacemacs-purpose-popwin")
;;     (propagated-inputs
;;      (list emacs-window-purpose))
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
;;                       "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
;;                       "spacemacs-purpose-popwin\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-spacemacs-whitespace-cleanup
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-spacemacs-whitespace-cleanup")
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
;;                       "layers/+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup"
;;                       "spacemacs-whitespace-cleanup\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-help-fns-plus
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-help-fns-plus")
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
;;                       "layers/+spacemacs/spacemacs-defaults/local/help-fns+"
;;                       "help-fns+\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-helm-games
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-helm-games")
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
;;                       "layers/+fun/games/local/helm-games"
;;                       "helm-games\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-hybrid-mode
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-hybrid-mode")
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
;;                       "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode"
;;                       "hybrid-mode\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files))
;;               (substitute* "hybrid-mode.el"
;;                 ((";;; Code:")
;;                  ;; The following doesn't work. The macro must be autoloaded
;;                  ;; ";;; Code:\n(require 'core-funcs)"
;;                  (string-append
;;                   ";;; Code:\n\n"
;;                   ";;;###autoload\n"
;;                   "(defmacro spacemacs|dotspacemacs-backward-compatibility (variable default)
;;   \"Return `if' sexp for backward compatibility with old dotspacemacs
;;   values.\"
;;   `(if (boundp ',variable) ,variable ',default))"))))))))
;;     (propagated-inputs
;;      (list
;;       ;; emacs-core-funcs ;; Doesn't work - see above
;;       emacs-evil))))

;; (define-public emacs-vim-colors
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-vim-colors")
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
;;                       "layers/+spacemacs/spacemacs-modeline/local/vim-powerline"
;;                       "vim-colors\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-space-doc
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-space-doc")
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
;;                       "layers/+spacemacs/spacemacs-org/local/space-doc"
;;                       "space-doc\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-rst-sphinx
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-rst-sphinx")
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
;;                       "layers/+tools/sphinx/local/rst-sphinx"
;;                       "rst-sphinx\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-vim-powerline
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-vim-powerline")
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
;;                       "layers/+spacemacs/spacemacs-modeline/local/vim-powerline"
;;                       "vim-powerline-theme\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))
;;     (propagated-inputs
;;      (list
;;       emacs-vim-colors))))

;; (define-public emacs-evil-unimpaired
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-evil-unimpaired")
;;     (propagated-inputs
;;      (list
;;       emacs-dash
;;       emacs-f))
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
;;                       "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
;;                       "evil-unimpaired\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-pylookup
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-pylookup")
;;     (arguments
;;      (list
;;       #:tests? #f
;;       #:include
;;       #~(cons*
;;          "^layers/\\+lang/python/local/pylookup/pylookup\\.el$"
;;          "^layers/\\+lang/python/local/pylookup/pylookup\\.py$"
;;          %default-include)
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           (add-after 'unpack 'specify-python-location
;;             (lambda* (#:key inputs #:allow-other-keys)
;;               (let ((python3 (search-input-file inputs "/bin/python3")))
;;                 (substitute* '("layers/+lang/python/local/pylookup/pylookup.py")
;;                   (("/usr/bin/env python3?") python3)))))
;;           (replace 'expand-load-path
;;             (lambda args
;;               (with-directory-excursion
;;                   "layers/+lang/python/local/pylookup"
;;                 (apply (assoc-ref %standard-phases 'expand-load-path) args))))
;;           (replace 'make-autoloads
;;             (lambda args
;;               (with-directory-excursion
;;                   "layers/+lang/python/local/pylookup"
;;                 (apply (assoc-ref %standard-phases 'make-autoloads) args))))
;;           (replace 'install
;;             (lambda args
;;               (with-directory-excursion
;;                   "layers/+lang/python/local/pylookup"
;;                 (apply (assoc-ref %standard-phases 'install) args))))
;;           (replace 'build
;;             (lambda args
;;               (with-directory-excursion
;;                   "layers/+lang/python/local/pylookup"
;;                 (apply (assoc-ref %standard-phases 'build) args)))))))
;;     ;; (propagated-inputs
;;     ;;  (list
;;     ;;   emacs-browse-url ;; missing
;;     ;;   emacs-simple     ;; missing
;;     ;;   ))
;;     (native-inputs
;;      (list
;;       python-wrapper
;;       ))))

;; (define-public emacs-evil-evilified-state
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-evil-evilified-state")
;;     (propagated-inputs
;;      (list
;;       emacs-evil
;;       emacs-bind-map))
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
;;                       "layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state"
;;                       "evil-evilified-state\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-spacemacs-xclipboard
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-spacemacs-xclipboard")
;;     (arguments
;;      (list
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           ;; Move the source files to the top level, which is included in
;;           ;; the EMACSLOADPATH.
;;           (add-after 'unpack 'move-source-files
;;             (lambda _
;;               (let ((el-files
;;                      (find-files
;;                       "layers/+tools/xclipboard/local/spacemacs-xclipboard"
;;                       "spacemacs-xclipboard\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-theme-changer
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-theme-changer")
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
;;                       "layers/+tools/geolocation/extensions/theme-changer"
;;                       "theme-changer\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-holy-mode
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-holy-mode")
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
;;                       "layers/+distributions/spacemacs-bootstrap/local/holy-mode"
;;                       "holy-mode\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-jr-mode
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-jr-mode")
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
;;                       "layers/+lang/jr/local/jr-mode"
;;                       "jr-mode\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-rst-directives
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-rst-directives")
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
;;                       "layers/+lang/restructuredtext/local/rst-directives"
;;                       "rst-directives\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

;; (define-public emacs-core-spacemacs
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-core-spacemacs")
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
;;                       "core"
;;                       "core-spacemacs\\.el$")
;;                      ))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))
;;     (propagated-inputs
;;      (list
;;       emacs-core-versions
;;       emacs-core-versions
;;       emacs-core-load-paths
;;       emacs-core-emacs-backports
;;       emacs-core-env
;;       emacs-page-break-lines
;;       emacs-core-hooks
;;       emacs-core-debug
;;       emacs-core-command-line
;;       emacs-core-configuration-layer
;;       emacs-core-dotspacemacs
;;       emacs-core-custom-settings
;;       emacs-core-release-management
;;       emacs-core-jump
;;       emacs-core-display-init
;;       emacs-core-themes-support
;;       emacs-core-fonts-support
;;       emacs-core-spacemacs-buffer
;;       emacs-core-keybindings
;;       emacs-core-toggle
;;       emacs-core-early-funcs
;;       emacs-core-cycle
;;       emacs-core-funcs
;;       emacs-core-micro-state
;;       emacs-core-transient-state
;;       emacs-core-use-package-ext
;;       emacs-core-spacebind
;;       emacs-core-compilation
;;       emacs-core-dumper
;;       ))))


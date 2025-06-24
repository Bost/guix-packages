(define-module (bost gnu packages emacs-xyz-space)
  ;; #:use-module (utils)
  #:use-module (bost guix build emacs-utils)
  #:use-module (bost gnu packages space-all)

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
   (list "core/libs" "package-recipe-mode\\.el$")
   (list "layers/+chat/erc/local/erc-yank" "erc-yank\\.el$")
   (list "core" "core-debug\\.el$")
   (list "core/libs/forks" "load-env-vars\\.el$")
   (list "core" "core-themes-support\\.el$")
   (list "core/libs" "mocker\\.el$")
   (list "core" "core-release-management\\.el$")
   (list "layers/+completion/compleseus/local/compleseus-spacemacs-help" "compleseus-spacemacs-help\\.el$")
   (list "layers/+chat/erc/local/erc-tex" "erc-tex\\.el$")
   (list "core" "core-keybindings\\.el$")
   (list "core" "core-dumper\\.el$")
   (list "core" "core-cycle\\.el$")
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
   (list "layers/+fun/games/local/helm-games" "helm-games\\.el$")
   (list "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode" "hybrid-mode\\.el$")
   (list "layers/+spacemacs/spacemacs-modeline/local/vim-powerline" "vim-colors\\.el$")
   (list "layers/+spacemacs/spacemacs-org/local/space-doc" "space-doc\\.el$")
   (list "layers/+tools/sphinx/local/rst-sphinx" "rst-sphinx\\.el$")
   (list "layers/+spacemacs/spacemacs-modeline/local/vim-powerline" "vim-powerline-theme\\.el$")
   (list "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired" "evil-unimpaired\\.el$")
   (list "layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state" "evil-evilified-state\\.el$")
   (list "layers/+tools/xclipboard/local/spacemacs-xclipboard" "spacemacs-xclipboard\\.el$")
   (list "layers/+distributions/spacemacs-bootstrap/local/holy-mode" "holy-mode\\.el$")
   (list "layers/+lang/jr/local/jr-mode" "jr-mode\\.el$")
   (list "layers/+lang/restructuredtext/local/rst-directives" "rst-directives\\.el$")
   (list "core" "core-spacemacs\\.el$")
   ))

(define (listing-el-files)
  (begin
    (use-modules (utils))
    ((comp
      pretty-print
      ;; (partial map (cut string-replace-substring <> "+" "\\+"))
      (cut sort <> string<?)
      (partial map (comp
                    (partial str "^")
                    (cut string-join <> "/"))))
     paths-to-el-files
     #;(take-smart 2 paths-to-el-files)))
  )

(define (listing-el-paths)
  (begin
    (use-modules (utils))
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
     ))
  )

(define-public emacs-spacemacs-orig
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
           ;; "^layers/\\+chat/erc/local/erc-sasl/erc-sasl\\.el$"
           "^layers/\\+chat/erc/local/erc-tex/erc-tex\\.el$"
           "^layers/\\+chat/erc/local/erc-yank/erc-yank\\.el$"
           "^layers/\\+completion/compleseus/local/compleseus-spacemacs-help/compleseus-spacemacs-help\\.el$"
           "^layers/\\+completion/helm/local/helm-spacemacs-help/helm-spacemacs-faq\\.el$"
           "^layers/\\+completion/helm/local/helm-spacemacs-help/helm-spacemacs-help\\.el$"
           "^layers/\\+completion/ivy/local/ivy-spacemacs-help/ivy-spacemacs-help\\.el$"
           "^layers/\\+distributions/spacemacs-bootstrap/local/evil-evilified-state/evil-evilified-state\\.el$"
           "^layers/\\+distributions/spacemacs-bootstrap/local/holy-mode/holy-mode\\.el$"
           "^layers/\\+distributions/spacemacs-bootstrap/local/hybrid-mode/hybrid-mode\\.el$"
           ;; "^layers/\\+emacs/org/local/ox-gfm/ox-gfm\\.el$"
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

                (setenv "EMACSLOADPATH"
                        (string-append
                         (getcwd) "core/libs:"
                         ;; ...
                         ;; (getcwd) "/path/to/dirN:"
                         (getenv "EMACSLOADPATH")))
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

(define-public emacs-spacemacs
  (let ((commit "a75bc4f8ad4ab050cb00bc723aad9b41d912f9a0")
        (revision "0"))
    (package
      (name "emacs-spacemacs")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/spacemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0iv1i877kfw9igc36jdki2cgk1hym6ih3s15f6c85zqmnsfrb1pl"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include
        #~(cons*
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
           "^layers/+chat/erc/local/erc-tex/erc-tex\\.el$"
           "^layers/+chat/erc/local/erc-yank/erc-yank\\.el$"
           "^layers/+completion/compleseus/local/compleseus-spacemacs-help/compleseus-spacemacs-help\\.el$"
           "^layers/+completion/helm/local/helm-spacemacs-help/helm-spacemacs-faq\\.el$"
           "^layers/+completion/helm/local/helm-spacemacs-help/helm-spacemacs-help\\.el$"
           "^layers/+completion/ivy/local/ivy-spacemacs-help/ivy-spacemacs-help\\.el$"
           "^layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state/evil-evilified-state\\.el$"
           "^layers/+distributions/spacemacs-bootstrap/local/holy-mode/holy-mode\\.el$"
           "^layers/+distributions/spacemacs-bootstrap/local/hybrid-mode/hybrid-mode\\.el$"
           "^layers/+fun/games/local/helm-games/helm-games\\.el$"
           "^layers/+lang/jr/local/jr-mode/jr-mode\\.el$"
           "^layers/+lang/restructuredtext/local/rst-directives/rst-directives\\.el$"
           "^layers/+lang/restructuredtext/local/rst-lists/rst-lists\\.el$"
           "^layers/+misc/ietf/local/irfc/irfc\\.el$"
           "^layers/+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup/spacemacs-whitespace-cleanup\\.el$"
           "^layers/+spacemacs/spacemacs-evil/local/evil-unimpaired/evil-unimpaired\\.el$"
           "^layers/+spacemacs/spacemacs-modeline/local/vim-powerline/vim-colors\\.el$"
           "^layers/+spacemacs/spacemacs-modeline/local/vim-powerline/vim-powerline-theme\\.el$"
           "^layers/+spacemacs/spacemacs-org/local/space-doc/space-doc\\.el$"
           "^layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin/spacemacs-purpose-popwin\\.el$"
           "^layers/+tools/sphinx/local/rst-sphinx/rst-sphinx\\.el$"
           "^layers/+tools/tmux/local/tmux/tmux\\.el$"
           "^layers/+tools/xclipboard/local/spacemacs-xclipboard/spacemacs-xclipboard\\.el$"
           %default-include)
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
            (add-after 'unpack 'patch-file
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((python (search-input-file inputs "bin/python")))
                  (substitute* "layers/+lang/python/local/pylookup/pylookup.py"
                    (("/usr/bin/env python") python))
                  (substitute* "layers/+lang/c-c++/global_conf.py"
                    (("/usr/bin/env python") python)))))

            (add-after 'unpack 'add-emacs-load-path
             ;; add-before 'compile 'add-emacs-load-path
              (lambda* (#:key inputs #:allow-other-keys)
                (map
                   (lambda (file)
                     (let* ((base (basename file))
                            (dir (dirname file)))
                       (with-directory-excursion
                           dir (bst:write-pkg-file
                                ;; remove the ".el" extension
                                (substring base 0 (- (string-length base) 3))))))
                   (list
                    "core/aprilfool/zemacs.el"
                    "core/libs/forks/load-env-vars.el"
                    "layers/+chat/erc/local/erc-tex/erc-tex.el"
                    "layers/+completion/compleseus/local/compleseus-spacemacs-help/compleseus-spacemacs-help.el"
                    "layers/+completion/ivy/local/ivy-spacemacs-help/ivy-spacemacs-help.el"
                    "layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state/evil-evilified-state.el"
                    "layers/+distributions/spacemacs-bootstrap/local/holy-mode/holy-mode.el"
                    "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode/hybrid-mode.el"
                    "layers/+fun/games/local/helm-games/helm-games.el"
                    "layers/+lang/jr/local/jr-mode/jr-mode.el"
                    "layers/+lang/restructuredtext/local/rst-directives/rst-directives.el"
                    "layers/+lang/restructuredtext/local/rst-lists/rst-lists.el"
                    "layers/+misc/ietf/local/irfc/irfc.el"
                    "layers/+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup/spacemacs-whitespace-cleanup.el"
                    "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired/evil-unimpaired.el"
                    "layers/+spacemacs/spacemacs-org/local/space-doc/space-doc.el"
                    "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin/spacemacs-purpose-popwin.el"
                    "layers/+tools/sphinx/local/rst-sphinx/rst-sphinx.el"
                    "layers/+tools/tmux/local/tmux/tmux.el"
                    "layers/+tools/xclipboard/local/spacemacs-xclipboard/spacemacs-xclipboard.el"
                    ))
                  (let* ((root    (getcwd))
                       ;; list every directory you need on the load-path:
                       (paths   (list
                                 "core"
                                 "core/aprilfool"
                                 "core/libs"
                                 "core/libs/forks"
                                 "core/libs/spacemacs-theme"
                                 "layers/+chat/erc/local/erc-tex"
                                 "layers/+chat/erc/local/erc-yank"
                                 "layers/+completion/compleseus/local/compleseus-spacemacs-help"
                                 "layers/+completion/helm/local/helm-spacemacs-help"
                                 "layers/+completion/ivy/local/ivy-spacemacs-help"
                                 "layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state"
                                 "layers/+distributions/spacemacs-bootstrap/local/holy-mode"
                                 "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode"
                                 "layers/+fun/games/local/helm-games"
                                 "layers/+lang/jr/local/jr-mode"
                                 "layers/+lang/restructuredtext/local/rst-directives"
                                 "layers/+lang/restructuredtext/local/rst-lists"
                                 "layers/+misc/ietf/local/irfc"
                                 "layers/+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup"
                                 "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
                                 "layers/+spacemacs/spacemacs-modeline/local/vim-powerline"
                                 "layers/+spacemacs/spacemacs-org/local/space-doc"
                                 "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
                                 "layers/+tools/sphinx/local/rst-sphinx"
                                 "layers/+tools/tmux/local/tmux"
                                 "layers/+tools/xclipboard/local/spacemacs-xclipboard"
                                 ))
                       (full    (map (lambda (d) (string-append root "/" d)) paths))
                       (env-val (string-join (cons (getenv "EMACSLOADPATH") full) ":")))
                    (setenv "EMACSLOADPATH" env-val))))

            (add-after 'expand-load-path 'post-expand-load-path
              (lambda* (#:key inputs #:allow-other-keys)
                ;; (bst:show-user-emacs-directory)
                ;; TODO expand-load-path adds ':' at the end of EMACSLOADPATH
                (substitute* "core/core-load-paths.el"          (("user-emacs-directory") "\".\""))
                (substitute* "core/core-configuration-layer.el" (("user-emacs-directory") "\".\""))
                (substitute* "core/libs/quelpa.el"              (("user-emacs-directory") "\".\""))
                (substitute* "core/core-funcs.el"               (("user-emacs-directory") "\".\""))
                (format #t "post: ### EMACSLOADPATH ~a\n" (getenv "EMACSLOADPATH"))))
            )))
      (propagated-inputs
       (append
        (spguimacs-packages)
        (list python-wrapper))
       )
      (home-page "http://spacemacs.org/")
      (synopsis
       "Community-driven Emacs distribution - The best editor is neither Emacs
 nor Vim, it's Emacs *and* Vim!")
      (description
       "Spacemacs is a new way of experiencing Emacs - it's a sophisticated
 and polished set-up, focused on ergonomics, mnemonics and consistency.")
      (license license:gpl3+))))

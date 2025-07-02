(define-module (bost gnu packages emacs-xyz-space)
  #:use-module (bost utils)
  #:use-module (bost tests)
  #:use-module (bost guix build spacemacs-utils)
  #:use-module (bost guix build emacs-utils)
  #:use-module (bost gnu packages space-all)
  #:use-module (ice-9 match)
  #:use-module (ice-9 pretty-print)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-1) ;; sets, delete-duplicates
  #:use-module (srfi srfi-26)
  #:use-module (gnu packages)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages chez)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages java)
  #:use-module (gnu packages julia-xyz)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages music)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages node)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages racket)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages scheme)
  #:use-module (gnu packages screen)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages web)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix bzr-download)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix i18n)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  )

(define m (module-name-for-logging))
(evaluating-module)

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

(define-public emacs-spacemacs
  (let ((commit
         "dcf3ebb0dd2dae6afa90aa50ac55df60529266c9" ;; Fix: Apply spacemacs-rolling-release-add-data-dir.patch
         )
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
          (base32
           "00wwzc7g3pxryy2lxjydhlnzmq4xsdxqjll4vai7m1sk6pi8xcqx" ;; Fix: Apply spacemacs-rolling-release-add-data-dir.patch
           ))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include
        ;; TODO cons with a regexp matching every file
        #~(cons* ".*" %default-include)
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
            (add-after 'unpack 'patch-bump-version
              (lambda* (#:key inputs #:allow-other-keys)
                ;; Needed for `guix build --with-input=emacs-minimal=emacs emacs-spacemacs`
                (substitute* "layers/+spacemacs/spacemacs-org/config.el"
                  (("^") ";; -*- no-byte-compile: t -*-\n"))))
            (add-after 'unpack 'patch-file
              (lambda* (#:key inputs outputs #:allow-other-keys)
                (let [(fun
                       "
(defun print-vars (f)
  (message \"[%s] user-emacs-directory : %s\" f (or (and (boundp 'user-emacs-directory) user-emacs-directory) 'undefined))
  (message \"[%s] emacs-startup-hook : %s\" f (or (and (boundp 'emacs-startup-hook) emacs-startup-hook) 'undefined))
  (message \"[%s] noninteractive : %s\" f (or (and (boundp 'noninteractive) noninteractive) 'undefined))
  (message \"[%s] spacemacs-start-directory : %s\" f (or (and (boundp 'spacemacs-start-directory) spacemacs-start-directory) 'undefined))
  (message \"[%s] spacemacs-data-directory : %s\" f (or (and (boundp 'spacemacs-data-directory) spacemacs-data-directory) 'undefined))
  (message \"[%s] spacemacs-cache-directory : %s\" f (or (and (boundp 'spacemacs-cache-directory) spacemacs-cache-directory) 'undefined))
  (message \"[%s] spacemacs-private-directory : %s\" f (or (and (boundp 'spacemacs-private-directory) spacemacs-private-directory) 'undefined))
  (message \"[%s] quelpa-dir : %s\" f (or (and (boundp 'quelpa-dir) quelpa-dir) 'undefined))
  (message \"[%s] configuration-layer--elpa-root-directory : %s\" f (or (and (boundp 'configuration-layer--elpa-root-directory) configuration-layer--elpa-root-directory) 'undefined))
  (message \"[%s] spacemacs--last-emacs-version-file : %s\" f (or (and (boundp 'spacemacs--last-emacs-version-file) spacemacs--last-emacs-version-file) 'undefined))
  )
")]
                  (map (lambda* (file)
                         (substitute* file
                           ((";; (\\(print-vars \".*\"\\))" all sexp)
                            (format #f "\n~a\n~a" fun sexp))))
                       (list
                        "core/core-configuration-layer.el")))

                (substitute* "core/core-load-paths.el"
                  (("(\\s+)user-emacs-directory\n" all indent)
                   (string-append
                    indent
                    (format #f "\"~a\"\n"
                            ;; (assoc-ref outputs "out")
                            "./"
                            ))))
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
                 ;; TODO for every el-file analyze every (require ...)
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

                (let* ((current-dir (getcwd))
                       ;; list every directory you need on the load-path:
                       ;; TODO obtain a list of every el-file and `dirname' over it. Then delete duplicates.
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
                                 "layers/+tools/xclipboard/local/spacemacs-xclipboard"))
                       (full    (map (lambda (path) (string-append current-dir "/" path)) paths))
                       (env-val (string-join (cons (getenv "EMACSLOADPATH") full) ":")))
                  (setenv "EMACSLOADPATH" env-val))))
            (replace 'build (lambda* args #t)))))
      (inputs            (package-inputs            emacs))
      (native-inputs     (package-native-inputs     emacs))
      (propagated-inputs
       (append
        (spguimacs-packages)
        (package-propagated-inputs emacs)))
      (home-page "http://spacemacs.org/")
      (synopsis
       "Community-driven Emacs distribution - The best editor is neither Emacs
 nor Vim, it's Emacs *and* Vim!")
      (description
       "Spacemacs is a new way of experiencing Emacs - it's a sophisticated
 and polished set-up, focused on ergonomics, mnemonics and consistency.")
      (license license:gpl3+))))
(testsymb 'emacs-spacemacs)

(define* (make-packages emacs-package spacemacs-package
                        #:optional (name "emacs-spacemacs-wrapped"))
  "Given an EMACS-PACKAGE and a SPACEMACS-PACKAGE, create wrappers that allow
the use of Spacemacs without conflicting with the base Emacs."
  ;; (define f (format #f "~a [make-packages]" m))
  ;; (format #t "#### ~a starting...\n" f)
  (package
    (name name)
    (version (string-append (package-version emacs-package) "-"
                            (package-version spacemacs-package)))
    (source #f)
    (build-system trivial-build-system)
    (inputs `(("sh" ,bash)
              ("emacs" ,emacs-package)
              ("spacemacs" ,spacemacs-package)))
    (arguments
     (list
      #:modules '((guix build utils)
                  (bost utils)
                  (bost guix build spacemacs-utils))
      #:builder
      #~(begin
          ;; Seems like `su:spacemacs-builder' must be in a different module
          (use-modules (ice-9 pretty-print)
                       ((bost guix build spacemacs-utils) #:prefix su:))
          ;; (format #t "### %build-inputs:\n")
          ;; (pretty-print %build-inputs)
          (su:spacemacs-builder
           #:shell (string-append
                    (assoc-ref %build-inputs "sh")
                    "/bin/sh")
           #:emacs (string-append
                    (assoc-ref %build-inputs "emacs")
                    "/bin/emacs")
           #:spacemacs (assoc-ref %build-inputs "spacemacs")
           #:out (string-append
                  (assoc-ref %outputs "out") "/bin")))))
     (home-page (package-home-page spacemacs-package))
     (synopsis (package-synopsis spacemacs-package))
     (description (package-description spacemacs-package))
     (license (package-license spacemacs-package))))
(testsymb 'make-packages)

(define-public emacs-spacemacs-wrapped
  ;; (define f (format #f "~a [emacs-spacemacs-wrapped]" m))
  ;; (format #t "#### ~a starting...\n" f)
  (make-packages emacs emacs-spacemacs))
(testsymb 'emacs-spacemacs-wrapped)

(module-evaluated)

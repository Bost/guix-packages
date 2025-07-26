(define-module (bost gnu packages space-all)
  #:use-module (bost utils)        ; partial m s+ s- sx
  #:use-module (srfi srfi-1)  ; list-processing: first take remove append-map
  #:use-module (ice-9 pretty-print)
  #:use-module (gnu packages) ; specification->package+output
  #:use-module ((bost gnu packages emacs-xyz) #:prefix bst:)
  #:use-module ((bost gnu packages emacs-build) #:prefix bst:)
  #:use-module ((gnu packages emacs-xyz) #:prefix gnu:)
  #:use-module (bost gnu packages space-needed)
  #:use-module (bost gnu packages space-available)
  #:use-module (guix) ;; package-name
  )

(define m (module-name-for-logging))
(evaluating-module)

(define (general-packages)
  (list
   ;; "emacs-spacemacs"
   ;; "spacemacs-rolling-release"
   ))
(testsymb 'general-packages)

(define (excluded-packages)
  (list
   ))
(testsymb 'excluded-packages)

;; Orphan packages according to spguimacs
(define (orphan-packages)
  (list
   "emacs-faceup"
   "emacs-deferred"
   "emacs-undercover"
   "emacs-treeview" ;; installed by emacs-inspector
   "emacs-pg"
   "emacs-finalize"
   "emacs-ivy"
   "emacs-a"
   ))
(testsymb 'orphan-packages)

(define orig-bst-packages
  (list
   bst:emacs-ac-php
   bst:emacs-ace-jump-helm-line
   bst:emacs-ample-zen-theme
   bst:emacs-anti-zenburn-theme
   bst:emacs-apropospriate-theme
   bst:emacs-avy-jump-helm-line
   bst:emacs-badwolf-theme
   bst:emacs-birds-of-paradise-plus-theme
   bst:emacs-bubbleberry-theme
   bst:emacs-busybee-theme
   bst:emacs-centered-cursor-mode
   bst:emacs-chatgpt
   bst:emacs-chatgpt-shell
   bst:emacs-cherry-blossom-theme
   bst:emacs-chocolate
   bst:emacs-cider-hydra
   bst:emacs-clean-aindent-mode
   bst:emacs-clues-theme
   bst:emacs-code-review
   bst:emacs-codegpt
   bst:emacs-color-theme
   bst:emacs-color-theme-sanityinc-solarized
   bst:emacs-company-anaconda
   bst:emacs-company-php
   bst:emacs-company-phpactor
   bst:emacs-company-shell
   bst:emacs-company-statistics
   bst:emacs-company-web
   bst:emacs-copilot
   bst:emacs-copy-sexp
   bst:emacs-cython-mode
   bst:emacs-cursory
   bst:emacs-dakrone-theme
   bst:emacs-dall-e
   bst:emacs-dap-chrome
   bst:emacs-dap-launch
   bst:emacs-dap-mode
   bst:emacs-dap-overlays
   bst:emacs-dap-tasks
   bst:emacs-dap-utils
   bst:emacs-darkmine-theme
   bst:emacs-darkokai-theme
   bst:emacs-darktooth-theme
   bst:emacs-dash
   bst:emacs-define-word
   bst:emacs-dired-quick-sort
   bst:emacs-django-theme
   bst:emacs-drupal-mode
   bst:emacs-dumb-jump
   bst:emacs-ellama
   bst:emacs-elisp-def
   bst:emacs-elisp-refs
   bst:emacs-emacsql-sqlite3
   bst:emacs-emr
   bst:emacs-erc-image
   bst:emacs-erc-social-graph
   bst:emacs-erc-tweet
   bst:emacs-erc-view-log
   bst:emacs-erc-yt
   bst:emacs-espresso-theme
   bst:emacs-evil-easymotion
   bst:emacs-evil-evilified-state
   bst:emacs-evil-iedit-state
   bst:emacs-evil-lisp-state
   bst:emacs-evil-matchit
   bst:emacs-evil-nerd-commenter
   bst:emacs-evil-textobj-line
   bst:emacs-evil-tutor
   bst:emacs-evil-vimish-fold
   bst:emacs-evil-visual-mark-mode
   bst:emacs-eziam-themes
   bst:emacs-f
   bst:emacs-farmhouse-light-mod-theme
   bst:emacs-farmhouse-themes
   bst:emacs-flatland-theme
   bst:emacs-flatui-theme
   bst:emacs-flx
   bst:emacs-flx-ido
   bst:emacs-flycheck-bashate
   bst:emacs-flycheck-credo
   bst:emacs-flycheck-elsa
   bst:emacs-flycheck-joker
   bst:emacs-flycheck-pos-tip
   bst:emacs-flyspell-correct
   bst:emacs-flyspell-correct-helm
   bst:emacs-font-utils
   bst:emacs-forge
   bst:emacs-frame-cmds
   bst:emacs-frame-fns
   bst:emacs-gandalf-theme
   bst:emacs-geben
   bst:emacs-gh
   bst:emacs-gh-md
   bst:emacs-gist
   bst:emacs-gitignore-templates
   bst:emacs-google-translate
   bst:emacs-gotham-theme
   bst:emacs-gptel
   bst:emacs-grandshell-theme
   bst:emacs-groovy-imports
   bst:emacs-groovy-mode
   bst:emacs-gruber-darker
   bst:emacs-gruber-darker-theme
   bst:emacs-haml-mode
   bst:emacs-hc-zenburn-theme
   bst:emacs-helm
   bst:emacs-helm-ag
   bst:emacs-helm-c-yasnippet
   bst:emacs-helm-cider
   bst:emacs-helm-cider-history
   bst:emacs-helm-comint
   bst:emacs-helm-company
   bst:emacs-helm-core
   bst:emacs-helm-css-scss
   bst:emacs-helm-descbinds
   bst:emacs-helm-dictionary
   bst:emacs-helm-git-grep
   bst:emacs-helm-ls-git
   bst:emacs-helm-lsp
   bst:emacs-helm-make
   bst:emacs-helm-mode-manager
   bst:emacs-helm-mu
   bst:emacs-helm-org
   bst:emacs-helm-org-rifle
   bst:emacs-helm-projectile
   bst:emacs-helm-purpose
   bst:emacs-helm-pydoc
   bst:emacs-helm-slime
   bst:emacs-helm-sly
   bst:emacs-helm-swoop
   bst:emacs-helm-system-packages
   bst:emacs-helm-themes
   bst:emacs-helm-xref
   bst:emacs-hemisu-theme
   bst:emacs-heroku-theme
   bst:emacs-hide-comnt
   bst:emacs-highlight-parentheses
   bst:emacs-hlint-refactor
   bst:emacs-hungry-delete
   bst:emacs-hybrid-mode
   bst:emacs-impatient-mode
   bst:emacs-importmagic
   bst:emacs-indent-guide
   bst:emacs-inkpot-theme
   bst:emacs-insert-shebang
   bst:emacs-ir-black-theme
   bst:emacs-jazz-theme
   bst:emacs-jbeans-theme
   bst:emacs-journalctl-mode
   bst:emacs-js-doc
   bst:emacs-json-navigator
   bst:emacs-json-reformat
   bst:emacs-jump-last
   bst:emacs-kaocha-runner
   bst:emacs-kaolin-themes
   bst:emacs-kbd-mode
   bst:emacs-kill-buffers
   bst:emacs-light-soap-theme
   bst:emacs-live-py-mode
   bst:emacs-livid-mode
   bst:emacs-llm
   bst:emacs-logito
   bst:emacs-loop
   bst:emacs-lsp-docker
   bst:emacs-lsp-haskell
   bst:emacs-lsp-java
   bst:emacs-lsp-latex
   bst:emacs-lsp-lens
   bst:emacs-lsp-metals
   bst:emacs-lsp-mode
   bst:emacs-lsp-origami
   bst:emacs-lsp-protocol
   bst:emacs-lsp-pyright
   bst:emacs-lsp-python-ms
   bst:emacs-lsp-treemacs
   bst:emacs-lsp-ui
   bst:emacs-lsp-volar
   bst:emacs-lush-theme
   bst:emacs-lv
   bst:emacs-madhat2r-theme
   bst:emacs-magit
   bst:emacs-magit-annex
   bst:emacs-magit-gerrit
   bst:emacs-magit-org-todos-el
   bst:emacs-magit-section
   bst:emacs-magit-tbdiff
   bst:emacs-majapahit-themes
   bst:emacs-markdown-toc
   bst:emacs-marshal
   bst:emacs-material-theme
   bst:emacs-maven-test-mode
   bst:emacs-minimal-theme
   bst:emacs-moe-theme
   bst:emacs-molokai-theme
   bst:emacs-monochrome-theme
   bst:emacs-mu4e-alert
   bst:emacs-multi-line
   bst:emacs-mustang-theme
   bst:emacs-mvn
   bst:emacs-naquadah-theme
   bst:emacs-nerd-icons
   bst:emacs-nix-mode
   bst:emacs-noctilux-theme
   bst:emacs-ob-elixir
   bst:emacs-obsidian-theme
   bst:emacs-occidental-theme
   bst:emacs-oldlace-theme
   bst:emacs-omtose-phellack-theme
   bst:emacs-omtose-phellack-themes
   bst:emacs-open-junk-file
   bst:emacs-openai
   bst:emacs-org-category-capture
   bst:emacs-org-cliplink
   bst:emacs-org-project-capture
   bst:emacs-org-projectile
   bst:emacs-org-rich-yank
   bst:emacs-organic-green-theme
   bst:emacs-orgit
   bst:emacs-orgit-forge
   bst:emacs-overseer
   bst:emacs-paradox
   bst:emacs-pcache
   bst:emacs-pcsv
   bst:emacs-pdf-tools
   bst:emacs-pdf-view-restore
   bst:emacs-pet
   bst:emacs-phoenix-dark-mono-theme
   bst:emacs-phoenix-dark-pink-theme
   bst:emacs-php-auto-yasnippets
   bst:emacs-php-extras
   bst:emacs-php-mode
   bst:emacs-php-runtime
   bst:emacs-phpactor
   bst:emacs-phpunit
   bst:emacs-pip-requirements
   bst:emacs-pipenv
   bst:emacs-planet-theme
   bst:emacs-plz
   bst:emacs-plz-event-source
   bst:emacs-plz-media-type
   bst:emacs-poetry
   bst:emacs-popwin
   bst:emacs-powerline
   bst:emacs-prettier-js
   bst:emacs-professional-theme
   bst:emacs-purple-haze-theme
   bst:emacs-pyenv-mode
   bst:emacs-pytest
   bst:emacs-reveal-in-folder
   bst:emacs-reverse-theme
   bst:emacs-sass-mode
   bst:emacs-sayid
   bst:emacs-scss-mode
   bst:emacs-seti-theme
   bst:emacs-shfmt
   bst:emacs-slim-mode
   bst:emacs-smeargle
   bst:emacs-smyx-theme
   bst:emacs-soft-charcoal-theme
   bst:emacs-soft-morning-theme
   bst:emacs-soft-stone-theme
   bst:emacs-spaceline
   bst:emacs-spaceline-all-the-icons
   bst:emacs-sqlite3
   bst:emacs-string-edit-at-point
   bst:emacs-subatomic-theme
   bst:emacs-subatomic256-theme
   bst:emacs-sublime-themes
   bst:emacs-suggest
   bst:emacs-sunny-day-theme
   bst:emacs-system-packages
   bst:emacs-systemd
   bst:emacs-tango-2-theme
   bst:emacs-tango-plus-theme
   bst:emacs-tangotango-theme
   bst:emacs-taxy
   bst:emacs-taxy-magit-section
   bst:emacs-tblui
   bst:emacs-term-cursor
   bst:emacs-terminal-here
   bst:emacs-toxi-theme
   bst:emacs-transient
   bst:emacs-treemacs
   bst:emacs-treemacs-evil
   bst:emacs-treemacs-extra
   bst:emacs-treemacs-icons-dired
   bst:emacs-treemacs-magit
   bst:emacs-treemacs-persp
   bst:emacs-treemacs-projectile
   bst:emacs-tweaks
   bst:emacs-twilight-anti-bright-theme
   bst:emacs-twilight-bright-theme
   bst:emacs-twilight-theme
   bst:emacs-ujelly-theme
   bst:emacs-underwater-theme
   bst:emacs-undo-tree
   bst:emacs-unfill
   bst:emacs-unicode-fonts
   ;; bst:emacs-use-package
   ;; bst:emacs-use-package-chords
   bst:emacs-uuidgen
   bst:emacs-vdiff-magit
   bst:emacs-vi-tilde-fringe
   bst:emacs-vimish-fold
   bst:emacs-vline
   bst:emacs-volatile-highlights
   bst:emacs-vterm
   bst:emacs-vundo
   bst:emacs-web-completion-data
   bst:emacs-wfnames
   bst:emacs-white-sand-theme
   bst:emacs-winum
   bst:emacs-with-editor
   bst:emacs-writeroom-mode
   bst:emacs-xhair
   bst:emacs-xterm-color
   bst:emacs-yaml-mode
   bst:emacs-yasnippet-snippets
   bst:emacs-zen-and-art-theme
   bst:emacs-zenburn-theme
   bst:emacs-zonokai-emacs
   bst:emacs-zoom-frm
   ))
(testsymb 'orig-bst-packages)

(define dash-s-packages
  (list
   ;; emacs-magit-svn
   bst:emacs-meyvn
   bst:emacs-magit-popup
   bst:emacs-minions
   bst:emacs-speed-type
   bst:emacs-ghq
   bst:emacs-typit
   bst:emacs-shroud
   bst:emacs-unpackaged
   bst:emacs-haskell-mode
   ;; bst:emacs-lean4-mode
   bst:emacs-dante
   bst:emacs-flycheck
   bst:emacs-fb2-reader
   bst:emacs-alarm-clock
   bst:emacs-relative-buffers
   bst:emacs-alchemist
   bst:emacs-auto-sudoedit
   bst:emacs-bluetooth
   bst:emacs-ag
   bst:emacs-xenops
   bst:emacs-autothemer
   bst:emacs-campus
   bst:emacs-chronometrist
   bst:emacs-citeproc
   bst:emacs-direnv
   bst:emacs-noman
   bst:emacs-bui
   bst:emacs-guix
   bst:emacs-minitest
   bst:emacs-es-mode
   bst:emacs-litable
   bst:emacs-calc-currency
   bst:emacs-standard-dirs
   bst:emacs-org-now
   bst:emacs-orgmdb
   bst:emacs-flycheck-rust
   bst:emacs-elastic-modes
   bst:emacs-docker-compose-mode
   bst:emacs-ob-ipython
   bst:emacs-ob-async
   bst:emacs-company-box
   bst:emacs-math-preview
   bst:emacs-company-coq
   bst:emacs-multifiles
   bst:emacs-company-lsp
   bst:emacs-tagedit
   bst:emacs-anki-editor
   bst:emacs-org-sidebar
   bst:emacs-org-trello
   bst:emacs-company-flow
   bst:emacs-solarized-theme
   bst:emacs-consult-notes
   bst:emacs-smartparens
   bst:emacs-eyebrowse
   bst:emacs-pretty-hydra
   bst:emacs-major-mode-hydra
   bst:emacs-clojure-mode
   bst:emacs-sphinx-doc
   bst:emacs-julia-snail
   bst:emacs-tide
   bst:emacs-projectile
   bst:emacs-skeletor
   bst:emacs-elfeed
   bst:emacs-elfeed-goodies
   bst:emacs-elfeed-org
   bst:emacs-elfeed-protocol
   bst:emacs-elfeed-score
   bst:emacs-elfeed-tube
   bst:emacs-el-x
   bst:emacs-epithet
   bst:emacs-eterm-256color
   bst:emacs-elpy
   bst:emacs-gitlab-snip-helm
   bst:emacs-wgrep
   ;; bst:emacs-helm
   ;; bst:emacs-helm-org
   ;; bst:emacs-helm-swoop
   ;; bst:emacs-helm-ag
   ;; bst:emacs-helm-projectile
   bst:emacs-hexrgb
   bst:emacs-taskrunner
   bst:emacs-tp
   bst:emacs-ivy-taskrunner
   bst:emacs-helm-taskrunner
   ;; bst:emacs-helm-make
   bst:emacs-islisp-mode
   bst:emacs-cider
   bst:emacs-cider-eval-sexp-fu
   bst:emacs-sly
   bst:emacs-sly-quicklisp
   bst:emacs-sly-asdf
   bst:emacs-sly-named-readtables
   bst:emacs-sly-macrostep
   bst:emacs-sly-stepper
   bst:emacs-sly-package-inferred
   bst:emacs-lua-mode
   bst:emacs-ebuild-mode
   bst:emacs-ebuku
   bst:emacs-evil
   bst:emacs-evil-collection
   bst:emacs-evil-goggles
   bst:emacs-goggles
   bst:emacs-goto-chg
   bst:emacs-evil-owl
   bst:emacs-evil-paredit
   bst:emacs-evil-args
   bst:emacs-evil-escape
   bst:emacs-evil-exchange
   bst:emacs-evil-replace-with-register
   bst:emacs-evil-indent-plus
   bst:emacs-evil-text-object-python
   bst:emacs-evil-lion
   bst:emacs-evil-expat
   ;; bst:emacs-evil-nerd-commenter
   bst:emacs-evil-visual-replace
   bst:emacs-evil-visualstar
   bst:emacs-monky
   bst:emacs-monroe
   bst:emacs-rail
   bst:emacs-orgalist
   bst:emacs-writegood-mode
   bst:emacs-writefreely
   bst:emacs-neotree
   bst:emacs-org
   bst:emacs-org-contrib
   bst:emacs-org-count-words
   bst:emacs-org-texlive-collection
   bst:emacs-org-contacts
   bst:emacs-org-vcard
   bst:emacs-org-pretty-table
   bst:emacs-ob-sclang
   bst:emacs-org-edna
   bst:emacs-toodoo
   ;; bst:emacs-flx
   bst:emacs-afternoon-theme
   bst:emacs-cyberpunk-theme
   bst:emacs-dart-mode
   bst:emacs-ht
   bst:emacs-denote-explore
   ;; bst:emacs-helm-org-rifle
   bst:emacs-boon
   bst:emacs-pippel
   bst:emacs-mini-echo
   bst:emacs-mustache
   bst:emacs-org2web
   ;; bst:emacs-json-reformat
   bst:emacs-jsonnet-mode
   bst:emacs-dired-hacks
   bst:emacs-lcr
   bst:emacs-attrap
   bst:emacs-browse-at-remote
   bst:emacs-ansible
   bst:emacs-groovy-modes
   bst:emacs-terraform-mode
   bst:emacs-frog-jump-buffer
   bst:emacs-pass
   bst:emacs-passage
   bst:emacs-psc-ide
   bst:emacs-epkg
   bst:emacs-frecency
   bst:emacs-org-recent-headings
   bst:emacs-org-recur
   bst:emacs-org-super-agenda
   bst:emacs-org-make-toc
   bst:emacs-ts
   bst:emacs-org-ql
   bst:emacs-helm-org-ql
   bst:emacs-org-auto-expand
   bst:emacs-biblio
   bst:emacs-helm-bibtex
   bst:emacs-md4rd
   bst:emacs-org-mind-map
   ;; bst:emacs-elisp-refs
   bst:emacs-esup
   bst:emacs-company-lua
   bst:emacs-elm-mode
   bst:emacs-hy-mode
   bst:emacs-web-beautify
   bst:emacs-helm-shell-history
   bst:emacs-discover-my-major
   bst:emacs-org-ref
   ;; bst:emacs-helpful
   ;; bst:emacs-suggest
   bst:emacs-academic-phrases
   bst:emacs-grep-context
   bst:emacs-parinfer-mode
   bst:emacs-noflet
   ;; bst:emacs-dumb-jump
   bst:emacs-helm-flycheck
   bst:emacs-sxiv
   bst:emacs-github-review
   bst:emacs-deadgrep
   bst:emacs-pandoc-mode
   bst:emacs-ccls
   bst:emacs-racer
   bst:emacs-rustic
   bst:emacs-helm-org-contacts
   bst:emacs-dired-rsync
   ;; bst:emacs-magit-todos
   bst:emacs-ytdl
   bst:emacs-org-web-tools
   bst:emacs-all-the-icons
   ;; bst:emacs-spaceline
   bst:emacs-frame-purpose
   bst:emacs-kodi-remote
   ;; bst:emacs-repo
   ;; bst:emacs-orgit
   bst:emacs-docker
   ;; bst:emacs-lsp-mode
   ;; bst:emacs-treemacs
   ;; bst:emacs-lsp-java
   ;; bst:emacs-lsp-ui
   bst:emacs-lsp-ivy
   ;; bst:emacs-helm-lsp
   bst:emacs-elmacro
   bst:emacs-flycheck-haskell
   bst:emacs-js2-refactor
   bst:emacs-jsdoc
   bst:emacs-tco
   bst:emacs-equake
   bst:emacs-prodigy
   bst:emacs-prodigy-el
   bst:emacs-origami
   bst:emacs-ivy-clipmenu
   bst:emacs-org-drill-table
   bst:emacs-dash-docs
   bst:emacs-helm-dash
   bst:emacs-counsel-dash
   bst:emacs-calibredb
   bst:emacs-eval-in-repl
   bst:emacs-ox-pandoc
   bst:emacs-refactor
   bst:emacs-org-jira
   bst:emacs-ssh-agency
   bst:emacs-eshell-git-prompt
   bst:emacs-frames-only-mode
   bst:emacs-shrink-path
   bst:emacs-eshell-toggle
   bst:emacs-rime
   bst:emacs-ivy-omni-org
   bst:emacs-esh-help
   bst:emacs-metal-mercury-mode
   bst:emacs-org-roam
   ;; bst:emacs-org-node
   bst:emacs-org-node-3
   bst:emacs-plantuml-mode
   bst:emacs-csound-mode
   bst:emacs-html-to-hiccup
   bst:emacs-spaceleader
   bst:emacs-seriestracker
   bst:emacs-ein
   bst:emacs-global-tags
   bst:emacs-pyimport
   bst:emacs-consult-lsp
   bst:emacs-org-wild-notifier

   bst:emacs-mustache
   bst:emacs-org2web
   bst:emacs-emojify

   ))
(testsymb-trace 'dash-s-packages)

(define bst-packages
  (lset-union equal? orig-bst-packages dash-s-packages))
(testsymb-trace 'bst-packages)

(define (all-packages-from-guix-channel)
  (let* [(G (general-packages))
         (N (needed-packages))
         (O (orphan-packages))
         (A (available-packages))
         (E (excluded-packages))

;;; The 'specification->package+output' can be reliably called only over
;;; available-packages since e.g. needed-packages may contain a non-existing
;;; package, i.e. a package which hasn't been ported to Guix yet.
         ;; (G (map (comp list specification->package+output) (general-packages)))
         ;; (N (map (comp list specification->package+output) (needed-packages)))
         ;; (O (map (comp list specification->package+output) (orphan-packages)))
         ;; (A (map (comp list specification->package+output) (available-packages)))
         ;; (E (map (comp list specification->package+output) (excluded-packages)))
         ]
    (s+ G
        (s- (sx (s+ N O)
                A)
            E))))
(testsymb 'all-packages-from-guix-channel)

#|
(define G (general-packages))
(define N (needed-packages))
(define O (orphan-packages))
(define A (available-packages))
(define E (excluded-packages))
(load "/home/bost/dev/dotfiles/guix/home/cfg/packages/spguimacs/all.scm")
|#
(define-public (spguimacs-packages)
  (define f (format #f "~a [spguimacs-packages]" m))
  ((comp
    ;; TODO separate package+output to packate and output
    ;; (lambda (lst) (format #t "~a 3. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    (partial append bst-packages)
    ;; (lambda (lst) (format #t "~a 2. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    (partial map (comp list specification->package+output))
    ;; (lambda (lst) (format #t "~a 1. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    (lambda (lst) (s- lst (map package-name bst-packages)))
    ;; (lambda (lst) (format #t "~a 0. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    )
   (all-packages-from-guix-channel)))
(testsymb 'spguimacs-packages)

(define-public (sorted-spguimacs-packages)
  (define f (format #f "~a [sorted-spguimacs-packages]" m))
  ((comp
    ;; (lambda (lst) (format #t "~a 4. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    (lambda (lst) (sort-list lst (comp (partial apply string<=?)
                                       (partial map package-name)
                                       list)))
    ;; (lambda (lst) (format #t "~a 3. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    (partial append bst-packages)
    (lambda (lst) (format #t "~a 2. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    (partial map specification->package)
    ;; (lambda (lst) (format #t "~a 1. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    (lambda (lst) (s- lst (map package-name bst-packages)))
    ;; (lambda (lst) (format #t "~a 0. length: ~a\n" f (length lst)) #;(pretty-print lst) lst)
    )
   (all-packages-from-guix-channel)))
(testsymb 'sorted-spguimacs-packages)

(define-public (spguimacs-packages-with-output-path)
  (define f (format #f "~a [spguimacs-packages-with-output-path]" m))
  (let* [(packages (sorted-spguimacs-packages))]
    (combine
     (map package-name packages)
     (package-output-paths packages))))
(testsymb 'spguimacs-packages-with-output-path)

(module-evaluated)

#;(specifications->manifest (spguimacs-packages))

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
   ;; "emacs-faceup"
   ;; "emacs-deferred"
   ;; "emacs-undercover"
   ;; "emacs-treeview" ;; installed by emacs-inspector
   ;; "emacs-pg"
   ;; "emacs-finalize"
   ;; "emacs-ivy"
   ;; "emacs-a"
   ))
(testsymb 'orphan-packages)

(define bst-packages
  (list
   bst:emacs-ac-ispell
   bst:emacs-ac-php
   bst:emacs-academic-phrases
   bst:emacs-ace-jump-helm-line
   bst:emacs-afternoon-theme
   bst:emacs-ag
   bst:emacs-alarm-clock
   bst:emacs-alchemist
   bst:emacs-all-the-icons
   bst:emacs-ample-zen-theme
   bst:emacs-anaconda-mode
   bst:emacs-anki-editor
   bst:emacs-annalist
   bst:emacs-ansible
   bst:emacs-anti-zenburn-theme
   bst:emacs-apropospriate-theme
   bst:emacs-attrap
   bst:emacs-attrap
   bst:emacs-auto-complete
   bst:emacs-auto-sudoedit
   bst:emacs-auto-yasnippet
   bst:emacs-autothemer
   bst:emacs-avy-jump-helm-line
   bst:emacs-badwolf-theme
   bst:emacs-biblio
   bst:emacs-bind-chord
   bst:emacs-bind-map
   bst:emacs-birds-of-paradise-plus-theme
   bst:emacs-bluetooth
   bst:emacs-boon
   bst:emacs-browse-at-remote
   bst:emacs-bubbleberry-theme
   bst:emacs-bui
   bst:emacs-bui
   bst:emacs-busybee-theme
   bst:emacs-calc-currency
   bst:emacs-calibredb
   bst:emacs-campus
   bst:emacs-ccls
   bst:emacs-centered-cursor-mode
   bst:emacs-cfrs
   bst:emacs-chatgpt
   bst:emacs-chatgpt-shell
   bst:emacs-cherry-blossom-theme
   bst:emacs-chocolate
   bst:emacs-chocolate-theme
   bst:emacs-chronometrist
   bst:emacs-cider
   bst:emacs-cider-eval-sexp-fu
   bst:emacs-cider-hydra
   bst:emacs-citeproc
   bst:emacs-clean-aindent-mode
   bst:emacs-clj-refactor
   bst:emacs-clojure-mode
   bst:emacs-clojure-snippets
   bst:emacs-clues-theme
   bst:emacs-code-review
   bst:emacs-codegpt
   bst:emacs-color-identifiers-mode
   bst:emacs-color-theme
   bst:emacs-color-theme-sanityinc-solarized
   bst:emacs-company-anaconda
   bst:emacs-company-auctex
   bst:emacs-company-box
   bst:emacs-company-coq
   bst:emacs-company-flow
   bst:emacs-company-lsp
   bst:emacs-company-lua
   bst:emacs-company-php
   bst:emacs-company-phpactor
   bst:emacs-company-shell
   bst:emacs-company-statistics
   bst:emacs-company-web
   bst:emacs-consult-lsp
   bst:emacs-consult-notes
   bst:emacs-copilot
   bst:emacs-copy-sexp
   bst:emacs-counsel-dash
   bst:emacs-csound-mode
   bst:emacs-cursory
   bst:emacs-cyberpunk-theme
   bst:emacs-cython-mode
   bst:emacs-dakrone-theme
   bst:emacs-dall-e
   bst:emacs-dante
   bst:emacs-dap-chrome
   bst:emacs-dap-launch
   bst:emacs-dap-mode
   bst:emacs-dap-overlays
   bst:emacs-dap-tasks
   bst:emacs-dap-utils
   bst:emacs-darkmine-theme
   bst:emacs-darkokai-theme
   bst:emacs-darktooth-theme
   bst:emacs-dart-mode
   bst:emacs-dash
   bst:emacs-dash-docs
   bst:emacs-deadgrep
   bst:emacs-define-word
   bst:emacs-denote-explore
   bst:emacs-dired-hacks
   bst:emacs-dired-quick-sort
   bst:emacs-dired-rsync
   bst:emacs-direnv
   bst:emacs-discover-my-major
   bst:emacs-django-theme
   bst:emacs-docker
   bst:emacs-docker-compose-mode
   bst:emacs-drag-stuff
   bst:emacs-drupal-mode
   bst:emacs-dumb-jump
   bst:emacs-ebuild-mode
   bst:emacs-ebuku
   bst:emacs-ein
   bst:emacs-el-mock
   bst:emacs-el-x
   bst:emacs-elastic-modes
   bst:emacs-elfeed
   bst:emacs-elfeed-goodies
   bst:emacs-elfeed-org
   bst:emacs-elfeed-protocol
   bst:emacs-elfeed-score
   bst:emacs-elfeed-tube
   bst:emacs-elisp-def
   bst:emacs-elisp-refs
   bst:emacs-ellama
   bst:emacs-elm-mode
   bst:emacs-elmacro
   bst:emacs-elpy
   bst:emacs-emacsql-sqlite3
   bst:emacs-emojify
   bst:emacs-emr
   bst:emacs-epithet
   bst:emacs-epkg
   bst:emacs-equake
   bst:emacs-erc-image
   bst:emacs-erc-social-graph
   bst:emacs-erc-tweet
   bst:emacs-erc-view-log
   bst:emacs-erc-yt
   bst:emacs-ert-runner
   bst:emacs-es-mode
   bst:emacs-esh-help
   bst:emacs-eshell-git-prompt
   bst:emacs-eshell-toggle
   bst:emacs-espresso-theme
   bst:emacs-esup
   bst:emacs-eterm-256color
   bst:emacs-eval-in-repl
   bst:emacs-eval-in-repl-cider
   bst:emacs-eval-in-repl-elm
   bst:emacs-eval-in-repl-erlang
   bst:emacs-eval-in-repl-geiser
   bst:emacs-eval-in-repl-hy
   bst:emacs-eval-in-repl-ielm
   bst:emacs-eval-in-repl-iex
   bst:emacs-eval-in-repl-javascript
   bst:emacs-eval-in-repl-lua
   bst:emacs-eval-in-repl-ocaml
   bst:emacs-eval-in-repl-prolog
   bst:emacs-eval-in-repl-python
   bst:emacs-eval-in-repl-racket
   bst:emacs-eval-in-repl-ruby
   bst:emacs-eval-in-repl-scheme
   bst:emacs-eval-in-repl-shell
   bst:emacs-eval-in-repl-slime
   bst:emacs-eval-in-repl-sly
   bst:emacs-eval-in-repl-sml
   bst:emacs-evil
   bst:emacs-evil-anzu
   bst:emacs-evil-args
   bst:emacs-evil-cleverparens
   bst:emacs-evil-collection
   bst:emacs-evil-easymotion
   bst:emacs-evil-escape
   bst:emacs-evil-evilified-state
   bst:emacs-evil-exchange
   bst:emacs-evil-expat
   bst:emacs-evil-goggles
   bst:emacs-evil-iedit-state
   bst:emacs-evil-indent-plus
   bst:emacs-evil-lion
   bst:emacs-evil-lisp-state
   bst:emacs-evil-matchit
   bst:emacs-evil-mc
   bst:emacs-evil-nerd-commenter
   bst:emacs-evil-numbers
   bst:emacs-evil-org
   bst:emacs-evil-owl
   bst:emacs-evil-paredit
   bst:emacs-evil-replace-with-register
   bst:emacs-evil-surround
   bst:emacs-evil-tex
   bst:emacs-evil-text-object-python
   bst:emacs-evil-textobj-line
   bst:emacs-evil-tutor
   bst:emacs-evil-vimish-fold
   bst:emacs-evil-visual-mark-mode
   bst:emacs-evil-visual-replace
   bst:emacs-evil-visualstar
   bst:emacs-eyebrowse
   bst:emacs-eziam-themes
   bst:emacs-f
   bst:emacs-farmhouse-light-mod-theme
   bst:emacs-farmhouse-themes
   bst:emacs-fb2-reader
   bst:emacs-flatland-theme
   bst:emacs-flatui-theme
   bst:emacs-flx
   bst:emacs-flx-ido
   bst:emacs-flycheck
   bst:emacs-flycheck-bashate
   bst:emacs-flycheck-clj-kondo
   bst:emacs-flycheck-credo
   bst:emacs-flycheck-elsa
   bst:emacs-flycheck-haskell
   bst:emacs-flycheck-joker
   bst:emacs-flycheck-package
   bst:emacs-flycheck-pos-tip
   bst:emacs-flycheck-rust
   bst:emacs-flyspell-correct
   bst:emacs-flyspell-correct-helm
   bst:emacs-font-utils
   bst:emacs-forge
   bst:emacs-frame-cmds
   bst:emacs-frame-fns
   bst:emacs-frame-purpose
   bst:emacs-frames-only-mode
   bst:emacs-frecency
   bst:emacs-frog-jump-buffer
   bst:emacs-gandalf-theme
   bst:emacs-geben
   bst:emacs-gh
   bst:emacs-gh-md
   bst:emacs-ghq
   bst:emacs-gist
   bst:emacs-git-messenger
   bst:emacs-github-review
   bst:emacs-gitignore-templates
   bst:emacs-gitlab-snip-helm
   bst:emacs-global-tags
   bst:emacs-goggles
   bst:emacs-google-translate
   bst:emacs-gotham-theme
   bst:emacs-goto-chg
   bst:emacs-gptel
   bst:emacs-grandshell-theme
   bst:emacs-grep-context
   bst:emacs-groovy-imports
   bst:emacs-groovy-mode
   bst:emacs-groovy-modes
   bst:emacs-gruber-darker
   bst:emacs-gruber-darker-theme
   bst:emacs-gruvbox-theme
   bst:emacs-guix
   bst:emacs-guix
   bst:emacs-haml-mode
   bst:emacs-haskell-mode
   bst:emacs-haskell-snippets
   bst:emacs-hc-zenburn-theme
   bst:emacs-helm
   bst:emacs-helm-ag
   bst:emacs-helm-bibtex
   bst:emacs-helm-c-yasnippet
   bst:emacs-helm-cider
   bst:emacs-helm-cider-history
   bst:emacs-helm-comint
   bst:emacs-helm-company
   bst:emacs-helm-core
   bst:emacs-helm-css-scss
   bst:emacs-helm-dash
   bst:emacs-helm-descbinds
   bst:emacs-helm-dictionary
   bst:emacs-helm-flycheck
   bst:emacs-helm-git-grep
   bst:emacs-helm-ls-git
   bst:emacs-helm-lsp
   bst:emacs-helm-make
   bst:emacs-helm-mode-manager
   bst:emacs-helm-mu
   bst:emacs-helm-org
   bst:emacs-helm-org-contacts
   bst:emacs-helm-org-ql
   bst:emacs-helm-org-rifle
   bst:emacs-helm-projectile
   bst:emacs-helm-purpose
   bst:emacs-helm-pydoc
   bst:emacs-helm-shell-history
   bst:emacs-helm-slime
   bst:emacs-helm-sly
   bst:emacs-helm-swoop
   bst:emacs-helm-system-packages
   bst:emacs-helm-taskrunner
   bst:emacs-helm-themes
   bst:emacs-helm-xref
   bst:emacs-hemisu-theme
   bst:emacs-heroku-theme
   bst:emacs-hexrgb
   bst:emacs-hide-comnt
   bst:emacs-highlight-parentheses
   bst:emacs-hlint-refactor
   bst:emacs-ht
   bst:emacs-html-to-hiccup
   bst:emacs-hungry-delete
   bst:emacs-hy-mode
   bst:emacs-hybrid-mode
   bst:emacs-impatient-mode
   bst:emacs-importmagic
   bst:emacs-indent-guide
   bst:emacs-inkpot-theme
   bst:emacs-insert-shebang
   bst:emacs-ir-black-theme
   bst:emacs-islisp-mode
   bst:emacs-ivy-clipmenu
   bst:emacs-ivy-omni-org
   bst:emacs-ivy-taskrunner
   bst:emacs-jazz-theme
   bst:emacs-jbeans-theme
   bst:emacs-journalctl-mode
   bst:emacs-js-doc
   bst:emacs-js2-refactor
   bst:emacs-jsdoc
   bst:emacs-json-navigator
   bst:emacs-json-reformat
   bst:emacs-jsonnet-mode
   bst:emacs-julia-snail
   bst:emacs-jump-last
   bst:emacs-kaocha-runner
   bst:emacs-kaolin-themes
   bst:emacs-kbd-mode
   bst:emacs-key-chord
   bst:emacs-kill-buffers
   bst:emacs-kodi-remote
   bst:emacs-lcr
   bst:emacs-light-soap-theme
   bst:emacs-litable
   bst:emacs-live-py-mode
   bst:emacs-livid-mode
   bst:emacs-llm
   bst:emacs-logito
   bst:emacs-loop
   bst:emacs-lsp-docker
   bst:emacs-lsp-haskell
   bst:emacs-lsp-ivy
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
   bst:emacs-lua-mode
   bst:emacs-lush-theme
   bst:emacs-lv
   bst:emacs-madhat2r-theme
   bst:emacs-magit
   bst:emacs-magit-annex
   bst:emacs-magit-gerrit
   bst:emacs-magit-org-todos-el
   bst:emacs-magit-popup
   bst:emacs-magit-section
   bst:emacs-magit-tbdiff
   bst:emacs-majapahit-themes
   bst:emacs-major-mode-hydra
   bst:emacs-markdown-toc
   bst:emacs-marshal
   bst:emacs-material-theme
   bst:emacs-math-preview
   bst:emacs-maven-test-mode
   bst:emacs-md4rd
   bst:emacs-metal-mercury-mode
   bst:emacs-meyvn
   bst:emacs-mini-echo
   bst:emacs-minimal-theme
   bst:emacs-minions
   bst:emacs-minitest
   bst:emacs-moe-theme
   bst:emacs-molokai-theme
   bst:emacs-monky
   bst:emacs-monochrome-theme
   bst:emacs-monroe
   bst:emacs-mu4e-alert
   bst:emacs-multi-line
   bst:emacs-multifiles
   bst:emacs-mustache
   bst:emacs-mustache
   bst:emacs-mustang-theme
   bst:emacs-mvn
   bst:emacs-naquadah-theme
   bst:emacs-neotree
   bst:emacs-nerd-icons
   bst:emacs-nix-mode
   bst:emacs-noctilux-theme
   bst:emacs-noflet
   bst:emacs-noman
   bst:emacs-ob-async
   bst:emacs-ob-elixir
   bst:emacs-ob-ipython
   bst:emacs-ob-sclang
   bst:emacs-obsidian-theme
   bst:emacs-occidental-theme
   bst:emacs-oldlace-theme
   bst:emacs-omtose-phellack-theme
   bst:emacs-omtose-phellack-themes
   bst:emacs-open-junk-file
   bst:emacs-openai
   bst:emacs-org
   bst:emacs-org-auto-expand
   bst:emacs-org-category-capture
   bst:emacs-org-cliplink
   bst:emacs-org-contacts
   bst:emacs-org-contrib
   bst:emacs-org-count-words
   bst:emacs-org-drill-table
   bst:emacs-org-edna
   bst:emacs-org-jira
   bst:emacs-org-make-toc
   bst:emacs-org-mind-map
   bst:emacs-org-node-3
   bst:emacs-org-now
   bst:emacs-org-pretty-table
   bst:emacs-org-project-capture
   bst:emacs-org-projectile
   bst:emacs-org-ql
   bst:emacs-org-recent-headings
   bst:emacs-org-recur
   bst:emacs-org-ref
   bst:emacs-org-rich-yank
   bst:emacs-org-roam
   bst:emacs-org-sidebar
   bst:emacs-org-super-agenda
   bst:emacs-org-texlive-collection
   bst:emacs-org-trello
   bst:emacs-org-vcard
   bst:emacs-org-web-tools
   bst:emacs-org-wild-notifier
   bst:emacs-org2web
   bst:emacs-org2web
   bst:emacs-orgalist
   bst:emacs-organic-green-theme
   bst:emacs-orgit
   bst:emacs-orgit-forge
   bst:emacs-orgmdb
   bst:emacs-origami
   bst:emacs-overseer
   bst:emacs-ox-pandoc
   bst:emacs-pandoc-mode
   bst:emacs-paradox
   bst:emacs-parinfer-mode
   bst:emacs-pass
   bst:emacs-passage
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
   bst:emacs-pippel
   bst:emacs-planet-theme
   bst:emacs-plantuml-mode
   bst:emacs-plz
   bst:emacs-plz-event-source
   bst:emacs-plz-media-type
   bst:emacs-poetry
   bst:emacs-popup
   bst:emacs-popwin
   bst:emacs-powerline
   bst:emacs-prettier-js
   bst:emacs-pretty-hydra
   bst:emacs-prodigy
   bst:emacs-prodigy-el
   bst:emacs-professional-theme
   bst:emacs-projectile
   bst:emacs-psc-ide
   bst:emacs-purple-haze-theme
   bst:emacs-pyenv-mode
   bst:emacs-pyimport
   bst:emacs-pytest
   bst:emacs-pythonic
   bst:emacs-racer
   bst:emacs-rail
   bst:emacs-refactor
   bst:emacs-relative-buffers
   bst:emacs-reveal-in-folder
   bst:emacs-reverse-theme
   bst:emacs-rime
   bst:emacs-rustic
   bst:emacs-sass-mode
   bst:emacs-sayid
   bst:emacs-scss-mode
   bst:emacs-seriestracker
   bst:emacs-seti-theme
   bst:emacs-shfmt
   bst:emacs-shrink-path
   bst:emacs-shroud
   bst:emacs-skeletor
   bst:emacs-slim-mode
   bst:emacs-sly
   bst:emacs-sly-asdf
   bst:emacs-sly-macrostep
   bst:emacs-sly-named-readtables
   bst:emacs-sly-package-inferred
   bst:emacs-sly-quicklisp
   bst:emacs-sly-stepper
   bst:emacs-smartparens
   bst:emacs-smeargle
   bst:emacs-smyx-theme
   bst:emacs-soft-charcoal-theme
   bst:emacs-soft-morning-theme
   bst:emacs-soft-stone-theme
   bst:emacs-solarized-theme
   bst:emacs-spaceleader
   bst:emacs-spaceline
   bst:emacs-spaceline-all-the-icons
   bst:emacs-speed-type
   bst:emacs-sphinx-doc
   bst:emacs-sqlite3
   bst:emacs-ssh-agency
   bst:emacs-standard-dirs
   bst:emacs-string-edit-at-point
   bst:emacs-subatomic-theme
   bst:emacs-subatomic256-theme
   bst:emacs-sublime-themes
   bst:emacs-suggest
   bst:emacs-sunny-day-theme
   bst:emacs-sxiv
   bst:emacs-system-packages
   bst:emacs-systemd
   bst:emacs-tagedit
   bst:emacs-tango-2-theme
   bst:emacs-tango-plus-theme
   bst:emacs-tangotango-theme
   bst:emacs-taskrunner
   bst:emacs-taxy
   bst:emacs-taxy-magit-section
   bst:emacs-tblui
   bst:emacs-tco
   bst:emacs-term-cursor
   bst:emacs-terminal-here
   bst:emacs-terraform-mode
   bst:emacs-tide
   bst:emacs-toodoo
   bst:emacs-toxi-theme
   bst:emacs-tp
   bst:emacs-transient
   bst:emacs-treemacs
   bst:emacs-treemacs-evil
   bst:emacs-treemacs-extra
   bst:emacs-treemacs-icons-dired
   bst:emacs-treemacs-magit
   bst:emacs-treemacs-persp
   bst:emacs-treemacs-projectile
   bst:emacs-ts
   bst:emacs-tweaks
   bst:emacs-twilight-anti-bright-theme
   bst:emacs-twilight-bright-theme
   bst:emacs-twilight-theme
   bst:emacs-typit
   bst:emacs-ujelly-theme
   bst:emacs-undercover
   bst:emacs-underwater-theme
   bst:emacs-undo-tree
   bst:emacs-unfill
   bst:emacs-unicode-fonts
   bst:emacs-unpackaged
   bst:emacs-use-package
   bst:emacs-use-package-chords
   bst:emacs-uuidgen
   bst:emacs-vdiff-magit
   bst:emacs-vi-tilde-fringe
   bst:emacs-vimish-fold
   bst:emacs-vline
   bst:emacs-volatile-highlights
   bst:emacs-vterm
   bst:emacs-vundo
   bst:emacs-web-beautify
   bst:emacs-web-completion-data
   bst:emacs-wfnames
   bst:emacs-wgrep
   bst:emacs-white-sand-theme
   bst:emacs-winum
   bst:emacs-with-editor
   bst:emacs-writefreely
   bst:emacs-writegood-mode
   bst:emacs-writeroom-mode
   bst:emacs-xenops
   bst:emacs-xhair
   bst:emacs-xterm-color
   bst:emacs-yaml-mode
   bst:emacs-yasnippet
   bst:emacs-yasnippet-snippets
   bst:emacs-ytdl
   bst:emacs-zen-and-art-theme
   bst:emacs-zenburn-theme
   bst:emacs-zonokai-emacs
   bst:emacs-zoom-frm
   ))
(testsymb 'bst-packages)

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

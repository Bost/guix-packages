#!/bin/sh

set -e
set -x

# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-auctex-latexmk)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-clean-aindent-mode)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-closql)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-code-review)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-codegpt)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-company-shell)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-concurrent)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-consult)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-ctable)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-cython-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-dall-e)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-define-word)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-dired-quick-sort)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-disable-mouse)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-drupal-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-eat)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-ef-themes)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-elisp-def)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-ellama)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-emacsql)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-emr)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-epc)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-image)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-tweet)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-view-log)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-yt)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-eval-sexp-fu)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-easymotion)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-lisp-state)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-textobj-line)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-tutor)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-visual-mark-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flx-ido)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-bashate)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-credo)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-elsa)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-pos-tip)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flyspell-correct-helm)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-forge)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-geben)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-gh-md)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-ghub)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-gitignore-templates)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-groovy-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-haml-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-comint)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-git-grep)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-purpose)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-highlight-parentheses)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-hungry-delete)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-iedit)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-impatient-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-importmagic)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-journalctl-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-kbd-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-live-py-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-livid-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-llm)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-load-env-vars)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-lsp-latex)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-lsp-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-maven-test-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-molokai)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-mvn)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-nose)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-ob-elixir)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-omtose-phellack-themes)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-open-junk-file)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-openai)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-org-category-capture)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-org-project-capture)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-org-projectile)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-orgit)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-orgit-forge)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-overseer)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pdf-view-restore)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-php-extras)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-php-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-phpunit)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pip-requirements)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pipenv)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-poetry)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-prettier-js)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-py-isort)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pydoc)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pyenv-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pytest)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pyvenv)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-reformatter)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-reveal-in-folder)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-sass-mode)'
# guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-shell-maker)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-shfmt)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-sqlite3)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-string-edit-at-point)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-systemd)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-transient)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-treemacs-evil)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-treemacs-icons-dired)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-treemacs-persp)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-treemacs-projectile)'

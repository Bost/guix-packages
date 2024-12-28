#!/bin/sh

set -e
set -x

guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-overseer)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-php-extras)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-php-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-emr)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-tweet)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-view-log)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-yt)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-drupal-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-elisp-def)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-dall-e)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-gh-md)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flx-ido)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-define-word)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-concurrent)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-company-shell)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-easymotion)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-tutor)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-code-review)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-codegpt)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-dired-quick-sort)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-lisp-state)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-textobj-line)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-visual-mark-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-org-projectile)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-phpunit)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pip-requirements)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-bashate)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-credo)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-elsa)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-pos-tip)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-flyspell-correct-helm)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-gitignore-templates)'

guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-haml-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-comint)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-git-grep)'

guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-purpose)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-highlight-parentheses)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-hungry-delete)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-live-py-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-livid-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-llm)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-molokai)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-omtose-phellack-themes)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-openai)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-orgit)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-py-isort)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pydoc)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pyenv-mode)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pytest)'
guix build -c 24 -L ./src -e '(@(bost gnu packages emacs-xyz-new) emacs-pyvenv)'

# exists:
gxse emacs-llm
gxse emacs-molokai  # emacs-molokai-theme
gxse emacs-py-isort
gxse emacs-pyenv-mode

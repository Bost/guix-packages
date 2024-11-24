#!/bin/sh

set -e
set -x

# guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-auctex-latexmk)'
# guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-clean-aindent-mode)'
# guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-closql)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-codegpt)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-company-shell)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-concurrent)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-consult)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-ctable)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-cython-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-dall-e)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-define-word)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-dired-quick-sort)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-disable-mouse)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-drupal-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-eat)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-ef-themes)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-elisp-def)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-ellama)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-emacsql)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-emr)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-epc)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-image)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-tweet)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-view-log)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-erc-yt)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-eval-sexp-fu)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-easymotion)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-lisp-state)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-textobj-line)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-tutor)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-evil-visual-mark-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-flx-ido)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-bashate)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-credo)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-elsa)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-flycheck-pos-tip)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-flyspell-correct-helm)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-forge)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-geben)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-gh-md)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-ghub)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-gitignore-templates)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-groovy-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-haml-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-comint)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-git-grep)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-helm-purpose)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-highlight-parentheses)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-hungry-delete)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-iedit)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-impatient-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-importmagic)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-indent-guide)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-insert-shebang)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-journalctl-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-kbd-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-live-py-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-livid-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-llm)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-load-env-vars)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-lsp-latex)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-lsp-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-magit)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-magit-popup)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-magit-section)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-maven-test-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-molokai)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-mvn)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-nose)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-ob-elixir)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-omtose-phellack-themes)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-open-junk-file)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-openai)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-org-category-capture)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-org-project-capture)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-org-projectile)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-orgit)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-orgit-forge)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-overseer)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pcsv)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pdf-tools)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pdf-view-restore)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-php-extras)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-php-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-phpunit)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pip-requirements)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pipenv)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-plz)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-poetry)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pos-tip)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-prettier-js)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-py-isort)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pydoc)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pyenv-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pytest)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-pyvenv)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-reformatter)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-reveal-in-folder)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-sass-mode)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-shell-maker)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-shfmt)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-smeargle)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-sqlite3)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-string-edit-at-point)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-systemd)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-tblui)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-transient)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-treemacs-evil)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-treemacs-icons-dired)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-treemacs-persp)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-treemacs-projectile)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-treepy)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-uuidgen)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-wfnames)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-xhair)'
guix build -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz-new) emacs-yapfify)'

#!/home/bost/.guix-profile/bin/emacs --script

;; for `-compose' and `-partial'
(require 'dash)
(require 'f)

(setq
 pkgs
 '(
   (
    "https://github.com/ankurdave/color-identifiers-mode"
    ""
    "/home/bost/.local/share/spacemacs/elpa/28.2/develop/color-identifiers-mode-20230302.226/color-identifiers-mode.el"
    )
   ))

(setq
 pkgs5
 '(
   (
    "https://github.com/purcell/color-theme-sanityinc-solarized"
    "2.29"
    "/home/bost/.emacs.d/elpa/28.2/develop/color-theme-sanityinc-solarized-20220917.1350/color-theme-sanityinc-solarized.el"
    )
   ))

(setq
 pkgs4
 '(
   (
    "https://github.com/zerolfx/copilot.el.git"
    "0"
    "/home/bost/.emacs.d/elpa/28.2/develop/copilot-20230330.33957/copilot.el"
    )
   ))

(setq
 pkgs3
 '(
   (
    "https://github.com/karthink/gptel"
    "0.10"
    "/home/bost/.emacs.d/elpa/28.2/develop/gptel-20230320.35819/gptel.el"
    )
   ))

(setq
 pkgs2
 '(
   (
    "https://github.com/osv/web-completion-data"
    "0.2"
    "/home/bost/.local/share/spacemacs/elpa/28.2/develop/web-completion-data-20160318.848/web-completion-data.el"
    )
   ))

(setq
  pkgs1
  '(
    ;; django-theme is a copy of hemisu-theme ???
    ;; https://github.com/andrzejsliwa/hemisu-theme.git
    ;; ("http://github/anrzejsliwa/django-theme"
    ;;  "1.0.0"
    ;;  "/home/bost/.local/share/spacemacs/elpa/28.2/develop/hemisu-theme-20130508.1844/hemisu-theme.el"
    ;;  )

    ("https://github.com/Alexander-Miller/treemacs"
     "0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/treemacs-magit-20220917.1026/treemacs-magit.el"
     )
    ("https://github.com/mbezjak/emacs-groovy-imports"
     "1.0.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/groovy-imports-20210505.1807/groovy-imports.el"
     )
    ("https://github.com/andre-r/centered-cursor-mode.el"
     "0.5.12"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/centered-cursor-mode-20200507.1529/centered-cursor-mode.el"
     )
    ("https://github.com/emacs-helm/helm-dictionary"
     "1.0.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/helm-dictionary-20220514.714/helm-dictionary.el"
     )
    ("https://github.com/abo-abo/auto-yasnippet"
     "1.0.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/auto-yasnippet-20230208.331/auto-yasnippet.el"
     )
    ("https://github.com/zonuexe/composer.el"
     "0.2.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/composer-20221120.202/composer.el"
     )
    ("https://github.com/mswift42/soft-stone-theme"
     "0.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/soft-stone-theme-20140614.835/soft-stone-theme.el"
     )

    ("https://github.com/jimeh/twilight-anti-bright-theme"
     "0.3.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/twilight-anti-bright-theme-20160622.848/twilight-anti-bright-theme.el"
     )
    ("https://github.com/Alexander-Miller/treemacs"
     "0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/treemacs-icons-dired-20220915.1626/treemacs-icons-dired.el"
     )
    ("https://github.com/Alexander-Miller/treemacs"
     "0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/treemacs-evil-20220911.1427/treemacs-evil.el"
     )
    ("https://github.com/vibhavp/erc-social-graph"
     "1.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/erc-social-graph-20150508.1204/erc-social-graph.el"
     )

    ;; color-theme-molokai.el requires color-theme
    ("https://github.com/alloy-d/color-theme-molokai"
     "0.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/molokai-theme-20220106.1520/molokai-theme.el"
     )
    ("https://github.com/mpickering/hlint-refactor-mode"
     "0.0.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/hlint-refactor-20190115.900/hlint-refactor.el"
     )
    ("https://github.com/Alexander-Miller/treemacs"
     "0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/treemacs-persp-20220911.1427/treemacs-persp.el"
     )

    ("https://github.com/IvanMalison/multi-line"
     "0.1.5"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/multi-line-20220112.1744/multi-line.el"
     )

    ("https://github.com/ankurdave/color-identifiers-mode"
     "1.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/color-identifiers-mode-20230210.2047/color-identifiers-mode.el"
     )
    ("https://github.com/SavchenkoValeriy/emacs-chocolate-theme"
     "0.2.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/chocolate-theme-20210128.1647/chocolate-theme.el"
     )
    ("https://github.com/Malabarba/paradox"
     "2.5.5"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/paradox-20191011.1119/paradox.el"
     )

    ("https://github.com/mswift42/soft-charcoal-theme"
     "0.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/soft-charcoal-theme-20140420.1643/soft-charcoal-theme.el"
     )

    ;; (
    ;;  "https://github.com/AndreaCrotti/yasnippet-snippets"
    ;;  "1.0"
    ;;  "/home/bost/.local/share/spacemacs/elpa/28.2/develop/yasnippet-snippets-20230216.942/yasnippet-snippets.el"
    ;;  )

    ("https://github.com/emacsfodder/emacs-clues-theme"
     "1.0.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/clues-theme-20161213.1127/clues-theme.el"
     )
    ("https://github.com/cmack/emacs-planet-theme"
     "0.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/planet-theme-20161031.217/planet-theme.el"
     )
    ("https://github.com/mooz/js-doc"
     "0.0.5"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/js-doc-20160715.434/js-doc.el"
     )
    ("https://github.com/olcai/occidental-theme"
     "1.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/occidental-theme-20130312.1958/occidental-theme.el"
     )

    ;; hybrid-mode is a part of spacemacs
    ;; ("https://github.com/syl20bnr/spacemacs"
    ;;  "1.0"
    ;;  "/home/bost/.local/share/spacemacs/elpa/28.2/develop/hybrid-mode-20230220.120717/hybrid-mode.el"
    ;;  )

    ("https://github.com/rexim/gruber-darker-theme"
     "0.7"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/gruber-darker-theme-20221122.1143/gruber-darker-theme.el"
     )
    ("https://github.com/emacs-php/phpactor.el"
     "0.1.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/company-phpactor-20221023.608/company-phpactor.el"
     )
    ("https://github.com/emacs-evil/goto-chg"
     "1.7.5"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/goto-chg-20220107.1733/goto-chg.el"
     )
    ("https://github.com/ejmr/php-auto-yasnippets"
     "2.3.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/php-auto-yasnippets-20170331.31431/php-auto-yasnippets.el"
     )
    ("https://github.com/syohex/emacs-helm-pydoc"
     "0.07"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/helm-pydoc-20160918.542/helm-pydoc.el"
     )
    ("https://github.com/emacs-lsp/lsp-haskell"
     "1.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/lsp-haskell-20230104.1508/lsp-haskell.el"
     )
    ("https://github.com/pierre-lecocq/darkmine-theme"
     "0.5"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/darkmine-theme-20160406.624/darkmine-theme.el"
     )
    ("https://github.com/ShingoFukuyama/helm-css-scss"
     "1.3"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/helm-css-scss-20191230.1549/helm-css-scss.el"
     )
    ("https://github.com/antonj/scss-mode"
     "0.5.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/scss-mode-20180123.1708/scss-mode.el"
     )
    ("https://github.com/bbatsov/solarized-emacs"
     "1.3.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/solarized-theme-20220619.1203/solarized-theme.el"
     )
    ("https://github.com/joostkremers/writeroom-mode"
     "3.12"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/writeroom-mode-20220426.2046/writeroom-mode.el"
     )
    ("https://github.com/007kevin/pdf-view-restore"
     "0.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/pdf-view-restore-20190904.1708/pdf-view-restore.el"
     )

    ;; ("https://emacs-helm.github.io/helm"
    ;;  "3.9.0"
    ;;  "/home/bost/.local/share/spacemacs/elpa/28.2/develop/helm-core-20230217.602/helm-core.el"
    ;;  )

    ("https://github.com/ogdenwebb/emacs-kaolin-themes"
     "1.6.7"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/kaolin-themes-20230126.2302/kaolin-themes.el"
     )
    ("https://github.com/haskell/haskell-snippets"
     "0.1.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/haskell-snippets-20210228.344/haskell-snippets.el"
     )
    ("https://github.com/arnested/drupal-mode"
     "0.7.4"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/drupal-mode-20220125.1044/drupal-mode.el"
     )
    ("https://github.com/astoff/code-cells.el"
     "0.3"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/code-cells-20220917.1431/code-cells.el"
     )
    ("https://github.com/emacs-php/php-mode"
     "1.24.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/php-mode-20230212.731/php-project.el"
     )
    ("https://github.com/juba/color-theme-tangotango"
     "0.0.7"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/tangotango-theme-20220714.2034/tangotango-theme.el"
     )
    ("https://github.com/Kungi/helm-cider-history"
     "0.0.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/helm-cider-history-20150719.2120/helm-cider-history.el"
     )
    ("https://github.com/lewang/flx"
     "0.6.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/flx-20221213.542/flx.el"
     )
    ("https://github.com/emacs-php/php-mode"
     "1.24.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/php-mode-20230212.731/php.el"
     )
    ("https://github.com/jimeh/twilight-bright-theme.el"
     "0.1.0"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/twilight-bright-theme-20130605.843/twilight-bright-theme.el"
     )
    ("https://github.com/osv/company-web"
     "2.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/company-web-20220115.2146/company-web.el"
     )
    ;; ("https://github.com/emacs-php/php-mode/wiki/Local-PHP-Manual"
    ;;  "2.0.0"
    ;;  "/home/bost/.local/share/spacemacs/elpa/28.2/develop/php-mode-20230212.731/php-local-manual.el"
    ;;  )
    ("https://github.com/emacs-php/php-mode"
     "1.24.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/php-mode-20230212.731/php-mode.el"
     )
    ("https://github.com/jwiegley/use-package"
     "2.4.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/bind-key-20230203.2004/bind-key.el"
     )
    ("https://github.com/proofit404/pythonic"
     "0.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/pythonic-20220723.1741/pythonic.el"
     )
    ("https://github.com/emacs-php/php-mode"
     "1.24.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/php-mode-20230212.731/php-align.el"
     )
    ("https://github.com/DamienCassou/json-navigator"
     "0.1.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/json-navigator-20191213.755/json-navigator.el"
     )
    ("https://github.com/thblt/eziam-theme-emacs"
     "4"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/eziam-themes-20221121.1609/eziam-themes.el"
     )
    ("https://github.com/emacs-php/php-mode"
     "1.24.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/php-mode-20230212.731/php-face.el"
     )
    ("https://github.com/d12frosted/flyspell-correct"
     "0.6.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/flyspell-correct-helm-20220520.630/flyspell-correct-helm.el"
     )
    ("https://github.com/emacs-php/php-mode"
     "1.24.2"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/php-mode-20230212.731/php-mode-debug.el"
     )
    ("https://github.com/company-mode/company-statistics"
     "0.2.3"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/company-statistics-20170210.1933/company-statistics.el"
     )

    ;; ("https://github.com/syl20bnr/spacemacs"
    ;;  "1.0"
    ;;  "/home/bost/.local/share/spacemacs/elpa/28.2/develop/holy-mode-20230220.113515/holy-mode.el"
    ;;  )

    ("https://github.com/sigma/pcache"
     "0.5.1"
     "/home/bost/.local/share/spacemacs/elpa/28.2/develop/pcache-20220724.1841/pcache.el"
     )
    ))

(defun lint-get-forms (filename)
  "Read FILENAME and return a list of its Lisp forms."
  (with-temp-buffer
    (let ((buf (current-buffer))
          forms)
      (insert-file-contents filename)
      (while (ignore-errors (push (read buf) forms)))
      (nreverse forms))))

(pcase-defmacro sexp (kw) `(pred (equal ,kw)))
;; (sexp--pcase-macroexpander 'provide) ;; => (pred (equal provide))

(setq inputs-to-remove
      (mapcar (-compose
               (-partial #'concat "emacs-")
               #'symbol-name)
              '(advice cl cl-lib
                       wid-edit cus-face
                       ;; color is needed
                       compile
                       ;; dash is needed
                       eieio erc hierarchy json
                       rx seq subr-x)))

(defun find-sexps (kw lst)
  "Remove nil elements"
  (funcall
   (-compose
    ;; (-partial #'mapcar (-compose (-partial #'message "%s")))
    (-partial #'remove nil)
    (-partial #'mapcar
              (-compose
               (-partial
                (lambda (kw lst)
                  (pcase lst
                    (`(,(sexp kw) ,pkg)
;;; TODO find out what is the type of PKG? It's not a string neither symbol.
                     (concat "emacs-" (substring (format "%s" pkg) 1)))))
                kw))))
   lst))

(defun analyze (pkg)
  (funcall
   (-compose
    (lambda (lst)
      (list
       (append (find-sexps 'provide-theme lst) (find-sexps 'provide lst))
       ;; (find-sexps 'provide lst)
       ;; emacs-dash is needed
       (find-sexps 'require lst)))
    #'reverse
    #'lint-get-forms
    #'caddr)
   pkg))

(funcall
 (-compose
  (lambda (_)
    (message "%s" "Now run ./create-elisp-package-definition.scm"))
  (lambda (s)
    (f-write-text (format "%s" (pp
                                `(define pkgs-analyzed
                                   ',s)))
                  'utf-8 (format "%s/analyzed.scm" (getenv "dotf"))))
  ;; (-partial #'mapcar #'print)
  (-partial #'mapcar
            (lambda (pkg)
"(git-url, version, elisp-file). E.g.:
   (
    \"https://github.com/osv/web-completion-data\"
    \"0.2\"
    \"/home/bost/.local/share/spacemacs/elpa/28.2/develop/web-completion-data-20160318.848/web-completion-data.el\"
    ) "

              (let ((r (analyze pkg)))
                (list (caar r)    ; package name - string
                      (car pkg)   ; repo url - string
                      (cadr pkg)  ; version
                      (let* ((input-syms     (mapcar #'intern (cadr r)))
                             (input-syms-rem (mapcar #'intern inputs-to-remove))
                             (inputs (cl-set-difference input-syms input-syms-rem)))
                        ;; (message "r: %s" r)
                        ;; (message "input-syms: %s" input-syms)
                        `(propagated-inputs
                          (list ,@inputs)))    ; required packages - list
                      (caddr pkg) ; file
                      )))))
 ;; (list (car pkgs) (cadr pkgs))
 pkgs)

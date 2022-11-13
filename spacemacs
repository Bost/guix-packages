#!/gnu/store/d99ykvj3axzzidygsmdmzxah4lvxd6hw-bash-5.1.8/bin/sh
set -x
exec -a /gnu/store/d99ykvj3axzzidygsmdmzxah4lvxd6hw-bash-5.1.8/bin/sh \
     /gnu/store/gxjwd3q2iy3hgzwnc37mcnvfiv2s1pxz-emacs-28.2/bin/emacs \
     --no-init-file \
     --eval '
(progn
 (setq spacemacs-start-directory
        (concat
         "/home/bost/.spacemacs-guix.d"
         "/"))
 (setq spacemacs-data-directory
  (concat
   (or (getenv "XDG_DATA_DIR")
    (concat (getenv "HOME") "/.local/share"))
   "/spacemacs/"))
 (setq package-user-dir
  (concat spacemacs-data-directory "elpa/"))
 (load-file
  (concat spacemacs-start-directory "init.el")))
' \
      "$@"
set +x

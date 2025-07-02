;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2019 Bryan Ferris <saffronsnail@protonmail.com>
;;; Copyright © 2022-2025 Rostislav Svoboda <Rostislav.Svoboda@gmail.com>
;;;
;;; TODO This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (bost guix build spacemacs-utils)
  #:use-module (bost utils)
  #:use-module (guix build utils)
  #:use-module (oop goops)
  #:use-module (ice-9 pretty-print)
  #:use-module (srfi srfi-1)
  #:export (spacemacs-builder))

(define m (module-name-for-logging))
(evaluating-module)

(define (create-initialization-code spacemacs)
  "Create elisp code that sets spacemacs-specific variables and then loads the
spacemacs initialization file
https://specifications.freedesktop.org/basedir-spec/latest/

$XDG_DATA_HOME
$XDG_CONFIG_HOME
$XDG_STATE_HOME
$XDG_DATA_DIRS
$XDG_CONFIG_DIRS
$XDG_CACHE_HOME.
$XDG_RUNTIME_DIR
"
  (define f (format #f "[create-initialization-code]" m))
  ;; (format #t "#### ~a starting...\n" f)
  ;; (format #t "#### ~a spacemacs : ~a" f spacemacs)
  (let* ((v (substring spacemacs (- (string-length spacemacs) (string-length "-1.0-0.0c2e845"))))
         (start-dir (string-append spacemacs "/share/emacs/site-lisp/spacemacs" v "/")))
    `(progn
      (setq spacemacs-start-directory ,start-dir)

      ;; For development purposes
      ;; (setq spacemacs-start-directory
      ;;       (concat "~/.emacs.d.spguimacs" "/"))

      (setq spacemacs-cache-directory
            (concat (or
                     ;; (and (getenv "XDG_CACHE_HOME")
                     ;;      (expand-file-name "emacs" (getenv "XDG_CACHE_HOME")))
                     (expand-file-name ".cache" (getenv "HOME")))
                    "/"))

      (setq spacemacs-data-directory
            (concat (or
                     ;; (and (getenv "XDG_DATA_DIRS")
                     ;;      (expand-file-name "emacs" (getenv "XDG_DATA_DIRS")))
                     (expand-file-name ".cache" (getenv "HOME")))
                    "/spacemacs/"))

      (setq package-user-dir (concat spacemacs-data-directory "elpa/"))

      (mapcar (lambda (dir)
                (unless (file-directory-p dir)
                  (make-directory dir)))
              (list
               spacemacs-start-directory
               spacemacs-cache-directory
               spacemacs-data-directory
               ;; configuration-layer-template-directory
               ;; configuration-layer-directory
               ;; configuration-layer-private-layer-directory
               ;; configuration-layer-lock-file
               ;; configuration-layer-stable-elpa-directory
               ;; configuration-layer--stable-elpa-gpg-keyring
               ;; configuration-layer--elpa-root-directory
               ;; configuration-layer--rollback-root-directory
               ;; configuration-layer-rollback-directory
               package-user-dir))

      (load-file (concat spacemacs-start-directory "init.el")))))
(testsymb 'create-initialization-code)

(define (generate-wrapper shell output executable . args)
  "Create a shell script interpreted by sh-compatible shell `shell` that
executes `executable` passing arguments `args` as well as any passed in from
the command line."
  (define f (format #f "[generate-wrapper]" m))
  ;; (format #t "#### ~a starting...\n" f)
  (call-with-output-file
      output (lambda (port)
               (format port "~A~%~A"
                       (string-append "#!" shell)
                       (string-join (list "exec" "-a" shell
                                          executable (string-join args)
                                          "\"$@\"")))))
  (chmod output #o555))
(testsymb 'generate-wrapper)

(define* (spacemacs-builder #:key shell emacs spacemacs out)
  "Create exectables that run emacs, the emacs server, and the emacs client
with Spacemacs code preloaded."
  (define f (format #f "~a [spacemacs-builder]" m))
  (format #t "#### ~a starting...\n" f)
  (format #t "~a shell: ~a\n" f shell)
  (format #t "~a emacs: ~a\n" f emacs)
  (format #t "~a spacemacs: ~a\n" f spacemacs)
  (format #t "~a out: ~a\n" f out)

  (mkdir-p out)

  (generate-wrapper shell
                    (string-append out "/spacemacs")
                    emacs "--no-init-file" "--debug-init" "--eval"
;;; \n is here just for the readability purposes when viewed by
;;;   cat  (readlink  (which spacemacs))   # in fish-shell
;;;   cat $(readlink $(which spacemacs))   # in bash
                    (string-append "'\n"
                                   (pretty-print->string
                                    ;; object->string
                                    (create-initialization-code spacemacs))
                                   "'"))

  (generate-wrapper shell
                    (string-append out "/spacemacsdaemon")
                    (string-append out "/spacemacs")
                    "--daemon=spacemacs")

  (generate-wrapper shell
                    (string-append out "/spacemacsclient")
                    (string-append emacs "client")
                    "--no-wait"
;;; Can't use
;;;   (or (getenv "XDG_DATA_DIR")
;;;       (string-append (getenv "HOME") "/.local/share"))
;;; At the execution time the value of (getenv "HOME") is "/homeless-shelter"
;;; TODO implement it in the shell-script language
                    "--socket-name=$HOME/.local/share/spacemacs/server/server"
                    ))
(testsymb 'spacemacs-builder)

(module-evaluated)

;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2019 Bryan Ferris <saffronsnail@protonmail.com>
;;; Copyright © 2022,2023 Rostislav Svoboda <Rostislav.Svoboda@gmail.com>
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

#|

TODO Launch emacs instances using the --init-directory paramater (, introduced
in Emacs 29) instead of using Chemac2 from ~/.emacs.d/.

TODO Compute the list of available (and also needed) dependencies and add to
to the list of inputs/native-inputs of the emacs-spacemac package.

A package is orphan if it's not distant and not protected. I.e. if it is local or unprotected

TODO Add (write-pkg-file ...) to the every package where I get "Unable to
activate package `%s'. Required package `%s-%s' is unavailable"

|#

(define-module (bost guix build spacemacs-utils)
  #:use-module (bost utils)
  #:use-module (guix build utils)
  #:use-module (oop goops)
  #:use-module (ice-9 pretty-print)
  #:use-module (srfi srfi-1)
  #:export (builder))

(define m (module-name-for-logging))
;; (format #t "~a evaluating module ...\n" m)

(define (pretty-print->string sexp)
  (let [(port (open-output-string))]
    (pretty-print sexp port)
    (let* [(ret (get-output-string port))]
      (close-output-port port)
      ret)))

;; (format #t "~a ... " "(define (create-initialization-code spacemacs) ...)")
(define (create-initialization-code spacemacs)
  "Create elisp code that sets spacemacs-specific variables and then loads the
spacemacs initialization file"
  (write (format #f "[create-initialization-code] spacemacs: ~a" spacemacs))
  `(progn
    (setq spacemacs-start-directory
          (concat ,spacemacs "/"))
    ;; For development purposes
    (setq spacemacs-start-directory
          (concat "~/.emacs.d.spguimacs" "/"))
    (setq spacemacs-data-directory
          (concat (or (getenv "XDG_DATA_DIR")
                      (concat (getenv "HOME") "/.local/share"))
                  "/spacemacs/"))
    (setq package-user-dir (concat spacemacs-data-directory "elpa/"))
    (load-file (concat spacemacs-start-directory "init.el"))))
(testsymb 'create-initialization-code)

;; (format #t "~a ... " "(define (generate-wrapper shell output executable . args) ...)")
(define (generate-wrapper shell output executable . args)
  "Create a shell script interpreted by sh-compatible shell `shell` that
executes `executable` passing arguments `args` as well as any passed in from
the command line."
  (call-with-output-file
      output (lambda (port)
               (format port "~A~%~A"
                       (string-append "#!" shell)
                       (string-join (list "exec" "-a" shell
                                          executable (string-join args)
                                          "\"$@\"")))))
  (chmod output #o555))
(testsymb 'generate-wrapper)

;; (format #t "~a ... " "(define* (builder ...) ...)")
(define* (builder #:key shell emacs spacemacs out)
  "Create exectables that run emacs, the emacs server, and the emacs client
with Spacemacs code preloaded."
  (let* [(f "[builder]")]
    (write (format #f "~a shell: ~a" f shell))
    (write (format #f "~a emacs: ~a" f emacs))
    (write (format #f "~a spacemacs: ~a" f spacemacs))
    (write (format #f "~a out: ~a" f out)))

  (mkdir-p out)

  (generate-wrapper shell
                    (string-append out "/spacemacs")
                    emacs "--no-init-file" "--eval"
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
(testsymb 'builder)

;; (format #t "~a module evaluated\n" m)

;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2019 Bryan Ferris <saffronsnail@protonmail.com>
;;;
;;; This file is part of GNU Guix.
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

;; (format #t "~a... " "")
;; (format #t "done\n")

(define-module (guix build spacemacs-utils)
  #:use-module (bost utils)
  #:use-module (guix build utils)
  #:use-module (oop goops)
  #:use-module (ice-9 pretty-print)
  #:use-module (srfi srfi-1)

  #:export (builder))

(define m (module-name-for-logging))

(define hack-the-start-script? #t)

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
  (format #t "[create-initialization-code] spacemacs: ~a\n" spacemacs)
  (pretty-print->string
   ;; object->string
   (let* [(dir (if hack-the-start-script? "'$edir'" spacemacs))]
     `(progn
       (setq spacemacs-start-directory
             (concat ,(if hack-the-start-script? "'$edir'" spacemacs) "/"))
       (setq spacemacs-data-directory
             (concat (or (getenv "XDG_DATA_DIR")
                         (concat (getenv "HOME") "/.local/share"))
                     "/spacemacs/"))
       (setq package-user-dir (concat spacemacs-data-directory "elpa/"))
       (load-file (concat spacemacs-start-directory "init.el"))))))
(testsymb 'create-initialization-code)

(define the-hack-code
  "
# Exit immediately if a command exits with a non-zero status
set -e

# Problem:
# spacemacs-rolling-release installation directory in the /gnu/store is empty,
# i.e. the spacemacs.scm -> (assoc-ref %build-inputs \"spacemacs\") returns an
# empty directory.
#
# Possible solutions:
# 1. Try
#    $ guix build --check emacs-spacemacs spacemacs-rolling-release
#    $ sudo guix build --repair emacs-spacemacs spacemacs-rolling-release
#
# 2. Hack the start-script
# Get the spacemacs commit id. (the tilda '~' doesn't work):
cid=$(guix show spacemacs-rolling-release | rg 'version: 0.999.0-0.' | rg --only-matching '.{7}$')
# List a list of all relevant directories:

dirs=$(ls -d1 /gnu/store/*-spacemacs-rolling-release-0.999.0-0.$cid)
# The list $dirs should be two directories. One of them should be empty the
# other not

# Get the nonempty directory:
edir=$(find $dirs -maxdepth 0 -type d -not -empty)

# If everything fails, try to use:
# edir=/home/bost/dev/.spguimacs.d

# Print commands and their arguments as they are executed
# set -x

# Any printf or echo will prevent the script from running
# printf 'edir: %s\\n' $edir
# printf \"edir: %s\\n\" $edir
# echo 'edir: $edir'
# echo \"edir: $edir\"
")

;; (format #t "the-hack-code:\n~a\n" the-hack-code)

;; (format #t "~a ... " "(define (generate-wrapper shell output executable . args) ...)")
(define (generate-wrapper shell output executable . args)
  "create a shell script interpreted by sh-compatible shell `shell` that
executes `executable` passing arguments `args` as well as any passed in from
the command line."
  (call-with-output-file
      output (lambda (port)
               (format port "~A~%~A"
                       (string-append
                        "#!" shell
                        (if (and hack-the-start-script?
                                 (string-suffix-ci? "/spacemacs" output))
                            (begin
                              (format #t "[generate-wrapper] ### Hacking the output:\n~a\n" output)
                              the-hack-code)
                            ""))
                       (string-join (list "exec" "-a" shell
                                          executable (string-join args)
                                          "\"$@\"")))))
  (chmod output #o555))
(testsymb 'generate-wrapper)

;; (format #t "~a ... " "(define* (builder ...) ...)")
(define* (builder #:key shell emacs spacemacs out)
  "Create exectables that run emacs, the emacs server, and the emacs client
with Spacemacs code preloaded."
  ;; WTF? The messages are not displayed on the output.
  (format #t "\n")
  (format #t "[builder] shell: ~a\n" shell)
  (format #t "[builder] emacs: ~a\n" emacs)
  (format #t "[builder] spacemacs: ~a\n" spacemacs)
  (format #t "[builder] out: ~a\n" out)

  (mkdir-p out)

  (generate-wrapper shell
                    (string-append out "/spacemacs")
                    emacs "--no-init-file" "--eval"
                    (string-append "'"
                                   (create-initialization-code spacemacs)
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

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


(format #t "~a ... " "(define-module (guix build spacemacs-utils) ...)")
(define-module (guix build spacemacs-utils)
  #:use-module (guix build utils)
  #:use-module (oop goops)
  #:use-module (srfi srfi-1)

  #:export (builder))
(format #t "done\n")

(define (create-initialization-code spacemacs)
  "Create elisp code that sets spacemacs-specific variables and then loads the
spacemacs initialization file"
  (object->string
   `(progn
     (setq spacemacs-start-directory (concat ,spacemacs "/"))
     (setq spacemacs-data-directory
           (concat (or (getenv "XDG_DATA_DIR")
                       (concat (getenv "HOME") "/.local/share"))
                   "/spacemacs/"))
     (setq package-user-dir (concat spacemacs-data-directory "elpa/"))
     (load-file (concat spacemacs-start-directory "init.el")))))

(define (generate-wrapper shell output executable . args)
  "create a shell script interpreted by sh-compatible shell `shell` that
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

(define* (builder #:key shell emacs spacemacs out)
  "Create exectables that run emacs, the emacs server, and the emacs client
with Spacemacs code preloaded."
  (mkdir-p out)

  (generate-wrapper shell
                    (string-append out "/spacemacs")
                    emacs " --no-init-file" "--eval"
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
                    "--socket-name" "spacemacs"))

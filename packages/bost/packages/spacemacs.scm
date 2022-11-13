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

(format #t "~a" "define-module (bost packages spacemacs)...")
(define-module (bost packages spacemacs)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages emacs)

  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils))

(format #t "~a\n" "... done")

(format #t "~a... " "spacemacs-rolling-release")
(define-public spacemacs-rolling-release
  (let ((commit "57a7a0e63c4aecf810b19ca3fd49e5ae1a838126"))
    (package
      (name "spacemacs-rolling-release")
      (version (git-version "0.999.0" "0" commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/syl20bnr/spacemacs")
                      (commit commit)))
                (sha256
                 (base32
                  "1vm51jh88xzq6wlkrbvi7yj7k1r0bs5719264pwdgqwwki843k9c"))
                (file-name (string-append name "-" version))
                (patches
                 (search-patches
                  "spacemacs-rolling-release-add-data-dir.patch"
                  "spacemacs-rolling-release-inhibit-read-only.patch"
                  "spacemacs-rolling-release-quelpa-permissions.patch"))))
      (build-system trivial-build-system)
      (native-inputs `(("tar" ,tar) ("xz" ,xz)))
      (arguments (list
                  #:modules '((guix build utils))
                  #:builder '(begin (use-modules (guix build utils))
                                    (setenv "PATH"
                                            (string-append (getenv "PATH") ":"
                                                           (assoc-ref
                                                            %build-inputs "xz")
                                                           "/bin"))
                                    (mkdir-p (assoc-ref %outputs "out"))
                                    (write
                                     (string-join (list (string-append
                                                         (assoc-ref %build-inputs "tar")
                                                         "/bin/tar")
                                                        "xf" (assoc-ref %build-inputs
                                                                        "source")
                                                        "-C" (assoc-ref %outputs "out")
                                                        "--strip-components" "1"
                                                        "\n")))

                                    (system* (string-append
                                              (assoc-ref %build-inputs "tar")
                                              "/bin/tar")
                                             "xf" (assoc-ref %build-inputs
                                                             "source")
                                             "-C" (assoc-ref %outputs "out")
                                             "--strip-components" "1")

                                    )))
      (synopsis "Automatically configured emacs for both emacs and vim users")
      (description "Spacemacs is a configuration framework for emacs designed to
work well for people with experience using either emacs or vim.  It has 4
driving principles: mnemonics, discoverability, consistency, and crowd
configuration.  Mnemonics mean that key bindings use letters that stand for the
action they take, making the easier to remember.  Discoverability means that
help is displayed when partial keybindings are entered, and prepared
configuration units are searchable.  Consistency means that bindings for
different use-cases (eg, different programming languages) use the same
keybindings for similar actions.  And crowd-configuration means that the
spacemacs community collaborates to provide the best default experience for new
and expert users alike.")
      (home-page "https://spacemacs.org")
      (license license:gpl3))))

(format #t "done\n")

(format #t "~a... " "generate-wrapped-emacs-spacemacs")
(define* (generate-wrapped-emacs-spacemacs emacs spacemacs
                                           #:optional (name "emacs-spacemacs"))
  "Given an emacs package and a spacemacs package, create wrappers that allow
the use of spacemacs without conflicting with the base emacs."
  (package
    (name name)
    (version (string-append (package-version emacs) "-"
                            (package-version spacemacs)))
    (source #f)
    (build-system trivial-build-system)
    (inputs `(("sh" ,bash)
              ("emacs" ,emacs)
              ("spacemacs" ,spacemacs)))
    (arguments `(#:modules ((guix build utils) (guix build spacemacs-utils))
                 #:builder (begin
                             (use-modules ((guix build spacemacs-utils)
                                           #:prefix spacemacs:))
                             (spacemacs:builder
                              #:shell (string-append
                                       (assoc-ref %build-inputs "sh")
                                       "/bin/sh")
                              #:emacs (string-append
                                       (assoc-ref %build-inputs "emacs")
                                       "/bin/emacs")
                              #:spacemacs (assoc-ref %build-inputs "spacemacs")
                              #:out (string-append
                                     (assoc-ref %outputs "out") "/bin")))))
    (home-page (package-home-page spacemacs))
    (synopsis (package-synopsis spacemacs))
    (description (package-description spacemacs))
    (license (package-license spacemacs))))
(format #t "done\n")

(format #t "~a... " "emacs-spacemacs")
(define-public emacs-spacemacs
  (generate-wrapped-emacs-spacemacs emacs spacemacs-rolling-release))
(format #t "done\n")

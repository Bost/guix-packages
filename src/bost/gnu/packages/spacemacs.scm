;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2022 - 2025 Rostislav Svoboda <Rostislav.Svoboda@gmail.com>
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

(define-module (bost gnu packages spacemacs)
  #:use-module (bost utils)  ;; for build
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages emacs)

  #:use-module (guix build-system trivial)
  #:use-module (guix build-system emacs)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils))


;; Don't use evaluating-module from the (utils) module since the
;; $dotf/guix/common/utils.scm is not loaded using -L

(define m (module-name-for-logging))
;; (format #t "~a evaluating module ...\n" m)

(define-public spacemacs-rolling-release
  #|
git clone $dev/.spguimacs.d /tmp/.spguimacs.d
cd /tmp/.spguimacs.d
git log --pretty=format:' "%H"' --max-count=1
guix hash -x --serializer=nar .

  cd $dgxp
  wp; guix build --file=./src/bost/gnu/packages/spacemacs.scm
  wp; guix --install-from-file=./src/bost/gnu/packages/spacemacs.scm
  |#

  (let ((commit "77886bd9cd136ab47a83105fa318953b156bef50"))
    (package
      (name "spacemacs-rolling-release")
      (version (git-version "0.999.0" "0" commit))
      (source (origin
                #|
                cd $dev/guix-packages/packages
                wp; guix build --file=./bost/packages/spacemacs.scm
                wp; guix --install-from-file=./bost/packages/spacemacs.scm
                |#
                ;; (method url-fetch)
                ;; (uri
                ;;  "file:///tmp/.spguimacs.d"
                ;;  ;; (format #f "file://~a/dev/.spguimacs.d" (getenv "HOME"))
                ;;  )

                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Bost/spacemacs.git")
                      (commit commit)))
                (sha256
                 (base32
                  "0r9lx19fwdr6rx5g4b1f0al4234hj03nvziq5vcxy0v0gdalslzw"))
                (file-name (string-append name "-" version))))
      (build-system emacs-build-system)
      (arguments
       (let ((code-dir "layers/+distributions/spacemacs-bootstrap/local"))
         (list
          #:include
          #~(cons (format #f "^~a/" #$code-dir) %default-include)
          #:phases
          #~(modify-phases %standard-phases
              (add-after 'install 'install-info
                (lambda* (#:key inputs #:allow-other-keys)
                  (let [(src (search-input-directory inputs #$code-dir))
                        (dst (string-append #$output "/share/emacs/site-lisp"))]
                    (copy-recursively src dst))))))))

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
(testsymb 'spacemacs-rolling-release)

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
    (arguments
     `(#:modules ((guix build utils)
;;; Omitting following module leads to:
;;;   Loading './guix/build/spacemacs-utils.scm'...
;;;   ...
;;;   no code for module (bost utils)
                  (bost utils)
                  (bost guix build spacemacs-utils))
       #:builder (begin
                   (use-modules
                    ((bost guix build spacemacs-utils) #:prefix spacemacs:))
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
(testsymb 'generate-wrapped-emacs-spacemacs)

;; (format #t "~a ... " "(define-public emacs-spacemacs ...)")
(define-public emacs-spacemacs
  (generate-wrapped-emacs-spacemacs emacs spacemacs-rolling-release))
(testsymb 'emacs-spacemacs)

;; (format #t "~a module evaluated\n" m)

;; emacs-spacemacs ;; needed only when building via `guix build ...'
;; spacemacs-rolling-release ;; needed only when building via `guix build ...'

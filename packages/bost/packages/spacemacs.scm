;;; GNU Guix --- Functional package management for GNU
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

(define-module (bost packages spacemacs)
  #:use-module (bost utils)
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

(define m (module-name-for-logging))
;; (format #t "~a evaluating module ...\n" m)

;; (format #t "~a (define-public spacemacs-rolling-release ...)" m)
(define-public spacemacs-rolling-release
  #|
git clone $dev/.spguimacs.d /tmp/.spguimacs.d
cd /tmp/.spguimacs.d
git log --pretty=format:' "%H"' --max-count=1
guix hash -x --serializer=nar .

  cd $dev/guix-packages/packages
  wp; guix build --file=./bost/packages/spacemacs.scm
  wp; guix --install-from-file=./bost/packages/spacemacs.scm
  |#

  (let ((commit "b1c8f84716cd2e8783e480816232c22a7155b4a6"))
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
                      (url "https://github.com/Bost/spacemacs")
                      (commit commit)))
                (sha256
                 (base32
                  "1ax64jhxw63ji219649v1hb5y4ggx0vc096xsi6jvwvxz5ms8qjp"))
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
                  (guix build spacemacs-utils))
       #:builder (begin
                   (use-modules
                    ((guix build spacemacs-utils) #:prefix spacemacs:))
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

(define (build pkg-or-pkgs)
  "Usage
(build spacemacs-rolling-release)"
  (let [(daemon ((@ (guix store) open-connection)))]
    (define (partial fun . args) (lambda x (apply fun (append args x))))
    (map (compose
          ;; (lambda (p) (format #t "3 p: ~a\n" p) p)
          (partial (@ (guix derivations) build-derivations) daemon)
          ;; (lambda (p) (format #t "2 p: ~a\n" p) p)
          list
          ;; (lambda (p) (format #t "1 p: ~a\n" p) p)
          (partial (@ (guix packages) package-derivation) daemon)
          ;; (lambda (p)
          ;;   (format #t "0 p: ~a\n" p)
          ;;   (format #t "(record? p: ~a\n" (record? p))
          ;;   (format #t "(package? p) p: ~a\n" (package? p))
          ;;   p)
          )
         (if (list? pkg-or-pkgs) pkg-or-pkgs
             (list pkg-or-pkgs)))))

;; (format #t "~a module evaluated\n" m)

;; emacs-spacemacs ;; needed only when building via `guix build ...'
;; spacemacs-rolling-release ;; needed only when building via `guix build ...'

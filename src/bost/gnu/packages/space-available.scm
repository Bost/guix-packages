(define-module (bost gnu packages space-available)
  #:use-module (srfi srfi-1)
  #:use-module (bost utils) ;; partial, m
  #:use-module (gnu packages) ;; find-packages-by-name
  #:use-module (guix)         ;; package-name
  #:use-module (guix packages) ; fold-packages
)

(evaluating-module)

(define-public (gnu-packages-emacs-xyz)
  "List all packages in the (gnu packages emacs-xyz) module."
  (fold-packages (lambda (package result)
                   (cons
                    package ;; (package-name package)
                    result))
                 '() ;; init
                 (list (resolve-interface '(gnu packages emacs-xyz)))
                 ))

(define-public (available-package-names)
  (map package-name (gnu-packages-emacs-xyz)))

(module-evaluated)

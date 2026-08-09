;;; Small Guix-store helpers. Kept separate from the rest of (bost common
;;; *) so that modules with no need to talk to the store/build daemon
;;; don't transitively pull in (guix store)/(guix packages)/(guix
;;; derivations).

(define-module (bost common guix)
  #:use-module (bost common core)  ; comp
  #:use-module (bost common list)) ; ensure-list

(define m "[bost common guix]")

(define-public (package-output-paths one-or-more-packages)
  "(package-output-paths (@(gnu packages emacs) emacs))
;=> (\"/gnu/store/<...>-emacs-29.1\")"
  (let [(connection ((@(guix store) open-connection)))]
    (map (comp
          ;; (partial format #f "~a/bin/emacs")
          (@(guix derivations) derivation->output-path)
          (partial (@(guix packages) package-derivation)
                   connection))
         (ensure-list one-or-more-packages))))

(define (build one-or-more-packages)
  "
(build (@(bost gnu packages emacs-xyz) emacs-tweaks)) ; doesn't build

(build (@(gnu packages emacs-xyz) emacs-back-button)) ;=> (#t)
(build \"emacs-back-button\")                           ;=> (#t)
(build 'emacs-back-button)                            ;=> (#t)
"
  (let [(daemon ((@ (guix store) open-connection)))]
    ;; Define `partial' locally so that this procedure is self-sustained
    (define (partial fun . args) (lambda x (apply fun (append args x))))
    (define (ensure-list args) (if (list? args) args (list args)))
    (define packages
      (map (lambda (p)
             (cond
              [((@(guix packages) package?) p) p]
              [(symbol? p) ((@(gnu packages) specification->package)
                            (symbol->string p))]
              [(string? p) ((@(gnu packages) specification->package)
                            p)]))
           (ensure-list one-or-more-packages)))

    (map (compose
          ;; (lambda (p) (format #t "3 p: ~a\n" p) p)
          (partial (@ (guix derivations) build-derivations) daemon)
          ;; (lambda (p) (format #t "2 p: ~a\n" p) p)
          list
          ;; (lambda (p) (format #t "1 p: ~a\n" p) p)
          (partial (@ (guix packages) package-derivation) daemon)
          ;; (lambda (p)
          ;;   (format #t "0. p : ~a; record? : ~a; package? : ~a\n"
          ;;           p (record? p) ((@(guix packages) package?) p))
          ;;   p)
          )
         (ensure-list packages))))

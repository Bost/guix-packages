(define-module (bost utils)
  #:export (
            module-name-for-logging
            testsymb
            build
            ))

(define (partial fun . args)
  (lambda x (apply fun (append args x))))

(define (module-name-for-logging)
  ((compose
    (partial format #f "[~a]")
    (partial string-join)
    (partial map (partial format #f "~a"))
    (partial module-name))
   (current-module)))

(define-syntax testsymb
  (syntax-rules ()
    ((_ symbol)
     (begin
       ;; (let [(module (module-name-for-logging))]
       ;;   (if (defined? symbol)
       ;;       (format #t "~a ~a defined\n" module symbol)
       ;;       (error (format #f "~a ~a undefined\n" module symbol))))
       ))))

;; (define f 42)
;; (testsymb 'f)

;;; testsymb doesn't work in the let-syntax
;; (let [(ff 42)] (testsymb 'ff))


(define (build pkg-or-pkgs)
  "Usage
(build <package-name>)"
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
             (list pkg-or-pkgs)))

    ;; ((compose
    ;;   (lambda (p) (format #t "3 p: ~a\n" p) p)
    ;;   (partial (@ (guix derivations) build-derivations) daemon)
    ;;   (lambda (p) (format #t "2 p: ~a\n" p) p)
    ;;   list
    ;;   (lambda (p) (format #t "1 p: ~a\n" p) p)
    ;;   (partial (@ (guix packages) package-derivation) daemon)
    ;;   (lambda (p)
    ;;     (format #t "0 p: ~a\n" p)
    ;;     (format #t "(record? p: ~a\n" (record? p))
    ;;     (format #t "(package? p) p: ~a\n" (package? p))
    ;;     p)
    ;;   )
    ;;  (specification->package
    ;;   (format #f "(@ (bost packages emacs-xyz) ~a)" (symbol->string pkg-or-pkgs))
    ;;   ))
    ))

;; (format #t "~a module evaluated\n" (module-name-for-logging))

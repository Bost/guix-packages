;; (format #t "~a... " "")
;; (format #t "done\n")

(define-module (bost utils)
  #:export (
            testsymb
            ))

(define (module-name-for-logging)
  ((compose
    (partial format #f "[~a]")
    (partial string-join)
    (partial map (partial format #f "~a"))
    (partial module-name))
   (current-module)))

(define (partial fun . args)
  (lambda x (apply fun (append args x))))

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

(format #t "~a module evaluated\n" (module-name-for-logging))


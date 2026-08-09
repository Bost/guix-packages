;;; Extended boolean-algebra helpers (eagerly chained comparisons over
;;; booleans, treating #f < #t). See `true?'/`false?' in (bost common
;;; core) for the base boolean coercions these build on.

(define-module (bost common boolean)
  #:use-module (bost common core)) ; true?, false?

(define (boolean->bit x)
  "#f -> 0, #t -> 1; anything else is a type error."
  (cond ((false? x) 0)
        ((true? x) 1)
        (else (scm-error 'wrong-type-arg 'boolean->bit
                         "Wrong type argument (expecting boolean): ~S"
                         (list x) (list x)))))

(define m "[bost common boolean]")

(define-public (boolean= . args)
  "Eagerly chained =.
(boolean= 1)                 ;=> Wrong type argument (expecting boolean)
Note:
((@(rnrs base) boolean=?) 1) ;=> #f"
  (apply = (map boolean->bit args)))

(define-public (boolean<> . args)
  "All elements distinct. Vacuously true for 0 or 1 args; for booleans only
≤2 args can differ, so >2 args ⇒ #f.

(boolean<> 1 #f #t)  ;=> Wrong type argument (expecting boolean)
(boolean<> #f #t #f) ;=> #f
(boolean<> #f #t)    ;=> #t
(boolean<> #t)       ;=> #t
(boolean<>)          ;=> #t"
  (let ((all-equal? (apply boolean= args)) ; run first → type-checks every arg
        (n (length args)))
    (or (< n 2)                            ; 0 or 1 args: vacuously distinct
        (and (= n 2) (not all-equal?)))))  ; exactly 2 and they differ

(define-public (boolean<  . args)
  "Eagerly chained #f<#t"
  (apply <  (map boolean->bit args)))

(define-public (boolean<= . args)
  "Eagerly chained #f<=#t"
  (apply <= (map boolean->bit args)))

(define-public (boolean>  . args)
  "Eagerly chained #f>#t"
  (apply >  (map boolean->bit args)))

(define-public (boolean>= . args)
  "Eagerly chained #f>=#t"
  (apply >= (map boolean->bit args)))

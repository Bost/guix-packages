;;; General list helpers: predicates, take/drop variants, flattening,
;;; interleaving, indexed mapping, duplicate detection, and the small
;;; `every?'/`some'/boolean-of-list family.

(define-module (bost common list)
  #:use-module (bost common core) ; comp, partial, def-public, boolean, true?
  #:use-module (ice-9 match)      ; ensure-list
  #:use-module (srfi srfi-1))     ; fold, remove, any, every, delete-duplicates, ...

(define m "[bost common list]")

(define-public rflatten
  (case-lambda ; multi-arity
    "Reducer collecting inputs into a list, flattening each input first.
(list-transduce (tmap (juxt 1+ 1-)) rflatten '(1 2)) ;=> (2 0 3 1)

See also
(list-transduce (compose (tmap (juxt 1+ 1-)) tflatten) rcons '(1 2))
;=> (2 0 3 1)"
    (() '())
    ((acc) (reverse! acc))
    ((acc input) (fold cons acc (flatten input)))))

(define eq-op? string-ci=?)
(define-public (s+ . rest) (apply (partial lset-union eq-op?) rest))
(define-public (s- . rest) (apply (partial lset-difference eq-op?) rest))
(define-public (sx . rest) (apply (partial lset-intersection eq-op?) rest))

(define-public (drop-right xs n)
  "Corresponds to `drop-last' in Clojure.
(drop-right (list 1 2 3 4 5) 2) ;=> (1 2 3)"
  (reverse (list-tail (reverse xs) n)))

(define-public (drop-left xs n)
  "Corresponds to `drop' in Clojure.
(drop-left (list 1 2 3 4 5) 2) ;=> (4 5)"
  (reverse (list-head (reverse xs) n)))

(define-public (flatten x)
  "(flatten (list (cons 1 (cons 2 3)))) ;=> (1 2 3)
   (equal? (list 1 2 3)
           (flatten (list (cons 1 (cons 2 3))))) ;=> #t"
  (cond ((null? x) '())
        ((pair? x) (append (flatten (car x)) (flatten (cdr x))))
        (else (list x))))

(define-public (ensure-list x)
  "Wrap X in a list if it is not already a list. Think \"monadic container\".
(ensure-list '(a b c))   ;=> (a b c)
(ensure-list 'a)         ;=> (a)
(ensure-list 1)          ;=> (1)

Note: Variadic definition `(define (ensure-list . xs) xs)' produces nested list:
(ensure-list '(a b c)) ;=> ((a b c))"
  (match x
    ((? list?) x)
    (else (list x))))

;; TODO consider testing for proper-list?
;; See also (scm-error 'wrong-type-arg #f "Expected a proper list or non-pair value" #f #f)
;; (def-public (ensure-list x)
;;   "Wrap X in a list if it is not already a list. Think \"monadic container\".
;; Raise an error if it's neither a list nor a single value."
;;   (guard (exception ((not (or (list? exception)
;;                               (not (pair? exception))))
;;                      => (lambda (x)
;;                           (error (format #f "~a Expected a list or single value" f) x))))
;;     ;; Alternative implementations:
;;     ;;   (or (and (list? x) x)
;;     ;;       (list x))
;;     ;; or
;;     ;;   (match args
;;     ;;     ((_ ...) args)
;;     ;;     (x (list x)))
;;     (match x
;;       ((? list?) x)
;;       (else (list x)))))

(define-public some any)
;; (some even? '(1 2 3))       ;=> 2

(define-public every? every)
;; (every? even? '(2 4 6))     ;=> #t

(define-public not-any? (compose not any))
;; (not-any? even? '(1 3 5))   ;=> #t

(define-public not-every? (compose not every))
;; (not-every? even? '(2 4 6)) ;=> #f

(define-public some-true? (partial some true?))
;; (some-true? (list #t #t))   ;=> #f

(define-public every-true? (partial every? true?))
;; (every-true? (list #t #t))  ;=> #f

;; (define-public (interpose separator lst)
;;   "Insert separator between each element of lst"
;;   (cond
;;    ((null? lst) '())
;;    ((null? (cdr lst)) lst)
;;    (else
;;     (cons (car lst)
;;           (cons separator
;;                 (interpose separator (cdr lst)))))))

;; Alternative implementation using fold-right for better performance
(define-public (interpose separator lst)
  "Insert separator between each element of lst using fold.
Examples:
(interpose '+ (list 1 2 3))        ;=> '(1 + 2 + 3)
(interpose '(1 2 3) '(a b c))      ;=> '(a (1 2 3) b (1 2 3) c)
(interpose '| '(a b c d))          ;=> '(a | b | c | d)
(interpose 0 '(1 2 3))             ;=> '(1 0 2 0 3)
(interpose \",\" '(\"hello\" \"world\")) ;=> '(\"hello\" \",\" \"world\")"
  (if (null? lst)
      '()
      (fold-right (lambda (x acc)
                    (if (null? acc)
                        (list x)
                        (cons x (cons separator acc))))
                  '()
                  lst)))

(define-public (combine . lists)
  "Combine elements alternately from each list, stopping at the shortest.
(combine '(1 2 3 4) '(a b c)) ;=> ((1 a) (2 b) (3 c)) ;=> ((1 4) (2 5) (3 6))"
  (let ((len (length (car lists))))
    ;; (unless (every (lambda (l) (= (length l) len)) lists)
    ;;   (error "combine: lists must all be the same length" lists))
    (apply map list lists)))

(define-public (interleave . lists)
  "Flatten combined lists.
(interleave '(1 2 3) '(a b c)) ;=> '(1 a 2 b 3 c)"
  (flatten (apply combine lists)))

(define-public (take-smart a b)
  "Accepts either (number list) or (list number)"
  (cond ((and (number? a) (list? b)) (take b a))
        ((and (list? a) (number? b)) (take a b))
        (else (error "take-smart: expected one number and one list" a b))))

(define-public (drop-smart a b)
  "Accepts either (number list) or (list number)"
  (cond ((and (number? a) (list? b)) (drop b a))
        ((and (list? a) (number? b)) (drop a b))
        (else (error "drop-smart: expected one number and one list" a b))))

(define-public (take-last n lst)
  "Returns the last n elements of lst."
  (let ((len (length lst)))
    (if (>= n len)
        lst
        (drop lst (- len n)))))

(define-public (take-last-smart a b)
  "Accepts either (number list) or (list number)"
  (cond ((and (number? a) (list? b)) (take-last a b))
        ((and (list? a) (number? b)) (take-last b a))
        (else (error "take-last-smart: expected one number and one list" a b))))

(define-public (drop-last n lst)
  "Returns lst without its last n elements."
  (take lst (- (length lst) n)))

(define-public (drop-last-smart a b)
  "Accepts either (number list) or (list number)"
  (cond ((and (number? a) (list? b)) (drop-last a b))
        ((and (list? a) (number? b)) (drop-last b a))
        (else (error "drop-last-smart: expected one number and one list" a b))))

(define-public (butlast lst)
  "Returns lst without its last element."
  (drop-last 1 lst))

(define-public (butlast-smart . args)
  "With one argument, it behaves like butlast.\n

With two arguments, it accepts either (number list) or (list number) and drops
that many from the end."
  (cond ((null? args)
         (error "butlast-smart: no arguments provided"))
        ((= (length args) 1)
         (let ((arg (car args)))
           (if (list? arg)
               (butlast arg)
               (error "butlast-smart: single argument must be a list" arg))))
        ((= (length args) 2)
         (let ((a (car args)) (b (cadr args)))
           (cond ((and (number? a) (list? b)) (drop-last a b))
                 ((and (list? a) (number? b)) (drop-last b a))
                 (else
                  (error
                   "butlast-smart: expected one number and one list" a b)))))
        (else (error "butlast-smart: expected 1 or 2 arguments"))))

(define-public (cartesian xs ys)
  "(cartesian '(a b) '(1 2)) ;=> ((a 1) (a 2) (b 1) (b 2))"
  (append-map (lambda (x) (map (lambda (y) (list x y)) ys)) xs))

(define-public (member? x lst) (boolean (member x lst)))

;; Both implementations of `if-not` are equivalent. The one done with
;; `define-syntax` is here for future extensibility
;; (define-syntax-rule (if-not condition then else)
;;   (if (not condition) then else))

(def-public (map-indexed proc seq)
  "(map-indexed (lambda (i x) (list i x)) '(a b c)) ;=> ((0 a) (1 b) (2 c))"
  (cond
   [(list? seq)
    ;; Use the list version
    (let loop [(idx 0) (xs seq) (acc '())]
      (if (null? xs)
          ;; Reverse the accumulator because we built it backwards
          (reverse acc)
          (loop (+ idx 1) (cdr xs)
                (cons (proc idx (car xs)) acc))))]
   [(vector? seq)
    ;; For vectors: build a list or build a new vector
    (let* [(n (vector-length seq))
           (out (make-vector n))]
      (do ((i 0         ; initialize i to 0
              (+ i 1))) ; on each iteration, i is incremented by 1
          ((= i n) out) ; stop when (= i n) and return the out
        (vector-set! out i (proc i (vector-ref seq i)))))]
   [else
    (error (format #f "~a Sequence must be a vector or list: ~s" f seq))]))

(define-public (nonempty-dotted-list? x)
  "SRFI-1's dotted-list? treats any finite list whose final cdr is not '() as a
dotted (improper) list — and it allows the degenerate case with zero pairs.

(nonempty-dotted-list? '(a b c))    ;=> #f
(nonempty-dotted-list? '(a b . c))  ;=> #t
(nonempty-dotted-list? '())         ;=> #f
(nonempty-dotted-list? 42)          ;=> #f"
  (and (pair? x) (dotted-list? x)))

(define-public (flat-list-cond . xs)
  "Conditionally create a one level flattened list.

(flat-list-cond 5 (list 4) 3 (when #f (list 2)) #f (list 1) 0)
;=> (list 5 4 3 2 #f 1 0)
(flat-list-cond 5 (list 4) 3 (if #f (list 2)) #f (list 1) 0)
;=> (list 5 4 3 2 #f 1 0)

(flat-list-cond 5 (list 4) 3 (when #t (list 2)) #f (list 1) 0)
;=> (list 5 4 3 2 #f 1 0)
(flat-list-cond 5 (list 4) 3 (if #t (list 2)) #f (list 1) 0)
;=> (list 5 4 3 2 #f 1 0)

(flat-list-cond 5 (list 4) 3 (if #t 2) #f (list 1) 0)
;=> (list 5 4 3 2 #f 1 0)"
  (append-map                ; or (apply append (map ... xs))
   (lambda (x)
     (cond
      ((unspecified? x) '()) ; skip *unspecified*
      ;; ((not x) '())       ; activate to this to skip #f
      ((list? x) x)          ; flatten lists one level
      (else (list x))))      ; keep atoms
   xs))

;; 'list=  ; from srfi-1
;; first paramter of `list=' is an equality predicate
(define-public (list=eq?    . rest)
"
(list=eq?)           ;=> #t
(list=eq? 2 1)       ;=> (expecting pair): 2
(list=eq? 1 1)       ;=> (expecting pair): 1
(list=eq? '(2) '(1)) ;=> #f
(list=eq? '(1) '(1)) ;=> #f
"
  (apply (partial list= eq?) rest))

(define-public (list=eqv?   . rest) (apply (partial list= eqv?) rest))

(define-public (list=equal? . rest) (apply (partial list= equal?) rest))

(define-public (find-duplicates lst eq-proc)
  "(find-duplicates (list 1 2 2 3) =)            ;=> (2)
(find-duplicates (list 1 2 1 2 3) =)          ;=> (1 2)
(find-duplicates (list 1 1 1 2) =)            ;=> (1)
(find-duplicates (list \"1\" \"2\" \"1\") string=?) ;=> (\"1\")"

  (define f (format #f "~a [find-duplicates]" m))

  ((comp
    ;; (lambda (p) (format #t "~a 2. (length p): ~a\n" f (length p)) p)
    (lambda (deduped-lst)
      (filter (lambda (x)
                (> (count (partial eq-proc x) lst) 1))
              deduped-lst))
    ;; (lambda (p) (format #t "~a 1. (length p): ~a\n" f (length p)) p)
    (lambda (lst) (delete-duplicates lst eq-proc))
    ;; (lambda (p) (format #t "~a 0. (length p): ~a\n" f (length p)) p)
    )
   lst))

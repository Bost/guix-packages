;;; Foundational helpers that almost every other (bost common *) module
;;; builds on: the def/def-public/def*/def*-public logging macros, the
;;; function-combination trio (comp, partial, juxt), and small
;;; cross-cutting predicates/coercions (boolean, str, true?, false?,
;;; empty?). Split out of the former single-file (bost common utils)
;;; module; see (bost common utils) for the full picture of the split.

(define-module (bost common core)
  #:use-module (bost common srfi-1-smart) ; smart-last, used by my=warn
  #:use-module (ice-9 hash-table)         ; for procedure: cnt
  #:use-module (ice-9 match)              ; error-command-failed
  #:use-module (ice-9 optargs)            ; define*-public, def*, def*-public
  #:use-module (rnrs bytevectors)         ; for procedure: cnt
  #:use-module (srfi srfi-1)              ; string-concatenate, used by str
  #:export
  (
   def
   def-public
   def*
   def*-public
   evaluating-module
   if-let
   if-not
   module-evaluated
   testsymb
   testsymb-trace
   dbgfmt
   and*
   or*
   ))

(define m "[bost common core]")

(define-public (cnt obj)
  "Return the number of elements in OBJ, dispatching on its type.

Supported types and semantics:
  #f            → 0  (like Clojure's nil)
  '()           → 0
  string        → number of characters
  vector        → number of elements
  bytevector    → number of bytes
  bitvector     → number of bits
  hash table    → number of entries
  char-set      → number of characters in the set
  pair          → number of distinct pairs reachable via cdr;
                  terminates on proper, improper, and circular lists
  array         → total number of elements across all dimensions

Any other type signals an error.

(define circular-list (let ((x '(1 2 3))) (set-cdr! (cddr x) x) x))
(cnt circular-list) ;=> 3
"
  (define (count-pairs x)
    ;; Floyd's tortoise-and-hare: O(n) time, O(1) space.
    ;; For a ρ-shaped structure the answer is μ + λ, i.e. the
    ;; number of distinct pairs.
    (define (cdr* x) (and (pair? x) (cdr x)))
    (let race ((slow x) (fast x))
      (let* ((f1 (cdr* fast))
             (f2 (and f1 (cdr* f1))))
        (if (not f2)
            ;; Finite — plain linear walk.
            (let walk ((y x) (n 0))
              (if (pair? y) (walk (cdr y) (+ n 1)) n))
            (let ((slow* (cdr slow)))
              (if (eq? slow* f2)
                  ;; Cycle detected; SLOW* lies on it.
                  (let* ((mu  (let find-mu ((a x) (b slow*) (m 0))
                                (if (eq? a b) m
                                    (find-mu (cdr a) (cdr b) (+ m 1)))))
                         (lam (let find-lam ((y (cdr slow*)) (l 1))
                                (if (eq? y slow*) l
                                    (find-lam (cdr y) (+ l 1))))))
                    (+ mu lam))
                  (race slow* f2)))))))
  (cond
   ((not obj)         0)
   ((null? obj)       0)
   ((string? obj)     (string-length obj))
   ((vector? obj)     (vector-length obj))
   ((bytevector? obj) (bytevector-length obj))
   ((bitvector? obj)  (bitvector-length obj))
   ((hash-table? obj) (hash-count (const #t) obj))
   ((char-set? obj)   (char-set-size obj))
   ((pair? obj)       (count-pairs obj))
   ((array? obj)      (apply * (map (lambda (dim)
                                      (- (cadr dim) (car dim) -1))
                                    (array-shape obj))))
   ;; TODO fix the def-public macro
   ;; (let [(f "...")] f) is a workaround for
   ;;   definition in expression context, where definitions are not allowed
   (else (error (format #f "~a unsupported type" (let [(f "cnt")] f)) obj))))

(define-public (partial fun . args)
  "Alternative implementation:
(use-modules (srfi srfi-26))
(map (cut * 2 <>) '(1 2 3 4)) ;=> (2 4 6 8)

Works also for multiple args:
(define (fabc a b c) (+ a b c))
(define (fa a) (partial fabc a))
((fa 1) 3 4) ;=> 8"
  (lambda x (apply fun (append args x))))

(define-public (comp . fns)
  "Like `compose'. Can be called with zero arguments. I.e.
(thunk? comp)    ;=> #t
(thunk? compose) ;=> #f
Works also for functions returning and accepting multiple values."
  (lambda args
    (if (null? fns)
        (apply values args)
        (let [(proc (car fns)) (rest (cdr fns))]
          (if (null? rest)
              (apply proc args)
              (let ((g (apply comp rest)))
                (call-with-values (lambda () (apply g args)) proc)))))))

(define-public (juxt . fns)
  "Naive implementation. Inspired by Clojure's juxt.
((juxt a b c) x) => (list (a x) (b x) (c x))

(define add1 (lambda (x) (+ x 1)))
(define square (lambda (x) (* x x)))
(define negate (lambda (x) (- x)))

;; Create a juxtaposition of functions
(define combined (juxt add1 square negate))

;; Apply to arguments
(combined 5)  ;=> (6 25 -5)

;; With multiple arguments
(define add (lambda (x y) (+ x y)))
(define mult (lambda (x y) (* x y)))
(define sub (lambda (x y) (- x y)))

(define math-ops (juxt add mult sub))
(math-ops 10 3)  ;=> (13 30 7)

;; Using with built-in functions
(define string-ops (juxt string-length string-upcase string-downcase))
(string-ops \"Hello\")  ;=> (5 \"HELLO\" \"hello\")"
  (lambda args
    (map (lambda (fn) (apply fn args)) fns)))

(define-public empty? null?) ;; no runtime cost. null? is a primitive procedure

(define-public (boolean x)
  "Returns #f only when X is #f or #nil, otherwise returns #t.
#nil - Guile's Elisp-interop nil - is false in a boolean context ((if #nil …)

(boolean #nil)          ;=> #f
(boolean #f)            ;=> #f

(boolean 1)             ;=> #t
(boolean 0)             ;=> #t
(boolean (list))        ;=> #t
(boolean \"\")            ;=> #t
(boolean -1)            ;=> #t
(boolean *unspecified*) ;=> #t"
  (not (not x)))

(define-public (str . args)
  "Convert all arguments to strings and concatenate them, like Clojure's `str`.
(str '(1 2 3)) ;=> \"(1 2 3)\"
(str *unspecified*) ;=> \"\"
"
  (string-concatenate
   (map (lambda (x)
          (cond
           ((string? x) x)
           ((symbol? x) (symbol->string x))
           ((number? x) (number->string x))
           ((char? x) (string x))
           ((boolean? x) (if x "#t" "#f"))
           ((empty? x) "()")                ; catches '() before the (pair? x)
           ;; (use-modules (ice-9 format))  ; For `format` with ~A specifier
           ((pair? x) (format #f "~A" x))   ; Handle lists and pairs
           ((unspecified? x) "")
           (else (format #f "~A" x))))      ; Fallback for other types
        args)))

;; (warn ...) doesn't print anything
(define-public (my=warn . args)
  ;; (error s)
  (let* [(orig-fmt (car args))
         (fmt (if (string= "\n" (smart-last orig-fmt))
                  orig-fmt
                  (str orig-fmt "\n")))]
    (apply (partial format #t (str "W " fmt))
           (cdr args))))

(define-public (module-name-for-logging)
  ((comp
    (partial format #f "[~a]")
    (partial string-join)
    (partial map (partial format #f "~a"))
    (partial module-name))
   (current-module)))

(unless (equal? (module-name-for-logging) m)
  (my=warn "~a (equal? (module-name-for-logging) m): ~a"
           m (equal? (module-name-for-logging) m)))

(define-syntax if-let
  (syntax-rules ()
    [(_ (var test) then)
     (let [(var test)]
       (if var then))]
    ;; same as the above just adding the brackets
    [(_ ((var test)) then)
     (let [(var test)]
       (if var then))]

    [(_ (var test) then else)
     (let [(var test)]
       (if var then else))]
    ;; same as the above just adding the brackets
    [(_ ((var test)) then else)
     (let [(var test)]
       (if var then else))]))
#|
(if-let (result (+ 2 2))
        (format #t "Truthy Test Passed: ~a\n" (number->string result))
        (format #t "Truthy Test Failed: Should not reach here\n"))

(if-let (result (and #f (+ 2 2)))
        (format #t "Falsey Test Failed: Should not reach here\n")
        (format #t "Falsey Test Passed: Correctly reached else clause\n"))
|#

(define show-evaluating-module #f) ; placed at the beginning of a module
(define show-module-evaluated  #f) ; placed at the end of a module

(define (inf-evaluating-module)
  (format #t "~a Evaluating module…\n" (module-name-for-logging)))

(define-syntax evaluating-module
  (syntax-rules ()
    [(_ show) (when show                   (inf-evaluating-module))]
    [(_)      (when show-evaluating-module (inf-evaluating-module))]))

(define (inf-evaluating-module-done)
  (format #t "~a Evaluating module… done\n" (module-name-for-logging)))

(define-syntax module-evaluated
  (syntax-rules ()
    [(_ show) (when show                  (inf-evaluating-module-done))]
    [(_)      (when show-module-evaluated (inf-evaluating-module-done))]))

(define (warn-undefined symbol)
  (my=warn (format #f "~a Symbol undefined: ~a"
                   (module-name-for-logging) symbol)))

(define-syntax testsymb
  (syntax-rules ()
    [(_ symbol)
     (unless (defined? symbol) (warn-undefined symbol))
     ;; (if (defined? symbol)
     ;;     (format #t "~a Symbol defined: ~a\n" (module-name-for-logging) symbol)
     ;;     (warn-undefined symbol))
     ]))

(define-syntax testsymb-trace
  (syntax-rules ()
    [(_ symbol)
     (if (defined? symbol)
         (format #t "~a Symbol defined: ~a\n" (module-name-for-logging) symbol)
         (warn-undefined symbol))]))

(define (test-testsymb)
  (define x 42)
  (testsymb 'x)
  (testsymb-trace 'x)
  )

;;;;;; end: testsymb, testsymb-trace

;; Like `define', `define-public', `define*', `define*-public' but it prints
;; what's being defined / evaluated.
;; See /home/bost/dev/guile/module/ice-9/psyntax.scm line 3377
;; Introduces unhygienic `f'!!!
(define-syntax make-def
  (lambda (stx)
    (syntax-case stx ()
      [(_ macro-name def-form)
       #'(define-syntax macro-name
          (lambda (stx)
            (syntax-case stx ()
              ;; Escaped ellipsis (... ...) is preserved for the generated macro
              [(_ (name . args) body0 body1 (... ...) bodyN)
               (string? (syntax->datum #'body0))
               ;;
               (with-syntax [(f (datum->syntax #'name 'f))
                             (m (datum->syntax #'name 'm))
                             (fprefix (datum->syntax #'name
                                                     ""
                                                     ;; "[=> 2 w/-docstr] "
                                                     ))]
                 #`(begin
                     ;; (format #t "~a #'body0 ...   : ~s\n" fprefix
                     ;;         (syntax->datum #'body0))
                     ;; (format #t "~a #'(body1 ...) : ~s\n" fprefix
                     ;;         (syntax->datum #'(body1 ...)))
                     ;; (format #t "~a #'bodyN       : ~s\n" fprefix
                     ;;         (syntax->datum #'bodyN))
                     (def-form (name . args)
                       body0
                       (let [(f (format #f "~a~a [~a]" fprefix
                                        m `name))]
                         ;; (format #t "~a Docstring defined : ~s\n" f body0)
                         ;; (format #t "~a Starting…\n" f)
                         body1 (... ...)
                         (let [(result bodyN)]
                           ;; (format #t "~a done. result : ~s\n" f result)
                           result))
                       )))]
              [(_ (name . args) body0)
               (with-syntax [(f (datum->syntax #'name 'f))
                             (m (datum->syntax #'name 'm))
                             (fprefix (datum->syntax #'name
                                                     ""
                                                     ;; "[1] "
                                                     ))]
                 #`(begin
                     ;; (format #t "~a#'body0 : ~s\n" fprefix
                     ;;         (syntax->datum #'body0))
                     (def-form (name . args)
                       (let [(f (format #f "~a~a [~a]" fprefix
                                        m `name))]
                         ;; (format #t "~a Docstring undefined.\n" f)
                         ;; (format #t "~a Starting…\n" f)
                         (let [(result body0)]
                           ;; (format #t "~a done. result : ~s\n" f result)
                           result)))))]
              [(_ name val) (identifier? #'name)
               (with-syntax [(f (datum->syntax #'name 'f))
                             (m (datum->syntax #'name 'm))
                             (fprefix (datum->syntax #'name
                                                     ""
                                                     ;; "[0] "
                                                     ))]
                 #`(begin
                     ;; (format #t "~a#'val : ~s\n" fprefix
                     ;;         (syntax->datum #'val))
                     (def-form name
                       (let [(f (format #f "~a~a [~a]" fprefix
                                        m `name))]
                         ;; (format #t "~a Docstring undefined.\n" f)
                         ;; (format #t "~a Starting…\n" f)
                         (let [(result val)]
                           ;; (format #t "~a done. result : ~s\n" f result)
                           result)))))]
              [else (syntax-violation 'macro-name "invalid syntax" stx)])))])))
(testsymb 'make-def)

(make-def def define)
(make-def def-public define-public)

(make-def def* define*)
(make-def def*-public define*-public)
(testsymb 'def*-public)

;; ;;; Test cases:
;; (def-public (fa a b)
;;   "fa: some output string")

;; (def-public (fb a b)
;;   "fb: docstring"
;;   42)

;; (def-public (fc a b)
;;   (format #t "fc: output 1\n")
;;   (format #t "fc: output 2\n"))

;; (def-public (fd a b)
;;   "fd: docstring"
;;   (format #t "output 1\n")
;;   (format #t "output 2\n"))

;; (def-public (fe a b)
;;   (format #t "output 1\n")
;;   (format #t "output 2\n")
;;   (format #t "output 3\n"))

;; (def-public (fe a b)
;;   "fe: docstring"
;;   (format #t "~a a ~a\n" f a)
;;   (format #t "~a b ~a\n" f b)
;;   42)

;; (def-public ff 42)

;; (def*-public (fg* a b)
;;   "fg*: docstring"
;;   (format #t "~a a ~a\n" f a)
;;   (format #t "~a b ~a\n" f b)
;;   42)

;; (def*-public (fg* a b #:key (c #f))
;;   "fg*: docstring"
;;   (format #t "~a a ~a\n" f a)
;;   (format #t "~a b ~a\n" f b)
;;   (format #t "~a c ~a\n" f c)
;;   42)

;; from /home/bost/dev/guile/module/ice-9/boot-9.scm
;; (define-syntax define-public
;;   (syntax-rules ()
;;     ((_ (name . args) . body)
;;      (begin
;;        (define (name . args) . body)
;;        (export name)))
;;     ((_ name val)
;;      (begin
;;        (define name val)
;;        (export name)))))

(define-public (true? x) (eq? x #t))

(define-public (false? x) (eq? x #f))

;;; testsymb doesn't work in the let-syntax
;; (let [(ff 42)] (testsymb 'ff))

(define-public (unspecified-or-empty-or-false? obj)
  (or (unspecified? obj)
      (null? obj)
      (and (string? obj) (string-null? obj))
      (eq? #f obj)))

(define (fmt-rest rest)
  (if (empty? rest)
      ""
      (format #f "~a" (string-join (map str rest)))))

;; TODO dbgfmt should detect if the f / m are defined and if so then use them
(define-syntax dbgfmt
  ;; match specific datums `m' and `f' in an expression
  (syntax-rules (m f)
    [(_ m f e ...)
     (format #t "~a ~a ~a\n" m f (fmt-rest (list e ...)))]
    [(_ f m e ...) ;; in case we have reversed order: `f m'
     (format #t "~a ~a ~a\n" m f (fmt-rest (list e ...)))]
    [(_ f e ...)
     (format #t "~a ~a\n" f (fmt-rest (list e ...)))]
    [(_ m e ...)
     (format #t "~a ~a\n" m (fmt-rest (list e ...)))]
    [(_ e ...)
     (format #f "~a\n" (fmt-rest (list e ...)))]))

;; TODO implement pretty-print for bash commands
(define-public dbg peek)

(define*-public (dbg-exec prm #:key (verbose #t))
  "`pk', i.e. `peek' can be used instead of this procedure.
See also (getenv \"STARSHIP_PROMPT_SYMBOL\")
⋎ U+22CE Curly logical OR, licensed Guix logo
λ U+03BB Greek small lambda
🐟🐳🐠🎣🦑👽🛸🚀🧙🦊🐍💡🧠🤓👾🤖🦾🐌🐚
"
  (when verbose
    (format #t "+🤓 ~a\n" (if (list? prm) (string-join prm) prm)))
  prm)

(def*-public (error-command-failed #:rest args)
  "Returns #t and prints \"Command failed.\" with some extra text. Does NOT
error-out!"
  (define (error-fun . args)
    (apply (partial format (current-error-port))
           (cons (str "E " (car args) "\n") (cdr args))))
  (match args
    ['()
     (error-fun "Command failed.")]
    [(module)
     (error-fun "~a Command failed." module)]
    [(module extra-text)
     (error-fun "~a Command failed: ~a" module extra-text)]))

(define-syntax if-not
  (syntax-rules ()
    ((_ test then else)
     (if (not test) then else))))

(define-public (syntax->list orig-ls)
  "From $der/racket/pkgs/racket-benchmarks/tests/racket/benchmarks/common/psyntax-input.txt
(syntax->list (call-with-input-string \"  (+ 1 2)\" read-syntax))
;=> (#<syntax:unknown file:1:3 +> #<syntax:unknown file:1:5 1> #<syntax:unknown file:1:7 2>)"
  (let loop ((ls orig-ls))
    (syntax-case ls ()
      (() '())
      ((x . r) (cons (syntax x) (loop (syntax r))))
      (_ (error 'syntax->list "invalid argument ~s" orig-ls)))))

(define-public inc 1+) ; Increment (inc 0) ;=> 1

(define and*
  (lambda args
    (let loop ((args args))
      (if (null? args)
          #t
          (and (car args) (loop (cdr args)))))))

(define or*
  (lambda args
    (let loop ((args args))
      (if (null? args)
          #f
          (or (car args) (loop (cdr args)))))))

(define-public (print-lines lines)
  "Print each of LINES followed by a newline."
  (for-each (lambda (line) (display line) (newline)) lines))

(define-public (die fmt . args)
  "Print a message to the error port and exit with status 1.
Unlike `error', no backtrace — for expected failures, not bugs."
  (apply format (current-error-port) fmt args)
  (newline (current-error-port))
  (exit 1))

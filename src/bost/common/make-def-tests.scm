;;; Run from the channel root:
;;; guile --no-auto-compile -L src -c '((@ (bost common make-def-tests) main))'

(define-module (bost common make-def-tests)
  #:use-module (bost common core)
  #:use-module (srfi srfi-64)
  #:export (main))

(define (check-definition macro public? starred?)
  "Exercise MACRO in a fresh module to check its exports and tracing context."
  (test-group (symbol->string macro)
    (let ((module (make-fresh-user-module)))
      (module-use! module (resolve-interface '(bost common core)))
      (module-define! module 'm "[test]")
      (module-define! module 'recorded '())
      (eval
       `(begin
          (,macro value
            (begin
              (set! recorded (cons 'initialized recorded))
              (list tracing-procedure-name f 42)))

          (,macro (single a b)
            (+ a b))
          (,macro (string-result)
            "A result, not a docstring.")
          (,macro (two-expressions)
            21
            42)
          (,macro (ordered a b)
            (set! recorded (cons a recorded))
            (set! recorded (cons b recorded))
            (reverse recorded))

          (,macro (documented)
            "Return the answer."
            42)
          (,macro (documented-output a b)
            "Print both arguments and return the answer."
            (format #t "~a a ~a\n" f a)
            (format #t "~a b ~a\n" f b)
            42)

          (,macro (local-definition a)
            (define (double n) (+ n n))
            (list tracing-procedure-name f (double a)))
          (,macro (rest-arguments first . rest)
            (cons first rest)))
       module)

      (test-equal "variable initializer has tracing context"
        '(value "[test:value]" 42)
        (module-ref module 'value))
      (test-equal "initializer ran once" '(initialized)
        (module-ref module 'recorded))
      (test-equal "single expression" 7
        ((module-ref module 'single) 3 4))
      (test-equal "single string is a result"
        "A result, not a docstring."
        ((module-ref module 'string-result)))
      (test-eq "single string is not a docstring" #f
        (procedure-documentation (module-ref module 'string-result)))
      (let ((two-expressions (module-ref module 'two-expressions)))
        (test-equal "two expressions without a docstring" 42 (two-expressions))
        (test-eq "multi-expression body has no docstring" #f
          (procedure-documentation two-expressions)))
      (test-equal "multiple expressions run once and in order"
        '(initialized first second)
        ((module-ref module 'ordered) 'first 'second))

      (let ((documented (module-ref module 'documented))
            (documented-output (module-ref module 'documented-output)))
        (test-equal "one expression after a docstring" 42 (documented))
        (test-equal "single-expression procedure retains its docstring"
          "Return the answer."
          (procedure-documentation documented))
        (test-equal "multiple-expression procedure retains its docstring"
          "Print both arguments and return the answer."
          (procedure-documentation documented-output))
        (let* ((result #f)
               (output (with-output-to-string
                         (lambda () (set! result (documented-output 21 42))))))
          (test-equal "documented body prints in order with the tracing prefix"
            "[test:documented-output] a 21\n[test:documented-output] b 42\n"
            output)
          (test-equal "documented body returns its last result" 42 result)))

      (test-equal "internal definition and procedure tracing context"
        '(local-definition "[test:local-definition]" 42)
        ((module-ref module 'local-definition) 21))
      (test-equal "dotted rest arguments" '(1 2 3)
        ((module-ref module 'rest-arguments) 1 2 3))
      (test-eq "variable export follows the macro" public?
        (module-defined? (module-public-interface module) 'value))
      (test-eq "procedure export follows the macro" public?
        (module-defined? (module-public-interface module) 'documented))
      (test-error "empty procedure body" 'syntax-error
        (eval `(,macro (empty-body)) module))

      (when starred?
        (eval
         `(begin
            (,macro (keyword-body a b #:key (c #f))
              21
              42)
            (,macro (keyword-documented a b #:key (c #f))
              "Return the supplied arguments."
              (list a b c))
            (,macro (extended a #:optional (b 2) #:key (c 3)
                               #:allow-other-keys #:rest rest)
              (list a b c rest)))
         module)
        (let ((keyword-body (module-ref module 'keyword-body))
              (keyword-documented (module-ref module 'keyword-documented))
              (extended (module-ref module 'extended)))
          (test-equal "keyword signature with two expressions and no docstring"
            42 (keyword-body 1 2 #:c #t))
          (test-equal "keyword default" '(1 2 #f) (keyword-documented 1 2))
          (test-equal "keyword override" '(1 2 3) (keyword-documented 1 2 #:c 3))
          (test-equal "keyword procedure docstring"
            "Return the supplied arguments."
            (procedure-documentation keyword-documented))
          (test-equal "optional and keyword defaults with an empty rest list"
            '(1 2 3 ()) (extended 1))
          (test-equal "explicit optional, rest, and keyword arguments"
            '(1 4 5 (#:c 5)) (extended 1 4 #:c 5))
          (test-equal "allow-other-keys accepts an unrecognized keyword"
            '(1 4 3 (#:other 7)) (extended 1 4 #:other 7)))))))

(define (main . args)
  (test-begin "make-def")
  (parameterize ((log-prefix-style 'brackets))
    (check-definition 'def #f #f)
    (check-definition 'def-public #t #f)
    (check-definition 'def* #f #t)
    (check-definition 'def*-public #t #t))
  (let ((runner (test-runner-current)))
    (test-end "make-def")
    (exit (if (and (zero? (test-runner-fail-count runner))
                   (zero? (test-runner-xpass-count runner)))
              0 1))))

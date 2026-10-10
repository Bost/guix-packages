;;; Run from the channel root:
;;; guile --no-auto-compile -L src -c '((@ (bost common dbgfmt-tests) main))'

(define-module (bost common dbgfmt-tests)
  #:use-module (bost common core)
  #:use-module (srfi srfi-64)
  #:export (main))

;; Keep m and f out of module scope so each case controls its own context.
(define (capture thunk)
  "Call the zero-argument procedure THUNK once, capturing its standard output.
Return a pair whose car is the output string and whose cdr is THUNK's
single return value.  Exceptions propagate to the caller."
  (let ((result #f))
    (let ((output (with-output-to-string
                   (lambda () (set! result (thunk))))))
      (cons output result))))

(define* (check-print #:key test-name expected thunk)
  "Run two SRFI-64 assertions for the zero-argument procedure THUNK.
Using TEST-NAME as the output assertion's name, compare captured standard
output with the string EXPECTED, including any trailing newline.  Also
check that THUNK returns the same value as a printing call to format in
the current environment.  THUNK is called once; exceptions propagate."
  (let ((actual (capture thunk)))
    (test-equal test-name expected (car actual))
    ;; Loading SRFI-64 can change format's printing return value.
    (test-equal (string-append test-name " returns format's printing result")
      (cdr (capture (lambda () (format #t ""))))
      (cdr actual))))

(define (main . args)
  (test-begin "dbgfmt")
  (let ((actual (capture (lambda () (dbgfmt "hello" 42)))))
    (test-equal "no context prints nothing" "" (car actual))
    (test-equal "no context returns a string" "hello 42\n" (cdr actual)))

  (check-print
   #:test-name "module only"
   #:expected "[module] hello 42\n"
   #:thunk (lambda () (let ((m "[module]")) (dbgfmt "hello" 42))))

  (check-print
   #:test-name "function only"
   #:expected "[function] hello\n"
   #:thunk (lambda () (let ((f "[function]")) (dbgfmt "hello"))))

  (check-print
   #:test-name "both prefixes"
   #:expected "[module] [function] hello\n"
   #:thunk (lambda ()
             (let ((m "[module]") (f "[function]"))
               (dbgfmt "hello"))))

  (check-print
   #:test-name "explicit reversed prefixes"
   #:expected "[module] [function] hello\n"
   #:thunk (lambda ()
             (let ((m "[module]") (f "[function]"))
               (dbgfmt f m "hello"))))

  (check-print
   #:test-name "explicit normal prefixes"
   #:expected "[module] [function] hello\n"
   #:thunk (lambda ()
             (let ((m "[module]") (f "[function]"))
               (dbgfmt m f "hello"))))

  (check-print
   #:test-name "false is still defined"
   #:expected "#f hello\n"
   #:thunk (lambda () (let ((f #f)) (dbgfmt "hello"))))

  (let ((count 0))
    (check-print
     #:test-name "expression evaluated once"
     #:expected "[function] 1\n"
     #:thunk (lambda ()
               (let ((f "[function]"))
                 (dbgfmt (begin (set! count (+ count 1)) count)))))
    (test-equal "evaluation count" 1 count))

  (test-error "payload error propagates" 'misc-error
    (let ((f "[function]")) (dbgfmt (error "payload failed"))))

  (test-error "unbound payload is not treated as missing context"
    'unbound-variable
    (let ((f "[function]")) (dbgfmt missing-payload)))

  ;; def* introduces a lexical f containing the module and procedure names.
  (let ((m "[module]"))
    (def* (sample) "Example procedure." (dbgfmt "hello") #t)
    (test-equal "def* supplies lexical function context"
      "[module:sample] hello\n"
      (with-output-to-string sample)))

  ;; The same prefix in the standard Guile notation; (module) isn't loaded, so
  ;; sample counts as private.
  (let ((m "[module]"))
    (def* (sample) "Example procedure." (dbgfmt "hello") #t)
    (test-equal "log-prefix-style 'guile"
      "(@@ (module) sample) hello\n"
      (parameterize ((log-prefix-style 'guile))
        (with-output-to-string sample))))

  (test-equal "log-prefix-style 'guile, exported"
    "(@ (bost common core) cnt) hello\n"
    (parameterize ((log-prefix-style 'guile))
      (with-output-to-string
        (lambda () (let ((f ((@@ (bost common core) qualified-prefix)
                             "[bost common core]" 'cnt)))
                     (dbgfmt "hello"))))))

  (let ((runner (test-runner-current)))
    (test-end "dbgfmt")
    (exit (if (and (zero? (test-runner-fail-count runner))
                   (zero? (test-runner-xpass-count runner)))
              0 1))))

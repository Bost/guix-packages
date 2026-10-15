;;; Pretty-printing helpers: rendering an s-expression to a string (with
;;; or without comments) and rendering a small source-generation DSL
;;; (source->string) to text.

(define-module (bost common pretty-print)
  #:use-module (ice-9 match)         ; source->string's match-lambda
  #:use-module (ice-9 optargs)       ; pretty-print-with-comments->string
  #:use-module (ice-9 pretty-print)) ; pretty-print

(define m "[bost common pretty-print]")

(define-public (pretty-print->string sexp)
  (let [(port (open-output-string))]
    (pretty-print sexp port)
    (let* [(ret (get-output-string port))]
      (close-output-port port)
      ret)))

(define*-public (pretty-print-with-comments->string sexp #:key (max-width 78))
  (call-with-output-string
    (lambda (port)
      ;; can't use '#:use-module (guix read-print)'. See above module definition
      ((@(guix read-print) pretty-print-with-comments) port sexp
       #:max-width max-width))))

(define (source-form->string form indentation)
  "Convert FORM to a string, using INDENTATION spaces.
A (multiline operator operand ...) node is a formatting directive,
not a Scheme form. A multiline-indented node additionally specifies the
indentation step; a multiline-definition node keeps the definition header
together. All other forms retain ordinary `write' semantics.

(display (source-form->string '(multiline list 1 2) 0))
;=> (list
;     1
;     2
;   )

(display
 (source-form->string
  '(multiline-definition define-public (example)
     (multiline-indented 1 list #:a
       (multiline-indented 1 list 1 2)))
  0))
;=> (define-public (example)
;     (list
;      #:a
;      (list
;       1
;       2
;      )
;     )
;   )"
  (match form
    [('multiline-indented step operator operands ...)
     (let* ((inner-indent (+ indentation step))
            (prefix (make-string inner-indent #\space)))
       (string-append
        "(" (source-form->string operator indentation)
        (if (null? operands) ""
            (string-append
             "\n" prefix
             (string-join
              (map (lambda (operand)
                     (source-form->string operand inner-indent))
                   operands)
              (string-append "\n" prefix))))
        "\n" (make-string indentation #\space) ")"))]
    [('multiline-definition operator signature body ...)
     (let ((prefix (make-string (+ indentation 2) #\space)))
       (string-append
        "(" (source-form->string operator indentation)
        " " (source-form->string signature indentation)
        "\n" prefix
        (string-join
         (map (lambda (form)
                (source-form->string form (+ indentation 2)))
              body)
         (string-append "\n" prefix))
        "\n" (make-string indentation #\space) ")"))]
    [('multiline operator operands ...)
     (source-form->string
      (cons 'multiline-indented (cons 2 (cons operator operands)))
      indentation)]
    [_
     (call-with-output-string
       (lambda (port) (write form port)))]))

(define-public (source->string items)
  "Render source-generation items. Existing forms are unchanged.

New: (multiline operator operand ...) formats an application vertically,
with two-space indentation per level. Nested multiline nodes are supported.
Each operand starts on its own source line, making this suitable for
checksummed, manually transcribed Scheme data.

Example:
(use-modules (bost common core))
((comp
  (partial format #t \"~a\\n\")
  source->string)
 '((multiline list
     (multiline list \"abcd\" \"ef01\")
     (cons (quote vout) 0))))

;=> (list
;     (list
;       \"abcd\"
;       \"ef01\"
;     )
;     (cons (quote vout) 0)
;   )

Example:
(use-modules (bost common core))
(define a 1)
(define b #f)
(define s \"42\")
(define x \"24\")

((comp
  (partial format #t \"~a\\n\")
  source->string)
  (list
   `(define a ,a)
   `(define b ,b)
   '(blank)
   `(commented
     (define s ,s)
     ,(format #f \"x was ~s\" x))))

;=> (define a 1)
;   (define b #f)
;
;   (define s \"42\") ; x was \"24\""
  (string-join
   (map
    (match-lambda
      (('blank) "")
      (('comment text)
       (string-append "; " text))
      (('commented form text)
       (string-append (source-form->string form 0) " ; " text))
      (form (source-form->string form 0)))
    items)
   "\n"))

(define* (to-form value #:optional (step 2))
  "Convert data VALUE to a source-generation form, using indentation STEP.
Recursively turn proper lists into multiline-indented list constructors.
Quote symbols and improper pairs; leave other values unchanged.

(to-form '(#:a (1 2)) 1)
;=> (multiline-indented 1 list #:a (multiline-indented 1 list 1 2))
(to-form 'hello) ;=> (quote hello)
(to-form '())    ;=> (multiline-indented 2 list)"
  (cond
   [(list? value)
    (cons 'multiline-indented
          (cons step
                (cons 'list
                      (map (lambda (item) (to-form item step)) value))))]
   [(or (symbol? value) (pair? value))
    (list 'quote value)]
   [else value]))

(define (source-to-form form)
  "Convert source FORM to formatting directives without evaluating it.
Keep definition headers together and format list operands with one-space
indentation. Convert empty or non-symbol-headed lists as raw data via
to-form. Preserve other expressions, including quoted data, unchanged.

(source-to-form '(define-public (example) (list #:a 1)))
;=> (multiline-definition define-public (example)
;     (multiline-indented 1 list #:a 1))
(source-to-form '(#:a (1 2)))
;=> (multiline-indented 1 list #:a (multiline-indented 1 list 1 2))
(source-to-form '(+ x 1)) ;=> (+ x 1)"
  (match form
    [('list operands ...)
     (cons 'multiline-indented
           (cons 1 (cons 'list (map source-to-form operands))))]
    [((? (lambda (head)
           (memq head '(define define-public define* define*-public)))
       operator)
      signature body ...)
     (cons 'multiline-definition
           (cons operator (cons signature (map source-to-form body))))]
    ;; Raw data spliced into a definition body has no list operator.
    ;; Preserve symbol-headed source expressions, including quote forms.
    [(? (lambda (value)
          (and (list? value)
               (or (null? value) (not (symbol? (car value)))))))
     (to-form form 1)]
    [_ form]))

(define-public (list->multiline-string lst)
  "Render LST as nested `list' expressions using `source->string'.
Each element starts on its own line, indented two spaces per level.
Procedure definitions headed by define, define-public, define*, or
define*-public are treated as source: the header stays on one line, and
nested list expressions use one-space indentation. A top-level list
expression is also treated as source. Within source, empty lists and
lists whose first element is not a symbol are treated as raw data and
converted recursively to list expressions. Symbol-headed expressions
are preserved as source; use explicit list expressions or quote for data
beginning with a symbol. Other top-level inputs are treated as data.
Return a string without a trailing newline. Symbols and improper pairs
are quoted so the generated expression evaluates back to the original data.

(define s (list->multiline-string
           '(define (foo) (list #:a (list \"abcd\" \"ef01\") #:b 1))))
(format #t \"~a\\n\" s)
;=> (define (foo)
;     (list
;      #:a
;      (list
;       \"abcd\"
;       \"ef01\"
;      )
;      #:b
;      1
;     )
;   )"
  (unless (list? lst)
    (error "list->multiline-string: expected a proper list" lst))

  (source->string
   (list (if (and (pair? lst)
                  (memq (car lst)
                        '(list define define-public define* define*-public)))
             (source-to-form lst)
             (to-form lst)))))

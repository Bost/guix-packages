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
not a Scheme form. All other forms retain ordinary `write' semantics."
  (match form
    (('multiline operator operands ...)
     (let* [(inner-indent (+ indentation 2))
            (prefix (make-string inner-indent #\space))
            (rendered (map (lambda (operand)
                             (source-form->string operand inner-indent))
                           operands))]
       (string-append
        "(" (source-form->string operator indentation)
        (if (null? rendered)
            ""
            (string-append "\n" prefix
                           (string-join rendered
                                        (string-append "\n" prefix))))
        "\n" (make-string indentation #\space) ")")))
    (_
     (call-with-output-string
       (lambda (port) (write form port))))))

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

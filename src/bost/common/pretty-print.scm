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

(define-public (source->string items)
  "
(define a 1)
(define b #f)
(define s \"42\")
(define x \"24\")
((comp
  (partial format #t \"~a\\n\")
  source->string
  )
  (list
   `(define a ,a)
   `(define b ,b)
   '(blank)
   `(commented
     (define s ,s)
     ,(format #f \"x was ~s\" x))))
=>
(define a 1)
(define b #f)

(define s \"42\") ; x was \"24\"
"
  (string-join
   (map
    (match-lambda
      (('blank) "")
      (('comment text)
       (string-append "; " text))
      (('commented form text)
       (string-append
        (call-with-output-string
          (lambda (port) (write form port)))
        " ; "
        text))
      (form
       (call-with-output-string
         (lambda (port) (write form port)))))
    items)
   "\n"))

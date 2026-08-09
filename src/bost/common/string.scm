;;; String helpers: splitting/joining, prefix/suffix/substring checks,
;;; padding, printed-representation helpers (pr-str, scheme-literal),
;;; and small pure predicates (url?, keyword->string).

(define-module (bost common string)
  #:use-module (bost common core) ; comp, partial, def, str
  #:use-module (bost common list) ; ensure-list
  #:use-module (ice-9 optargs)    ; str-join is define*-public
  #:use-module (ice-9 regex)      ; string-match, used by has-substring?
  #:use-module (ice-9 string-fun) ; string-replace-substring
  #:use-module (srfi srfi-1))     ; used transitively by str-join etc.

(define m "[bost common string]")

(define-public (has-suffix? string suffix)
  "Does STRING end with the SUFFIX? As `string-suffix?' but the parameters are
reversed. See also:
(define s (string-match \"[0-9][0-9][0-9][0-9]\" \"blah2002foo\"))
(match:end s) ;=> 8"
  (string-suffix? suffix string))

(define-public ends-with? has-suffix?)

(define-public (has-substring? str subs)
  (boolean (string-match subs str)))

(define-public (split-string s n)
  "Split a string S into substrings of length N.
;; Valid cases
(split-string \"hello\" 2)        ;=> (\"he\" \"ll\" \"o\")
(split-string \"hello\" 5)        ;=> (\"hello\")
(split-string \"hello\" 10)       ;=> (\"hello\") - n >= length
(split-string \"\" 3)             ;=> (\"\") or maybe should be '()?
(split-string \"ab\" 1)           ;=> (\"a\" \"b\")
(split-string \"hello\" 0)        ;=> (\"hello\")

;; Invalid n: not a number
(split-string \"hello\" \"2\")      ;=> error
(split-string \"hello\" #f)       ;=> error
(split-string \"hello\" '())      ;=> error
(split-string \"hello\" #\\c)      ;=> error

;; Invalid n: negative number
(split-string \"hello\" -1)       ;=> error
(split-string \"hello\" -5)       ;=> error

;; Invalid n: non-integer number
(split-string \"hello\" 2.5)      ;=> error
(split-string \"hello\" 1.0)      ;=> error; even though mathematically =1
(split-string \"hello\" +inf.0)   ;=> error
(split-string \"hello\" +nan.0)   ;=> error

;; Invalid s: not a string
(split-string 123 2)            ;=> error
(split-string #f 2)             ;=> error
(split-string '() 2)            ;=> error
(split-string #\\h 2)            ;=> error

;; Both invalid
(split-string 123 \"2\")          ;=> error
(split-string #f -1)            ;=> error

;; Edge cases
(split-string \"\" 0)             ;=> (\"\")
(split-string \"a\" 1)            ;=> (\"a\")"
  (def (error-out s n)
    (let* [(s1 (if (not (and (number? n)
                             (or (zero? n) (positive? n))
                             (integer? n)))
                   (format #f "`n' '~a' must be a positive integer or zero" n)
                   ""))
           (s2 (if (not (string? s))
                   (format #f "`s' must be a string") ""))
           (s ((comp
                (partial str-join ", ")
                (partial remove unspecified-or-empty-or-false?))
               (list s1 s2)))]
      (error (format #f "~a ~a" f s))))

  (if  (and (string? s) (number? n))
       (cond
        [(and (positive? n) (integer? n))
         (if (<= (string-length s) n)
             (list s)
             (cons (substring s 0 n)
                   (split-string (substring s n) n)))]
        [(zero? n) (list s)]
        [else (error-out s n)])
       (error-out s n)))

(define-public (smart-split-string s n)
  "Smart split a string S into substrings of length N.
(smart-split-string \"12345\" 2) ;=> (\"12\" \"34\" \"5\")
(smart-split-string 2 \"12345\") ;=> (\"12\" \"34\" \"5\")"
  (if (and (string? s) (number? n))
      (split-string s n)
      (split-string n s)))

(define (split-space-escaped input)
  "(split-space-escaped \"a b\\ c\") ;=> (\"a\" \"b c\")"
  (let* [(placeholder "#\\space")]
    ((comp
      (partial map (lambda (s) (string-replace-substring s placeholder " ")))
      (lambda (prepared) (string-split prepared #\space))
      (lambda (input) (string-replace-substring input "\\ " placeholder)))
     input)))

(define (string-sff ch s-list)
  "(string-sff #\\space (list \"foo bar baz\")) ;=> (\"foo\" \"bar\" \"baz\")"
  ((comp
    (partial filter (comp not string-null?))
    flatten
    (partial map (lambda (s) (string-split s ch))))
   s-list))

(define-public (string-split-whitespace one-or-more-args)
  ((comp
    ;; (partial string-sff #\space)
    flatten (partial map split-space-escaped)
    (partial string-sff #\newline)
    (partial string-sff #\tab)
    ensure-list)
   one-or-more-args))

(define-public (url? url)
  "Is URL a valid url?"
  (or (string-prefix? "https://" url)
      (string-prefix? "http://" url))
  #;
  (let ((url-regex (rx (and string-start
                            (or "http" "https" "ftp") "://"
                            (ensure-list (not (any " ")))
                            string-end))))
    (regexp-match url-regex url)))

;; `any', `every' are from (srfi srfi-1)
(define-public (string-in? lst string-elem)
  "Return the first element of @var{lst} that equals (string=)
@var{string-elem}, or @code{#f} if no such element is found.

(string-in? (list \"a\" \"b\" \"c\") \"b\") ;=> \"b\"
(string-in? (list \"a\" \"b\" \"c\") \"X\") ;=> #f
(string-in? (list \"a\" \"b\" \"c\") \"\")  ;=> #f
(string-in? (list \"a\" \"b\" \"c\") #f)    ;=> Exception

Requires:
  (use-modules (srfi srfi-1))"
  (find (lambda (e) (string= string-elem e)) lst)
  ;; Alternative implementation
  #;
  (if-let [r (member string-elem lst)]
    (car r)))

(define-public (keyword->string keyword)
  "(use-modules (srfi srfi-88))
(keyword->string #:example) ;=> \"example\""
  (symbol->string (keyword->symbol keyword)))

;; (define-public (directory-exists? fs-path)
;;   "Check if fs-path exists and is a directory. (Alternative definition)"
;;   (and (file-exists? fs-path)
;;        (eq? (stat:type (stat fs-path)) 'directory)))

;;; take and drop are in (use-modules (srfi srfi-1))
(define-public split-on-whitespace string-tokenize)
;; (split-on-whitespace "a b\tc\nd") => ("a" "b" "c" "d")

(define-public (pr-str . xs)
  "Return a string containing the printed representation of all arguments,
separated by spaces.
(pr-str 1 '(2 3) 'x \"foo\") ;=> \"1 (2 3) x \\\"foo\\\"\""
  (string-join (map (lambda (x) (object->string x)) xs) " "))

(define-public (pr-str-with-quote . xs)
  "See `pr-str'.
(pr-str-with-quote 1 2 '(3 4) \"foo\") ;=> \"1 '(2 3) 'x \\\"foo\\\"\""
  ((comp
    (lambda (lst) (string-join lst " "))
    (partial map (lambda (x)
                   (str
                    (cond
                     [(symbol? x) "'"]
                     [(or (list? x) (pair? x)) "'"]
                     [#t ""])
                    (object->string x)))))
   xs))

(define-public (string-qchecksum s)
  "(string-checksum \"0200000000010171\") ;=> 683979683
(string-checksum \"\") ;=> 0
(string-checksum \" \") ;=> 32"
  ;; simple polynomial hash: sum over chars of (char-code * weight^i) mod some
  ;; modulus
  (let* ((modulus 1000000007)   ; a large prime
         (base 257)
         (len (string-length s)))
    (let loop ((i 0) (acc 0))
      (if (= i len)
          acc
          (let* ((c (char->integer (string-ref s i)))
                 (acc2 (modulo (+ (modulo (* acc base) modulus)
                                  c)
                               modulus)))
            (loop (+ i 1) acc2))))))

(define*-public (str-join lst #:optional (delimiter " ") (grammar 'infix))
  "Join a list of values into a string with an optional delimiter and grammar.
Elements are converted with `str', and both (LIST DELIMITER) and (DELIMITER
LIST) are accepted.

(str-join (map str (list 1 2 3)))         ;=> \"1 2 3\"
(str-join (map str (list 1 2 3)) \"\\n\") ;=> \"1\\n2\\n3\"
(str-join \"_\" (map str (list 1 2)))     ;=> \"1_2\"
(str-join (map str (list 1 2)) \"_\")     ;=> \"1_2\""
  (cond
   [(and (list? lst) (string? delimiter) (symbol? grammar))
    (string-join (map str lst) delimiter grammar)]
   [(and (string? lst) (list? delimiter) (symbol? grammar))
    (string-join (map str delimiter) lst grammar)]
   [else
    (string-join lst delimiter grammar)]))

(define-public (padding-string max-length a-string)
  (cond
   [(and (number? a-string) (string? max-length))
    (padding-string a-string max-length)]
   [else
    (cond
     [(= max-length (string-length a-string)) a-string]
     [(< max-length (string-length a-string))
      (error (format #f "(< max-length (string-length a-string)). ~a, ~a"
                     (format #f "max-length : ~a" max-length)
                     (format #f "a-string : ~s" a-string)))]
     [else
      ((comp
        (lambda (lst) (string-join lst ""))
        (lambda (len) (make-list len " "))
        (partial - max-length)
        string-length)
       a-string)])]))

(define-public (scheme-literal x)
  "(scheme-literal 42);  $17 = \"42\"
  (scheme-literal \"42\") $18 = \"\\\"42\"\\\"

(define av 1) (define sv \"42\")
(str-join (list `(define a ,(scheme-literal av)) `(define s ,(scheme-literal sv))))
=> \"(define a 1) (define s \\\"42\\\")\"
"
  (object->string x write))

;; See https://codeberg.org/guile/guile/issues/50#issuecomment-14496786
;; The dual-mode syntax is clever but fragile, so if the short-circuiting is not needed a plain procedure may be better:
;; (define-syntax and*
;;   (lambda (x)
;;     (syntax-case x ()
;;       [(_ rest ...)
;;        #'(and rest ...)]
;;       [var
;;        (identifier? #'var)
;;        #'(lambda args
;;            (let loop ((args args))
;;              (if (null? args)
;;                  #t ; by default
;;                  (and (car args) (loop (cdr args))))))])))
;;
;; (define-syntax or*
;;   (lambda (x)
;;     (syntax-case x ()
;;       [(_ rest ...)
;;        #'(or rest ...)]
;;       [var
;;        (identifier? #'var)
;;        #'(lambda args
;;            (let loop ((args args))
;;              (if (null? args)
;;                  #f ; by default
;;                  (or (car args) (loop (cdr args))))))])))

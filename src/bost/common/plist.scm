;;; Property-list (keyword-tagged list) helpers: predicates, accessors,
;;; mutators, and `sort-by' for sorting a list of plists by given keys.

(define-module (bost common plist)
  #:use-module (bost common core) ; comp, partial, def-public, def*-public, str
  #:use-module (bost common list) ; flatten, every?, true?
  #:use-module (srfi srfi-1))     ; remove, filter-map, concatenate, delete-duplicates

(define m "[bost common plist]")

(define-public (get-keys lst)
  "Return a list of all keys in the list LST, which may or may not be a plist.
(get-keys '(#:a 1 b 2))   ;=> (#:a b)
(get-keys '(a 1 b 2))     ;=> (a b)
(get-keys '())            ;=> ()
(get-keys '(#:a 1 #:a 3)) ;=> (#:a #:a) ; not checking for duplicate keys
(get-keys '(#:a 1 b))     ;=> (#:a)
(get-keys 1)              ;=> not a list"
  (unless (list? lst)
    (error (format #f "get-keys: `~s' is not a list\n" lst)))

  (let loop ((xs lst) (acc '()))
    (cond
     ((or (null? xs) (null? (cdr xs)))
      (reverse acc))
     (else
      (loop (cddr xs) (cons (car xs) acc))))))

(define (has-duplicates? lst)
  "Used in `plist?'
(has-duplicates? '())        ;=> #f
(has-duplicates? '(1 2 3 4)) ;=> #f
(has-duplicates? '(1 2 3 2)) ;=> #t
(has-duplicates? '(a 1 a 2)) ;=> #t
"
  (cond
   ((null? lst) #f)
   ((member (car lst) (cdr lst)) #t)
   (else (has-duplicates? (cdr lst)))))

(def-public (plist-get . args)
  "Smart plist-get that works with arguments in either order.
(plist-get '(#:y 2 #:x 1) #:x)      ;=> 1
(plist-get #:x (list #:y 2 #:x 1))  ;=> 1
(plist-get '(#:x 1 #:x 2) #:x)      ; plist-get: expected even-length ...
(plist-get '(#:y 2 #:x 1) #:z)      ;=> #f
(plist-get '() #:x)                 ;=> #f

(plist-get '(1 11 2 22) 1)          ;=> 11
(plist-get '((1 2) 11 2 22) '(1 2)) ;=> 11

(plist-get '(42 #:y 2 #:x 1) #:x)   ; plist-get: expected even-length ...

(plist-get)                         ; plist-get: expected exactly ...
(plist-get 1)                       ; plist-get: expected exactly ...
(plist-get '())                     ; plist-get: expected exactly ...
"
  (define (loop plist key)
    (cond [(null? plist) #f]
          ;; eq? is fragile for non-symbol/non-keyword keys
          [(equal? (car plist) key) (cadr plist)]
          [else (loop (cddr plist) key)]))

  (unless (= 2 (length args))
    (error
     (format #f "~a expect exactly 2 arguments (plist key) or (key plist)" f)
     args))

  (let* ((loop-args (if (list? (car args))
                        args
                        (reverse args)))
         (plist (car loop-args)))
    (if (plist? plist)
        (apply loop loop-args)
        (error
         "plist-get: expected even-length list of unique key/value pairs"
         plist))))

(define-public (reorder-plist plist order)
  "Reorder PLIST so its key/value pairs follow the keyword sequence ORDER.
Each present keyword is paired with its value via `plist-get'. Keywords in
ORDER that are absent from PLIST are reported with `my=warn' and dropped.

(define lst (list #:k1 1 #:k2 2 #:k3 3 #:k4 4))
(reorder-plist lst (list #:k5 #:k2 #:k1 #:k4 #:k3))
;=> (#:k2 2 #:k1 1 #:k4 4 #:k3 3)  ; warns: #:k5 not in plist"
  (let ((keys (get-keys plist)))
    ((comp
      flatten  ; the '() from misses vanish
      (partial
       map
       (lambda (kw)
         (if (member kw keys)
             (list kw (plist-get plist kw))  ; keep: pair keyword & its value
             (begin                          ; miss: warn, contribute nothing
               ;; (my=warn "reorder-plist: ~s not in plist; skipping" kw)
               '())))))
     order)))

(def-public (plist-set plist key val)
  "(plist-set (list) #:key 'val) ;=> (#:key val)"
  (cond
   [(not (plist? plist))
    (error (format #f "~a `~s' is not a plist\n" f plist))]
   [else
    (let rec [(lst plist) (acc '())]
      (cond [(null? lst)
             (reverse (cons val (cons key acc)))]
            ;; eq? is fragile for non-symbol/non-keyword keys
            [(equal? (car lst) key)
             ;; skip the old key+value, replace
             (reverse acc)   ; rinsed part
             (let ((rest (cddr lst)))
               (append (reverse acc) (list key val) rest))]
            [else
             (rec (cddr lst) (cons (cadr lst) (cons (car lst) acc)))]))]))

(def-public (plist-set! plist key val)
  "Destructively modifies PLIST by setting KEY to VAL. Note: Cannot mutate an
empty list into a non-empty one.
(define lst (list #:k1 1 #:k2 2 #:k3 3))
(plist-set! lst #:k2 22) ;=> (#:k1 1 #:k2 22 #:k3 3)
lst ;=> (#:k1 1 #:k2 22 #:k3 3)"
  (cond
   [(not (plist? plist))
    (error (format #f "~a `~s' is not a plist.\n" f plist))]
   [(null? plist)
    (error
     (format #f
             "~a Cannot mutate empty list. Use `set!' with plist-set instead."
             f))]
   [else
    ;; The following works as well, but it allocates a whole new tail (the pure
    ;; plist-set) and then replaces the old one—still O(n) but with extra
    ;; consing.
    ;; (set-cdr! plist (cdr (plist-set plist key val)))
    ;;
    ;; This implementation doesn't rebuild the whole tail:
    (let loop [(p plist)]
      (cond
       ;; eq? is fragile for non-symbol/non-keyword keys
       [(equal? (car p) key)
        (if (pair? (cdr p))
            (begin (set-car! (cdr p) val) plist)
            ;; The following error message should never appear. The test
            ;; `(plist? plist)' should catch it.
            (error (format #f "~a Malformed plist: key without value: ~s"
                           f plist)))]
       [(null? (cddr p))         ; reached last value cell
        (set-cdr! (cdr p) (list key val))
        plist]
       [else (loop (cddr p))]))]))

;; A procedure can't change the caller's binding of plist, so it can't handle
;; the empty-list case "in place". I.e. this works in REPL and in doesn't work
;; in a procedure:
;;   (define lst (list))
;;   (set! lst (list #:key 'val)))
;;   lst ;=> '(#:key val)
;; A workaround is to use a macro:
;; (define-syntax-rule (plist-set! place key val)
;;   (set! place (plist-set place key val)))

(define (remove-element . args)
  "Remove all occurrences of a given element from a list.
If the element is a keyword (e.g., #:x), it also removes the next element (its
value).
(remove-element '(x #:a 1 x #:b 2 #:c 3 x b z #:d 1 #:d) #:d)
;=> (x #:a 1 x #:b 2 #:c 3 x b z)
(remove-element #:d '(x #:a 1 x #:b 2 #:c 3 x b z #:d 1 #:d))
;=> (x #:a 1 x #:b 2 #:c 3 x b z)"

  (define (loop lst element)
    "Original remove-element implementation."
    (define (recur xs)
      (cond
       [(null? xs) '()]
       [(and (keyword? element)      ; If element is a keyword and matches...
             (eq? (car xs) element))
        (if (null? (cdr xs))
            '() ; no value after keyword; remove only keyword
            (recur (cddr xs)))]   ; ...then skip the keyword and its value
       [(equal? (car xs) element) ; If element matches...
        (recur (cdr xs))]         ; ...then skip it
       [else
        (cons (car xs) (recur (cdr xs)))]))

    (recur lst))

  ((comp
    (partial apply loop)
    (lambda (args) (if (list? (car args))
                       args
                       (reverse args))))
   args))

(def (get-from-list pred lst)
  "Used in `get-keywords', `plist?'"
  (if (list? lst)
      ((comp
        (partial remove unspecified-or-empty-or-false?)
        (partial map (lambda (elem) (when (pred elem) elem))))
       lst)
      (error (format #f "~a `~s' is not a list\n" f lst))))

(define-public (get-keywords lst)
  "Return a list of all keys in the list LST, which may or may not be a plist.
(get-keywords '(#:a 1 b 2))   ;=> (#:a)
(get-keywords '(a 1 b 2))     ;=> ()
(get-keywords '())            ;=> ()
(get-keywords '(#:a 1 #:a 3)) ;=> (#:a #:a) ; not checking for duplicate keys
(get-keywords 1)              ;=> not a list"
  (get-from-list keyword? lst))

(define-public (plist? lst)
  "Empty list is also a plist. Plist must not contain duplicate keys.
(plist? '(a 1 b 2)) ;=> #t
(plist? '())        ;=> #t
(plist? '(1))       ;=> #f
(plist? '(1 2 3))   ;=> #f
(plist? 1)          ;=> #f
(plist? '(a 1 a 2)) ;=> #f ; duplicate"
  (and (list? lst) (even? (length lst))
       (not (has-duplicates? (get-keys lst)))))

(define-public (alist->plist alist)
  "Flatten a (key . value) alist to a plist, dropping #f-valued entries.
(alist->plist (list (cons #:k 1))) ;=> (#:k 1)"
  ((comp
    concatenate
    (partial filter-map
             (lambda (kv)
               (and (cdr kv) (list (car kv) (cdr kv))))))
   alist))

(def (plist-keys-or-vals proc plist)
  "Used in `plist-keys', `plist-vals'"
  (if (plist? plist)
      (let loop ((lst plist) (keys '()))
        (if (null? lst)
            (reverse keys)
            (loop (cddr lst) (cons (proc lst) keys))))
      (error (format #f "~a `~s' is not a plist\n" f plist))))

(define-public (plist-keys plist)
  "Return a list of all keys in the plist.
(plist-keys '(a 1 b 2)) ;=> (a b)
(plist-keys '())        ;=> ()
(plist-keys '(1))       ;=> not a plist"
  (plist-keys-or-vals car plist))

(define-public (plist-vals plist)
  "Return a list of all values in the plist.
(plist-vals '(a 1 b 2)) ;=> (1 2)
(plist-vals '())        ;=> ()
(plist-vals '(1))       ;=> not a plist"
  (plist-keys-or-vals cadr plist))

(def-public (get-keyworded-vals lst)
  "Return a list of all keys in the plist.
(get-keyworded-vals '(#:a 1 b 2))   ;=> (1)
(get-keyworded-vals '(a 1 b 2))     ;=> ()
(get-keyworded-vals '())            ;=> ()
(get-keyworded-vals '(a 1 a 3))     ;=> ()
(get-keyworded-vals '(#:a 1 a 3))   ;=> (1) ; the second `a' is not a keyword
(get-keyworded-vals '(#:a 1 #:a 3)) ;=> not a plist - has duplicate keys
(get-keyworded-vals 1)              ;=> not a plist"
  (if (plist? lst)
      (map (partial plist-get lst) (get-keywords lst))
      (error (format #f "~a `~s' is not a plist\n" f lst))))

(define-public (remove-all-elements lst elements)
  "Remove all elements from a list.
If an element is a keyword (e.g., #:x), also remove the following element (its
value).
(remove-all-elements '(x #:a 1 y #:b 2 #:c 3 x z #:d 1 #:d) '(x #:d))
=> (#:a 1 y #:b 2 #:c 3 z)"
  (let ((uniq-elements (delete-duplicates elements)))
    (let loop ((lst lst)
               (els uniq-elements))
      (if (null? els)
          lst
          (loop (remove-element lst (car els))
                (cdr els))))))

(define-public (get-non-keyworded-vals lst)
  "Return a list of all keys in the plist.
(get-non-keyworded-vals '(#:a 1 b 2)) ;=> (b 2)
(get-non-keyworded-vals '(a 1 b 2))   ;=> (1 2)
(get-non-keyworded-vals '())          ;=> ()
(get-non-keyworded-vals 1)            ;=> not a list"
  (remove-all-elements lst (get-keywords lst)))

(define-public (keyworded-plist? lst)
  "(keyworded-plist? '(#:a 1 #:b 2)) ;=> #t
(keyworded-plist? '(#:a 1 b 2))   ;=> #f
(keyworded-plist? '())            ;=> #t
(keyworded-plist? '(1))           ;=> not a plist"
  (every? true? (map keyword? (plist-keys lst))))

(def (value< a b)
  "Used in `sort-by'. Compare two plist values A and B of the same kind.
Numbers, strings, symbols, characters and booleans (#f is smaller than #t)
are supported; comparing values of differing or unsupported types errors
out."
  (cond
   ((and (number? a) (number? b))   (< a b))
   ((and (string? a) (string? b))   (string<? a b))
   ((and (symbol? a) (symbol? b))   (string<? (symbol->string a)
                                              (symbol->string b)))
   ((and (char? a) (char? b))       (char<? a b))
   ((and (boolean? a) (boolean? b)) (and (not a) b)) ; #f < #t
   (else
    (error (format #f "~a don't know how to compare ~s and ~s" f a b)))))

(def*-public (sort-by lst #:key (order '()) (ascend #t))
  "Stably sort the list of plists LST by the keys listed in ORDER, most
significant key first. ASCEND controls the direction for every key in
ORDER; there's no per-key direction. Values under a key are compared with
`value<', which understands numbers, strings, symbols, characters and
booleans; comparing two values of differing or unsupported types signals
an error. Rows equal on every key in ORDER keep their original relative
position, since the underlying `sort' is stable.

(define lst
  (list
   (list #:a 2 #:b 12 #:c #t)
   (list #:a 2 #:b 13 #:c #t)
   (list #:a 1 #:b 11 #:c #f)
   (list #:a 3 #:b 12 #:c #t)))

,pp (sort-by lst #:order (list #:a) #:ascend #t) ;=>
(list
 (list #:a 1 #:b 11 #:c #f)
 (list #:a 2 #:b 12 #:c #t)  ; tie on #:a: original relative order kept
 (list #:a 2 #:b 13 #:c #t)
 (list #:a 3 #:b 12 #:c #t))

,pp (sort-by lst #:order (list #:a #:b) #:ascend #t) ;=>
(list
 (list #:a 1 #:b 11 #:c #f)
 (list #:a 2 #:b 12 #:c #t)
 (list #:a 2 #:b 13 #:c #t)
 (list #:a 3 #:b 12 #:c #t))

,pp (sort-by lst #:order (list #:a) #:ascend #f) ;=>
(list
 (list #:a 3 #:b 12 #:c #t)
 (list #:a 2 #:b 12 #:c #t)  ; tie on #:a: original relative order kept
 (list #:a 2 #:b 13 #:c #t)
 (list #:a 1 #:b 11 #:c #f))

(sort-by (list (list #:a 1) (list #:a \"x\")) #:order (list #:a) #:ascend #t)
;; error: value<: don't know how to compare ... ; mixed types under #:a
;; (argument order in the message is unspecified: `sort' decides which of
;; the two it hands to `value<' first)"
  (unless (every? plist? lst)
    (error (format #f "~a not a list of plists" f) lst))

  (define (item< item-a item-b)
    (let loop ((keys order))
      (and (not (null? keys))
           (let* ((key (car keys))
                  (va (plist-get item-a key))
                  (vb (plist-get item-b key)))
             (cond
              ((equal? va vb) (loop (cdr keys)))
              (ascend (value< va vb))
              (else   (value< vb va)))))))

  (sort lst item<))

;;; The two `(guix monads)'-based command-composition pipelines used by
;;; the scm-bin CLI utilities: a plain shell-command monad and a
;;; guix-shell one (plus its dry-run variant).

(define-module (bost common monad)
  #:use-module (bost common core)  ; error-command-failed
  #:use-module (bost common plist) ; plist-get
  #:use-module (guix monads)       ; bind, return, define-monad

  #:export (
            compose-commands-guix-shell
            compose-commands-guix-shell-dry-run
            compose-shell-commands
            ))

(define m "[bost common monad]")

(define-inlinable (pipe-return params)
  (list
   ;; Return code signaling that some hypothetical previous command terminated
   ;; successfully.
   0
   ;; String containing the parameters of the next command
   params))

(define-inlinable (pipe-bind mv mf)
  (let* [(mv-retcode (plist-get mv #:retcode))]
    (if (zero? mv-retcode)
        (mf (plist-get mv #:results))
        (begin
          (error-command-failed m (format #f "mv-retcode: ~a" mv-retcode))
          mv))))

;; See guix/common/utils.scm
(define-monad compose-shell-commands
  (bind pipe-bind)
  (return pipe-return))

(define-inlinable (guix-shell-return lst-params)
  (list
   ;; Return code signaling that some hypothetical previous command terminated
   ;; successfully.
   ;; copy-file, delete-file return *unspecified*
   lst-params  ;; output returned by some previous command
   ;; String containing the parameters of the next command
   lst-params))

(define-inlinable (guix-shell-bind mv mf)
  "Contains (mf lst-params)"
  ;; (format #t "\n")
  ;; (format #t "mv: ~a\n" mv)
  ;; (format #t "mf: ~a; (list? mf): ~a\n" mf (list? mf))
  (if (and (list? mf) (equal? (car mf) 'override-mv))
      (begin
        ;; (format #t "mf: (cdr mf): ~a\n" (cdr mf))
        (guix-shell-return (cdr mf)))
      (let* [(lst-output-of-previous-cmd (car mv))
             (lst-params (cadr mv))]
        (if (equal? lst-output-of-previous-cmd lst-params)
            (begin
              (format #t "~s… " `(,mf ,lst-params))
              ;; (format #t "~s…\n" `(,mf ,lst-params))
              (mf lst-params)
              ;; (format #t "~s… done\n" `(,mf ,lst-params))
              (format #t "done\n")
              ;; enforce manual command params specification by returning an
              ;; empty list
              (guix-shell-return '()))
            (begin
              (error-command-failed m)
              mv)))))

(define-inlinable (guix-shell-dry-run-bind mv mf)
  "Does NOT contain (mf lst-params)"
  ;; (format #t "\n")
  ;; (format #t "mv: ~a\n" mv)
  ;; (format #t "mf: ~a; (list? mf): ~a\n" mf (list? mf))
  (if (and (list? mf) (equal? (car mf) 'override-mv))
      (begin
        ;; (format #t "mf: (cdr mf): ~a\n" (cdr mf))
        (guix-shell-return (cdr mf)))
      (let* [(lst-output-of-previous-cmd (car mv))
             (lst-params (cadr mv))]
        (if (equal? lst-output-of-previous-cmd lst-params)
            (begin
              (format #t "~s… " `(,mf ,lst-params))
              ;; (format #t "~s…\n" `(,mf ,lst-params))
              ;; (mf lst-params)
              ;; (format #t "~s… done\n" `(,mf ,lst-params))
              (format #t "done\n")
              ;; enforce manual command params specification by returning an
              ;; empty list
              (guix-shell-return '()))
            (begin
              (error-command-failed m)
              mv)))))

(define-monad compose-commands-guix-shell-dry-run
  (bind guix-shell-dry-run-bind)
  (return guix-shell-return))

(define-monad compose-commands-guix-shell
  (bind guix-shell-bind)
  (return guix-shell-return))

;;; Filesystem/process-environment helpers: temp files, mount/USB/
;;; ethernet inspection, safe file writing, and the small shell-command
;;; helpers (timestamp, sha1-file, sha1-string) built on (bost common exec).

(define-module (bost common fs)
  #:use-module (bost common core)   ; comp, partial, def-public, def*-public, str
  #:use-module (bost common exec)   ; exec, cmd->string, escape-single-quotes
  #:use-module (bost common plist)  ; plist-get
  #:use-module (ice-9 exceptions)   ; guard
  #:use-module (ice-9 match)        ; mounted-usb-devices et al.
  #:use-module (rnrs io ports)      ; get-line, get-string-all
  #:use-module (srfi srfi-1)        ; delete-duplicates, find
  #:use-module (srfi srfi-26))      ; cut

(define m "[bost common fs]")

;; TODO turn `path' to a procedure named `env-path' or `pathenv'
;; Turn the colon-separated PATH-string, into a list and return the resulting
;; list with tail appended
(define-public path
  (delete-duplicates (parse-path (getenv "PATH"))))

(define-public (mktmpfile)
  "Create / Make temporary file under /tmp"
  ;; (tmpnam) could be used instead of all of this, however I get deprecation
  ;; warning sometimes
  ((comp
    port-filename
    mkstemp!
    ;; prevent the 'string is read-only ...' error
    string-copy)
   "/tmp/myfile-XXXXXX"))
(testsymb 'mktmpfile)

(define-public (mdelete-file prms)
  (let [(file (car prms))]
    (when (access? file F_OK)
      (delete-file file))))

(define-public (mcopy-file prms) (apply copy-file prms))

#|
(use-modules (ice-9 exceptions))
;;;
(define (disk-space-amount) 1000)
(define (disk-space-left? query) (< query (disk-space-amount)))
;;;
(define-exception-type
  &read-exception &exception make-read-exception read-exception?
  ;; (field-name field-accessor) ...
  (read-reason read-exception-reason)
  (read-severity read-exception-severity))
;;;
(with-exception-handler
    (lambda (exception)
      (cond
       ((and (read-exception? exception)
             (eq? (read-exception-reason exception)  'almost-full))
        (format #t "the disk is almost full, only has ~a left.\n"
                (disk-space-amount))
        (format #t "please provide a different file size: ")
        (let ((new-file-size (read)))
          (if (disk-space-left? new-file-size)
              new-file-size
              (raise-exception exception))))
       (else (raise-exception exception))))
  (lambda ()
    (let ((file-size (if (disk-space-left? 1028)
                         1028
                         (raise-continuable
                          (make-read-exception 'almost-full 'medium)))))
      (format #t "writing ~a\n" file-size))))
|#

(define (symbolic-link? fs-path)
  "Check if fs-path is a symbolic link"
  (and (file-exists? fs-path)
       (eq? (stat:type (lstat fs-path)) 'symlink)))

(define (safe-write-to-file mode filename text)
  "Append TEXT to FILENAME. Create FILENAME if it doesn't exist."
  (guard
      (condition
       (else
        (let [(errmsg
               (format #f "~a: ~a"
                       (exception-origin condition)
                       (apply (partial format #f (exception-message condition))
                              (exception-irritants condition))))]
          (error errmsg))))
    (let [(port (open-file filename mode))]
      (display text port)
      (close-port port)
      #t)))

(define-public (safe-write-append filename text)
  (safe-write-to-file "a" filename text))
(testsymb 'safe-write-append)

(define-public (safe-overwrite filename text)
  (safe-write-to-file "w" filename text))
(testsymb 'safe-overwrite)

(define (read-mounts)
  (call-with-input-file "/proc/mounts"
    (lambda (port)
      (let loop ((lines '()))
        (let ((line (get-line port)))
          (if (eof-object? line)
              (reverse lines)
              (loop (cons line lines))))))))

(define (usb-device? dev)
  "Return #t if DEV (like /dev/sdb1) is backed by a USB device."
  (let* ((basename (basename dev))
         ;; Resolve symlink in /sys/class/block to see where it points
         (sys-path (string-append "/sys/class/block/" basename)))
    (and (file-exists? sys-path)
         (let ((target (false-if-exception (readlink sys-path))))
           (and target (string-contains target "usb"))))))

;; #:use-module (ice-9 rdelim)     ; external-mount-points
;; (define (external-mount-points)
;;   (call-with-input-file "/proc/mounts"
;;     (lambda (port)
;;       (let loop ((line (read-line port))
;;                  (result '()))
;;         (if (eof-object? line)
;;             (reverse result)
;;             (let* ((fields (string-split line #\space))
;;                    (mount-point (and (> (length fields) 1) (cadr fields))))
;;               (loop (read-line port)
;;                     (if (and mount-point
;;                              (or (string-prefix? "/media/" mount-point)
;;                                  (string-prefix? "/run/media/" mount-point)))
;;                         (cons mount-point result)
;;                         result))))))))

(def*-public (mounted-usb-devices #:key (verbose #f))
  "Return a list of mounted USB block devices (e.g. /dev/sdb1)."
  (match (exec
          (list "findmnt" "--real" "--raw" "--noheadings" "--output" "SOURCE")
          #:verbose verbose #:return-plist #t)
    [(#:retcode retcode #:results results)
     (cond
      [(zero? retcode) (filter usb-device? results)]
      [else
       (begin
         (error (format #f "~a retcode: ~a\n" f retcode))
         (list))])]))

(def*-public (get-ethernet-interfaces #:key (verbose #f))
  (match (exec
          (list "grep" "--files-with-matches" "'1'" "/sys/class/net/*/type"
                "|" "cut" "-delimiter='/'" "-fields=5")
          #:verbose verbose #:return-plist #t)
    [(#:retcode retcode #:results results)
     (cond
      [(zero? retcode) results]
      [else
       (begin
         (error (format #f "~a retcode: ~a\n" f retcode))
         (list))])]))

(define-public (ethernet-cable-plugged? iface)
  "Returns #t or #f"
  (catch #t
    (lambda ()
      (call-with-input-file
          (string-append "/sys/class/net/" iface "/carrier")
        (lambda (port)
          (string=? "1\n" (get-string-all port)))))
    (lambda (key . args) #f)))

(def*-public (mounted-with-option? option device-or-mountpoint
                                   #:key (verbose #f))
  "Return #t if the given DEVICE-OR-MOUNTPOINT is mounted with specified OPTION.
(mounted-with-option? \"rw\" \"/run/media/bost/lbl-fsys-axagon\")
(mounted-with-option? \"ro\" \"/dev/sdc1\")"
  ;; (format #t "~a Starting…\n" f)
  (let* [(cmd-result-struct
          ((comp
            (lambda (cmd) (exec cmd #:verbose verbose #:return-plist #t))
            cmd->string)
           (list "findmnt --real --noheadings --output OPTIONS"

                 ;; Explicitly define mount source. Supported specifications:
                 ;; device
                 ;; maj:min
                 ;; LABEL=label
                 ;; UUID=uuid
                 ;; PARTLABEL=label
                 ;; PARTUUID=uuid
                 ;; "--source"

                 device-or-mountpoint)))
         (retcode (plist-get cmd-result-struct #:retcode))]
    (if (zero? retcode)
        ((comp
          ;; (lambda (p) (format #t "~a done\n" f) p)
          (partial member option)
          (lambda (the-str) (string-split the-str #\,))
          string-trim-both
          car
          ;; (lambda (v) (format #t "~a 0: ~a\n" m v) v)
          )
         (plist-get cmd-result-struct #:results))
        (begin
          ;; error-out
          (error (format #f "~a retcode: ~a\n" m retcode))))))

(define-public (writeable-usb-mounted?)
  ((comp
    (partial find true?)
    (partial map boolean)
    (partial map (partial mounted-with-option? "rw")))
   (mounted-usb-devices)))

(def-public (sha1-string s)
  "(sha1-string \"0200000000010171\")
;=> \"e2462d5e457858930952c8b7b80f49f3307234ec\"
(sha1-string \"a'b'c\")
;=> \"f28055385d2aa41b63e587f54ddc6ad961b36ad2\"

See also:
  (string-hash \"0200000000010171\")     ;=> 1902129584164781890
  (hash \"0200090000010170\" 2147483647) ;=> 626328076"
  (match ((comp
           (cut exec <> #:return-plist #t #:verbose #f)
           (partial format #f "echo -n '~a' | sha1sum")
           escape-single-quotes)
          s)
    [(#:retcode retcode #:results results)
     (cond
      [(zero? retcode)
       ((comp car
              (cut string-split <> #\space)
              car)
        results)]
      [else (error (format #f "~a retcode: ~a\n" f retcode))])]))

(def*-public (timestamp #:key (verbose #f))
  "(timestamp) ;=> \"2025-10-14_20-14-16\""
  (match (exec (list "date" "\"+%F_%H-%M-%S\"") ; same as "+%Y-%m-%d_%H-%M-%S"
               #:return-plist #t #:verbose verbose)
    [(#:retcode retcode #:results results)
     (cond
      [(zero? retcode) (car results)]
      [else (error (format #f "~a retcode: ~a\n" f retcode))])]))

(def*-public (sha1-file filename #:key (verbose #f))
  "(sha1-file \"/etc/hosts\") ;=> \"...\"
TODO display proper error message: (sha1-file \"./\")"
  (match (exec (list "sha1sum" filename) #:return-plist #t #:verbose verbose)
    [(#:retcode retcode #:results results)
     (cond
      [(zero? retcode)
       ((comp car
              (cut string-split <> #\space)
              car)
        results)]
      [else (error (format #f "~a retcode: ~a\n" f retcode))])]))

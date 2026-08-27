;;; Shell/process execution: the exec/exec-argv/exec-system* family,
;;; dry-run handling, pipe/port reading helpers (read-all*), and small
;;; process-inspection helpers (analyze-pids-*, compute-cmd).

;; TODO status:exit-val status can also return an #f, not just a number. Ugh.
;;   Return the exit status value, as would be set if a process ended normally
;;   through a call to exit or _exit, if any, otherwise #f.
;; https://doc.guix.gnu.org/guile/latest/en/html_node/Processes.html

(define-module (bost common exec)
  #:use-module (bost common core)
  #:use-module (bost common plist)
  #:use-module (bost common string)
  #:use-module (ice-9 match)        ; run-command et al.
  #:use-module (ice-9 optargs)      ; define*-public
  #:use-module (ice-9 popen)        ; open-input-pipe open-pipe* close-pipe
  #:use-module (ice-9 rdelim)       ; read-line read-delimited
  #:use-module (ice-9 regex)        ; string-match
  #:use-module (ice-9 string-fun)   ; string-replace-substring
  #:use-module (rnrs io ports)      ; exec-with-error-to-string
  #:use-module (srfi srfi-1)        ; every
  )

(define m "[bost common exec]")

(define dry-run-prm "--gx-dry-run")

(define*-public (contains--gx-dry-run? args)
  (or (and (list? args) (member dry-run-prm args))
      (and (string? args) (string-contains args dry-run-prm))))

(define*-public (exec-or-dry-run exec-function args)
  (if (contains--gx-dry-run? args)
      args
      (if (list? args)
          (apply exec-function args)
          (exec-function args))))

(def*-public (exec-system*
              #:key (trace #f) (verbose #f) (ignore-errors #f)
              #:rest args)
  "Execute system command and returns its ret-code. E.g.:
(exec-system* \"echo\" \"bar\" \"baz\") ;=>
$ (echo bar baz)
bar baz
$9 = 0 ;; return code"
  (let* [(elements (list #:verbose))
         (args (remove-all-elements args elements))]
    ;; (format #t "~a ~a args : ~a\n" m f args)
    ((comp
      (partial exec-or-dry-run system*)
      (lambda (prm) (dbg-exec prm #:verbose verbose))
      ;; TODO fix exec-system*: string-split-whitespace also splits:
      ;;   "(@(bost gnu packages emacs-xyz) ~a)"
      string-split-whitespace)
     args)))

(def*-public (exec-or-dry-run-new
              #:key exec-function (gx-dry-run #f) (verbose #f) #:rest args)
  (let* [(elements (list #:exec-function #:gx-dry-run #:verbose))
         (args (remove-all-elements args elements))

         (args (car args))]
    ;; (format #t "~a ~a exec-function : ~a\n" m f exec-function)
    ;; (format #t "~a ~a dry-run       : ~a\n" m f
    ;;         (or (contains--gx-dry-run? args) gx-dry-run))
    ;; (format #t "~a ~a args          : ~a\n" m f args)
    (if (or (contains--gx-dry-run? args) gx-dry-run)
        0 ;; the exit status OK
        (if (list? args)
            (apply exec-function args) ;; TODO add #:verbose
            (exec-function args)))))

(def*-public (exec-system*-new
              #:key (trace #f) (verbose #f) (ignore-errors #f)
              (split-whitespace #t) (gx-dry-run #f)
              #:rest args)
  "Execute system command and returns its ret-code. E.g.:
(exec-system* \"echo\" \"bar\" \"baz\") ;=>
$ (echo bar baz)
bar baz
$9 = 0 ;; return code"
  (let* [(elements (list #:trace #:verbose #:ignore-errors
                         #:split-whitespace #:gx-dry-run))
         (args (remove-all-elements args elements))]
    ;; (format #t "~a ~a split-whitespace : ~a\n" m f split-whitespace)
    ;; (format #t "~a ~a gx-dry-run       : ~a\n" m f gx-dry-run)
    ;; (format #t "~a ~a args             : ~a\n" m f args)
    ;; (format #t "~a ~a (list? args)     : ~a\n" m f (list? args))
    ;; (format #t "~a ~a (length args)    : ~a\n" m f (length args))
    ((comp
      (lambda (exit-status)
        ;; (format #t "~a ~a exit-status       : ~a\n" m f exit-status)
        ;; (format #t "~a ~a (= exit-status 0) : ~a\n" m f (= exit-status 0))
        (exit (= exit-status 0)))
      (partial exec-or-dry-run-new
               #:gx-dry-run gx-dry-run
               #:verbose verbose
               #:exec-function system*)
      (lambda (prm) (dbg-exec prm #:verbose verbose))
      (partial map (lambda (s) (if split-whitespace
                                   (string-split-whitespace s) s))))
     args)))

(define-public (read-all reader-procedure)
  "Return a procedure which reads all items from a port using READER-PROCEDURE.

The returned procedure repeatedly calls READER-PROCEDURE on the given port until
it returns #f or an EOF object, and returns the collected items as a list in the
order in which they were read.

Example:

  (call-with-input-string \"foo\\nbar\\n\"
    ((read-all read-line)))
  => (\"foo\" \"bar\")

  (call-with-input-string \"(a b) 42\"
    ((read-all read)))
  => ((a b) 42)"
  (lambda (port)
    (let loop ((acc '()) (item (reader-procedure port)))
      (if (or (not item) (eof-object? item))
          (reverse acc)
          (loop (cons item acc) (reader-procedure port))))))

(define-public (read-all-sexprs port)
  "Return a list of all s-expressions read from PORT.

Each item is read with `read`, so the returned values are ordinary Scheme
datums.

Example:

  (call-with-input-string \"(define x 1)\\n(+ x 2)\\n\"
    read-all-sexprs)
  => ((define x 1) (+ x 2))"
  ((read-all read) port))

(define-public (read-all-syntax port)
  "Return a list of all syntax objects read from PORT.

Each item is read with `read-syntax`, so the returned values are syntax objects
rather than plain datums.  Use `syntax->datum` to obtain the corresponding
s-expressions.

Example:

  (call-with-input-string \"(define x 1)\\n(+ x 2)\\n\"
    (lambda (port)
      (map syntax->datum (read-all-syntax port))))
  => ((define x 1) (+ x 2))"
  ((read-all read-syntax) port))

(define-public (read-all-strings port)
  "Return a list of all lines read from PORT.

Each line is read with `read-line`.  The returned strings do not include the
trailing newline.

Example:

  (call-with-input-string \"foo\\nbar\\n\"
    read-all-strings)
  => (\"foo\" \"bar\")"
  ((read-all read-line) port))

(define-public (cmd->string cmd)
  (if (list? cmd)
      ;; join with ' ' by default
      (string-join
       (remove unspecified-or-empty-or-false?
               cmd))
      cmd))

;; 8sync https://www.gnu.org/software/8sync/
;; asynchronous programming library for GNU Guile. Based on the actor
;; model, it makes use of delimited continuations to avoid a mess of callbacks
;; resulting in clean, easy to read non-blocking code.
#;(import (language wisp spec)) ;; whitespace lisp

;; exec-foreground, exec-background and exec-system have the same signature (,
;; otherwise a (cond ...) in the cli-general-command is needed). I want them all
;; to have the same capabilities like 'ignore errors' etc.
(def*-public (exec-background
              command #:key (trace #f) (verbose #f) (ignore-errors #f))
  "Execute COMMAND in background, i.e. in a detached process.
COMMAND can be a string or a list of strings.
+🤓 echo bar baz & disown
bar baz
$9 = 0 ;; <return-code>"

  ;; TODO implement (trace f args) which does the same as this (when trace ...)
  (when trace
    (format #t "~a #:trace         ~a\n" f (pr-str-with-quote trace))
    (format #t "~a #:verbose       ~a\n" f (pr-str-with-quote verbose))
    (format #t "~a #:ignore-errors ~a\n" f (pr-str-with-quote ignore-errors)))

  ((comp
    (partial exec-or-dry-run system)
    (lambda (prm) (dbg-exec prm #:verbose verbose))
    ;; (lambda (prm) (dbg-exec prm #:verbose #t))
    cmd->string
    ;; disown belongs to shells. See `help disown`. The semicolon, as indicated
    ;; by `help disown` ivoked from the fish-shell, in eg. `echo foo &; disown`,
    ;; doesn't work in bash, only in the fish-shell
    (lambda (cmd) (list cmd "&" "disown"))
    cmd->string)
   command))

(def*-public (exec-foreground
              command #:key (trace #f) (verbose #f) (ignore-errors #f))
  "Execute COMMAND and returns its ret-code.
(exec-foreground \"echo bar baz\") ;=>
+🤓 echo bar baz
bar baz
$9 = (0 \"bar baz\") ;; (<return-code> <return-value>)

(exec-foreground (str \"rg \" (timestamp)) #:ignore-errors #t)
;=> *unspecified*"

  (when trace
    (format #t "~a #:trace         ~a\n" f (pr-str-with-quote trace))
    (format #t "~a #:verbose       ~a\n" f (pr-str-with-quote verbose))
    (format #t "~a #:ignore-errors ~a\n" f (pr-str-with-quote ignore-errors)))

  (let* [(cmd-result-struct (exec command #:verbose verbose #:return-plist #t))
         (retcode (plist-get cmd-result-struct #:retcode))]
    (if (zero? retcode)
        (begin
          (map (partial format #t "~a\n")
               (plist-get cmd-result-struct #:results))
          cmd-result-struct)
        (begin
          (unless ignore-errors
            (error (format #f "~a retcode: ~a\n" f retcode))) ; error-out
          ;; (error-command-failed f)
          ;; or return `retcode' instead of `*unspecified*'
          ;; *unspecified*
          ))))

(def*-public (exec-system
              command #:key (trace #f) (verbose #f) (ignore-errors #f))
  "Execute COMMAND using `system' from the (guile) module and returns its
ret-code.
(exec-system \"echo bar baz\") ;=>
+🤓 echo bar baz
bar baz
$9 = 0 ;; <return-code>"
  (when trace
    (format #t "~a #:trace         ~a\n" f (pr-str-with-quote trace))
    (format #t "~a #:verbose       ~a\n" f (pr-str-with-quote verbose))
    (format #t "~a #:ignore-errors ~a\n" f (pr-str-with-quote ignore-errors)))

  ((comp
    (partial exec-or-dry-run system)
    (lambda (prm) (dbg-exec prm #:verbose verbose))
    ;; (lambda (prm) (dbg-exec prm #:verbose #t))
    )
   command))

;; (define (background-system command)
;;   " https://sourceware.org/legacy-ml/guile/1998-09/msg00228.html "
;;   (let ((child-pid (primitive-fork)))
;;     (if (zero? child-pid)
;;         ;; Okay, we're the child process.  We need to catch any and
;;         ;; all errors and exit, or else we'll end up with two Guile
;;         ;; repls trying to read from the same terminal.
;;         (begin
;;           (catch #t
;;             (lambda ()
;;               ;; Put ourselves in our own process group.
;;               (setpgid (getpid) (getpid))
;;               ;; Try to execute the user's command.
;;               (execl "/bin/sh" "sh" "-c" command))
;;             (lambda args #f))
;;           ;; If we return from the exec for any reason, it means it failed.
;;           (quit 1))
;;         ;; Okay, we're the parent process.  Return the child pid, in
;;         ;; case we want to wait for it at some point in the future.
;;         child-pid)))

;;; See https://www.draketo.de/software/guile-capture-stdout-stderr.html
;; (format #t "current-error-port:\n~a\n"
;;         (let* ((error-port (open-output-string)))
;;           (with-error-to-port error-port
;;             (lambda ()
;;               (display "Err msg1\n" (current-error-port))))
;;           (get-output-string error-port)))

;; (format #t "(output-port? error-port): ~a\n"
;;         (let* ((error-port (open-output-string)))
;;           (output-port? error-port)))

(define*-public (exec-with-error-to-string commad #:key (verbose #t))
  "Run the shell COMMAND using '/bin/sh -c' with 'OPEN_READ' mode, ie. to read
from the subprocess. Wait for the command to terminate and return 3 values:
- the command's exit code (an integer; 0 in dry-run mode)
- a string containing standard output
- a string containing standard error output

(use-module (ice-9 receive)) ;; or (srfi srfi-8)
(receive (retcode stdout stderr)
    (exec-with-error-to-string \"echo to-stdout; echo to-stderr >&2\")
  (format #t \"receive retcode:~a\\n\" retcode)
  (format #t \"receive stdout:~a\\n\" stdout)
  (format #t \"receive stderr:~a\\n\" stderr))"
  (define (exec-function commad)
    (if (string-contains commad dry-run-prm)
        (values 0 "" "")
        (let* ((err-cons (pipe))
               (port (with-error-to-port (cdr err-cons)
                       (lambda () (open-input-pipe commad))))
               ;; the err-cons buffer size is 16 MiB
               (_ (setvbuf (car err-cons) 'block (* 1024 1024 16)))
               (stdout (read-delimited "" port))
               ;; `close-pipe' (not `close-port') is what actually waits for
               ;; the subprocess and yields its wait status; without this,
               ;; the command's exit code was never available to callers.
               (retcode (status:exit-val (close-pipe port))))
          ;; Our own reference to the write end must be closed too, or the
          ;; `read-delimited' below blocks forever waiting for EOF.
          (close-port (cdr err-cons))
          (values
           retcode
           stdout
           ;; the port must be closed before calling the following
           (read-delimited "" (car err-cons))))))

  ((comp
    ;; Can't use the (partial exec-or-dry-run exec-function) since the
    ;; exec-function returns multiple values and the exec-or-dry-run is able to
    ;; return only one value.
    exec-function
    (lambda (prm) (dbg-exec prm #:verbose verbose))
    cmd->string)
   commad))

(define*-public (exec command #:key (verbose #t) (return-plist #f))
  "Run shell COMMAND and return its exit status and captured standard output.

COMMAND may be a string or a list of strings. A list is joined with spaces
before execution. The resulting command is interpreted by `/bin/sh -c';
use `exec-argv' to execute an argv list without shell interpretation.

Standard output is returned as a list of lines without trailing newlines.
Standard error is not captured: it inherits `(current-error-port)'. To
capture both streams together, merge standard error into standard output
in COMMAND with `2>&1'. Use `exec-with-error-to-string' to capture the
streams separately.

When RETURN-PLIST is true, return the same information as a property list:

  (exec \"printf '%s\\n' foo bar\" #:verbose #f #:return-plist #t)
  => (#:retcode 0 #:results (\"foo\" \"bar\"))

  (use-modules (ice-9 match))
  (match (exec cmd #:verbose #f #:return-plist #t)
    [(#:retcode retcode #:results results) ...]
    [else ...])

When RETURN-PLIST is #f, return a pair whose car is the exit status and
whose cdr contains the output lines:

  (exec \"printf '%s\\n' foo bar\" #:verbose #f)
  => (0 \"foo\" \"bar\")

VERBOSE controls whether COMMAND is displayed before execution. If COMMAND
contains `--gx-dry-run', no process is started and the normalized command
string is returned.

TODO clarify where a delimited continuation can be used to break out of
`exec', ie. skip the `read-all-strings' and thus make `exec-background' out of
it."
  ;; ,use (guix build utils) ;; contains `invoke'
  ;; `invoke' does `(apply system* program args)'; `system*' waits for the
  ;; program to finish, The command is executed using fork and execlp.

  ;; TODO write a scheme procedure: chdir str
  ;; There may be a chdir procedure in guix source code somewhere.

  ;; Change the current working directory to str. The return value is
  ;; unspecified.
  (define (exec-function command)
    ;; Can't use the `call-with-port' since the exit-val is needed.
    (let* [(port (open-input-pipe command)) ; from (ice-9 rdelim)
           ;; the `read-all-strings' must be called before `close-pipe'.
           (results (read-all-strings port))]
      (if return-plist
          (list
           #:retcode (status:exit-val (close-pipe port))
           #:results results)
          (cons
           (status:exit-val (close-pipe port))
           results))))
  ((comp
    (partial exec-or-dry-run exec-function)
    (lambda (prm) (dbg-exec prm #:verbose verbose))
    cmd->string)
   command))

(define-public (call-with-stderr-to-null thunk)
  "Call THUNK with `(current-error-port)' dynamically redirected to
`/dev/null', returning the values produced by THUNK. Restore the previous
error port when THUNK returns or exits non-locally.

Output written to the current error port is discarded. Subprocesses started
while THUNK runs inherit `/dev/null' as their standard error. A real file
port is used because a subprocess cannot inherit a file descriptor from a
void port.

This redirects standard error; it does not merge it into the private
standard-output pipe captured by `exec'.

  (call-with-stderr-to-null
    (lambda ()
      (exec \"printf '%s\\n' visible; printf '%s\\n' hidden >&2\"
            #:verbose #f)))
  => (0 \"visible\")"
  (call-with-output-file "/dev/null"
    (lambda (sink) (with-error-to-port sink thunk))))

(def*-public (exec-argv command #:key (verbose #t) (return-plist #f))
  "Run COMMAND as an argv list without invoking a shell.
COMMAND must be a list whose first element is the program and whose remaining
items are argv elements. No whitespace splitting, quote interpretation, globbing,
pipes, or variable expansion is performed."
  (define (exec-function . argv)
    (unless (and (not (null? argv)) (every string? argv))
      (error (format #f "~a expects a non-empty list of strings" f)
             argv))
    (let* [(port (apply open-pipe* OPEN_READ argv))
           (results (read-all-strings port))
           (retcode (status:exit-val (close-pipe port)))]
      (if return-plist
          (list #:retcode retcode #:results results)
          (cons retcode results))))
  ((comp
    (partial exec-or-dry-run exec-function)
    (lambda (prm) (dbg-exec prm #:verbose verbose)))
   command))

(define*-public (exec-argv-result args #:key (verbose #t))
  "Run ARGS (an argv list) without shell interpretation and return
(RETCODE . OUTPUT-LINES) pair. RETCODE is #f if the process was killed by a
signal."
  (match (exec-argv args #:verbose verbose #:return-plist #t)
    ((#:retcode retcode #:results results) (cons retcode results))))

(define*-public (exec-argv-first-line args #:key (verbose #t))
  "Run ARGS (an argv list) and return its first non-empty output line, or #f if
it exited non-zero, produced no output, or was killed by a signal."
  (match (exec-argv-result args #:verbose verbose)
    ((retcode . results)
     (and retcode
          (zero? retcode)
          (pair? results)
          (non-empty-string? (car results))
          (car results)))))

(define*-public (exec-argv-success? args #:key (verbose #t))
  "Run ARGS (an argv list) and return #t if it exited zero, #f otherwise
(including if it was killed by a signal)."
  (let ((retcode (car (exec-argv-result args #:verbose verbose))))
    (and retcode (zero? retcode))))

(define*-public (run-command #:key args)
  "argv -> list of stdout lines.  Runs via exec-argv (no shell), errors on a
non-zero exit, and normalizes the result to a list of lines."
  ((comp
    (lambda (res) (let ((out (cdr res)))
                    (if (string? out) (string-split out #\newline) out)))
    (lambda (res) (if (zero? (car res))
                      res
                      (error "command failed with code" (car res))))
    (lambda (argv) (exec-argv argv #:verbose #f)))
   args))

(define-public (analyze-pids-flag-variable user init-cmd client-cmd pids)
  "Breakout implementation using a flag variable"
  (let [(ret-cmd init-cmd)]
    ((comp
      (lambda (p)
        (if (null? p)
            init-cmd ;; No such binary has been started yet.
            (car p)))
      (partial
       map
       (lambda (pid)
         (when (string=? ret-cmd init-cmd) ;; check the flag
           (let ((proc-user ((comp
                              cadr
                              exec)
;;; '-o' user defined format, 'h' no header, '-p' pid
                             (format #f "ps -o user= h -p ~a" pid))))
             (when (and (not (string-null? proc-user))
                        (string=? user proc-user))
               (let ((proc-cmd (exec
;;; '-o' user defined format, 'h' no header, '-p' pid
                                (format #f "ps -o command= h -p ~a" pid))))
                 (unless (string-match ".*<defunct>$" proc-cmd)
;;; Set a flag so that the body of the outermost when-statement is not executed
                   (set! ret-cmd client-cmd))))))
         ret-cmd)))
     pids)))

(define-public (analyze-pids-call/cc user init-cmd client-cmd pids)
  "For a process ID from the list of PIDS, return the INIT-CMD if no process ID
was found or the CLIENT-CMD if some process ID was found."
  (call/cc
   (lambda (continuation)
     (map
      (lambda (pid)
        (let ((proc-user ((comp
                           cadr
                           exec)
;;; '-o' user defined format, 'h' no header, '-p' pid
                          (format #f "ps -o user= h -p ~a" pid))))
          (when (and (not (string-null? proc-user))
                     (string=? user proc-user))
            (let ((proc-cmd ((comp cadr exec)
;;; '-o' user defined format, 'h' no header, '-p' pid
                             (format #f "ps -o command= h -p ~a" pid))))
              (unless (string-match ".*<defunct>$" proc-cmd)
;;; Terminate the call/cc statement with the return value `client-cmd'
                (continuation client-cmd))))))
      pids)
     ;; The pids-list is empty. No such binary has been started yet.
     init-cmd)))

(define*-public (compute-cmd #:key user init-cmd client-cmd pgrep-pattern)
  "pgrep for a USER and PATTERN and return the INIT-CMD if no process ID was
found or the CLIENT-CMD if some process ID was found."
  ((comp
    (partial
     analyze-pids-call/cc
     ;; analyze-pids-flag-variable
     user init-cmd client-cmd)
    cdr
    exec
    ;; --euid effective ID
    (partial format #f "pgrep --full --euid ~a ~a" user)
    (lambda (s)
      ;; TODO either:
      ;; (A) remove single quotes, escape double quotes, or
      ;; (B) escape backslashes and spaces
      (str "\"" s "\"")))
   pgrep-pattern))
(testsymb 'compute-cmd)

(define-public (escape-single-quotes s)
  "Prevent shell injection vulnerability
(escape-single-quotes \"a'b'c\") ;=> \"a'\\''b'\\''c\""
  (string-replace-substring s "'" "'\\''"))

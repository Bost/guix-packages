(define-module (bost common prompt)
  #:use-module (bost common string)
  #:use-module (ice-9 rdelim)     ; read-line
  )

;;; Questions to the user on the terminal

(define-public (answered? prompt answers)
  "Display PROMPT and return #t when the user types one of ANSWERS, ignoring
case; #f for any other answer and for Ctrl-D.
(answered? \"Type gpg to continue: \" '(\"gpg\")) ; user types GPG ;=> #t"
  (display prompt)
  (force-output)
  (let [(answer (read-line))]
    ;; #<eof> on Ctrl-D is not a string
    (and (string? answer) (member (string-downcase answer) answers) #t)))

(define-public (yes? question)
  "Ask QUESTION; #t when the user answers y or yes, ignoring case.
(yes? \"Another one?\") ; prints: Another one? [y/N]"
  (answered? (str question " [y/N] ") '("y" "yes")))

(define-public (proceed? action)
  "Print ACTION and wait for Enter. #f when the user types q instead, or Ctrl-D.
(proceed? \"Insert the next disk\")
; prints: Insert the next disk, then press Enter (q to quit)"
  (format #t "~a, then press Enter (q to quit) " action)
  (force-output)
  (let [(answer (read-line))]
    (not (or (eof-object? answer) (member answer '("q" "Q"))))))

(define-public (accept-or-exit prompt answers)
  "Display PROMPT and return #t when the user types one of ANSWERS, ignoring
case. Exit otherwise."
  (or (answered? prompt answers)
      (begin
        (display "Exiting.\n")
        (exit 0))))

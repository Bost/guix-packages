(define-module (bost guix build spacemacs-utils)
  #:use-module (bost utils)
  #:use-module (guix build utils)
  #:use-module (guix gexp)
  #:use-module (oop goops)
  #:use-module (ice-9 pretty-print)
  #:use-module (srfi srfi-1)

  #:use-module (guix packages)
  #:use-module (guix build-system trivial)

  #:export (program-file->package))

(define m (module-name-for-logging))
(evaluating-module)

(define* (program-file->package program
                                #:key
                                (version "1.0.0")
                                (synopsis "")
                                (description "")
                                (home-page "https://example.org")
                                (license #f))
  (let* [(prg-file (cadr program))]
    (package
      (name (program-file-name prg-file))
      (version version)
      (source prg-file)
      (build-system trivial-build-system)
      (arguments
       (list
        #:modules '((guix build utils))
        #:builder
        #~(begin
            (use-modules (guix build utils))
            (let ((bin (string-append #$output "/bin")))
              (mkdir-p bin)
              (copy-file #$source
                         (string-append bin #$(string-append "/" name)))
              (chmod (string-append bin #$(string-append "/" name)) #o555)))))
      (synopsis synopsis)
      (description description)
      (home-page home-page)
      (license license))))

(testsymb 'program-file->package)

(module-evaluated)

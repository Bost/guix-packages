(define-module (bost guix build cli-utils)
  #:use-module (bost utils)
  #:use-module (bost tests)
  #:use-module (bost settings)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (guix gexp)         ; program-file local-file
  #:use-module (gnu home services shells)
  #:use-module (gnu home services) ; simple-service
  #:use-module (srfi srfi-1)       ; list-processing procedures
  #:use-module (ice-9 pretty-print)
  #:use-module (ice-9 ftw)         ; scandir nftw
  #:use-module (ice-9 regex)       ; string-match
  #:export
  (
   service-file-gexp
   service-file-utils
   emacs-cli-utils-service
   )
  )

(define m (module-name-for-logging))
(evaluating-module)

(define-public scm-bin-dirname "scm-bin")


(def* (service-file-gexp
       #:key
       (trace #f) (verbose #t)
       utility fun exec-fun params extra-modules
       #:allow-other-keys #:rest args)
  "Create gexp like:
#<gexp #<gexp-input (begin ...) :out> 7fae376db870>

Example:
(service-file-gexp #:trace         #t
                   #:fun           'cli-general-command
                   #:exec-fun      'exec-background
                   #:extra-modules '()
                   #:utility       \"techo\"
                   #:params        \"echo \\\"foo\\\"\")

(service-file-gexp #:trace         #t
                    #:fun           'cli-general-command
                    #:exec-fun      'exec-foreground
                    #:extra-modules '()
                    #:utility       \"techo\"
                    #:params        \"echo \\\"foo\\\"\")

(service-file-gexp #:trace         #t
                   #:fun           'cli-general-command
                   #:exec-fun      'exec-system
                   #:extra-modules '()
                   #:utility       \"techo\"
                   #:params        \"echo \\\"foo\\\"\")

(service-file-gexp #:trace         #t
                   #:exec-fun      'exec-foreground
                   #:extra-modules '((bost guix build emacs-common))
                   #:utility       \"r\" #:fun 'create-launcher
                   ;; #:utility       \"er\" #:fun 'set-editable
                   ;; #:utility       \"kr\" #:fun 'pkill-server
                   #:params develop)

TODO The `search-notes' program should read a `search-space-file' containing
a list of files to search through."
  ;; (format #t "~a Starting…\n" f)

  (when trace
    (format #t "~a #:trace         ~a ; ~a\n" f (pr-str-with-quote trace)         (test-type trace))
    (format #t "~a #:verbose       ~a ; ~a\n" f (pr-str-with-quote verbose)       (test-type verbose))
    (format #t "~a #:utility       ~a ; ~a\n" f (pr-str-with-quote utility)       (test-type utility))
    (format #t "~a #:fun           ~a ; ~a\n" f (pr-str-with-quote fun)           (test-type fun))
    (format #t "~a #:exec-fun      ~a ; ~a\n" f (pr-str-with-quote exec-fun)      (test-type exec-fun))
    (format #t "~a #:params        ~a ; ~a\n" f (pr-str-with-quote params)        (test-type params))
    (format #t "~a #:extra-modules ~a ; ~a\n" f (pr-str-with-quote extra-modules) (test-type extra-modules))
    (format #t "~a   args          ~a ; ~a\n" f (pr-str-with-quote args)          (test-type args))
    (format #t "\n"))

  (define common-modules '((srfi srfi-1)
                           (guix monads)
                           (bost utils)
                           (bost tests)
                           (bost settings)
                           (bost buix build cli-common)
                           (bost buix build command-line)))
  (let* [(symb-string scheme-file)
           (symb (or module-name
                     (string->symbol symb-string)))
           (new-args (remove-all-elements
                      args
                      (list
                       #:extra-modules ;; consumed by this procedure
                       )))
           (fixed-new-args (append-map
                            (lambda (k v)
                              (list k (if (symbol? v) `(quote ,v) v)))
                            (plist-keys new-args)
                            (plist-vals new-args)))
           (sexp
            `(begin
               (use-modules (ice-9 getopt-long)
                            (ice-9 regex)
                            ,@common-modules
                            ,@extra-modules)
               (handle-cli
                ,@(if (member? #:trace   new-args) `() `(#:trace   ,trace))
                ,@(if (member? #:verbose new-args) `() `(#:verbose ,verbose))
                ,@fixed-new-args
                (command-line))))]
      (when trace ;; (string=? "rgt" utility)
        (format #t "common-modules : ~a\n" common-modules)
        (format #t "extra-modules  : ~a\n" extra-modules)
        (format #t "sexp :\n~a\n" (pretty-print->string sexp))
        (format #t "\n"))
      (with-imported-modules (append common-modules extra-modules)
        #~#$sexp)))

(def* (service-file-utils
          #:key
          (trace #f) (verbose #t)
          utility fun exec-fun params extra-modules
          #:allow-other-keys #:rest args)
  "Create pairs like
  (\"scm-bin/g\"         \"/gnu/store/...\") ; for emacs CLI utils
  (\"scm-bin/mount-axa\" \"/gnu/store/...\") ; for mount utils

Example:
(service-file-utils #:trace         #t
                    #:fun           'cli-general-command
                    #:exec-fun      'exec-background
                    #:extra-modules '()
                    #:utility       \"techo\"
                    #:params        \"echo \\\"foo\\\"\")

(service-file-utils #:trace         #t
                    #:fun           'cli-general-command
                    #:exec-fun      'exec-foreground
                    #:extra-modules '()
                    #:utility       \"techo\"
                    #:params        \"echo \\\"foo\\\"\")

(service-file-utils #:trace         #t
                    #:fun           'cli-general-command
                    #:exec-fun      'exec-system
                    #:extra-modules '()
                    #:utility       \"techo\"
                    #:params        \"echo \\\"foo\\\"\")

(service-file-utils #:trace         #t
                    #:exec-fun      'exec-foreground
                    #:extra-modules '((bost guix build emacs-common))
                    #:utility       \"r\" #:fun 'create-launcher
                    ;; #:utility       \"er\" #:fun 'set-editable
                    ;; #:utility       \"kr\" #:fun 'pkill-server
                    #:params develop)

TODO The `search-notes' program should read a `search-space-file' containing
a list of files to search through."
  (list
   (str scm-bin-dirname "/" utility)
   (program-file utility (apply service-file-gexp args))))
(testsymb 'service-file-utils)

(define* (emacs-cli-utils-service #:optional (spguix-init-dir ""))
  ((comp
    (partial map (comp
                  (partial apply service-file-utils)
                  (partial append (list
                                   #:exec-fun 'exec-foreground
                                   #:extra-modules '((bost guix build emacs-common)))))))
   (list
    (list #:utility  "d" #:fun 'create-launcher  #:params develop #:init-dir (get-src develop))
    (list #:utility "ed" #:fun 'set-editable     #:params develop)
    (list #:utility "kd" #:fun 'pkill-server     #:params develop #:init-dir (get-src develop))

    (list #:utility  "cy" #:fun 'create-launcher #:params cycle #:init-dir (get-src cycle))
    (list #:utility "ecy" #:fun 'set-editable    #:params cycle)
    (list #:utility "kcy" #:fun 'pkill-server    #:params cycle #:init-dir (get-src cycle))

    (list #:utility  "g" #:fun 'create-launcher  #:params guix #:init-dir (get-src guix))
    (list #:utility "eg" #:fun 'set-editable     #:params guix)
    (list #:utility "kg" #:fun 'pkill-server     #:params guix #:init-dir (get-src guix))

    (list #:utility  "s" #:fun 'create-launcher  #:params spguix #:init-dir spguix-init-dir)
    (list #:utility "es" #:fun 'set-editable     #:params spguix)
    (list #:utility "ks" #:fun 'pkill-server     #:params spguix #:init-dir spguix-init-dir)

    (list #:utility  "r" #:fun 'create-launcher  #:params crafted)
    ;; TODO Move crafted-emacs user config from the project repo to the dotfiles
    ;; (list #:utility "er" #:fun 'set-editable  #:params crafted)
    (list #:utility "kr" #:fun 'pkill-server     #:params crafted)
    )))
(testsymb 'emacs-cli-utils-service)

(module-evaluated)

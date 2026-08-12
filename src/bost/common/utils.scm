;;; This module is required by some of the scm-bin CLI utilities. The output of
;;; the `format' will also appear in the console such a utility is executed.

;; TODO create a package installable by `guix install my=utils`
;; See: jaro the resource opener - an alternative to xdg-open
;; https://github.com/isamert/jaro/blob/master/jaro
;; See `guile-build-system'

;; https://github.com/daviwil/dotfiles/tree/master/.config/guix
;; Also (examples)
;; (use-service-modules nix)
;; (use-service-modules desktop xorg)
;; (use-package-modules certs)
;; (use-package-modules shells)

(define-module (bost common utils)
  #:use-module (bost common srfi-1-smart)
  #:use-module (bost common core)
  #:use-module (bost common boolean)
  #:use-module (bost common list)
  #:use-module (bost common plist)
  #:use-module (bost common string)
  #:use-module (bost common exec)
  #:use-module (bost common fs)
  #:use-module (bost common monad)
  #:use-module (bost common pretty-print)
  #:use-module (bost common guix)
  #:re-export
  (
   ;; (bost common srfi-1-smart)
   smart-first
   smart-last
   smart-second
   smart-third
   smart-fourth
   smart-fifth
   smart-take
   smart-drop

   ;; (bost common core)
   cnt
   partial
   comp
   juxt
   conjoin
   empty?
   boolean
   str
   my=warn
   module-name-for-logging
   true?
   false?
   unspecified-or-empty-or-false?
   dbg
   dbg-exec
   error-command-failed
   syntax->list
   inc
   print-lines
   die
   def
   def-public
   def*
   def*-public
   evaluating-module
   if-let
   if-not
   module-evaluated
   testsymb
   testsymb-trace
   dbgfmt
   and*
   or*

   ;; (bost common boolean)
   boolean=
   boolean<>
   boolean<
   boolean<=
   boolean>
   boolean>=

   ;; (bost common list)
   rflatten
   s+
   s-
   sx
   drop-right
   drop-left
   flatten
   ensure-list
   some
   every?
   not-any?
   not-every?
   some-true?
   every-true?
   interpose
   combine
   interleave
   take-smart
   drop-smart
   take-last
   take-last-smart
   drop-last
   drop-last-smart
   butlast
   butlast-smart
   cartesian
   member?
   map-indexed
   nonempty-dotted-list?
   flat-list-cond
   list=eq?
   list=eqv?
   list=equal?
   find-duplicates
   list-of-lists?

   ;; (bost common plist)
   get-keys
   plist-get
   reorder-plist
   plist-set
   plist-set!
   get-keywords
   plist?
   alist->plist
   plist-keys
   plist-vals
   get-keyworded-vals
   remove-all-elements
   get-non-keyworded-vals
   keyworded-plist?
   sort-by

   ;; (bost common string)
   has-suffix?
   ends-with?
   has-substring?
   split-string
   smart-split-string
   string-split-whitespace
   url?
   string-in?
   keyword->string
   split-on-whitespace
   pr-str
   pr-str-with-quote
   string-qchecksum
   str-join
   padding-string
   scheme-literal

   ;; (bost common exec)
   contains--gx-dry-run?
   exec-or-dry-run
   exec-system*
   exec-or-dry-run-new
   exec-system*-new
   read-all
   read-all-sexprs
   read-all-syntax
   read-all-strings
   cmd->string
   exec-background
   exec-foreground
   exec-system
   exec-with-error-to-string
   exec
   call-with-stderr-to-null
   exec-argv
   run-command
   analyze-pids-flag-variable
   analyze-pids-call/cc
   compute-cmd
   escape-single-quotes

   ;; (bost common fs)
   path
   mktmpfile
   mdelete-file
   mcopy-file
   safe-write-append
   safe-overwrite
   mounted-usb-devices
   get-ethernet-interfaces
   ethernet-cable-plugged?
   mounted-with-option?
   writeable-usb-mounted?
   sha1-string
   timestamp
   sha1-file

   ;; (bost common monad)
   compose-commands-guix-shell
   compose-commands-guix-shell-dry-run
   compose-shell-commands

   ;; (bost common pretty-print)
   pretty-print->string
   pretty-print-with-comments->string
   source->string

   ;; (bost common guix)
   package-output-paths
   ))

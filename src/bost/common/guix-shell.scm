;;; Dependency-light argv-flag builders for `guix shell --container', e.g.:
;;;   (guix-share "/foo")            ;=> "--share=/foo"
;;;   (guix-share-as "/foo" "/bar")  ;=> "--share=/foo=/bar"
;;; These flags are meant to be assembled into an argv list passed to `guix'
;;; via (bost common exec)'s `exec-argv'/`system*', not interpreted by a
;;; shell.
;;;
;;; The `guix-*' prefix avoids collisions when (bost common utils) imports
;;; this module widely.  Home-relative helpers that depend on
;;; dotfiles-specific `user-home' belong in (dotf guix-shell).

(define-module (bost common guix-shell)
  #:use-module (bost common core) ; str
  #:export
  (
   guix-preserve-exact
   guix-share
   guix-share-as
   guix-expose
   guix-expose-as
   guix-expose-if-exists
   ))

(define (guix-preserve-exact name)     (str "--preserve=^" name "$"))
(define (guix-share path)              (str "--share=" path))
(define (guix-share-as source target)  (str "--share=" source "=" target))
(define (guix-expose path)             (str "--expose=" path))
(define (guix-expose-as source target) (str "--expose=" source "=" target))

(define (guix-expose-if-exists path)
  "Like `guix-expose', but returns an empty list instead of a flag when PATH
doesn't exist - handy when constructing an argv list with `append-map'."
  (if (file-exists? path)
      (list (guix-expose path))
      '()))

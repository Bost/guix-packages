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
  #:use-module (bost common fs)   ; path predicates
  #:use-module (bost common string) ; non-empty-string?
  #:export
  (
   guix-preserve-exact
   guix-share
   guix-share-as
   guix-expose
   guix-expose-as
   guix-expose-if-exists

   guix-share-if-exists
   guix-share-as-if-exists

   guix-share-existing-directory
   guix-share-existing-directory-as
   guix-expose-readable-file
   guix-expose-existing-directory
   guix-expose-existing-path
   ))

(define (guix-preserve-exact name)     (str "--preserve=^" name "$"))
(define (guix-share fs-path)           (str "--share=" fs-path))
(define (guix-share-as source target)  (str "--share=" source "=" target))
(define (guix-expose fs-path)          (str "--expose=" fs-path))
(define (guix-expose-as source target) (str "--expose=" source "=" target))

(define (guix-expose-if-exists fs-path)
  "Like `guix-expose', but return an empty list instead of a flag when FS-PATH
doesn't exist or is unset/empty - handy when constructing an argv list with
`append-map', including from a possibly unset environment variable."
  (if (path-exists? fs-path)
      (list (guix-expose fs-path))
      '()))

(define (guix-share-if-exists fs-path)
  "Like `guix-expose-if-exists', but for `guix-share'."
  (if (path-exists? fs-path)
      (list (guix-share fs-path))
      '()))

(define (guix-share-as-if-exists source target)
  "Like `guix-expose-if-exists', but for `guix-share-as': returns an empty
list instead of a flag when SOURCE doesn't exist (or is #f/blank)."
  (if (path-exists? source)
      (list (guix-share-as source target))
      '()))

(define (optional-guix-flag predicate constructor fs-path)
  (if (predicate fs-path) (list (constructor fs-path)) '()))

(define (guix-share-existing-directory fs-path)
  (optional-guix-flag directory? guix-share fs-path))

(define (guix-share-existing-directory-as source target)
  (if (directory? source) (list (guix-share-as source target)) '()))

(define (guix-expose-readable-file fs-path)
  (optional-guix-flag readable-file? guix-expose fs-path))

(define (guix-expose-existing-directory fs-path)
  (optional-guix-flag directory? guix-expose fs-path))

(define (guix-expose-existing-path fs-path)
  (if (or (readable-file? fs-path) (directory? fs-path))
      (list (guix-expose fs-path))
      '()))

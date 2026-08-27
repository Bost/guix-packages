;;; Process-environment helpers: reading required/optional environment
;;; variables and splitting $PATH-style separated lists. Split out of
;;; (bost common fs)/(bost common string) so this concern remains small
;;; and dependency-light.

(define-module (bost common environment)
  #:use-module (bost common string) ; non-empty-string?
  #:use-module (ice-9 optargs)      ; define*-public
  #:use-module (srfi srfi-1))       ; filter

(define-public (required-getenv name)
  "Return the value of environment variable NAME, or error out if it is unset
(equivalent to bash: `${NAME:?}`)."
  (or (getenv name)
      (error (string-append "$" name " is not set"))))

(define-public (env-or-default name default)
  "Return the value of environment variable NAME if set and non-empty, otherwise
DEFAULT (equivalent to bash: `${NAME:-default}`)."
  (let ((value (getenv name)))
    (if (non-empty-string? value) value default)))

(define*-public (split-environment-list value #:optional (separator #\:))
  "Split VALUE on SEPARATOR (colon by default), omitting empty elements.
Return the empty list when VALUE is #f (ie. unset) or empty string.

Eg. VALUE is a $PATH-style, colon-delimited string.

(split-environment-list \"/a:/b\")      ;=> (\"/a\" \"/b\")
(split-environment-list \"/a;/b\" #\\;) ;=> (\"/a\" \"/b\")
(split-environment-list #f)            ;=> ()
(split-environment-list \"\")           ;=> ()"
  (if (non-empty-string? value)
      (filter non-empty-string? (string-split value separator))
      '()))

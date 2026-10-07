;;; Building blocks for scripts launching `guix shell --container':
;;;
;;; - Argv-flag builders, e.g.:
;;;     (guix-share "/foo")            ;=> "--share=/foo"
;;;     (guix-share-as "/foo" "/bar")  ;=> "--share=/foo=/bar"
;;;   These flags are meant to be assembled into an argv list passed to `guix'
;;;   via (bost common exec)'s `exec-argv'/`system*', not interpreted by a
;;;   shell.
;;;
;;; - A public-key-only GnuPG home for the container, signing via the host's
;;;   gpg-agent (see (bost common gpg)): `call-with-guix-gpg-home',
;;;   `guix-gpg-flags', `guix-gpg-environment'.
;;;
;;; - Launching: `guix-with-hostname', `guix-shell-run'.
;;;
;;; The `guix-*' prefix avoids collisions when (bost common utils) imports
;;; this module widely.  Home-relative helpers that depend on
;;; dotfiles-specific `user-home' belong in (dotf guix-shell).

(define-module (bost common guix-shell)
  #:use-module (bost common core) ; str
  #:use-module (bost common environment) ; required-non-empty-getenv
  #:use-module (bost common exec) ; wait-status->exit-code
  #:use-module (bost common fs)   ; path predicates
  #:use-module (bost common gpg)  ; prepare-public-gpg-home!, host-gpg-agent-socket
  #:use-module (bost common string) ; non-empty-string?
  #:use-module (ice-9 format)
  #:use-module (ice-9 optargs)    ; define*
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

   guix-gpg-home-strategy
   call-with-guix-gpg-home
   guix-gpg-flags
   guix-gpg-environment

   guix-with-hostname
   guix-shell-run
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

;;; Public-key-only GnuPG home for the container

(define (guix-gpg-home-strategy)
  "Which strategy to use for the container's public-key-only GNUPGHOME:

  'persistent - reuse the directory given to `call-with-guix-gpg-home' across
                runs. Faster startup (no re-import on every launch), but the
                directory and its imported public key persist on disk between
                runs.

  'ephemeral  - a fresh directory under /tmp per run, deleted again once the
                container exits. Nothing GPG-related persists on disk
                between runs, at the cost of re-creating the directory and
                re-importing the public key every time.

Defaults to 'persistent; override with GUIX_GPG_HOME_STRATEGY=ephemeral (or
=persistent) without editing any script - handy for comparing the two side by
side."
  (if (equal? (getenv "GUIX_GPG_HOME_STRATEGY") "ephemeral")
      'ephemeral
      'persistent))

(define (call-with-guix-gpg-home persistent-gpg-home proc)
  "Prepare a public-key-only GnuPG home on the host, call PROC with its path
and return PROC's value. The home is PERSISTENT-GPG-HOME, or under the
'ephemeral `guix-gpg-home-strategy' a fresh temporary directory, deleted
again when PROC returns or exits non-locally.

Also sets $GPG_TTY, so that terminal pinentry works when git invokes gpg
inside the container. Pass the home to `guix-gpg-flags'."
  (let* ((ephemeral? (eq? (guix-gpg-home-strategy) 'ephemeral))
         (gpg-home (if ephemeral?
                       (make-private-temporary-directory
                        "/tmp/guix-shell-gpg.XXXXXX")
                       persistent-gpg-home)))
    (dynamic-wind
      (lambda () #t)
      (lambda ()
        (set-gpg-tty-from-current-terminal!)
        (prepare-public-gpg-home! gpg-home)
        (proc gpg-home))
      (lambda ()
        (when ephemeral?
          (cleanup-temporary-directory! gpg-home))))))

(define (guix-container-gnupghome)
  (path-join (required-non-empty-getenv "HOME") ".gnupg"))

(define (guix-gpg-flags gpg-home)
  "Flags mounting the host-side GPG-HOME over the container's ~/.gnupg, so GPG
never falls back to the real host ~/.gnupg, and exposing the host's gpg-agent
socket there, so signing is delegated to it."
  (let ((agent-socket (or (host-gpg-agent-socket)
                          (error "No host gpg-agent socket found")))
        (container-gnupghome (guix-container-gnupghome)))
    (list (guix-share-as gpg-home container-gnupghome)
          (guix-expose-as agent-socket
                          (path-join container-gnupghome "S.gpg-agent")))))

(define (guix-gpg-environment)
  "Environment assignments, e.g. for `env', matching `guix-gpg-flags':
GNUPGHOME and, when set, GPG_TTY."
  (let ((gpg-tty (getenv "GPG_TTY")))
    (cons (str "GNUPGHOME=" (guix-container-gnupghome))
          (if gpg-tty (list (str "GPG_TTY=" gpg-tty)) '()))))

;;; Launching

(define (guix-with-hostname hostname command)
  "Return COMMAND (an argv list) wrapped so that it runs with HOSTNAME.

Guix containers inherit the host's hostname and offer no option to change it.
Setting it needs CAP_SYS_ADMIN in a new UTS namespace, so the outer `unshare'
maps the current user to root in a new user namespace, sets HOSTNAME there and
the inner `unshare' maps root back to the current user and group, so COMMAND
and the files it creates keep their usual ownership."
  (append
   (list "unshare" "--user" "--map-root-user" "--uts" "--"
         "sh" "-c"
         (str "hostname " hostname
              " && exec unshare --user"
              " --map-user=" (number->string (getuid))
              " --map-group=" (number->string (getgid))
              " -- \"$@\"")
         "sh")
   command))

(define* (guix-shell-run args #:key hostname)
  "Run `guix ARGS' (an argv list, e.g. starting with \"shell\") with HOSTNAME,
if given (see `guix-with-hostname'), and return its shell-style exit code.

Unlike `exec-argv', the command inherits stdin/stdout/stderr from the terminal
(colors, line editing, job control), as needed by an interactive container
shell. The command is traced to stderr, mimicking `set -o xtrace'."
  (let* ((guix-command (cons "guix" args))
         (command (if hostname
                      (guix-with-hostname hostname guix-command)
                      guix-command)))
    (format (current-error-port) "+~{ ~a~}~%" command)
    (wait-status->exit-code (apply system* command))))

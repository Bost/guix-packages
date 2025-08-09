(define-module (bost manifest-set-operations)
  #:use-module (srfi srfi-1)         ; list-processing procedures
  #:use-module (guix profiles)
  )

(define (entry-key e)
  (list (manifest-entry-name e)
        (manifest-entry-output e)
        (manifest-entry-version e)))

(define (entries->keymap entries)
  (fold (lambda (e acc)
          (let ((k (entry-key e)))
            (if (assoc k acc) acc (acons k e acc))))
        '()
        entries))

(define (keymap->manifest km)
  (manifest (map cdr (reverse km))))

(define-public (manifest-union . ms)
  "Left-biased union: earlier manifests take precedence on conflicts."
  (keymap->manifest
   (fold (lambda (m acc)
           (append acc (entries->keymap (manifest-entries m))))
         '()
         ms)))

(define-public (manifest-intersection . ms)
  (let* ((keysets (map (lambda (m) (map entry-key (manifest-entries m))) ms))
         (common  (apply lset-intersection equal? keysets)))
    (manifest
     (filter (lambda (e) (member (entry-key e) common))
             (apply append (map manifest-entries ms))))))

(define-public (manifest-difference m . ms)
  (let* ((rm-keys (apply append
                         (map (lambda (x)
                                (map entry-key (manifest-entries x))) ms)))
         (rm?     (lambda (e) (member (entry-key e) rm-keys))))
    (manifest (remove rm? (manifest-entries m)))))

#|
;; Example usage:

;; profile-ops.scm
(load (string-append (getenv "dgxp") "/src/bost/manifest-ops.scm"))
(define base (load "base.scm"))
(define old  (load "old.scm"))
(define extras (specifications->manifest '("ripgrep" "jq")))
;; Choose one:
(manifest-union extras base old)
;; (manifest-intersection base old)
;; (manifest-difference base old)

|#

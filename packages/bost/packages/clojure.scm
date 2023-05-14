(define-module (bost packages clojure)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages node)
  #:use-module (gnu packages java)
  #:use-module (gnu packages clojure)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages compression)
  )

(define clojure-lsp
  (package
    (name "clojure-lsp")
    (version "2023.05.04-19.38.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/clojure-lsp/clojure-lsp/releases/download/"
             version
             "/clojure-lsp-native-static-linux-amd64.zip"))
       (sha256
        (base32 "1zycljfrxaxicbjbpqjqrxdrzp2m6cn3my5p280fb3j5ynmjs54v"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     `(#:install-plan
       '(("clojure-lsp" "bin/"))))
    (home-page "https://clojure.org/releases/tools")
    (synopsis "CLI tools for the Clojure programming language")
    (description "The Clojure command line tools can be used to start a
Clojure repl, use Clojure and Java libraries, and start Clojure programs.")
    (license license:epl1.0)))

#|
(define (build pkg-or-pkgs)
  "Usage
(build emacs-treemacs)"
  (let [(daemon ((@ (guix store) open-connection)))]
    (define (partial fun . args) (lambda x (apply fun (append args x))))
    (format #t "(defined? 'partial): ~a\n" (defined? 'partial))
    (map (compose
          (partial (@ (guix derivations) build-derivations) daemon)
          list
          (partial (@ (guix packages) package-derivation) daemon))
         (if (list? pkg-or-pkgs) pkg-or-pkgs
             (list pkg-or-pkgs)))))
|#

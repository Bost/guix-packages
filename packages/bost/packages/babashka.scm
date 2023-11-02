(define-module (bost packages babashka)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages compression)
  #:use-module (nonguix build-system binary))

(define-public babashka
  (package
   (name "babashka")
   (version "0.9.162")
   (source (origin
            (method url-fetch)
            (uri
             (string-append
              "https://github.com/babashka/babashka/releases/download/v"
              version "/babashka-" version "-linux-amd64.tar.gz"))
            (sha256
             (base32
              "12zsjl0ix0dymvqfvf49md85z93g3p67px3bajl1mipcv5fg7mwx"))))
   (build-system binary-build-system)
   (supported-systems '("x86_64-linux" "i686-linux"))
   (arguments
    `(#:patchelf-plan
      `(("bb"
         ("libc" "zlib" "libstdc++")))
      #:install-plan
      `(("." ("bb") "bin/"))
      #:phases
      (modify-phases
       %standard-phases
       ;; this is required because standard unpack expects the archive to
       ;; contain a directory with everything inside it, while babashka's
       ;; release file only contains the `bb` binary.
       (replace 'unpack
                (lambda* (#:key inputs outputs source #:allow-other-keys)
                         (invoke "tar" "xf" source)
                         #t)))))
   (inputs
    `(("libstdc++" ,(make-libstdc++ gcc))
      ("zlib" ,zlib)))
   (synopsis
    "Fast native Clojure scripting runtime")
   (description
    "Babashka is a native Clojure interpreter for scripting with fast startup.
Its main goal is to leverage Clojure in places where you would be using bash otherwise.")
   (home-page "https://babashka.org/")
   (license license:epl1.0)))

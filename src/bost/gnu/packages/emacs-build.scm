(define-module (bost gnu packages emacs-build)
  #:use-module (gnu packages emacs-build)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages version-control))

(define-public modules-without-emacs-build-system
  '((guix build utils)
    (guix build emacs-utils)
    ((bost guix build emacs-utils) #:prefix bst:)))

(define-public modules
  (append
   modules-without-emacs-build-system
   '((guix build emacs-build-system))))

(define-public imported-modules
  `(,@%default-gnu-imported-modules
    (guix build emacs-build-system)
    (guix build emacs-utils)
    (bost guix build emacs-utils)
    (bost utils)
    (bost srfi-1-smart)
    ))

(define-public emacs-dash
  (let ((commit "fcb5d831fc08a43f984242c7509870f30983c27c")
        (revision "0"))
    (package
      (name "emacs-dash")
      (version (git-version "2.20.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/magnars/dash.el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "092kf61bi6dwl42yng69g3y55ni8afycqbpaqx9wzf8frx9myg6m"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules modules
        #:imported-modules imported-modules
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'disable-byte-compile-error-on-warn
              (lambda _
                (substitute* "Makefile"
                  (("\\(setq byte-compile-error-on-warn t\\)")
                   "(setq byte-compile-error-on-warn nil)"))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "dash")
                (bst:write-pkg-file "dash-functional")
                )))))
      (home-page "https://github.com/magnars/dash.el")
      (synopsis "Modern list library for Emacs")
      (description "This package provides a modern list API library for Emacs.")
      (license license:gpl3+))))

(define-public emacs-el-mock
  (let ((commit "6cfbc9de8f1927295dca6864907fe4156bd71910")
        (revision "1"))
    (package
      (name "emacs-el-mock")
      (version (git-version "1.25.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rejeep/el-mock.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "09c3a1771v6kliwj0bn953pxxyjlk6q9kp31cxcr0nraik7d0mhk"))))
      (build-system emacs-build-system)
      (native-inputs
       (list
        emacs-ert-runner
        emacs-ert-expectations
        emacs-undercover
        ))
      (home-page "https://github.com/rejeep/el-mock.el")
      (synopsis "Tiny mock and stub framework in Emacs Lisp")
      (description
       "Emacs Lisp Mock is a library for mocking and stubbing using readable
syntax.  Most commonly Emacs Lisp Mock is used in conjunction with Emacs Lisp
Expectations, but it can be used in other contexts.")
      (license license:gpl3+))))

(define-public emacs-f
  (let ((commit "931b6d0667fe03e7bf1c6c282d6d8d7006143c52")
        (revision "0"))
    (package
      (name "emacs-f")
      (version (git-version "0.21.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/rejeep/f.el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ccrcfhqfbv9qff38sfym69mai7k7z89yndi6nip8wi5hpd2addc"))))
      (build-system emacs-build-system)
      ;; circular dependency on ert-runner
      (arguments
       (list
        #:tests? #f
        #:modules modules
        #:imported-modules imported-modules
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "f")
                (bst:write-pkg-file "f-shortdoc")
                )))))
      (propagated-inputs
       (list
        emacs-s
        emacs-dash
        ))
      (home-page "https://github.com/rejeep/f.el")
      (synopsis "Emacs API for working with files and directories")
      (description "This package provides an Emacs library for working with
files and directories.")
      (license license:gpl3+))))

(define-public emacs-undercover
  (package
    (name "emacs-undercover")
    (version "0.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/sviridov/undercover.el")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qmvyy3xg5qi7ws8zcs934d6afsappr1a6pgfp796xpa9vdr4y6j"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-dash
      emacs-shut-up
      ))
    (home-page "https://github.com/sviridov/undercover.el")
    (synopsis "Test coverage library for Emacs Lisp")
    (description
     "Undercover is a test coverage library for software written in Emacs
Lisp.")
    (license license:expat)))

(define-public emacs-ert-runner
  (package
    (name "emacs-ert-runner")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rejeep/ert-runner.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "08gygn9fjank5gpi4v6ynrkn0jbknxbwsn7md4p9ndygdbmnkf98"))))
    (build-system emacs-build-system)
    (inputs
     (list
      bash-minimal
      emacs-ansi
      emacs-commander
      emacs-dash
      emacs-f
      emacs-s
      emacs-shut-up
      ))
    ;; Tests for ert-runner have a circular dependency with ecukes, and therefore
    ;; cannot be run
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'install-executable
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (source-directory (string-append
                                      (getenv "TMPDIR") "/source")))
               (substitute* "bin/ert-runner"
                 (("ERT_RUNNER=\"\\$\\(dirname \\$\\(dirname \\$0\\)\\)")
                  (string-append "ERT_RUNNER=\"" (elpa-directory out))))
               (install-file "bin/ert-runner" (string-append out "/bin"))
               (wrap-program (string-append out "/bin/ert-runner")
                 (list "EMACSLOADPATH" ":" 'prefix
                       ;; Do not capture the transient source directory in
                       ;; the wrapper.
                       (delete source-directory
                               (string-split (getenv "EMACSLOADPATH")
                                             #\:))))))))
       #:include (cons* "^reporters/.*\\.el$" %default-include)))
    (home-page "https://github.com/rejeep/ert-runner.el")
    (synopsis "Opinionated Ert testing workflow")
    (description "@code{ert-runner} is a tool for Emacs projects tested
using ERT.  It assumes a certain test structure setup and can therefore make
running tests easier.")
    (license license:gpl3+)))

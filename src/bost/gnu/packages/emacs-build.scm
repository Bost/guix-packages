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
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
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
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "f")
                (bst:write-pkg-file "f-shortdoc")
                )))))
      (propagated-inputs
       (list emacs-s emacs-dash))
      (home-page "https://github.com/rejeep/f.el")
      (synopsis "Emacs API for working with files and directories")
      (description "This package provides an Emacs library for working with
files and directories.")
      (license license:gpl3+))))


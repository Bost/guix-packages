(define-module (bost gnu packages emacs-xyz-magit)
  #:use-module (bost gnu packages emacs-xyz-done)
  #:use-module (bost gnu packages emacs-xyz-lsp)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix deprecation)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages chez)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages java)
  #:use-module (gnu packages julia-xyz)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages music)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages racket)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages scheme)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages animation)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages screen)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages tor)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wget)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)

  #:use-module (bost guix build emacs-utils)
  )

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
      (arguments (list #:tests? #f))
      (native-inputs (list emacs-ert-runner
                           emacs-ert-expectations
                           emacs-undercover))
      (home-page "https://github.com/rejeep/el-mock.el")
      (synopsis "Tiny mock and stub framework in Emacs Lisp")
      (description
       "Emacs Lisp Mock is a library for mocking and stubbing using readable
syntax.  Most commonly Emacs Lisp Mock is used in conjunction with Emacs Lisp
Expectations, but it can be used in other contexts.")
      (license license:gpl3+))))

(define-public emacs-google-translate
  (package
    (name "emacs-google-translate")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atykhonov/google-translate/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0rwpij2bm8d4jq2w5snkp88mfryplw8166dsrjm407n2p6xr48zx"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-bump-version
            (lambda* (#:key inputs #:allow-other-keys)
              ;; Needed for `guix build --with-input=emacs-minimal=emacs emacs-google-translate`
              (substitute* ".bump-version.el"
                (("^") ";; -*- no-byte-compile: t -*-\n"))))
          (add-before 'check 'disable-failing-tests
            (lambda _
              (let-syntax
                  ((disable-tests
                    (syntax-rules ()
                      ((_ file ())
                       (syntax-error "test names list must not be empty"))
                      ((_ file (test-name ...))
                       (substitute* file
                         (((string-append "^\\(ert-deftest " test-name ".*") all)
                          (string-append all "(skip-unless nil)\n")) ...)))))
                ;; These tests fail due to a missing requirement:
                ;;   (void-function facemenu-set-face)
                (disable-tests
                 "test/google-translate-core-ui-test.el"
                 ("test-google-translate--suggestion"
                  "test-google-translate--text-phonetic/show-phonetic"
                  "test-google-translate--translation-phonetic/show-phonetic"
                  "test-google-translate--translated-text"))))))))
    (native-inputs
     (list
      emacs-el-mock
      emacs-ert-runner
      ))
    (home-page "https://github.com/atykhonov/google-translate")
    (synopsis "Emacs interface to Google Translate")
    (description
     "This package provides an Emacs interface to the Google Translate
on-line service.")
    (license license:gpl3+)))

(define-public emacs-with-editor
  (let ((commit "ca902ae02972bdd6919a902be2593d8cb6bd991b")
        (revision "0"))
    (package
      (name "emacs-with-editor")
      (version (git-version "3.4.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/with-editor.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0h21qs60qihv4p72x5wbmc0xly4g74wc25qj8m9slfbc4am9mwys"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f                       ; no test suite
        #:lisp-directory "lisp"
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
            (add-before 'install 'make-info
              (lambda _
                (with-directory-excursion "../docs"
                  (invoke "makeinfo" "--no-split"
                          "-o" "with-editor.info" "with-editor.texi")
                  (install-file "with-editor.info" "../lisp"))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "with-editor")))
            )))
      (native-inputs (list texinfo))
      (propagated-inputs
       (list
        emacs-async
        emacs-compat))
      (home-page "https://github.com/magit/with-editor")
      (synopsis "Emacs library for using Emacsclient as EDITOR")
      (description
       "This package provides an Emacs library to use the Emacsclient as
@code{$EDITOR} of child processes, making sure they know how to call home.
For remote processes a substitute is provided, which communicates with Emacs
on stdout instead of using a socket as the Emacsclient does.")
      (license license:gpl3+))))

(define-public emacs-magit
  (let ((commit "04ee83d93fabbfbe202e9e7dc781b0dcd4d5b502")
        (revision "0"))
    (package
      (name "emacs-magit")
      (version (git-version "4.3.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0g0ji4m39z8mcq1krj8v3kdhb2a8v2w0m00dqq3z925ibq0lv01r"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #t
        #:test-command #~(list "make" "-C" ".." "test")
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
            (add-after 'unpack 'build-info-manual
              (lambda _
                (invoke "make" "info")
                ;; Copy info files to the lisp directory, which acts as
                ;; the root of the project for the emacs-build-system.
                (rename-file "docs/magit.info" "lisp/magit.info")))
            (add-after 'build-info-manual 'chdir-lisp
              (lambda _
                (chdir "lisp")))
            (add-after 'chdir-lisp 'patch-version-executables
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "magit.el"
                  ("magit-version" #$version))
                (emacs-substitute-variables "magit-git.el"
                  ("magit-git-executable"
                   (search-input-file inputs "/bin/git")))
                (emacs-substitute-variables "magit-sequence.el"
                  ("magit-perl-executable"
                   (search-input-file inputs "/bin/perl")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "git-commit")
                ;; `guix build ... emacs-magit-section` doesn't automatically
                ;; create the magit-section-pkg.el
                (bst:write-pkg-file "magit-section")
                )))))
      (native-inputs
       (list
        texinfo
        pkg-config))
      (inputs
       (list
        git
        perl))
      (propagated-inputs
       ;; Note: the 'git-commit' and 'magit-section' dependencies are part of
       ;; magit itself.
       (list
        emacs-compat
        emacs-transient
        emacs-with-editor
        emacs-llama))
      (home-page "https://magit.vc/")
      (synopsis "Emacs interface for the Git version control system")
      (description
       "With Magit, you can inspect and modify your Git repositories
with Emacs.  You can review and commit the changes you have made to
the tracked files, for example, and you can browse the history of past
changes.  There is support for cherry picking, reverting, merging,
rebasing, and other common Git operations.")
      (license license:gpl3+))))

;; Required by <path/to/spacemacs>/layers/+source-control/git/packages.el
(define-public emacs-magit-section
  (package
    (inherit emacs-magit)
    (name "emacs-magit-section")))

(define-public emacs-taxy
  (package
    (name "emacs-taxy")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://elpa.gnu.org/packages/taxy-" version ".tar"))
       (sha256
        (base32
         "1nmlx2rvlgzvmz1h3s5yn3qnad12pn2a83gjzxf3ln79p8rv1mj6"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-magit))
    (home-page "https://github.com/alphapapa/taxy.el")
    (synopsis "Programmable taxonomical grouping for arbitrary objects")
    (description
     "Taxy provides a programmable way to classify arbitrary objects into
a hierarchical taxonomy.  Allows you to automatically put things in nested
groups.")
    (license license:gpl3+)))

(define-public emacs-taxy-magit-section
  (package
    (name "emacs-taxy-magit-section")
    (version "0.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://elpa.gnu.org/packages/taxy-magit-section-" version
                    ".tar"))
              (sha256
               (base32
                "16j1a2vx9awr5vk1x3i1m526ym6836zxlypx1f50fcwjy0w8q8a3"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-magit emacs-taxy))
    (home-page "https://github.com/alphapapa/taxy.el")
    (synopsis "View Taxy structs in a Magit Section buffer")
    (description
     "This library provides a way to view @code{taxy} structs in a column-based,
@code{magit-section} buffer.  Columns are defined using simple top-level
forms, and new columns may be easily defined by users in their
configurations.")
    (license license:gpl3+)))

(define-public emacs-tweaks
  (let ((commit "bb89febabc2c6530200d17b6bce1907ff441c3fc")
        (revision "0"))
    (package
      (name "emacs-tweaks")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/tweaks.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "12qhvilffiilas8l8p088c7n4b8bl0avnbxg0s7ryxrbw2cafgsp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-copy-sexp
        emacs-drag-stuff
        emacs-evil
        emacs-evil-iedit-state
        emacs-jump-last
        emacs-kill-buffers
        emacs-magit
        emacs-yasnippet
        emacs-zoom-frm
        ))
      (home-page "https://github.com/Bost/tweaks")
      (synopsis "Various tweaks")
      (description "Various tweaks")
      (license license:gpl3+))))

(define-public emacs-forge
  (package
    (name "emacs-forge")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magit/forge")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02ks8zc3nqqqqfq2picf0pxsw7wygb5hv9abnva1cv44x091w6zw"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f                     ;no tests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'build-info-manual
           (lambda _
             (invoke "make" "info")
             ;; Move the info file to lisp so that it gets installed by the
             ;; emacs-build-system.
             (rename-file "docs/forge.info" "lisp/forge.info")))
         (add-after 'build-info-manual 'chdir-lisp
           (lambda _
             (chdir "lisp"))))))
    (native-inputs (list texinfo))
    (propagated-inputs
     (list
      emacs-closql
      emacs-emacsql
      emacs-ghub
      emacs-llama
      emacs-let-alist
      emacs-magit
      emacs-markdown-mode
      emacs-yaml))
    (home-page "https://github.com/magit/forge/")
    (synopsis "Access Git forges from Magit")
    (description "Work with Git forges, such as Github and Gitlab, from the
comfort of Magit and the rest of Emacs.")
    (license license:gpl3+)))

(define-public emacs-uuidgen
  (let ((commit "cebbe09d27c63abe61fe8c2e2248587d90265b59")
        (revision "0"))
    (package
     (name "emacs-uuidgen")
     (version (git-version "1.3" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kanru/uuidgen-el.git")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ih6kj3inwdxypbqj2n5vnfxmc6rfrx114w8bdy60yd8klx7273d"))))
     (build-system emacs-build-system)
     (home-page "https://github.com/kanru/uuidgen-el")
     (synopsis "UUID generation library for Emacs")
     (description
      "This package provides functions to generate Universally Unique
Identifiers (UUIDs) within Emacs.  It supports the creation of UUIDs
conforming to RFC 4122, including versions 1, 3, 4, and 5.  The
library allows for time-based, name-based (using MD5 or SHA-1
hashing), and random UUID generation, facilitating the creation of
unique identifiers directly in Emacs.")
     (license license:gpl3+))))

(define-public emacs-code-review
  (let ((commit "fba8fe3343665cb8000781590b2f20dc0351acb9")
        (revision "0"))
    (package
      (name "emacs-code-review")
      (version (git-version "0.0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/doomelpa/code-review.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0fgsbdydhsv15c0i9bajkshgf6cyijky5pdziq03jx7h3ph9y5fs"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-uuidgen
        emacs-deferred
        emacs-emojify
        emacs-forge
        emacs-closql
        emacs-magit
        emacs-a
        emacs-ghub
        emacs-transient
        emacs-markdown-mode
        ))
      (home-page "https://github.com/doomelpa/code-review")
      (synopsis "Perform code reviews from Emacs for GitHub, GitLab, and Bitbucket")
      (description
       "Emacs interface for conducting code reviews directly within the editor.  It
supports reviewing pull requests from GitHub,GitLab, and Bitbucket, offering
features such as reading and replying to comments, adding suggestions,
approving or requesting changes, and editing pull request metadata.  The
interface leverages `magit-section` and `transient` for a modern user
experience, enabling developers to manage code reviews without leaving Emacs.")
      (license license:gpl3+))))

(define-public emacs-magit-annex
  (let ((commit "83f438af33442c0ebc92922a562dad66208a45ff")
        (revision "0"))
    (package
      (name "emacs-magit-annex")
      (version (git-version "1.9.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit-annex.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "143y8kwbfgwq5zjg6v2gxxdrwwgllf4qarp60av2w186jr1j9zyw"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-magit))
      (home-page "https://github.com/magit/magit-annex/")
      (synopsis "Git-annex support for Magit")
      (description
       "Magit-annex adds a few git-annex operations to the Magit interface.")
      (license license:gpl3+))))

(define-public emacs-magit-tbdiff
  (let ((commit "1cb315269df2df2382edc3db21ed52418f13a0d6")
        (revision "0"))
      (package
        (name "emacs-magit-tbdiff")
        (version (git-version "1.2.0" revision commit))
        (source
         (origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/magit/magit-tbdiff.git")
                 (commit commit)))
           (file-name (git-file-name name version))
           (sha256
            (base32 "10qgl5mg8dj7g1yg0qc1aqraj96pywkj142i8xgnrdp6yngv8g56"))))
        (build-system emacs-build-system)
        (arguments (list #:tests? #f))
        (propagated-inputs (list emacs-magit))
        (home-page "https://github.com/magit/magit-tbdiff")
        (synopsis "Magit extension for range diffs")
        (description
         "Magit-tbdiff provides a Magit interface to @code{git-range-diff} (and its
third-party predecessor @code{git-tbdiff}), a Git subcommand for comparing two
versions of a topic branch.")
        (license license:gpl3+))))

(define-public emacs-magit-gerrit
  (let ((commit "07307dbdff9ec8042457dbeed21281c336fba104")
        (revision "1"))
    (package
      (name "emacs-magit-gerrit")
      (version (git-version "0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/magit-gerrit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "175vw3khs3bcm4ry98bcpd8dw7n1y8al01z4p5xcrlrzfp21cn0y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-magit))
      (home-page "https://github.com/emacsorphanage/magit-gerrit")
      (synopsis "Magit extension for Gerrit")
      (description "This Magit extension provides integration with Gerrit,
which makes it possible to conduct Gerrit code reviews directly from within
Emacs.")
      (license license:gpl3+))))

(define-public emacs-magit-stgit
  (let ((commit "b19d96f8f62bd4def83eb1c09e9cd2582856351e")
        (revision "0"))
    (package
      (name "emacs-magit-stgit")
      (version (git-version "3.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/stacked-git/magit-stgit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "10ql7gi586w65vds6wsh8bw5nr444xqhgh87khzcpfaglnw2lyaf"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f)) ;no tests
      (propagated-inputs (list emacs-magit emacs-transient emacs-llama))
      (home-page "https://github.com/stacked-git/magit-stgit")
      (synopsis "StGit extension for Magit")
      (description
       "This package provides basic support for @code{stgit} in
@code{emacs-magit}.  When @code{magit-stgit-mode} is turned on, the
current patch series is displayed in the status buffer.  While point is on a
patch the changes it introduces can be shown using @code{RET}, it can be selected
as the current patch using @code{a}, and it can be discarded using @code{k}.  Other
@code{StGit} commands are available from the @code{StGit} transient on @code{/}.")
      (license license:gpl3+))))

(define-public emacs-magit-svn
  (let ((commit "ca637c648835eddbeb277cc8089d3ffd6f75ae13")
        (revision "0"))
    (package
      (name "emacs-magit-svn")
      (version (git-version "2.2.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit-svn.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x419qz80ir9ni94j3n08a5ygfq1265fpr13dsnxjjnlwjbq7sx7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-dash
        emacs-with-editor
        emacs-magit))
      (home-page "https://github.com/magit/magit-svn")
      (synopsis "Git-SVN extension to Magit")
      (description
       "This package is an extension to Magit, the Git Emacs mode, providing
support for Git-SVN.")
      (license license:gpl3+))))

(define-public emacs-lean4-mode
  (let ((commit "76895d8939111654a472cfc617cfd43fbf5f1eb6")
        (revision "0"))
    (package
      (name "emacs-lean4-mode")
      (version (git-version "1.1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/leanprover-community/lean4-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1i4l614n0hs02y0a4xfnzc4xkilkp6bzx28pys4jkp96vp2ivf0c"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      ;; TODO: Just emacs-magit-section instead of emacs-magit would be enough.
      (propagated-inputs
       (list
        emacs-compat
        (@ (bost gnu packages emacs-xyz-lsp) emacs-lsp-mode)
        emacs-dash
        emacs-magit
        ))
      (synopsis "Lean 4 major mode for Emacs")
      (description "This package provides a major mode for the Lean theorem
prover, version 4.")
      (home-page "https://lean-lang.org/")
      (license license:asl2.0))))

(define-public emacs-evil-collection
  (let ((commit "fca81ddb2ca1ac3838aa7e8969b2313712807a45")
        (revision "0"))
    (package
      (name "emacs-evil-collection")
      (version (git-version "0.0.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-evil/evil-collection.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0grp87nb9pxx47rzclhngqn9gvgbn39yfk0szz6a4xh0pf56f100"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons* "^modes\\/" %default-include)
        #:tests? #true
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-L" "."
                               "-L" "./test"
                               "-l" "evil-collection-test.el"
                               "-l" "evil-collection-magit-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (native-inputs (list emacs-magit))
      (propagated-inputs (list emacs-annalist emacs-evil))
      (home-page "https://github.com/emacs-evil/evil-collection")
      (synopsis "Collection of Evil bindings for many major and minor modes")
      (description "This is a collection of Evil bindings for the parts of
Emacs that Evil does not cover properly by default, such as @code{help-mode},
@code{M-x calendar}, Eshell and more.")
      (license license:gpl3+))))

(define-public emacs-magit-org-todos-el
  (let ((commit "9ffa3efb098434d837cab4bacd1601fdfc6fe999")
        (revision "0"))
    (package
      (name "emacs-magit-org-todos-el")
      (version (git-version "0.1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/danielma/magit-org-todos.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0kxz5q8q5np4zm1ls4hx1h53vlnhj0mnmbq12p5nzk5zcxycbcpz"))))
      (propagated-inputs
       (list emacs-magit))
      (build-system emacs-build-system)
      (home-page "https://github.com/danielma/magit-org-todos.el")
      (synopsis "Get todo.org into Emacs Magit status")
      (description "This package allows you to get @file{todo.org} into your
magit status.

If you have a @file{todo.org} file with @code{TODO} items in the root of your
repository, @code{magit-org-todos} will create a section in your Magit status
buffer with each of your todos.")
      (license license:gpl3+))))

(define-public emacs-magit-todos
  (let ((commit "bd27c57eada0fda1cc0a813db04731a9bcc51b7b")
        (revision "0"))
    (package
      (name "emacs-magit-todos")
      (version (git-version "1.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/magit-todos.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q3rplkvd4ny02zpnrzkfhflg8yx7zq2brq15c603f2yjiwiy7xl"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list emacs-async
             emacs-dash
             emacs-f
             emacs-hl-todo
             emacs-magit
             emacs-pcre2el
             emacs-s))
      (home-page "https://github.com/alphapapa/magit-todos")
      (synopsis "Show source files' TODOs (and FIXMEs, etc) in Magit status buffer")
      (description "This package displays keyword entries from source code
comments and Org files in the Magit status buffer.  Activating an item jumps
to it in its file.  By default, it uses keywords from @code{hl-todo}, minus a
few (like NOTE).")
      (license license:gpl3))))

(define-public emacs-nix-mode
  (let ((commit "719feb7868fb567ecfe5578f6119892c771ac5e5")
        (revision "0"))
    (package
      (name "emacs-nix-mode")
      (version (git-version "1.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/NixOS/nix-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1i2yh8wgn97q9hwaihznb5d7jql9acdjyj5q375gqwpq144g3xjv"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-company emacs-json-mode emacs-magit emacs-mmm-mode))
      (home-page "https://github.com/NixOS/nix-mode")
      (synopsis "Emacs major mode for editing Nix expressions")
      (description "@code{nixos-mode} provides an Emacs major mode for editing
Nix expressions.  It supports syntax highlighting, indenting and refilling of
comments.")
      (license license:lgpl2.1+))))

(define-public emacs-repo
  (let ((commit "1572f3ee82eaadc06e741f03e1889281308c79fa")
        (revision "0"))
    (package
      (name "emacs-repo")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/canatella/repo-el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0y8j3hf5r69fxj2vsbaxwr9qdchddn53w25xzmxv1kfh6hbagzv3"))))
      (build-system emacs-build-system)
      (native-inputs
       (list
        emacs-el-mock
        emacs-ert-runner))
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-f
        emacs-magit))
      (home-page "https://github.com/canatella/repo-el")
      (synopsis "Emacs interface for the Google Repo tool")
      (description "This package provides integration of the Google Repo tool
with emacs.  It displays the output of the @code{repo status} command in a
buffer and launches Magit from the status buffer for the project at point.")
      (license license:gpl3+))))

(define-public emacs-orgit
  (let ((commit "efd98e5caaac1d08677dae95be40fab65dcda2c8")
        (revision "0"))
    (package
      (name "emacs-orgit")
      (version (git-version "2.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/orgit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0pzcmd4d82nmg98nrnk73qr02k1hy0qyagsbrxyjdpfzrg3ysmp9"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-dash
        emacs-magit))
      (home-page "https://github.com/magit/orgit")
      (synopsis "Support for Org links to Magit buffers")
      (description "This package defines several Org link types, which can be
used to link to certain Magit buffers.  Use the command
@command{org-store-link} while such a buffer is current to store a link.
Later you can insert it into an Org buffer using the command
@code{org-insert-link}.")
      (license license:gpl3+))))

(define-public emacs-orgit-forge
  (let ((commit "764820769e321a76622aaafe7617b4231985b5f0")
        (revision "0"))
    (package
      (name "emacs-orgit-forge")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/orgit-forge.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0v79xc4ss9c4wz6spplrlfzzgynfs264c6gxhzjffpa9vqnvbc6g"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-orgit
        emacs-forge
        emacs-compat
        ))
      (home-page "https://github.com/magit/orgit-forge")
      (synopsis "Org links to Forge topic buffers in Emacs")
      (description
       "This package defines the Org link type `orgit-topic`, enabling users
 to create links to Forge topic buffers within Org-mode documents in Emacs.
 Similar to the `orgit` package, which links to various Magit buffers,
 `orgit-forge` facilitates seamless navigation between Org documents and Forge
 topics, enhancing integration between version control and documentation
 workflows.")
      (license license:gpl3+))))

(define-public emacs-vdiff-magit
  ;; Need to use a more recent commit than the latest release version because
  ;; of Magit and Transient
  (let ((commit "cc9e2dbd81d7f717381981501472808b7a4c6d79")
        (revision "0"))
    (package
      (name "emacs-vdiff-magit")
      (version (git-version "0.3.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/justbur/emacs-vdiff-magit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jybs0ddgvl1xfa750prw3phvilqxq3a4gpjpcljyjbjdqhdfrym"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-vdiff emacs-magit))
      (home-page "https://github.com/justbur/emacs-vdiff-magit/")
      (synopsis "Frontend for diffing based on vimdiff")
      (description "This package permits comparisons of two or three buffers
based on diff output.")
      (license license:gpl3+))))

(define-public emacs-treemacs
  (let ((commit "820b09db106a48db76d95e3a266d1e67ae1b6bdb")
        (revision "0"))
    (package
      (name "emacs-treemacs")
      (version (git-version "3.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1gmp3dvji3ank0qh0fhygla2iy9pc2pg07d342wzs1mysgcdj2l8"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "make" "-C" "../.." "test")
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
            (add-after 'unpack 'fix-makefile
              (lambda _
                (substitute* "Makefile"
                  (("@\\$\\(CASK\\) exec ") "")
                  ;; Guix does not need to prepare dependencies before testing.
                  (("test: prepare") "test:"))))
            (add-after 'fix-makefile 'chdir-elisp
              ;; Elisp directory is not in root of the source.
              (lambda _
                (chdir "src/elisp")))
            (add-before 'install 'patch-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (make-file-writable "treemacs-core-utils.el")
                (emacs-substitute-variables "treemacs-core-utils.el"
                  ("treemacs-dir" (string-append #$output "/")))
                (make-file-writable "treemacs-icons.el")
                (substitute* "treemacs-icons.el"
                  (("icons/default")
                   (string-append (elpa-directory #$output) "/icons/default")))
                (make-file-writable "treemacs-customization.el")
                (emacs-substitute-variables "treemacs-customization.el"
                  ("treemacs-python-executable"
                   (search-input-file inputs "/bin/python3")))
                (make-file-writable "treemacs-async.el")
                (substitute* "treemacs-async.el"
                  (("src/scripts")
                   (string-append (elpa-directory #$output) "/scripts")))))
            (add-after 'install 'install-data
              (lambda _
                (with-directory-excursion "../.." ;treemacs root
                  (copy-recursively
                   "icons/default"
                   (string-append (elpa-directory #$output) "/icons/default"))
                  (copy-recursively
                   "src/scripts"
                   (string-append (elpa-directory #$output) "/scripts"))
                  ;; (copy-recursively
                  ;;  "src/extra"
                  ;;  (string-append (elpa-directory #$output) "/extra"))
                  )))
            ;; (add-after 'ensure-package-description 'add-needed-pkg-descriptions
            ;;   (lambda* (#:key outputs #:allow-other-keys)
            ;;     ;; (format #t "(getcwd) : ~a\n" (getcwd))
            ;;     ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
            ;;     (bst:write-pkg-file "treemacs-treelib")
            ;;     (with-directory-excursion "../extra"
            ;;       (bst:write-pkg-file "treemacs-all-the-icons")
            ;;       (bst:write-pkg-file "treemacs-evil")
            ;;       (bst:write-pkg-file "treemacs-icons-dired")
            ;;       (bst:write-pkg-file "treemacs-magit")
            ;;       (bst:write-pkg-file "treemacs-mu4e")
            ;;       (bst:write-pkg-file "treemacs-persp")
            ;;       (bst:write-pkg-file "treemacs-perspective")
            ;;       (bst:write-pkg-file "treemacs-projectile")
            ;;       (bst:write-pkg-file "treemacs-tab-bar")
            ;;       )))
            )))
      (native-inputs
       (list
        emacs-buttercup
        emacs-el-mock
        ))
      (inputs (list python))
      (propagated-inputs
       (list
        ;; emacs-projectile    ; for src/extra
        ;; emacs-perspective   ; for src/extra
        ;; emacs-persp-mode    ; for src/extra
        ;; mu                  ; for src/extra ; emacs-lisp package providing mu4e
        ;; emacs-magit         ; for src/extra
        ;; emacs-evil          ; for src/extra
        ;; emacs-all-the-icons ; for src/extra
        emacs-ace-window
        emacs-cfrs
        emacs-dash
        emacs-f
        emacs-ht
        emacs-hydra
        emacs-pfuture
        emacs-s))
      (home-page "https://github.com/Alexander-Miller/treemacs")
      (synopsis "Emacs tree style file explorer")
      (description
       "Treemacs is a file and project explorer similar to NeoTree or Vim's
NerdTree, but largely inspired by the Project Explorer in Eclipse.  It shows
the file system outlines of your projects in a simple tree layout allowing
quick navigation and exploration, while also possessing basic file management
utilities.")
      (license license:gpl3+))))

(define-public emacs-treemacs-extra
  (package
    (inherit emacs-treemacs)
    (name "emacs-treemacs-extra")
    (arguments
     (substitute-keyword-arguments
         (package-arguments emacs-treemacs)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'chdir-elisp 'copy-extra
              (lambda _
                (copy-recursively "../extra" ".")))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "treemacs-all-the-icons")
                (bst:write-pkg-file "treemacs-evil")
                (bst:write-pkg-file "treemacs-icons-dired")
                (bst:write-pkg-file "treemacs-magit")
                (bst:write-pkg-file "treemacs-mu4e")
                (bst:write-pkg-file "treemacs-persp")
                (bst:write-pkg-file "treemacs-perspective")
                (bst:write-pkg-file "treemacs-projectile")
                (bst:write-pkg-file "treemacs-tab-bar")))
            ))))
    (propagated-inputs
     (modify-inputs (package-propagated-inputs emacs-treemacs)
       (append
        emacs-all-the-icons
        emacs-evil
        emacs-magit
        emacs-projectile
        emacs-persp-mode
        emacs-perspective
        mu           ; emacs-lisp package which provides mu4e
        )))))

(define-public emacs-treemacs-evil
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-evil")))

(define-public emacs-treemacs-icons-dired
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-icons-dired")))

(define-public emacs-treemacs-magit
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-magit")))

(define-public emacs-treemacs-persp
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-persp")))

(define-public emacs-treemacs-projectile
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-projectile")))

(define-public emacs-lsp-volar
  (package
    (name "emacs-lsp-volar")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jadestrong/lsp-volar")
             (commit
              "6f0c2bc3be5fc4d8d8aa1cf5ee3546fcf6ef36be")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0bvma47dhnsipf3rdxlb5m040a40dxpkpbh7jcbr21r4g6z3xmlr"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@ (bost gnu packages emacs-xyz-lsp) emacs-lsp-mode)
      ))
    (home-page
     "https://github.com/jadestrong/lsp-volar")
    (synopsis "Language support for Vue3")
    (description "Language support for Vue3
This package has been merged into lsp-mode, so you can use lsp-mode
directly. There will only be some experimental updates here. Once stable, they
will be submitted to lsp-mode.")
    (license license:gpl3+)))

(define-public emacs-which-key
  (package
    (name "emacs-which-key")
    (version "3.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://elpa.gnu.org/packages/which-key-" version
                           ".tar"))
       (sha256
        (base32 "0p1vl7dnd7nsvzgsff19px9yzcw4w07qb5sb8g9r8a8slgvf3vqh"))))
    (build-system emacs-build-system)
    (home-page "https://elpa.gnu.org/packages/which-key.html")
    (synopsis "Display available keybindings in popup")
    (description
     "@code{emacs-which-key} is a minor mode for Emacs that displays the key
bindings following your currently entered incomplete command (a prefix) in a
popup.  For example, after enabling the minor mode if you enter C-x and wait
for the default of 1 second, the minibuffer will expand with all of the
available key bindings that follow C-x (or as many as space allows given your
settings).")
    (license license:gpl3+)))

(define-public emacs-undo-tree
  (package
    (name "emacs-undo-tree")
    (version "0.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://gitlab.com/tsc25/undo-tree")
              (commit "42aab056e37e033816b2d192f9121b89410b958e"))) ; no 0.8.2 tag
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xvkxc078b4z5zqwndz6jcv4ga8yd2ci32v7l8pdvqjmz7fq7bfz"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-queue))
    (home-page "https://www.dr-qubit.org/undo-tree.html")
    (synopsis "Treat undo history as a tree")
    (description
     "Tree-like interface to Emacs undo system, providing
graphical tree presentation of all previous states of buffer that
allows easily move between them.")
    (license license:gpl3+)))

(define-public emacs-web-beautify
  (package
    (name "emacs-web-beautify")
    (version "0.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/yasuyk/web-beautify")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vms7zz3ym53wf1zdrkbf2ky2xjr1v134ngsd0jr8azyi8siw84d"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command #~(list "ert-runner")))
    (native-inputs (list emacs-ert-runner))
    (home-page "https://github.com/yasuyk/web-beautify")
    (synopsis "Format HTML, CSS and JavaScript, JSON")
    (description "This package provides an Emacs functions to format HTML,
CSS, JavaScript, JSON.")
    (license license:gpl3+)))

(define-public emacs-dumb-jump
  (package
    (name "emacs-dumb-jump")
    (version "0.5.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jacktasia/dumb-jump")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18d2ll5wlll6pm909hiw8w9ijdbrjvy86q6ljzx8yyrjphgn0y1y"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f                      ; FIXME: Tests freeze when run.
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-shell
           (lambda _
             ;; Setting the SHELL environment variable is required for the
             ;; tests to find sh.
             (setenv "SHELL" (which "sh")))))))
    (native-inputs
     (list emacs-el-mock emacs-ert-runner emacs-noflet emacs-undercover))
    (propagated-inputs
     (list emacs-f emacs-popup))
    (home-page "https://github.com/jacktasia/dumb-jump")
    (synopsis "Jump to definition for multiple languages without configuration")
    (description "Dumb Jump is an Emacs \"jump to definition\" package with
support for multiple programming languages that favors \"just working\" over
speed or accuracy.  This means minimal --- and ideally zero --- configuration
with absolutely no stored indexes (tags) or persistent background processes.
Dumb Jump performs best with The Silver Searcher @command{ag} or ripgrep
@command{rg} installed.")
    (license license:gpl3+)))

(define-public emacs-wgrep
  (package
    (name "emacs-wgrep")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mhayashi1120/Emacs-wgrep")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "16qg5dpg7hms5dmh92ksnjahf6010pw97ggi7sb0mfafd6iwps0a"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "emacs" "--batch" "-Q"
                             "-l" "wgrep-test.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (native-inputs (list emacs-dash emacs-s))
    (home-page "https://github.com/mhayashi1120/Emacs-wgrep")
    (synopsis "Edit a grep buffer and apply those changes to the files")
    (description
     "Emacs wgrep allows you to edit a grep buffer and apply those changes
to the file buffer.  Several backends are supported beside the classic grep:
ack, ag, helm and pt.")
    (license license:gpl3+)))

(define-public emacs-web-mode
  (package
    (name "emacs-web-mode")
    (version "17.3.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/fxbois/web-mode")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lvixg4c5apwrpqljj11b3yrq8nklz4ky4njnh8y6h1j5bisx40p"))))
    (build-system emacs-build-system)
    (synopsis "Major mode for editing web templates")
    (description "Web mode is an Emacs major mode for editing web templates
aka HTML files embedding parts (CSS/JavaScript) and blocks (pre rendered by
client/server side engines).  Web mode is compatible with many template
engines: PHP, JSP, ASP, Django, Twig, Jinja, Mustache, ERB, FreeMarker,
Velocity, Cheetah, Smarty, CTemplate, Mustache, Blade, ErlyDTL, Go Template,
Dust.js, React/JSX, Angularjs, ejs, etc.")
    (home-page "https://web-mode.org/")
    (license license:gpl3+)))

(define-public emacs-web-mode
  (package
    (name "emacs-web-mode")
    (version "17.3.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/fxbois/web-mode")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lvixg4c5apwrpqljj11b3yrq8nklz4ky4njnh8y6h1j5bisx40p"))))
    (build-system emacs-build-system)
    (synopsis "Major mode for editing web templates")
    (description "Web mode is an Emacs major mode for editing web templates
aka HTML files embedding parts (CSS/JavaScript) and blocks (pre rendered by
client/server side engines).  Web mode is compatible with many template
engines: PHP, JSP, ASP, Django, Twig, Jinja, Mustache, ERB, FreeMarker,
Velocity, Cheetah, Smarty, CTemplate, Mustache, Blade, ErlyDTL, Go Template,
Dust.js, React/JSX, Angularjs, ejs, etc.")
    (home-page "https://web-mode.org/")
    (license license:gpl3+)))

(define-public emacs-evil-nerd-commenter
  (package
    (name "emacs-evil-nerd-commenter")
    (version "3.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/redguardtoo/evil-nerd-commenter")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1xi4sd75pzhgcd9lzhx18hlzbrwh5q9gbscb1971qn94mzxwd60r"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")
                     #:tests? #f        ; XXX: broken docstring
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-after 'unpack 'patch-Makefile
                           (lambda _
                             (substitute* "Makefile"
                               (("-Q") "")
                               (("-L [^.]*") "")
                               (("deps/") "")
                               ((" deps") "")))))))
    (propagated-inputs (list emacs-evil))
    (native-inputs (list emacs-web-mode))
    (home-page "https://github.com/redguardtoo/evil-nerd-commenter")
    (synopsis "Comment and uncomment lines efficiently")
    (description
     "This package provides text objects and operators for comments within
@code{evil-mode}.")
    (license license:gpl3+)))

(define-public emacs-zenburn-theme
  (package
    (name "emacs-zenburn-theme")
    (version "2.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/bbatsov/zenburn-emacs")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00zyx2knfchxkml19kf4wfgigsbgzqf47mvbgrmk3nfznnnnyvmf"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/bbatsov/zenburn-emacs")
    (synopsis "Low contrast color theme for Emacs")
    (description
     "Zenburn theme is a port of the popular Vim Zenburn theme for Emacs.
It is built on top of the custom theme support in Emacs 24 or later.")
    (license license:gpl3+)))

(define-public emacs-loop
  (package
    (name "emacs-loop")
    (version "1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Wilfred/loop.el")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gs95xnmnn8aa4794k7h8mw1sz1nfdh9v0caqj6yvnsdnwy74n5x"))))
    (build-system emacs-build-system)
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (home-page "https://github.com/Wilfred/loop.el")
    (synopsis "Imperative loop structures for Emacs")
    (description "Loop structures familiar to users of other languages.  This
library adds a selection of popular loop structures as well as break and
continue.")
    (license license:gpl3+)))

(define-public emacs-vterm
  (let ((commit "056ad74653704bc353d8ec8ab52ac75267b7d373")
        (revision "2"))
    (package
      (name "emacs-vterm")
      (version (git-version "0.0.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/akermu/emacs-libvterm")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0mh1xx3ggrr3kampm1b9cxydbn6csihipaa2bpjv08py98wi0434"))))
      (build-system emacs-build-system)
      (arguments
       `(#:modules ((guix build emacs-build-system)
                    ((guix build cmake-build-system) #:prefix cmake:)
                    (guix build emacs-utils)
                    (guix build utils))
         #:imported-modules (,@%emacs-build-system-modules
                             (guix build cmake-build-system))
         ;; Include the `etc' folder for shell-side configuration files
         #:include (cons* "^etc/.*" %default-include)
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'replace-bin-bash
             ;; This is necessary to avoid errors in phase 'patch-el-files'.
             (lambda* (#:key inputs #:allow-other-keys)
               (substitute* "vterm.el"
                 (("\\/bin\\/bash") (search-input-file inputs "/bin/bash")))))
           (add-after 'unpack 'substitute-vterm-module-path
             (lambda* (#:key outputs #:allow-other-keys)
               (chmod "vterm.el" #o644)
               (emacs-substitute-sexps "vterm.el"
                 ("(require 'vterm-module nil t)"
                  `(module-load
                    ,(string-append (assoc-ref outputs "out")
                                    "/lib/vterm-module.so"))))))
           (add-after 'build 'configure
             ;; Run cmake.
             (lambda* (#:key outputs #:allow-other-keys)
               ((assoc-ref cmake:%standard-phases 'configure)
                #:outputs outputs
                #:out-of-source? #f
                #:configure-flags '("-DUSE_SYSTEM_LIBVTERM=ON"))))
           (add-after 'configure 'make
             ;; Run make.
             (lambda* (#:key (make-flags '()) outputs #:allow-other-keys)
               ;; Compile the shared object file.
               (apply invoke "make" "all" make-flags)
               ;; Move the file into /lib.
               (install-file
                "vterm-module.so"
                (string-append (assoc-ref outputs "out") "/lib")))))
         #:tests? #f))
      (native-inputs
       (list cmake-minimal libtool libvterm))
      (home-page "https://github.com/akermu/emacs-libvterm")
      (synopsis "Emacs libvterm integration")
      (description "This package implements a bridge to @code{libvterm} to
display a terminal in an Emacs buffer.")
      (license license:gpl3+))))

(define-public emacs-multi-vterm
  (let ((commit "a3df7218c1ecadef779e2c47815201052283f9ea")
        (revision "1"))
    (package
      (name "emacs-multi-vterm")
      (version (git-version "1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/suonlight/multi-vterm")
                       (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0z6321994c4c8f5iya240pzvhirci9idlc110wjjwsm4pzdrrppj"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-vterm))
      (home-page "https://github.com/suonlight/multi-vterm/")
      (synopsis "Manage multiple vterm buffers in Emacs")
      (description
       "This package provides an Emacs library to manage vterm buffers.")
      (license license:gpl3+))))

(define-public emacs-undo-fu
  ;; There are no tagged releases upstream, instead we are using
  ;; the most recent commit.
  (let ((commit "0e22308de8337a9291ddd589edae167d458fbe77")
        (revision "0"))
    (package
      (name "emacs-undo-fu")
      (version (git-version "0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://codeberg.org/ideasman42/emacs-undo-fu")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "18c8lq4h3i5rzz8jwwszmq9ga1m7jk3sbrh76sgrsbdawpap3ak5"))))
      (build-system emacs-build-system)
      (home-page "https://codeberg.org/ideasman42/emacs-undo-fu")
      (synopsis "Simple, stable linear undo with redo for Emacs")
      (description
       "This is a light weight wrapper for Emacs built-in undo system,
adding convenient undo/redo without losing access to the full undo history,
allowing you to visit all previous states of the document if you need.")
      (license license:gpl3+))))

(define-public emacs-tldr
  (let ((commit "1b09d2032491d3904bd7ee9bf5ba7c7503db6593")
        (revision "2"))
    (package
      (name "emacs-tldr")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/kuanyui/tldr.el")
                      (commit commit)))
                (sha256
                 (base32
                  "0qdv5yhvs4mnb4lszglhli80pv1436mknbap9qrm9riixfg6zlvv"))
                (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'set-unzip-location
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "tldr.el"
                  (("\"unzip")
                   (string-append "\""
                                  (search-input-file inputs "/bin/unzip")))))))))
      (inputs
       (list unzip))
      (propagated-inputs
       (list emacs-request))
      (home-page "https://github.com/kuanyui/tldr.el")
      (synopsis "Simplified and community-driven man pages for Emacs")
      (description "Tldr allows the user to access @code{tldr} pages from
within Emacs.  The @code{tldr} pages are a community effort to simplify the
man pages with practical examples.")
      (license license:wtfpl2))))

(define-public emacs-elisp-refs
  (package
    (name "emacs-elisp-refs")
    (version "1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/elisp-refs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1670jj0pya74gb0xbjlfmka4w06hzh6ya1ai9f4brxp4n9knc13i"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-dash
           emacs-f
           emacs-list-utils
           emacs-loop
           emacs-s
           emacs-shut-up))
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (home-page "https://github.com/Wilfred/elisp-refs")
    (synopsis "Find callers of elisp functions or macros")
    (description "@code{elisp-refs} finds references to functions, macros or
variables.  Unlike a dumb text search, it actually parses the code, so it's
never confused by comments or @code{foo-bar} matching @code{foo}.")
    (license license:gpl3+)))

(define-public emacs-paradox
  (let ((commit "96401577ed02f433debe7604e49afd478e9eda61")) ;version bump
    (package
      (name "emacs-paradox")
      (version "2.5.5")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Malabarba/paradox")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0v9hmvq6bcr2hwlb09ldsd6pjl19ri5n2hl2bs3x52fqjj6fdzzn"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-hydra emacs-let-alist emacs-seq emacs-spinner))
      (native-inputs (list emacs-ert-runner emacs-undercover))
      (home-page "https://github.com/Malabarba/paradox")
      (synopsis "Paradox is an extension to Emacs packages menu")
      (description
       "Paradox is a project for modernizing Emacs' Package menu.  It provides
improved appearance, mode-line information, GitHub integration,
customizability and asynchronous upgrading.")
      (license license:gpl2+))))

(define-public emacs-paradox
  (let ((commit "96401577ed02f433debe7604e49afd478e9eda61")) ;version bump
    (package
      (name "emacs-paradox")
      (version "2.5.5")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Malabarba/paradox")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0v9hmvq6bcr2hwlb09ldsd6pjl19ri5n2hl2bs3x52fqjj6fdzzn"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-hydra emacs-let-alist emacs-seq emacs-spinner))
      (native-inputs (list emacs-ert-runner emacs-undercover))
      (home-page "https://github.com/Malabarba/paradox")
      (synopsis "Paradox is an extension to Emacs packages menu")
      (description
       "Paradox is a project for modernizing Emacs' Package menu.  It provides
improved appearance, mode-line information, GitHub integration,
customizability and asynchronous upgrading.")
      (license license:gpl2+))))

(define-public emacs-zop-to-char
  (package
    (name "emacs-zop-to-char")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thierryvolpiatto/zop-to-char")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14waf3g7b92k3qd5088w4pn0wcspxjfkbswlzf7nnkjliw1yh0kf"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/thierryvolpiatto/zop-to-char")
    (synopsis "Visual zap-to-char command for Emacs")
    (description
     "This package provides a visual zap-to-char command for Emacs.")
    (license license:gpl3+)))

(define-public emacs-json-reformat
  (package
    (name "emacs-json-reformat")
    (version "0.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gongo/json-reformat")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gaifz1brh7yh1wk1c02gddwis4ab6bggv27gy7gcd2s861f8bkx"))
       (patches (search-patches "emacs-json-reformat-fix-tests.patch"))))
    (build-system emacs-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'make-tests-writable
           (lambda _
             (for-each make-file-writable (find-files "test"))))
         (add-before 'check 'delete-json-objects-order-test
           (lambda _
             (emacs-batch-edit-file "test/json-reformat-test.el"
               `(progn (progn (goto-char (point-min))
                              (re-search-forward
                               "ert-deftest json-reformat-test:json-reformat-region")
                              (beginning-of-line)
                              (kill-sexp))
                       (basic-save-buffer)))))
         (add-before 'check 'delete-json-reformat-region-occur-error-test
           (lambda _
             (emacs-batch-edit-file "test/json-reformat-test.el"
               `(progn (goto-char (point-min))
                       (re-search-forward
                        "ert-deftest json-reformat-test:json-reformat-region-occur-error")
                       (beginning-of-line)
                       (kill-sexp)
                       (basic-save-buffer))))))))
    (native-inputs
     (list emacs-dash emacs-ert-runner emacs-shut-up))
    (propagated-inputs
     (list emacs-undercover))
    (home-page "https://github.com/gongo/json-reformat")
    (synopsis "Reformatting tool for JSON")
    (description "@code{json-reformat} provides a reformatting tool for
@url{http://json.org/, JSON}.")
    (license license:gpl3+)))

(define-public emacs-ws-butler
  (let ((commit "9ee5a7657a22e836618813c2e2b64a548d27d2ff")
        (revision "0"))
    (package
      (name "emacs-ws-butler")
      (version (git-version "1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://git.savannah.gnu.org/git/emacs/nongnu")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ivpgib2bxv7x6cp04mj8crc1a60d7c77jcc59sj14scq4jqbmjb"))))
      (build-system emacs-build-system)
      (arguments (list #:test-command
                       #~(list "emacs" "--batch" "-L" "."
                               "-l" "tests/run-test.el")))
      (home-page "https://elpa.nongnu.org/nongnu/ws-butler.html")
      (synopsis "Unobtrusively remove trailing whitespace")
      (description
       "ws-butler automatically trims trailing whitespace characters on save.
In contrast with other whitespace cleanup solutions, only modified lines are
trimmed.")
      (license license:gpl3+))))

(define-public emacs-org-cliplink
  (let ((commit "13e0940b65d22bec34e2de4bc8cba1412a7abfbc")
        (revision "0"))
    (package
      (name "emacs-org-cliplink")
      (version (git-version "0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/rexim/org-cliplink")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1avyiw8vlv4n1r7zqvc6wjlsz7jl2pqaprzpm782gzp0c999pssl"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-curl-executable
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "org-cliplink-transport.el"
                  (("\\(executable-find \"curl\"\\)")
                   (let ((curl (search-input-file inputs "/bin/curl")))
                     (string-append "\"" curl "\""))))))
            (add-before 'check 'fix-failing-test
              ;; XXX: Fix randomly (!) failing test, which doesn't account for
              ;; the fact that (random) may return a negative number.
              (lambda _
                (substitute* "test/org-cliplink-transport-test.el"
                  (("curl-rexim.me-\\[a-z0-9\\]\\+")
                   "curl-rexim.me--?[a-z0-9]+")))))))
      (native-inputs
       (list emacs-el-mock emacs-ert-runner emacs-undercover))
      (inputs
       (list curl))
      (home-page "https://github.com/rexim/org-cliplink/")
      (synopsis "Insert Org mode links from the clipboard")
      (description
       "Org Cliplink provides a simple command that takes a URL from the
clipboard and inserts an Org mode link with a title of a page found by the URL
into the current buffer.")
      (license license:expat))))

(define-public emacs-yasnippet-snippets
  (package
    (name "emacs-yasnippet-snippets")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AndreaCrotti/yasnippet-snippets")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0p38k8a3l9vpph1g2a6wz40y30wb2nhp770rv8947bxzjc5xc0gf"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include #~(cons* "^snippets\\/" %default-include)
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'set-home
            (lambda _
              (setenv "HOME" (getcwd)))))))
    (propagated-inputs
     (list emacs-yasnippet))
    (home-page "https://github.com/AndreaCrotti/yasnippet-snippets")
    (synopsis "Collection of YASnippet snippets for many languages")
    (description "This package provides an extensive collection of YASnippet
snippets.  When this package is installed, the extra snippets it provides are
automatically made available to YASnippet.")
    (license license:gpl3+)))

(define-public emacs-volatile-highlights
  (package
    (name "emacs-volatile-highlights")
    (version "1.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/k-talo/volatile-highlights.el")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0rlqwj6whxbvzgkf78d8arjva49aphj4bd2wkpv8djykcmi8nf6m"))))
    (build-system emacs-build-system)
    (home-page "http://github.com/k-talo/volatile-highlights.el")
    (synopsis "Emacs minor mode for visual feedback on some operations")
    (description "@code{volatile-highlights-mode} brings visual feedback to
some operations by highlighting portions relating to the operations.  All of
highlights made by this library will be removed when any new operation is
executed.")
    (license license:gpl3+)))

(define-public emacs-undo-fu-session
  ;; There are no tagged releases upstream, instead we are using the
  ;; most recent commit.
  (let ((commit "a6c4f73bc22401fd36e0f2fd4fe058bb28566d84")
        (revision "0"))
    (package
      (name "emacs-undo-fu-session")
      (version (git-version "0.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://codeberg.org/ideasman42/emacs-undo-fu-session")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03pb88bi5z4f01972jbk9z6w9iqamqflfp20mih29ghvbiyn6ahj"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; The tests require temp files handling which a recent change disabled
        ;; by default. We re-enable it here to make tests work again.
        #:test-command #~(list "emacs" "--batch" "--eval"
                               "(setq undo-fu-session-ignore-temp-files nil)"
                               "-l" "tests/undo-fu-session-test.el"
                               "-f" "undo-fu-session-test-run-all")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'set-home
              (lambda _
                (setenv "HOME" "/tmp"))))))
      (home-page "https://codeberg.org/ideasman42/emacs-undo-fu-session")
      (synopsis "Save & recover undo steps between Emacs sessions")
      (description "This package writes undo/redo information upon file save
which is restored where possible when the file is loaded again.")
      (license license:gpl3+))))

(define-public emacs-suggest
  (package
    (name "emacs-suggest")
    (version "0.7")
    (home-page "https://github.com/Wilfred/suggest.el")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "01v8plska5d3g19sb1m4ph1i3ayprfzk8mi6mpabjy6zad397xjl"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-loop
           emacs-dash
           emacs-s
           emacs-f
           emacs-spinner
           emacs-shut-up))
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (synopsis "Suggest Elisp functions that give the output requested")
    (description "Suggest.el will find functions that give the output
requested.  It's a great way of exploring list, string and arithmetic
functions.")
    (license license:gpl3+)))

(define-public emacs-vundo
  (package
    (name "emacs-vundo")
    (version "2.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/casouri/vundo/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "034ynwfk374i27vvfpr13n3qw02ihm0189m8frxfqdbd3hismjkb"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "emacs" "-Q" "--batch"
                             "-l" "vundo.el"
                             "-l" "test/vundo-test.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (home-page "https://github.com/casouri/vundo/")
    (synopsis "Visualize the undo tree")
    (description
     "Vundo (visual undo) displays the undo history as a tree and lets you
move in the tree to go back to previous buffer states.  To use vundo, type
@kbd{M-x vundo RET} in the buffer you want to undo.  An undo tree buffer
should pop up.")
    (license license:gpl3+)))

(define-public emacs-unfill
  (package
    (name "emacs-unfill")
    (version "0.3")
    (home-page "https://github.com/purcell/unfill")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pg64nza2mp4xyr69pjq51jsq1aaym0g38g4jzaxr0hh3w0ris1n"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "unit" "INIT_PACKAGES=t")))
    (synopsis "Inverse of Emacs' @code{fill-paragraph} and @code{fill-region}")
    (description
     "The functions in this package provide the inverse of Emacs'
@code{fill-paragraph} and @code{fill-region}.")
    (license license:gpl3+)))

(define-public emacs-yaml-mode
  (package
    (name "emacs-yaml-mode")
    (version "0.0.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yoshiki/yaml-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jqg2hmh7qsgqywwd6fy3k8z8j45nqhpdzr3hw4hd5s2hry3zhg1"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")))
    (home-page "https://github.com/yoshiki/yaml-mode")
    (synopsis "Major mode for editing YAML files")
    (description
     "Yaml mode is an Emacs major mode for editing files in the YAML data
serialization format.  As YAML and Python share the fact that indentation
determines structure, this mode provides indentation and indentation command
behavior very similar to that of Python mode.")
    (license license:gpl3+)))

(define-public emacs-terminal-here
  (package
    (name "emacs-terminal-here")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/davidshepherd7/terminal-here")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1iv1c2mbvhn00ha46c6f98j9syc71xhjpk8m5wa5p32sk4wcc9f4"))))
    (build-system emacs-build-system)
    (native-inputs (list emacs-el-mock emacs-ert-runner emacs-validate))
    (home-page "https://github.com/davidshepherd7/terminal-here")
    (synopsis "Open external terminals from Emacs")
    (description
     "This package provides commands to open external terminal emulators from
Emacs, whose initial working directories are determined in relation to the
current buffer.")
    (license license:gpl3+)))

(define-public emacs-evil-matchit
  (package
    (name "emacs-evil-matchit")
    (version "4.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/redguardtoo/evil-matchit")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06ayyw8nim5fi819hr30x54wx2ba6aqvlh7r0vld06xc0zsjdhm3"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-after 'unpack 'patch-Makefile
                           (lambda _
                             (substitute* "Makefile"
                               (("-Q") "")
                               (("-L [^.]*") "")
                               (("deps/") "")
                               ((" deps") "")))))))
    (propagated-inputs
     (list emacs-evil))
    (native-inputs (list emacs-lua-mode
                         emacs-markdown-mode
                         emacs-tuareg
                         emacs-yaml-mode))
    (home-page "https://github.com/redguardtoo/evil-matchit")
    (synopsis "Vim matchit ported into Emacs")
    (description
     "@code{evil-matchit} is a minor mode for jumping between matching tags in
evil mode using @kbd{%}.  It is a port of @code{matchit} for Vim.")
    (license license:gpl3+)))

(define-public emacs-xterm-color
  (package
    (name "emacs-xterm-color")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atomontage/xterm-color")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "127lq50q62x06kd1xrf8lyc4rkqbfhfy86gsx1x4x169am2xk397"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/atomontage/xterm-color")
    (synopsis "ANSI & xterm-256 color text property translator for Emacs")
    (description "@code{xterm-color.el} is an ANSI control sequence to
text-property translator.")
    (license license:bsd-2)))

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
      (native-inputs (list emacs-el-mock emacs-ert-runner))
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
        emacs-el-mock))
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

(define-module (bost gnu packages emacs-xyz-lsp-magit)
  #:use-module (bost gnu packages emacs-xyz-lsp)
  #:use-module (bost gnu packages emacs-xyz-magit)
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
  #:use-module (gnu packages emacs-build)
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
                (url "https://github.com/rejeep/el-mock.el.git")
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
    (native-inputs (list emacs-el-mock emacs-ert-runner))
    (home-page "https://github.com/atykhonov/google-translate")
    (synopsis "Emacs interface to Google Translate")
    (description
     "This package provides an Emacs interface to the Google Translate
on-line service.")
    (license license:gpl3+)))

(define-public emacs-lsp-mode
  (let ((commit
         "a478e03cd1a5dc84ad496234fd57241ff9dca57a"
         ;; "c77ba141063916ae5f36f84cb23230e1783b4f09"
         )
        (revision "0"))
    (package
      (name "emacs-lsp-mode")
      (version (git-version "9.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1p4979qbmllmmszmnyml0msxkza4pm14rdacmqczbfs3cs9n6bd3"
           ;; "0fkgd6bmdri6aa0f2qlxsp8imdn7zf2c30ymq9iqdcnly82ggd8k"
           ))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:emacs emacs                     ;need libxml support
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:test-command #~(list "ert-runner" "-L" "." "-L" "clients"
                               "-t" "!no-win" "-t" "!org")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'move-clients-libraries
              ;; Move all clients libraries at top-level, as is done, e.g., in
              ;; MELPA.
              (lambda _
                (for-each (lambda (f)
                            (install-file f "."))
                          (find-files "clients/" "\\.el$"))))
            (add-before 'check 'skip-failing-tests
              (lambda _
                (substitute* "test/lsp-common-test.el"
                  (("\\(require 'elenv" all)
                   (string-append all " nil t"))
                  (("\\(ert-deftest lsp--path-to-uri-1 .*" all)
                   (string-append all "(skip-unless (featurep 'elenv))"))
                  (("\\(ert-deftest lsp-byte-compilation-test .*" all)
                   (string-append all "(skip-unless nil)"))
                  (("\\(ert-deftest lsp--build-.*-response-test-[34] .*" all)
                   (string-append all "(skip-unless nil)")))
                (substitute* "test/lsp-mode-test.el"
                  (("\\(ert-deftest lsp--merge-results .*" all)
                   (string-append all "(skip-unless nil)")))
                (substitute* "test/lsp-integration-test.el"
                  (("\\(ert-deftest lsp-.*-hover-request(-tick)? .*" all)
                   (string-append all "(skip-unless nil)"))
                  (("\\(ert-deftest lsp-test-current-buffer-mode .*" all)
                   (string-append all "(skip-unless nil)")))
                (delete-file "test/lsp-clangd-test.el")))
            (add-before 'check 'set-home
              (lambda _ (setenv "HOME" (getenv "TMPDIR"))))
            (add-after 'unpack 'enable-plists
              (lambda _
                (substitute* "lsp-protocol.el"
                  ;; This is faster, and it's officially recommended,
                  ;; and it's required by emacs-lsp-booster.
                  ;; See also:
                  ;; <https://emacs-lsp.github.io/lsp-mode/page/performance/>.
                  (("\\(getenv \"LSP_USE_PLISTS\"\\)") "t"))))
            (add-before 'move-clients-libraries 'fix-patch-el-files
              ;; /bin/ksh is only used on macOS, which we don't support, so we
              ;; don't want to add it as input.
              (lambda _
                (substitute* '("clients/lsp-csharp.el" "clients/lsp-fsharp.el")
                  (("/bin/ksh") "ksh"))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "lsp-mode")
                ))
            )))
      (propagated-inputs
       (list
        emacs-dash
        emacs-f
        emacs-ht
        emacs-hydra
        emacs-markdown-mode
        emacs-spinner))
      (native-inputs
       (list
        emacs-deferred
        emacs-el-mock
        emacs-ert-runner))
      (home-page "https://emacs-lsp.github.io/lsp-mode/")
      (synopsis "Emacs client and library for the Language Server Protocol")
      (description
       "LSP mode is a client and library implementation for the Language
Server Protocol.  This mode creates an IDE-like experience by providing
optional integration with other popular Emacs packages like Company, Flycheck,
and Projectile.")
      (license license:gpl3+))))

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
    (propagated-inputs (list emacs-lsp-mode))
    (home-page
     "https://github.com/jadestrong/lsp-volar")
    (synopsis "Language support for Vue3")
    (description "Language support for Vue3
This package has been merged into lsp-mode, so you can use lsp-mode
directly. There will only be some experimental updates here. Once stable, they
will be submitted to lsp-mode.")
    (license license:gpl3+)))

(define-public emacs-lsp-docker
  (let ((commit "ff41f4a76b640d39dc238bacba7f654c297827fa")
        (revision "0"))
    (package
      (name "emacs-lsp-docker")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/emacs-lsp/lsp-docker.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1frlfcy5vwn8rprgfyrh2qjp2cwwyjsgsp112cxws98s91601v1j"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-lsp-mode
        emacs-yaml
        ))
      (home-page "https://github.com/emacs-lsp/lsp-docker")
      (synopsis "Leverage LSP mode in Docker environment")
      (description
       "This package provides scripts and configurations to leverage LSP mode
in Docker environment.")
      (license license:gpl3+))))

(define-public emacs-dap-mode
  (let ((commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0"))
    (package
      (name "emacs-dap-mode")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cgqhv036fzcv9dg89k5czcfx5w56jkm4rm216lra004nph0sj82"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include #~(cons* "\\.png$" %default-include)))
      (propagated-inputs
       (list emacs-bui
             emacs-lsp-docker
             emacs-lsp-mode
             emacs-posframe
             emacs-lsp-treemacs))
      (home-page "https://emacs-lsp.github.io/dap-mode")
      (synopsis "Emacs client/library for Debug Adapter Protocol")
      (description
       "Dap mode is an Emacs client/library for Debug Adapter
Protocol (DAP), a wire protocol for communication between client and
debug server.  It is similar to the LSP but provides integration with
Debug server.")
      (license license:gpl3+))))

(define emacs-dap-base
  (let ((commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0"))
    (package
      (name "emacs-dap-base")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cgqhv036fzcv9dg89k5czcfx5w56jkm4rm216lra004nph0sj82"))))
      (build-system emacs-build-system)
      (arguments
       (list
;;; Exclusions are done on top of the inclusions. However using (inherit
;;; emacs-dap-base) we can effectivelly invert that. So then the order is will
;;; be:
;;; 1. emacs-dap-base include
;;; 2. emacs-dap-base exclude
;;; 3. emacs-dap-<..> include

        ;; Exclude all el-files in the working directory. el-files in the
        ;; subdirectories are NOT excluded.
        ;; Also, matching every string except "foo" using lookahead assertion
        ;; "^\\(?!foo$\\).*" doesn't work. Lookahead assertions are not
        ;; supported in POSIX regular expressions used by Guile
        #:exclude #~(cons*
                     "^[^/]*\\.el$"
                     %default-exclude)))
      (home-page "https://github.com/emacs-lsp/dap-mode")
      (synopsis "Debug Adapter Protocol client integration for Emacs")
      (description
       "Emacs client for the Debug Adapter Protocol (DAP),enabling interactive
debugging capabilities within the editor.  It integrates with lsp-mode and
supports various programming languages, including Java,Python, Ruby, Elixir,
and C/C++.  Features include breakpoints, call stacks,variable inspection, and
a hydra-based UI for controlling debug sessions. Users can define reusable
debug templates and configure per-language adapters to streamline the
debugging workflow.")
      (license license:gpl3+))))

(define all-info-include (quote (list "^[^/]*\\.info$" "^doc/.*\\.info$")))

(define-public emacs-dap-launch
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-launch")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-launch\\.el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-dap-tasks
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-tasks")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-tasks.\\el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-dap-overlays
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-overlays")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-overlays\\.el$"
                       ,all-info-include)))))

(define-public emacs-dap-utils
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-utils")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                  "^dap-utils\\.el$"
                  ,all-info-include)))
    (propagated-inputs (list emacs-dap-mode))))

(define-public emacs-dap-chrome
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-chrome")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                  "^dap-chrome\\.el$"
                  ,all-info-include)))
    (propagated-inputs
     (list
      emacs-dap-utils
      emacs-dap-mode))))

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
      (native-inputs (list emacs-buttercup emacs-el-mock))
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

(define-public emacs-lsp-java
  (let ((commit "21c89243adfca4b70e244b0a10cfaa0cd78c61e7")
        (revision "1"))
    (package
      (name "emacs-lsp-java")
      (version (git-version "3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-java.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mp99vyi104r3jm4dlg0c9ri6w543h70mi5qq797xlb70n3sxqw3"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-dap-mode
        emacs-lsp-mode
        emacs-markdown-mode
        emacs-dash
        emacs-f
        emacs-ht
        emacs-request
        emacs-treemacs
        ))
      (home-page "https://github.com/emacs-lsp/lsp-java/")
      (synopsis "Java support for lsp-mode")
      (description "Emacs Java IDE using Eclipse JDT Language Server.")
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
        emacs-lsp-mode
        emacs-dash
        emacs-magit
        ))
      (synopsis "Lean 4 major mode for Emacs")
      (description "This package provides a major mode for the Lean theorem
prover, version 4.")
      (home-page "https://lean-lang.org/")
      (license license:asl2.0))))


(define-public emacs-lsp-metals
  (let ((commit "e1d9d04f3bab7e6e74916054b36ab1a87e831367")
        (revision "0"))
    (package
      (name "emacs-lsp-metals")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-metals.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00jyy2aqbci9k9x4rxxadpwlkpajg0xp0600ddk630nxfnr77vbv"))))
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
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "lsp-metals-protocol")
                (bst:write-pkg-file "lsp-metals-treeview")
                )))))
      (propagated-inputs
       (list
        emacs-scala-mode
        emacs-lsp-mode
        emacs-lsp-treemacs
        emacs-dap-mode
        emacs-dash
        emacs-f
        emacs-ht
        emacs-treemacs
        ))
      (home-page "https://github.com/emacs-lsp/lsp-metals")
      (synopsis "Scala support for LSP mode")
      (description "This package is an Emacs Scala IDE using LSP mode to connect
to Metals.")
      (license license:gpl3+))))

(define-public emacs-lsp-treemacs
  (let ((commit "3e5550f278db74f15ebe34add0138b138207ec08")
        (revision "0"))
    (package
      (name "emacs-lsp-treemacs")
      (version (git-version "0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-treemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dkbq1sc1xwlvy1baxc4px9yi6lp614nl3n9vidpxsmbryaapimq"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include #~(cons "^icons\\/" %default-include)
        )
       )
      (propagated-inputs
       (list
        emacs-dash
        emacs-f
        emacs-ht
        emacs-treemacs
        emacs-lsp-mode
        ))
      (home-page "https://github.com/emacs-lsp/lsp-treemacs")
      (synopsis "Integration between LSP mode and treemacs")
      (description
       "This package provides integration between LSP mode and treemacs, and
implementation of treeview controls using treemacs as a tree renderer.")
      (license (list license:gpl3+
                     license:cc-by4.0  ; microsoft/vscode-icons
                     license:expat)))))

;; (define* (%emacs-lsp-treemacs-upstream-source #:key commit version hash)
;;   (origin
;;     (method git-fetch)
;;     (uri (git-reference
;;           (url "https://github.com/emacs-lsp/lsp-treemacs.git")
;;           (commit commit)))
;;     (file-name (git-file-name "emacs-lsp-treemacs" version))
;;     (hash hash)))

;; (define-public emacs-lsp-treemacs
;;   (package
;;     (name "emacs-lsp-treemacs")
;;     (version "0.5")
;;     (source
;;      (origin
;;        (method (@@ (guix packages) computed-origin-method))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256 #f)
;;        (uri
;;         (delay
;;           (with-imported-modules '((guix build emacs-utils)
;;                                    (guix build utils))
;;             #~(begin
;;                 (use-modules (guix build utils)
;;                              (guix build emacs-utils))
;;                 (let* ((dir (string-append "emacs-lsp-treemacs-" #$version)))
;;                   (set-path-environment-variable
;;                    "PATH" '("bin")
;;                    (list #+emacs-minimal
;;                          #+(canonical-package bash)
;;                          #+(canonical-package coreutils)
;;                          #+(canonical-package gzip)
;;                          #+(canonical-package tar)))
;;                   ;; Copy the upstream source
;;                   (copy-recursively
;;                    #+(%emacs-lsp-treemacs-upstream-source
;;                       #:commit version #:version version
;;                       #:hash
;;                       (content-hash
;;                        "0clifff6xhi1irmx08wjdl13vlh05a7c108hmzzqmmklg76zyr04"))
;;                    dir)
;;                   (with-directory-excursion dir
;;                     ;; The icons are unclearly licensed and possibly non-free,
;;                     ;; see <https://github.com/emacs-lsp/lsp-treemacs/issues/123>
;;                     (with-directory-excursion "icons"
;;                       (for-each delete-file-recursively
;;                                 '("eclipse" "idea" "netbeans")))
;;                     ;; Also remove any mentions in the source code.
;;                     (make-file-writable "lsp-treemacs-themes.el")
;;                     (emacs-batch-edit-file "lsp-treemacs-themes.el"
;;                       '(progn
;;                         (while (search-forward-regexp
;;                                 "(treemacs-create-theme \"\\([^\"]*\\)\""
;;                                 nil t)
;;                           (pcase (match-string 1)
;;                                  ("Iconless" nil)
;;                                  (_ (beginning-of-line)
;;                                     (kill-sexp)))
;;                           (basic-save-buffer)))))
;;                   (invoke "tar" "cvfa" #$output
;;                           "--mtime=@0"
;;                           "--owner=root:0"
;;                           "--group=root:0"
;;                           "--sort=name"
;;                           "--hard-dereference"
;;                           dir))))))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list #:include #~(cons "^icons\\/" %default-include)))
;;     (propagated-inputs
;;      (list emacs-lsp-mode emacs-treemacs))
;;     (home-page "https://github.com/emacs-lsp/lsp-treemacs")
;;     (synopsis "Integration between LSP mode and treemacs")
;;     (description
;;      "This package provides integration between LSP mode and treemacs,
;; and implementation of treeview controls using treemacs as a tree renderer.")
;;     (license (list license:gpl3+
;;                    license:cc-by4.0  ; microsoft/vscode-icons
;;                    license:expat))))

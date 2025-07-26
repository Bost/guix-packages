(define-module (bost gnu packages emacs-xyz-dash-s)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages emacs-build)
  #:use-module (bost gnu packages emacs-build)
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
  #:use-module (gnu packages fpga)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages golang-apps)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages idris)
  #:use-module (gnu packages java)
  #:use-module (gnu packages julia-xyz)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-check)
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
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages libffi)
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
  #:use-module (gnu packages ruby-check)
  #:use-module (gnu packages ruby-xyz)
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
  #:use-module (gnu packages telegram)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wget)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

;; (define-public emacs-magit-svn
;;   (package
;;     (name "emacs-magit-svn")
;;     (version "2.2.4")
;;     (source (origin
;;               (method git-fetch)
;;               (uri (git-reference
;;                      (url "https://github.com/magit/magit-svn")
;;                      (commit version)))
;;               (file-name (git-file-name name version))
;;               (sha256
;;                (base32
;;                 "0x419qz80ir9ni94j3n08a5ygfq1265fpr13dsnxjjnlwjbq7sx7"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash) emacs-with-editor emacs-magit))
;;     (home-page "https://github.com/magit/magit-svn")
;;     (synopsis "Git-SVN extension to Magit")
;;     (description
;;      "This package is an extension to Magit, the Git Emacs mode, providing
;; support for Git-SVN.")
;;     (license license:gpl3+)))

(define-public emacs-magit-popup
  (package
    (name "emacs-magit-popup")
    (version "2.13.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magit/magit-popup")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0znp6gx6vpcsybg774ab06mdgxb7sfk3gki1yp2qhkanav13i6q1"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f    ; no tests
       #:phases
       (modify-phases %standard-phases
         (add-before 'install 'make-info
           (lambda _
             (invoke "make" "info"))))))
    (native-inputs
     (list texinfo))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/magit/magit-popup")
    (synopsis "Define prefix-infix-suffix command combos")
    (description
     "This library implements a generic interface for toggling switches and
setting options and then invoking an Emacs command which does something with
these arguments.  The prototypical use is for the command to call an external
process, passing on the arguments as command line arguments.")
    (license license:gpl3+)))

(define-public emacs-meyvn
  (let ((commit "8d00ada6daa5617fa60f76e0be2cf2f5d1babcf9")) ;version bump
    (package
      (name "emacs-meyvn")
      (version "1.7")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/danielsz/meyvn-el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ncilsn0ih01w6hjdn529jkapiv4nnkway07j2b5fndkrlgk2ry4"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-cider
                               (@(bost gnu packages emacs-build) emacs-dash)
                               emacs-geiser
                               emacs-parseclj
                               emacs-parseedn
                               emacs-projectile
                               emacs-s))
      (home-page "https://github.com/danielsz/meyvn-el")
      (synopsis "Emacs client for the Meyvn build tool")
      (description
       "This package provides an Emacs client for the @url{https://meyvn.org, Meyvn} build tool.")
      (license license:gpl3+))))

(define-public emacs-minions
  (package
    (name "emacs-minions")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tarsius/minions")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rinshdxln1wvzf7by8gq9wiqgcqy406k5jl1f86jd17b3wv5bxx"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command
           #~(list "make" "check-declare")))
    (propagated-inputs
     (list emacs-compat (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/tarsius/minions")
    (synopsis "Minor-mode menu for the mode line")
    (description
     "This package implements a menu that lists enabled minor-modes, as well
as commonly but not currently enabled minor-modes.  It can be used to toggle
local and global minor-modes, to access mode-specific menus, and to get help
about modes.

This menu is intended as a replacement for the incomplete yet wide list of
enabled minor-modes that is displayed in the mode line by default.  To use the
menu like this, enable Minions mode.

Alternatively the menu can be bound globally, for example:
@code{(global-set-key [S-down-mouse-3] 'minions-minor-modes-menu)}.")
    (license license:gpl3+)))

(define-public emacs-speed-type
  (package
    (name "emacs-speed-type")
    (version "1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dakra/speed-type")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1rw3lgm65jxcs7vbj0055ays4wv23mk2kj3xivnqmhnm030vk868"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command
      #~(list "emacs" "-Q" "--batch" "-L" "."
              "-l" "test-speed-type.el"
              "-f" "ert-run-tests-batch-and-exit")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'skip-failing-test
            ;; This test requires an internet connection.
            (lambda _
              (substitute* "test-speed-type.el"
                (("\\(ert-deftest speed-type--retrieve-test .*" all)
                 (string-append all " (skip-unless nil)"))))))))
    (native-inputs (list (@(bost gnu packages emacs-build) emacs-dash)))
    (propagated-inputs (list emacs-compat))
    (home-page "https://github.com/dakra/speed-type")
    (synopsis "Practice touch/speed typing in GNU Emacs")
    (description
     "Speed Type allows you to practice your touch typing skills.  You can
test yourself by typing snippets from online books or use any piece of text or
code you have in Emacs.  Speed Type keeps track of your stats (WPM, CPM,
accuracy) while you are typing.")
    (license license:gpl3+)))

(define-public emacs-ghq
  (package
    (name "emacs-ghq")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rcoedo/emacs-ghq")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10a7rxmijwmdkfb5rgavd8inc3a45q0m57dxdf6v62bcy00kmw4l"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'set-ghq-location
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((ghq (search-input-file inputs "/bin/ghq")))
                (substitute* "ghq.el"
                  (("\"ghq") (string-append "\"" ghq)))))))))
    (inputs
     (list ghq))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
    (home-page "https://github.com/rcoedo/emacs-ghq")
    (synopsis "Emacs interface for @code{ghq} tool")
    (description
     "This package provides a set of functions wrapping @code{ghq}, a tool for
organizing remote Go repository clones.")
    (license license:gpl3+)))

(define-public emacs-typit
  (package
    (name "emacs-typit")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mrkkrp/typit")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0djxmni5mfc9wzm0zg7fsd7138ic5qznbmqd5jyrk4mpf0li8nhy"))))
    (build-system emacs-build-system)
    (arguments
     '(#:include (cons "^dict/" %default-include)))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-f) emacs-mmt))
    (home-page "https://github.com/mrkkrp/typit")
    (synopsis "Typing game for Emacs with two difficulties")
    (description "Emacs Typit is a typing game for Emacs.  Words that are
picked randomly from the most frequent words in language you're practicing,
until time is up.")
    (license license:gpl3+)))

(define-public emacs-shroud
  (package
    (name "emacs-shroud")
    (version "1.105")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.savannah.gnu.org/git/emacs-shroud.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q2pb3w8s833fjhkzicciw2php4lsnismad1dnwgp2lcway757ra"))))
    (build-system gnu-build-system)
    (arguments
     `(#:modules ((guix build gnu-build-system)
                  ((guix build emacs-build-system) #:prefix emacs:)
                  (guix build utils))
       #:imported-modules (,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils))
       #:configure-flags (list (string-append "--with-lispdir="
                                              (emacs:elpa-directory %output)))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'expand-load-path
           (assoc-ref emacs:%standard-phases 'expand-load-path)))))
    (native-inputs
     (list autoconf automake texinfo perl emacs-minimal))
    (propagated-inputs
     (list emacs-bui
           (@(bost gnu packages emacs-build) emacs-dash)
           (@(bost gnu packages emacs-build) emacs-f)
           emacs-s
           gnupg
           shroud))
    (home-page "https://www.nongnu.org/emacs-shroud")
    (synopsis "Emacs interface to the Shroud password manager")
    (description
     "This package provides an Emacs interface to the Shroud password manager,
using the Buffers User Interface library.  You can view, copy, and edit secrets
from within Emacs.")
    (license license:gpl3+)))

(define-public emacs-unpackaged
  (let ((commit "0c1f447dab29697d4e30806022f28657c1489375")
        (revision "4"))
    (package
      (name "emacs-unpackaged")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/unpackaged.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "042vcffg1scq6zq8rhv3f2hsl4ychr1gx6hlp23b8hfmz268fima"))))
      (build-system emacs-build-system)
      (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash)
                               emacs-esxml
                               emacs-org
                               emacs-s
                               emacs-hydra
                               emacs-use-package
                               emacs-ts))
      (home-page "https://github.com/alphapapa/unpackaged.el")
      (synopsis "Useful snippets of Emacs Lisp code")
      (description
       "This package provides Emacs Lisp utilities for a variety
of tasks, including version control, task management, and regex-based
replacement.")
      (license license:gpl3+))))

(define-public emacs-haskell-mode
  (let ((commit "e9c356739310332afe59b10ffa2e6c3e76f124e3")
        (revision "0"))
    (package
    (name "emacs-haskell-mode")
    (version (git-version "17.5" revision commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/haskell/haskell-mode")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mkp9b31ai1z6sccx8cff40viryamw7dm85acig3q82dwlbmxx98"))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (native-inputs
     (list emacs-minimal emacs-el-search emacs-stream texinfo))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags #~(list
                      (string-append "EMACS=" #$emacs-minimal "/bin/emacs"))
      #:modules `((ice-9 match)
                  (srfi srfi-26)
                  ((guix build emacs-build-system) #:prefix emacs:)
                  ,@%default-gnu-imported-modules)
      #:imported-modules `(,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-before 'build 'pre-build
            (lambda* (#:key inputs #:allow-other-keys)
              (define (el-dir store-dir)
                (match (find-files store-dir "\\.el$")
                  ((f1 f2 ...) (dirname f1))
                  (_ "")))

              (let ((sh (search-input-file inputs "/bin/sh")))
                (define emacs-prefix? (cut string-prefix? "emacs-" <>))

                (setenv "SHELL" "sh")
                (setenv "EMACSLOADPATH"
                        (string-concatenate
                         (map (match-lambda
                                (((? emacs-prefix? name) . dir)
                                 (string-append (el-dir dir) ":"))
                                (_ ""))
                              inputs)))
                (substitute* (find-files "." "\\.el") (("/bin/sh") sh)))))
          (add-before 'check 'delete-failing-tests
            ;; XXX: these tests require GHC executable, which would be a big
            ;; native input.
            (lambda _
              (with-directory-excursion "tests"
                ;; File `haskell-indent-tests.el' fails with
                ;; `haskell-indent-put-region-in-literate-2'
                ;; on Emacs 27.1+
                ;; XXX: https://github.com/haskell/haskell-mode/issues/1714
                (for-each delete-file
                          '("haskell-indent-tests.el"
                            "haskell-customize-tests.el"
                            "inferior-haskell-tests.el"))

                ;; requires many external tools (e.g. git, hasktags)
                (substitute* "haskell-mode-tests.el"
                  (("\\(ert-deftest haskell-generate-tags.*" all)
                   (string-append all " (skip-unless nil)"))))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (el-dir (emacs:elpa-directory out))
                     (doc (string-append
                           out "/share/doc/haskell-mode-" #$version))
                     (info (string-append out "/share/info")))
                (define (copy-to-dir dir files)
                  (for-each (lambda (f)
                              (install-file f dir))
                            files))

                (with-directory-excursion "doc"
                  (invoke "makeinfo" "haskell-mode.texi")
                  (install-file "haskell-mode.info" info))
                (copy-to-dir doc '("CONTRIBUTING.md" "NEWS" "README.md"))
                (copy-to-dir el-dir (find-files "." "\\.elc?"))))))))
    (home-page "https://github.com/haskell/haskell-mode")
    (synopsis "Haskell mode for Emacs")
    (description
     "This is an Emacs mode for editing, debugging and developing Haskell
programs.")
    (license license:gpl3+))))

;; (define-public emacs-lean4-mode
;;   (package
;;     (name "emacs-lean4-mode")
;;     (version "1.1.2")
;;     (source (origin
;;               (method git-fetch)
;;               (uri (git-reference
;;                      (url "https://github.com/leanprover-community/lean4-mode.git")
;;                      (commit version)))
;;               (file-name (git-file-name name version))
;;               (sha256
;;                (base32
;;                 "1i4l614n0hs02y0a4xfnzc4xkilkp6bzx28pys4jkp96vp2ivf0c"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list
;;       #:tests? #f                       ; no tests
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           (add-after 'install 'install-data
;;             (lambda _
;;               (let ((data (string-append (elpa-directory #$output) "/data")))
;;                 (mkdir-p data)
;;                 (copy-recursively "data" data)))))))
;;     ;; TODO: Just emacs-magit-section instead of emacs-magit would be enough.
;;     (propagated-inputs
;;      (list emacs-compat emacs-lsp-mode (@(bost gnu packages emacs-build) emacs-dash) emacs-magit))
;;     (synopsis "Lean 4 major mode for Emacs")
;;     (description "This package provides a major mode for the Lean theorem
;; prover, version 4.")
;;     (home-page "https://lean-lang.org/")
;;     (license license:asl2.0)))

(define-public emacs-dante
  (package
    (name "emacs-dante")
    (version "1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jyp/dante")
                    (commit version)))
              (sha256
               (base32
                "0q7hackvaplh1f645ngd76f2ls5mvg93xicr3rkxr07hd36yihag"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-company
           (@(bost gnu packages emacs-build) emacs-dash)
           (@(bost gnu packages emacs-build) emacs-f)
           emacs-flycheck
           emacs-haskell-mode
           emacs-lcr
           emacs-s))
    (home-page "https://github.com/jyp/dante")
    (synopsis "Minor mode for interactive Haskell")
    (description
     "This package provides a minor mode for Haskell development that
supports type hints, definition-jumping, completion, and more.")
    (license license:gpl3+)))

(define-public emacs-flycheck
  (package
    (name "emacs-flycheck")
    (version "35.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/flycheck/flycheck/")
              (commit (string-append "v" version))))
       (sha256
        (base32 "1jj9w1j1qgpj3cdihwkgaj7nd714a0sgsydh413j9rsv6a3d4cgg"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (native-inputs
     (list emacs-shut-up))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'change-flycheck-version
            (lambda _
              (substitute* "flycheck.el"
                (("\\(pkg-info-version-info 'flycheck\\)")
                 (string-append "\"" #$version "\""))))))
      ;; TODO: many failing tests
      #:tests? #f
      #:test-command
      #~(list "emacs" "-Q" "--batch"
              "-L" "."
              "--load" "test/flycheck-test"
              "--load" "test/run.el"
              "-f" "flycheck-run-tests-main")))
    (home-page "https://www.flycheck.org")
    (synopsis "On-the-fly syntax checking")
    (description
     "This package provides on-the-fly syntax checking for GNU Emacs.  It is a
replacement for the older Flymake extension which is part of GNU Emacs, with
many improvements and additional features.

Flycheck provides fully-automatic, fail-safe, on-the-fly background syntax
checking for over 30 programming and markup languages with more than 70
different tools.  It highlights errors and warnings inline in the buffer, and
provides an optional IDE-like error list.")
    (license license:gpl3+)))                     ;+GFDLv1.3+ for the manual

(define-public emacs-fb2-reader
  (let ((commit "9836db284749e0cef4c43c2cb5358c82ae9b8589")) ; version bump
    (package
      (name "emacs-fb2-reader")
      (version "0.1.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jumper047/fb2-reader")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vx4b9wnmx1bng8wak5r7yryyvgib4m46l6b877xzkdhsjr3rbsi"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command
        #~(list "buttercup" "-L" ".")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'qualify-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((unzip (search-input-file inputs "/bin/unzip")))
                  (substitute* "fb2-reader.el"
                    (("unzip") unzip)))))
            (add-after 'unpack 'fix-tests
              (lambda _
                ;; Lexical binding is required for compatibility with recent
                ;; Buttercup.
                (emacs-batch-edit-file "tests/test-fb2-reader.el"
                  '(progn
                    (insert ";;; -*-lexical-binding:t -*-\n")
                    (basic-save-buffer)))
                ;; Fix bogus function name.
                (substitute* "tests/test-fb2-reader.el"
                  (("fb2-reader-render") "fb2-reader-render-xml")))))))
      (inputs (list unzip))
      (native-inputs
       (list emacs-async emacs-buttercup (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-f) emacs-visual-fill-column))
      (home-page "https://github.com/jumper047/fb2-reader")
      (synopsis "Emacs plugin to read FictionBook2 ebooks")
      (description "FB2 Reader provides a major mode for reading
FictionBook2 (@file{.fb2} and @file{.fb2.zip} files) ebooks.")
      (license license:gpl3+))))

(define-public emacs-alarm-clock
  (package
    (name "emacs-alarm-clock")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wlemuel/alarm-clock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0vdwvrbj79ylaz5ffa2bpfy4kzi1s6hf6bxijvyw7h8y6bd196av"))))
    (build-system emacs-build-system)
    (arguments
     (list #:include #~(cons "alarm.mp3" %default-include)
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'configure
                 (lambda* (#:key inputs #:allow-other-keys)
                   (substitute* "alarm-clock.el"
                     (("\"mpg123\"")
                      (string-append
                       "\"" (search-input-file inputs "bin/mpg123") "\""))
                     (("notify-send")
                      (search-input-file inputs "bin/notify-send"))))))))
    (inputs
     (list libnotify mpg123))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-f)))
    (home-page "https://github.com/wlemuel/alarm-clock")
    (synopsis "Alarm clock for Emacs")
    (description "Alarm Clock provides an alarm clock for Emacs.")
    (license license:gpl3+)))

(define-public emacs-relative-buffers
  (let ((release "0.0.1")
        (revision "0")
        (commit "9762fe268e9ff150dcec2e2e45d862d82d5c4008"))
    (package
      (name "emacs-relative-buffers")
      (version (git-version release revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsattic/relative-buffers")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0fzhwbpyndwrmxip9zlcwkrr675l5pzwcygi45hv7w1hn39w0hxp"))
         (snippet
          '(begin
             ;; Delete the Cask test runners.
             (for-each delete-file '("Cask" "test/test-helper.el"))))))
      (build-system emacs-build-system)
      (native-inputs
       (list emacs-ert-runner))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f) emacs-s))
      (home-page "https://github.com/emacsattic/relative-buffers")
      (synopsis "Minor mode to rename buffers by project structure")
      (description
       "This package provides a minor mode for renaming buffers according to
project structure.  For Python buffers, that will be the whole module name.
For temporary files and directories, that will be the relative path from the
project root.")
      (license license:gpl3+))))

(define-public emacs-alchemist
  (package
    (name "emacs-alchemist")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://stable.melpa.org/packages/"
                           "alchemist-" version ".tar"))
       (sha256
        (base32 "0ygwf9d739zqc8dcckw0j0bqkipw7cmxbrx3l281x237a3d384yw"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-elixir-mode (@(bost gnu packages emacs-build) emacs-dash) emacs-company emacs-pkg-info))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-server
            (lambda _
              (let ((server (string-append (elpa-directory #$output)
                                           "/alchemist-server")))
                (mkdir-p server)
                (copy-recursively "alchemist-server" server)
                (delete-file-recursively (string-append server "/test"))))))))
    (home-page "https://www.github.com/tonini/alchemist.el")
    (synopsis "Elixir tooling integration into Emacs")
    (description
     "This package brings you all the Elixir tooling and power inside your Emacs
editor.  It comes with commands to compile, execute and test your code, spawn
an interactive shell, and look up definitions and documentation as well as
code completion and project management support.")
    (license license:gpl3+)))

(define-public emacs-auto-sudoedit
  (package
    (name "emacs-auto-sudoedit")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ncaq/auto-sudoedit")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rhdvrj2rjbvl7vkb0wcp6krqxcaigl7jk9z8yvhx6s4cm2qli6q"))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-f)))
    (build-system emacs-build-system)
    (home-page "https://github.com/ncaq/auto-sudoedit")
    (synopsis "Automatically re-open read-only files with sudo")
    (description
     "This package automatically reopens a file or directory with
@command{sudo} if it cannot write to it.")
    (license license:expat)))

(define-public emacs-bluetooth
  (package
    (name "emacs-bluetooth")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://elpa.gnu.org/packages/"
                           "bluetooth-" version ".tar"))
       (sha256
        (base32 "1chi9xjg5zcg6qycn2n442adhhmip1vpvg12szf1raq3zhg7lr01"))))
    (build-system emacs-build-system)
    (inputs
     (list bluez dbus))
    (propagated-inputs
     (list emacs-compat (@(bost gnu packages emacs-build) emacs-dash) emacs-transient))
    (home-page "https://gitlab.com/rstocker/emacs-bluetooth")
    (synopsis "Manage Bluetooth devices using Emacs")
    (description
     "This package implements basic Bluetooth management functionality, such
as connecting and disconnecting devices, setting properties and aliases,
putting the adapter in discovery mode and controlling its power supply.  It
also includes a pairing agent.")
    (license license:gpl3+)))

(define-public emacs-ag
  (package
    (name "emacs-ag")
    (version "0.48")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/ag.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1p918y24vcn2pdliaymd210xp9fvhd4a1srqbv2lfiqrh59yjidx"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'substitute-ag-path
            (lambda* (#:key inputs #:allow-other-keys)
              (make-file-writable "ag.el")
              (emacs-substitute-variables "ag.el"
                ("ag-executable" (search-input-file inputs "/bin/ag")))))
          (add-before 'install 'make-info
            (lambda _
              (with-directory-excursion "docs"
                (invoke "make" "info"))))
          (add-after 'install 'install-info
            (lambda _
              (install-file "docs/_build/texinfo/agel.info"
                            (string-append #$output "/share/info")))))))
    (inputs (list the-silver-searcher))     ; 'ag' executable
    (native-inputs
     (list emacs-ert-runner emacs-undercover python-sphinx texinfo))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
    (home-page "https://github.com/Wilfred/ag.el")
    (synopsis "Front-end for ag (the-silver-searcher) for Emacs")
    (description "This package provides the ability to use the silver
searcher, a code searching tool, sometimes abbreviated to @code{ag}.  Features
include version control system awareness, use of Perl compatible regular
expressions, editing the search results directly and searching file names
rather than the contents of files.")
    (license license:gpl3+)))

(define-public emacs-xenops
  (package
    (name "emacs-xenops")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dandavison/xenops/archive/"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1gaym5bl6fhdp4pa283qcx5qf77wz2g7xl9n1gyvvl9yl0kvrb48"))))
    (propagated-inputs (list emacs-aio emacs-auctex emacs-avy (@(bost gnu packages emacs-build) emacs-dash)
                             (@(bost gnu packages emacs-build) emacs-f) emacs-s))
    (build-system emacs-build-system)
    (arguments
     (list
      #:lisp-directory "lisp"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'set-home
            (lambda _
              (setenv "HOME" "/tmp"))))))
    (synopsis "WYSIWYG LaTeX environment")
    (description "This package provides a WYSIWYG LaTeX environment.
It uses @command{dvisvgm}, @command{xclip}, @command{pngpaste} and
@command{latex}.")
    (home-page "https://github.com/dandavison/xenops")
    (license license:expat)))

(define-public emacs-autothemer
  (let ((commit "8f72afc6dba5ad7cc3a201a084fd20571f945d2e")) ;version bump
    (package
      (name "emacs-autothemer")
      (version "0.2.18")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sebastiansturm/autothemer")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "15f7i39937riswpwjpc1ryg2v0rqj944pwf7rp2ry56rbx4vgl97"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "tests/autothemer-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/sebastiansturm/autothemer")
      (synopsis "Conveniently create Emacs themes")
      (description
       "Autothemer provides a thin layer on top of @code{deftheme} and
@code{custom-theme-set-faces} that creates a new custom color theme, based on
a set of simplified face specifications and a user-supplied color palette.")
      (license license:gpl3+))))

(define-public emacs-campus
  (let ((commit "0a475cd7704001d8dc8280acb91a317db797933b")
        (revision "0"))
    (package
      (name "emacs-campus")
      (version (git-version "0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/eshrh/campus-emacs")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "13vych4kk6adn15scl1s4znnbmfjvihfglxglrqqp2llzh0wsnlm"))))
      (arguments (list #:tests? #f)) ; There are no tests.
      (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (build-system emacs-build-system)
      (home-page "https://github.com/eshrh/campus-emacs")
      (synopsis "Simple and sane approach to repl programming")
      (description
       "Campus is a simple but effective improvement to the
inferior-process repl development experience in Emacs.")
      (license license:gpl3+))))

(define-public emacs-chronometrist
  (package
    (name "emacs-chronometrist")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://tildegit.org/contrapunctus/chronometrist")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qpkpkipmac24m3ng4ahsml3vi15qcvmid3g02pbpgbpc113zfpl"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:lisp-directory "elisp"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-doc
            ;; Documentation consists of several Markdown files.
            (lambda _
              (let ((doc (string-append #$output
                                        "/share/doc/emacs-chronometrist-"
                                        #$version)))
                (with-directory-excursion "../doc"
                  (for-each (lambda (f) (install-file f doc))
                            (cons* "../UNLICENSE"
                                   "../WTFPL"
                                   (find-files "." "\\.md$"))))))))))
    (propagated-inputs
     (list emacs-alert (@(bost gnu packages emacs-build) emacs-dash) emacs-s emacs-spark emacs-ts))
    (home-page "https://github.com/contrapunctus-1/chronometrist")
    (synopsis "Time tracker for Emacs")
    (description "Chronometrist is a time tracker in Emacs, largely modelled
after the Android application, @emph{A Time Tracker}.

Its features are:
@itemize
@item Simple and efficient to use,
@item Displays useful information about your time usage,
@item Support for both mouse and keyboard,
@item Human errors in tracking are easily fixed by editing a plain text file,
@item Hooks to let you perform arbitrary actions when starting/stopping tasks.
@end itemize")
    ;; Software is dual-licensed.
    (license (list license:unlicense license:wtfpl2))))

(define-public emacs-citeproc
  (package
    (name "emacs-citeproc")
    (version "0.9.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/andras-simonyi/citeproc-el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1l74c2f2xjzsp3i331sw3db4fhbvdbwyd856j1ygldwrh4rli9ml"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:emacs emacs ;need libxml support
      #:tests? #f)) ;tests require missing data
    (propagated-inputs (list emacs-compat
                             (@(bost gnu packages emacs-build) emacs-dash)
                             (@(bost gnu packages emacs-build) emacs-f)
                             emacs-parsebib
                             emacs-queue
                             emacs-s
                             emacs-string-inflection))
    (home-page "https://github.com/andras-simonyi/citeproc-el")
    (synopsis "Citation Style Language (CSL) processor for Emacs")
    (description
     "Citeproc-el is an Emacs Lisp library for rendering citations
and bibliographies in styles described in the Citation Style
Language (CSL), an XML-based, open format to describe the formatting
of bibliographic references.")
    (license license:gpl3+)))

(define-deprecated/public emacs-citeproc-el emacs-citeproc
  (deprecated-package "emacs-citeproc-el" emacs-citeproc))

(define-public emacs-direnv
  (package
    (name "emacs-direnv")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wbolster/emacs-direnv")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cf5npgksl9a03mnfdhfdhlf46gr9qz9adjxz3dbckq9b1vl0dfc"))))
    (build-system emacs-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-in-direnv
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((direnv (search-input-file inputs "/bin/direnv")))
               (substitute* "direnv.el"
                 (("\"direnv\"") (string-append "\"" direnv "\"")))))))))
    (inputs
     (list direnv))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-with-editor))
    (home-page "https://github.com/wbolster/emacs-direnv")
    (synopsis "Direnv integration for Emacs")
    (description
     "This package provides support for invoking direnv to get the environment
for the current file and updating the environment within Emacs to match.

Direnv can be invoked manually, and a global minor mode is included that will
update the environment when the active buffer changes.

Using emacs-direnv means that programs started from Emacs will use the
environment set through Direnv.")
    (license license:gpl3+)))

(define-public emacs-noman
  (package
    (name "emacs-noman")
    (version "0.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/andykuszyk/noman.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rh1p9nlhkmhfqmp507rz8hwfgwrdvxx0zba41lxsd2admai90wv"))
       (snippet #~(begin
                    (for-each delete-file
                              '("makem.sh" "Makefile" "screencast.gif"))))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command
           #~(list #$(file-append (this-package-native-input "makem")
                                  "/bin/makem.sh") "test")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-test
                 (lambda _
                   (substitute* "tests/noman-tests.el"
                     (("#!/bin/bash")
                      (string-append "#!" (which "bash")))))))))
    (native-inputs
     (list bash emacs-ert-runner (@(bost gnu packages emacs-build) emacs-f) makem-minimal))
    (synopsis "Emacs package for browsing CLI command docs without man pages")
    (description
     "Noman is an Emacs package that parses command line help from flags like
@code{--help}, and presents it in an easy-to-navigate Emacs buffer.")
    (home-page "https://github.com/andykuszyk/noman.el")
    (license license:gpl3+)))

(define-public emacs-bui
  (package
    (name "emacs-bui")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://notabug.org/alezost/emacs-bui.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0sszdl4kvqbihdh8d7mybpp0d8yw2p3gyiipjcxz9xhvvmw3ww4x"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://notabug.org/alezost/emacs-bui")
    (synopsis "Buffer interface library for Emacs")
    (description
     "BUI (Buffer User Interface) is a library for making @code{list} and
@code{info} interfaces to display an arbitrary data of the same
type, for example: packages, buffers, files, etc.")
    (license license:gpl3+)))

(define-public emacs-guix
  (let ((commit "66b935020d93cdbbff0b0ed3b1d2195724a46821")
        (revision "8"))
    (package
      (name "emacs-guix")
      (version (git-version "0.5.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://codeberg.org/guix/emacs-guix/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1pm1nyy1r704wjg4hfdrrxlf1mn327wk0vkghwy8wsp4f84j5j7d"))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:modules '((guix build gnu-build-system)
                    ((guix build emacs-build-system) #:prefix emacs:)
                    (guix build utils))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils))
        #:tests? #f    ; no tests
        #:configure-flags
        #~(list (string-append "--with-lispdir="
                               (emacs:elpa-directory #$output)))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'expand-load-path
              (lambda _
                ((assoc-ref emacs:%standard-phases 'expand-load-path)
                 #:prepend-source? #f))))))
      (native-inputs
       (list autoconf automake emacs-minimal pkg-config texinfo))
      (inputs
       (list (lookup-package-input guix "guile")
             guix))
      (propagated-inputs
       (list emacs-bui
             (@(bost gnu packages emacs-build) emacs-dash)
             emacs-edit-indirect
             emacs-geiser
             emacs-geiser-guile
             emacs-magit-popup
             guile-gcrypt))
      (home-page "https://guix.gnu.org")
      (synopsis "Emacs interface for GNU Guix")
      (description
       "Emacs-Guix provides a visual interface, tools and features for the GNU
Guix package manager.  Particularly, it allows you to do various package
management tasks from Emacs.  To begin with, run @code{M-x guix-about} or
@code{M-x guix-help} command.")
      (license license:gpl3+))))

(define-public emacs-minitest
  (package
    (name "emacs-minitest")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arthurnn/minitest-emacs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0d8kg68yy5x1y3ivj43vzcakb3gii6bh8jm40g4sah5f53bbrs16"))))
    (build-system emacs-build-system)
    (arguments
     '(#:include (cons "^snippets\\/minitest-mode\\/" %default-include)
       #:exclude (delete "^[^/]*tests?\\.el$" %default-exclude)))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f)))
    (home-page "https://github.com/arthurnn/minitest-emacs")
    (synopsis "Emacs minitest mode")
    (description
     "The minitest mode provides commands to run the tests for the current
file or line, as well as rerunning the previous tests, or all the tests for a
project.

This package also includes relevant snippets for yasnippet.")
    (license license:expat)))

(define-public emacs-es-mode
  (package
    (name "emacs-es-mode")
    (version "4.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dakrone/es-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qhfnd5anp5qrmravv7ks5ix763xnki2f5jwcyj70qyxwr0l60cg"))))
    (build-system emacs-build-system)
    (propagated-inputs
     ;; The version of org in Emacs 24.5 is not sufficient, and causes tables
     ;; to be rendered incorrectly
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-org emacs-spark))
    (home-page "https://github.com/dakrone/es-mode")
    (synopsis "Major mode for editing Elasticsearch queries")
    (description "@code{es-mode} includes highlighting, completion and
indentation support for Elasticsearch queries.  Also supported are
@code{es-mode} blocks in @code{org-mode}, for which the results of queries can
be processed through @code{jq}, or in the case of aggregations, can be
rendered in to a table.  In addition, there is an @code{es-command-center}
mode, which displays information about Elasticsearch clusters.")
    (license license:gpl3+)))

(define-public emacs-litable
  (let ((commit "b0278f3f8dcff424bfbdfdefb545b1fbff33206f"))
    (package
      (name "emacs-litable")
      (version (git-version "0.1" "0" commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Fuco1/litable")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0bny40hv9a024n01clxns351cs4j4ifhgcc7m4743xncqf612p7g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/Fuco1/litable/")
      (synopsis "Dynamic evaluation replacement with Emacs")
      (description "This package provides dynamic evaluation in Emacs.")
      (license license:gpl3+))))

(define-public emacs-calc-currency
  (let ((commit "7021d892ef38b01b875082aba4bae2517ce47ae6")
        (revision "0"))
    (package
      (name "emacs-calc-currency")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jws85/calc-currency")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0y4m0hasg4ji6zfis3088hq90pm9998lnnh8yg9g8yqqaqpfizp8"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "--batch"
                               "-L" "."
                               "-l" "test/calc-currency-init.el"
                               "-l" "test/calc-currency-ecb-test.el"
                               "-l" "test/calc-currency-oxr-test.el"
                               ;; test/calc-currency-utils-test.el fails
                               "-f" "ert-run-tests-batch-and-exit")))
      (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-f)))
      (home-page "https://github.com/jws85/calc-currency")
      (synopsis "Add currency units to Emacs Calc")
      (description "This package adds custom units to the units table in Emacs
Calc by fetching exchange rates backends.")
      (license license:gpl3+))))

(define-public emacs-standard-dirs
  (package
    (name "emacs-standard-dirs")
    (version "2.0.0")
    (home-page "https://github.com/lafrenierejm/standard-dirs.el")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r814qcrhvx4qlx4sdzwdmrhiryslqclx0bnpp0qcrbx6g8qfl25"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-f) emacs-s))
    (synopsis "Platform-specific paths for config, cache, and other data")
    (description
     "This package provides platform-specific paths for reading and writing
configuration, cache, and other data.")
    (license license:gpl3+)))

(define-public emacs-org-now
  (let ((commit "8f6b277a73f1c66e58ccb4b7f40d406851befc91"))
    (package
      (name "emacs-org-now")
      (version (git-version "0.1-pre" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/org-now")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "117zzkryznznk6h4i1jqzdn888nl019xrgxm2gza0lndx8dxsg2c"))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (build-system emacs-build-system)
      (home-page "https://github.com/alphapapa/org-now")
      (synopsis "Show current Org tasks in a sidebar")
      (description
       "This package provides commands to show Org headings in a sidebar
window while working on them.  After defining one heading as the \"now\"
heading, other headings can be refiled to it with one command, and back to
their original location with another.")
      (license license:gpl3+))))

(define-public emacs-orgmdb
  (package
    (name "emacs-orgmdb")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/isamert/orgmdb.el")
             (commit "66c13abdb84e0f0a31bae6cfda27478771d58d8e")))
       (sha256
        (base32
         "1hvxha0ih9jhvwj07l6jnpf2vzhgvb6ii73g49c8saxld61l0frf"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'configure
                 (lambda* (#:key inputs #:allow-other-keys)
                   (substitute* "orgmdb.el"
                     (("\"fd ")
                      (string-append "\""
                                     (search-input-file inputs "/bin/fd")
                                     " "))))))))
    (inputs
     (list fd))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-org emacs-s))
    (home-page "https://github.com/isamert/orgmdb.el")
    (synopsis "Emacs' Org mode watchlist manager and OMDb API client")
    (description "This package adds tools for managing your watchlist in Emacs'
Org mode and some functions for interacting with the OMDb API.")
    (license license:gpl3+)))
(define-public emacs-flycheck-rust
  (package
    (name "emacs-flycheck-rust")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/flycheck/flycheck-rust")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fh6j5w2387nh2fwwjphkhq17cgj5m2q5k0fhidvgc2w65lzbr1r"))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-flycheck emacs-let-alist))
    (native-inputs (list emacs-buttercup
                         rust-bootstrap
                         `(,rust-bootstrap "cargo")))
    (build-system emacs-build-system)
    (home-page "https://github.com/flycheck/flycheck-rust")
    (synopsis "Rust/Cargo support for Flycheck")
    (description
     "This Flycheck extension configures Flycheck automatically for
the current Cargo project.")
    (license license:gpl3+)))

(define-public emacs-elastic-modes
  (let ((commit "ea49bb03b78cb9fd17655990223e3095f137a3ce")
        (revision "1"))
    (package
      (name "emacs-elastic-modes")
      (version "1.0.0")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jyp/elastic-modes")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1dkigkjw4i9nz5rl0dnic16ljdnp5cyz2xic3hc2myqnjlqnc6z6"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #false)) ;no tests
      (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/jyp/elastic-modes")
      (synopsis "Text and code alignment for variable-width fonts")
      (description
       "This is an Emacs package for text and code alignment for
variable-width (i.e., proportional, or variable pitch) fonts.")
      (license license:gpl3+))))

(define-public emacs-docker-compose-mode
  (package
    (name "emacs-docker-compose-mode")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/meqif/docker-compose-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1fbcxwfvm33xcdj3cs26d9i1zyrryyjjkv7sc3mfxd45nq8d3ivj"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f) emacs-yaml-mode))
    (home-page "https://github.com/meqif/docker-compose-mode/")
    (synopsis "Major mode for editing @file{docker-compose} files")
    (description
     "This is a major mode for @file{docker-compose} files that provides
completion of relevant keywords.")
    (license license:expat)))

(define-public emacs-ob-ipython
  (package
    (name "emacs-ob-ipython")
    (version "20180224")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (commit "7147455230841744fb5b95dcbe03320313a77124")
                    (url "https://github.com/gregsexton/ob-ipython")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1a10fc2jk37ni5sjjvf87s5nyaz2a6h2mlj5dxh4dhv5sd3bb85p"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-f)))
    (home-page "http://www.gregsexton.org")
    (synopsis "Org-Babel functions for IPython evaluation")
    (description "This package adds support to Org-Babel for evaluating Python
source code using IPython.")
    (license license:gpl3+)))

(define-public emacs-ob-async
  (package
    (name "emacs-ob-async")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/astahlman/ob-async")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10x4hxrjm4pr6vg42a961h9ilqzyd0l0fv7fsbq9clxi439f1nd6"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; ~1/2 tests fail.
           #:test-command
           #~(list "ert-runner" "--verbose" "--debug" "-l" "ob-async.el")))
    (native-inputs
     (list emacs-ert-runner))
    (propagated-inputs
     (list emacs-async (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/astahlman/ob-async")
    (synopsis "Asynchronous src_block execution for org-babel")
    (description "@code{ob-async} enables asynchronous execution of org-babel
src blocks.")
    (license license:gpl3+)))

(define-public emacs-company-box
  ;; There is no release yet.  Version is extracted from the main
  ;; file.
  (let ((version "0.0.1")
        (revision "0")
        (commit "be37a9a30dc112ab172af21af694e2cb04a74f85"))
    (package
      (name "emacs-company-box")
      (version (git-version version revision commit))
      (source
       (origin
         (method (@@ (guix packages) computed-origin-method))
         (file-name (string-append name "-" version ".tar.gz"))
         (sha256 #f)
         (uri
          (delay
            (with-imported-modules '((guix build emacs-utils)
                                     (guix build utils))
              #~(begin
                  (use-modules (guix build utils)
                               (guix build emacs-utils))
                  (let* ((dir (string-append "emacs-company-box-" #$version)))

                    (set-path-environment-variable
                     "PATH" '("bin")
                     (list #+emacs-minimal
                           #+(canonical-package bash)
                           #+(canonical-package coreutils)
                           #+(canonical-package gzip)
                           #+(canonical-package tar)))

                    ;; Copy the upstream source
                    (copy-recursively
                     #+(%emacs-lsp-treemacs-upstream-source
                        #:commit commit #:version version
                        #:hash
                        (content-hash
                         "13fgmdy51gqdwijqfvb784pirx4lgva0y7ysi0c3fcx8f82cdj59"))
                     dir)

                    (with-directory-excursion dir
                      ;; The icons are unclearly licensed and possibly non-free,
                      ;; see <https://github.com/emacs-lsp/lsp-treemacs/issues/123>
                      (with-directory-excursion "images"
                        (for-each delete-file-recursively
                                  '("eclipse" "idea" "netbeans")))

                      ;; Also remove any mentions in the source code.
                      (make-file-writable "company-box-icons.el")
                      (emacs-batch-edit-file "company-box-icons.el"
                        '(progn
                          (while (search-forward-regexp
                                  "(defvar company-box-icons-\\([a-z-]*\\)"
                                  nil t)
                            (pcase (match-string 1)
                                   ((or "images"
                                        "all-the-icons"
                                        "icons-in-terminal") nil)
                                   (_ (beginning-of-line)
                                      (kill-sexp)))
                            (basic-save-buffer))))

                      ;; Also patch source to not show broken icons as configuration
                      ;; option.
                      (substitute* "company-box-icons.el"
                        (("- .*, from.*editor.*") "")
                        (("\\(const :tag \"([a-z]*)\".*\\)" all tag)
                         (if (member tag
                                     '("images" "all-the-icons" "icons-in-terminal"))
                             all
                             ""))))

                    (invoke "tar" "cvfa" #$output
                            "--mtime=@0"
                            "--owner=root:0"
                            "--group=root:0"
                            "--sort=name"
                            "--hard-dereference"
                            dir))))))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-company (@(bost gnu packages emacs-build) emacs-dash) emacs-frame-local))
      (home-page "https://github.com/sebastiencs/company-box")
      (synopsis "Company front-end with icons")
      (description
       "Company box is a Company front-end.  It supports different
colors for different backends, associates icons to functions,
variables... and their backends, and displays candidate's
documentation.  It is not limited by the current window size or
buffer's text properties.

This package is not compatible with a TTY.")
      (license license:gpl3+))))
(define-public emacs-math-preview
  (package
    (name "emacs-math-preview")
    (version "5.1.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://gitlab.com/matsievskiysv/math-preview")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0ni08900p0pbajw143iw0b7a62qiqcm9b6jy7pqgpn437vydjx1z"))))
    (build-system emacs-build-system)
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
    (home-page "https://gitlab.com/matsievskiysv/math-preview")
    (synopsis "Preview TeX math equations inline using MathJax")
    (description
     "Emacs math-preview uses MathJax for displaying TeX, MathML and AsciiMath
  math inline in Emacs buffers.")
    (license license:gpl3+)))

(define-public emacs-company-coq
  (package
    (name "emacs-company-coq")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/cpitclaudel/company-coq")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dxi4h8xqq5647k7h89s4pi8nwyj3brlhsckrv3p3b1g4dr6mk3b"))))
    (inputs
     (list emacs-company emacs-company-math (@(bost gnu packages emacs-build) emacs-dash) emacs-yasnippet))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; no tests
    (home-page "https://github.com/cpitclaudel/company-coq")
    (synopsis "Emacs extensions for Proof General's Coq mode")
    (description "This package includes a collection of Company mode backends
for Proof-General's Coq mode, and many useful extensions to Proof-General.  It
features:

@itemize
@item Prettification of operators, types, and subscripts,
@item Auto-completion,
@item Insertion of cases,
@item Fully explicit intros,
@item Outlines, code folding, and jumping to definition,
@item Help with errors,
@item and more.
@end itemize")
    (license license:gpl3+)))

(define-public emacs-multifiles
  ;; There is no tag and no "Version:" keyword.  Using the latest release
  ;; instead.
  (let ((commit "dddfe64b8e1c1cd1f9ccc1f03405477fc0d53897")
        (revision "1"))
    (package
      (name "emacs-multifiles")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magnars/multifiles.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "065l04ylplng1vgykkbn2vnkcs3sn1k2cikx1ha2q8wmgx6bkvai"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))      ; no tests
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/magnars/multifiles.el")
      (synopsis "Edit multiple files in a single Emacs buffer")
      (description
       "This package allows one to view and edit parts of multiple files in
one Emacs buffer.")
      (license license:gpl3+))))

(define-public emacs-company-lsp
  (package
    (name "emacs-company-lsp")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tigersoldier/company-lsp")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1hy1x2w0yp5brm7714d1hziz3rpkywb5jp3yj78ibmi9ifny9vri"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-xyz-2) emacs-lsp-mode)
      emacs-company
      emacs-s
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (native-inputs
     (list emacs-buttercup))
    (arguments
     `(#:test-command '("buttercup" "-L" ".")))
    (home-page "https://github.com/tigersoldier/company-lsp")
    (synopsis "Completion for @code{lsp-mode}")
    (description
     "This package provides completion features that are not possible with
@code{lsp-mode} and @code{company-capf} alone, including support for trigger
characters and asynchronous fetching of completion candidates.")
    (license license:gpl3+)))

(define-public emacs-tagedit
  (package
    (name "emacs-tagedit")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magnars/tagedit")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kq40g46s8kgiafrhdq99h79rz9h5fvgz59k7ralmf86bl4sdmdb"))))
    (build-system emacs-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'remove-spurious-require
                 (lambda _
                   (substitute* "tagedit.el"
                     (("\\(require 'assoc\\)") "")))))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
    (home-page "https://github.com/magnars/tagedit")
    (synopsis "Some Paredit-like features for HTML mode")
    (description
     "This package provides a collection of Paredit-like functions for editing
in HTML mode.")
    (license license:gpl3+)))

(define-public emacs-anki-editor
  ;; Last release was in 2018.
  (let ((commit "546774a453ef4617b1bcb0d1626e415c67cc88df")
        (revision "0")
        (version "0.3.3"))
    (package
      (name "emacs-anki-editor")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/louietan/anki-editor")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1if610hq5j8rbjh1caw5bwbgnsn231awwxqbpwvrh966kdxzl4qf"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-request))
      (home-page "https://github.com/louietan/anki-editor")
      (synopsis "Minor mode for making Anki cards with Org mode")
      (description
       "This package is for people who use Anki as a spaced repetition system
(SRS) but would like to make cards in Org mode.")
      (license license:gpl3+))))
(define-public emacs-org-sidebar
  (package
    (name "emacs-org-sidebar")
    (version "0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alphapapa/org-sidebar")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gccih9wgi31m59flljw4cphfyhlfcqbjih91gkcnldq5z7n83nj"))
       (modules '((guix build utils)))
       (snippet #~(begin
                    (delete-file-recursively "images")
                    ;; Contents of makem package, but no tests.
                    (for-each delete-file
                              '("makem.sh" "Makefile"))))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)
           emacs-org
           emacs-org-ql
           emacs-org-super-agenda
           emacs-s))
    (home-page "https://github.com/alphapapa/org-sidebar")
    (synopsis "Helpful sidebar for Org buffers")
    (description "This package provides a sidebar for Org buffers.  At the
top is a chronological list of scheduled and deadlined tasks in the current
buffer (similar to the Org agenda ,but without all its features), and below
that is a list of all other non-done to-do items.  If the buffer is narrowed,
the sidebar only shows items in the narrowed portion; this allows seeing an
overview of tasks in a subtree.")
    (license license:gpl3+)))

(define-public emacs-org-trello
  (package
    (name "emacs-org-trello")
    (version "0.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/org-trello/org-trello")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "18y5zdjc7zh4jlwz6k1nl13i721rknqm0vp4mxfnmq0sc5a0qva0"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; Old incompatible version of dash is used.
           #:test-command #~(list "ert-runner")))
    (native-inputs (list emacs-ert-runner emacs-undercover))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)
           emacs-deferred
           (@(bost gnu packages emacs-build) emacs-f)
           (@(bost gnu packages emacs-xyz-2) emacs-helm)
           emacs-request
           emacs-s))
    (home-page "https://org-trello.github.io")
    (synopsis "Emacs minor mode for interacting with Trello")
    (description "This package provides an Emacs minor mode to extend
@code{org-mode} with Trello abilities.  Trello is an online project
organizer.")
    (license license:gpl3+)))

(define-public emacs-company-flow
  (let ((commit "76ef585c70d2a3206c2eadf24ba61e59124c3a16")
        (revision "1"))
    (package
      (name "emacs-company-flow")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/aaronjensen/company-flow/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0zs9cblnbkxa0dxw4lyllmybqizxcdx96gv8jlhx20nrjpi78piw"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-company (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/aaronjensen/company-flow/")
      (synopsis "Flow backend for @code{company-mode}")
      (description
       "This package provides completion for JavaScript files utilizing Flow.")
      (license license:gpl3+))))

(define-public emacs-solarized-theme
  (package
    (name "emacs-solarized-theme")
    (version "2.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bbatsov/solarized-emacs/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nwyax9dikpw4fcplnk0az9k1pk02wnhkadvfp325s7rl2j8y23b"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; Tests require a standard tty.
           #:test-command #~(list "make" "run" "CASK=")))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/bbatsov/solarized-emacs")
    (synopsis "Port of the Solarized theme for Emacs")
    (description
     "Solarized for Emacs is a port of the Solarized theme for Vim.  This
package provides a light and a dark variant.")
    (license license:gpl3+)))

(define-public emacs-consult-notes
  (let ((commit "7c9cd970c75fae9a6140ca1beefed9532d8e1b96")
        (revision "0"))
    (package
      (name "emacs-consult-notes")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/mclear-tools/consult-notes/")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1lccpnqqaai6vsjn9v65xhpzs0bmhrsyflaxg3n3iszigmsxrfaz"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))      ;no tests
      (propagated-inputs (list emacs-consult (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (home-page "https://github.com/mclear-tools/consult-notes/")
      (synopsis "Management of personal notes with @code{emacs-consult}")
      (description
       "This package allows selecting notes easily.  Its most basic use is to
integrate directories of files (notes) and to provide easy narrowing via
@code{emacs-consult}.  @code{consult-notes} can be used with any directory (or
directories) of note files.  It easily integrates with note systems like
@code{emacs-zk}, @code{emacs-denote} or @code{emacs-org-roam}.  Additionally, it
may also search org headings in a set of specified files.")
      (license license:gpl3+))))

(define-public emacs-smartparens
  (let ((commit "b629b4e893ba21ba5a381f6c0054bb72f8e96df2")
        (revision "1"))
    (package
      (name "emacs-smartparens")
      (version (git-version "1.11.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Fuco1/smartparens")
               (commit commit)))
         (file-name (git-file-name name version))
         (modules '((guix build utils)
                    (ice-9 ftw)
                    (srfi srfi-26)))
         (snippet
          '(begin
             ;; Taken from nextpnr package.
             (define (delete-all-but directory . preserve)
               (with-directory-excursion directory
                 (let* ((pred
                         (negate (cut member <> (append '("." "..") preserve))))
                        (items (scandir "." pred)))
                   (for-each delete-file items))))
             ;; Only activate basic tests.
             (delete-all-but "test"
                             "test-helper.el"
                             "smartparens-advice-test.el"
                             "smartparens-delete-pair-test.el"
                             "smartparens-elisp-test.el"
                             "smartparens-framework-test.el"
                             "smartparens-get-comment-bounds-test.el"
                             "smartparens-get-paired-expression-elisp-test.el"
                             "smartparens-get-prefix-test.el"
                             "smartparens-get-stringlike-expression-elisp-test.el"
                             "smartparens-get-stringlike-expression-python-test.el"
                             "smartparens-get-stringlike-expression-test.el"
                             "smartparens-get-suffix-test.el"
                             "smartparens-insertion-specification-parser-test.el"
                             "smartparens-markdown-test.el"
                             "smartparens-movement-test.el"
                             "smartparens-org-test.el"
                             "smartparens-region-ok-test.el"
                             "smartparens-rst-test.el"
                             "smartparens-search-fn-test.el"
                             "smartparens-settings-sp-pair-test.el"
                             "smartparens-skip-closing-pair-test.el")))
         (sha256
          (base32 "1nfd10kxd1l8bmxhaghhxphl424yg5qn6xcqaligwc3b406b566w"))))
      (build-system emacs-build-system)
      (native-inputs
       (list emacs-ert-runner emacs-yasnippet))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-markdown-mode))
      (home-page "https://github.com/Fuco1/smartparens")
      (synopsis "Paredit-like insertion, wrapping and navigation with user
defined pairs")
      (description
       "Smartparens is a minor mode for Emacs that deals with parens pairs
and tries to be smart about it.  It started as a unification effort to
combine functionality of several existing packages in a single,
compatible and extensible way to deal with parentheses, delimiters, tags
and the like.  Some of these packages include autopair, textmate,
wrap-region, electric-pair-mode, paredit and others.  With the basic
features found in other packages it also brings many improvements as
well as completely new features.")
      (license license:gpl3+))))

(define-public emacs-eyebrowse
  ;; XXX: Upstream has no tagged release.  Version is extracted from keyword
  ;; in main file.
  (let ((commit "88c7b59aa7c5c93bc23812217213adfa238f977b")
        (revision "0"))
    (package
      (name "emacs-eyebrowse")
      (version (git-version "0.7.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://depp.brause.cc/eyebrowse.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "09s07mvg5bz3dm9sxgn40c7z6d6ry1sdjzsxwgmy825f3xm66avs"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://depp.brause.cc/eyebrowse/")
    (synopsis "Simple-minded way to manage window configs in Emacs")
    (description
     "Eyebrowse is a global minor mode for Emacs that allows you to manage
your window configurations in a simple manner, just like tiling window
managers like i3wm with their workspaces do.  It displays their current state
in the modeline by default.")
    (license license:gpl3+))))

(define-public emacs-pretty-hydra
  (package
    (name "emacs-pretty-hydra")
    (version "0.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jerrypnz/major-mode-hydra.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "08a15knkdq35pzjq82imff016fbfdib5q4glg2xmdy2b5fnk7jqa"))
       (modules '((guix build utils)))
       (snippet #~(begin (substitute* "test/pretty-hydra-test.el"
                           (("\\(c1 \\(quote foo\\)\\)") "(c1 'foo)"))))))
    (build-system emacs-build-system)
    (arguments
     (list #:exclude #~(cons "^major-mode-hydra\\.el" %default-exclude)))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-hydra emacs-s))
    (native-inputs (list emacs-ert-runner))
    (home-page "https://github.com/jerrypnz/major-mode-hydra.el")
    (synopsis "Major mode keybindings managed by Hydra")
    (description
     "This package offers an hydra-based method of managing major
mode-specific key bindings.  It is intended for use as a library only; see
package @code{emacs-major-mode-hydra} for a user-friendly interface.")
    (license license:gpl3+)))

(define-public emacs-major-mode-hydra
  (package
    (inherit emacs-pretty-hydra)
    (name "emacs-major-mode-hydra")
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-pretty-hydra))
    (arguments
     `(#:exclude (cons "^pretty-hydra\\.el" %default-exclude)))
    (synopsis "Create nice-looking hydras")
    (description
     "This package provides the macro @code{pretty-hydra-define} to define
hydras with one column per group of heads.")))

(define-public emacs-clojure-mode
  (package
    (name "emacs-clojure-mode")
    (version "5.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clojure-emacs/clojure-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kv7jw1cg145zcy0pffjk9n2kkcgdn46nb2ny06ynadbivk2l4ds"))))
    (build-system emacs-build-system)
    (native-inputs
     (list emacs-buttercup (@(bost gnu packages emacs-build) emacs-dash) emacs-paredit emacs-s))
    (arguments
     `(#:test-command '("buttercup")))
    (home-page "https://github.com/clojure-emacs/clojure-mode")
    (synopsis "Major mode for Clojure code")
    (description
     "This Emacs package provides font-lock, indentation, navigation and basic
refactoring for the @uref{http://clojure.org, Clojure programming language}.
It is recommended to use @code{clojure-mode} with Paredit or Smartparens.")
    (license license:gpl3+)))

(define-public emacs-sphinx-doc
  (let ((commit "1eda612a44ef027e5229895daa77db99a21b8801")
        (revision "1"))
    (package
      (name "emacs-sphinx-doc")
      (version (git-version "0.3.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/naiquevin/sphinx-doc.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0q72i95yx3xa57jlgr7dik6prf20hi8bp8xf3f5c6ificv7i5378"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "sphinx-doc-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (home-page "https://github.com/naiquevin/sphinx-doc.el")
      (synopsis
       "Generate Sphinx friendly docstrings for Python functions in Emacs")
      (description
       "Sphinx Doc is an Emacs minor mode for inserting docstring skeletons
for Python functions and methods.  The structure of the docstring is as per
the equirement of the Sphinx documentation generator.")
      (license license:expat))))

(define-public emacs-julia-snail
  (package
    (name "emacs-julia-snail")
    (version "1.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gcv/julia-snail")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1jphpyhg52c2gm8dkz42s3nsyb4b1bg9n4vx8qncn1flclczkgcz"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include
      #~(cons* "^JuliaSnail\\.jl" "extensions" %default-include)))
    (inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s emacs-spinner emacs-xref))
    (propagated-inputs
     (list libvterm
           emacs-julia-mode             ;required by parser
           emacs-parsec                 ;required by parser
           emacs-popup
           emacs-vterm
           julia-tokenize
           julia-cstparser))
    (home-page "https://github.com/gcv/julia-snail")
    (synopsis "Development environment and REPL interaction package for Julia")
    (description "This package provides a development environment and REPL
interaction package for Julia in the spirit of Common Lisp’s SLIME and
Clojure’s CIDER.  It enables convenient and dynamic REPL-driven development.")
    (license license:gpl3)))

(define-public emacs-tide
  (package
    (name "emacs-tide")
    (version "5.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ananthakumaran/tide")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "01chyr71b8893jxgf4wncpskfmg9iwfpcaxq0vfc6yaij46yfhky"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command
                     #~(list "emacs" "--batch" "-l" "tide-tests.el"
                             "-f" "ert-run-tests-batch-and-exit")
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-before 'check 'set-home
                           (lambda _
                             (setenv "HOME" (getenv "TMPDIR"))))
                         (add-before 'check 'skip-package-refresh
                           (lambda _
                             (emacs-batch-edit-file "tide-tests.el"
                               '(progn (search-forward "dolist (p")
                                       (beginning-of-line)
                                       (kill-sexp)
                                       (basic-save-buffer)))))
                         (add-before 'check 'skip-failing-tests
                           (lambda _
                             (substitute* "tide-tests.el"
                               (("tide-list-servers/.*" all)
                                (string-append all " (skip-unless nil)"))))))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-flycheck emacs-s emacs-typescript-mode))
    (native-inputs (list node))
    (home-page "https://github.com/ananthakumaran/tide")
    (synopsis "Typescript IDE for Emacs")
    (description
     "Tide is an Interactive Development Environment (IDE) for Emacs which
provides the following features:

@itemize
@item ElDoc
@item Auto complete
@item Flycheck
@item Jump to definition, Jump to type definition
@item Find occurrences
@item Rename symbol
@item Imenu
@item Compile On Save
@item Highlight Identifiers
@item Code Fixes
@item Code Refactor
@item Organize Imports
@end itemize")
    (license license:gpl3+)))

(define-public emacs-projectile
  (package
    (name "emacs-projectile")
    (version "2.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bbatsov/projectile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "15wc2ivmac0kgbdgsaaxngmcffgd3227zsb4n7inhn14cqwr6qxd"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "buttercup" "-L" ".")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'fix-failing-test
            (lambda _
              (substitute* "test/projectile-test.el"
                (("user-emacs-directory") "\".\"")))))))
    (native-inputs
     (list emacs-buttercup))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-pkg-info))
    (home-page "https://github.com/bbatsov/projectile")
    (synopsis "Manage and navigate projects in Emacs easily")
    (description
     "This library provides easy project management and navigation.  The
concept of a project is pretty basic: just a folder containing special file.
Currently Git, Mercurial and Bazaar repositories are considered projects by
default.  If you want to mark a folder manually as a project just create an
empty @file{.projectile} file in it.")
    (license license:gpl3+)))

(define-public emacs-skeletor
  (let ((commit "47c5b761aee8452716c97a69949ac2f675affe13")
        (revision "1"))
    (package
      (name "emacs-skeletor")
      (version (git-version "1.6.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/chrisbarrett/skeletor.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "12bdgykfh4mwsqdazxjdvha62h3q3v33159ypy91f6x59y01fi0n"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^project-skeletons\\/" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            ;; XXX: one failing test involving initializing a git repo.
            (add-before 'check 'remove-git-test
              (lambda _
                (emacs-batch-edit-file "test/skeletor-test.el"
                  `(progn
                    (goto-char (point-min))
                    (re-search-forward "ert-deftest initialises-git-repo")
                    (beginning-of-line)
                    (kill-sexp)
                    (basic-save-buffer))))))))
      (native-inputs
       (list emacs-ert-runner))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f) emacs-let-alist emacs-s))
      (home-page "https://github.com/chrisbarrett/skeletor.el")
      (synopsis "Project skeletons for Emacs")
      (description "This package provides project templates and automates the
mundane parts of setting up a new project, such as version control, licenses,
and tooling.")
      (license license:gpl3+))))

(define-public emacs-elfeed
  (package
    (name "emacs-elfeed")
    (version "3.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/skeeto/elfeed")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yq93abyadzrmcd40pi06wcr4jg9ddhlz2phg0wjypprqvv4q49z"))))
    (build-system emacs-build-system)
    (arguments
     `(#:test-command '("make" "test")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-program-calls
           (lambda* (#:key inputs #:allow-other-keys)
             (emacs-substitute-variables "elfeed-curl.el"
               ("elfeed-curl-program-name"
                (search-input-file inputs "/bin/curl"))))))))
    (inputs
     (list curl))
    (home-page "https://github.com/skeeto/elfeed")
    (synopsis "Atom/RSS feed reader for Emacs")
    (description
     "Elfeed is an extensible web feed reader for Emacs, supporting both Atom
and RSS, with a user interface inspired by notmuch.")
    (license license:gpl3+)))

(define-public emacs-elfeed-goodies
  (let ((commit "544ef42ead011d960a0ad1c1d34df5d222461a6b"))
    (package
      (name "emacs-elfeed-goodies")
      (version commit)
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jeetelongname/elfeed-goodies")
               (commit version)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "147pwqx2maf430qhigzfd6lqk7a5sbrydf9a4c5bvsw8jv7wzb6l"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-elfeed
        emacs-popwin
        emacs-powerline
        emacs-link-hint))
      (home-page "https://github.com/jeetelongname/elfeed-goodies")
      (synopsis
       "Various bits and pieces to enhance the Elfeed user experience")
      (description
       "This package enhances the vanilla Elfeed user experience with:
@itemize @bullet
@item
An adaptive, powerline-based header for the @code{*elfeed-search*} and
@code{*elfeed-entry*} buffers, with a matching entry format.

@item
Split pane setup.

@item
A function to toggle the @code{*elfeed-log*} buffer in a popup window.
@end itemize")
      (license license:gpl3+))))

(define-public emacs-elfeed-org
  (let ((commit "1197cf29f6604e572ec604874a8f50b58081176a")
        (version "20250104.0")
        (revision "0"))
    (package
      (name "emacs-elfeed-org")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/remyhonig/elfeed-org")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0giwnzlqk2s5hb6fs8a0l4dxcmn2fvkngpj1fayzwj0qnvds1kri"))))
      (build-system emacs-build-system)
      (arguments
       `(#:test-command '("ert-runner" "-L" "org-mode/lisp")))
      (propagated-inputs (list emacs-elfeed))
      (native-inputs (list emacs-ert-runner emacs-xtest))
      (home-page "https://github.com/remyhonig/elfeed-org")
      (synopsis "Configure Elfeed with an Org-mode file")
      (description
       "@code{elfeed-org} lets you manage your Elfeed subscriptions
in Org-mode.  Maintaining tags for all RSS feeds is cumbersome using
the regular flat list, where there is no hierarchy and tag names are
duplicated a lot.  Org-mode makes the book keeping of tags and feeds
much easier.")
      (license license:gpl3+))))

(define-public emacs-elfeed-protocol
  (package
    (name "emacs-elfeed-protocol")
    (version "0.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fasheng/elfeed-protocol")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n5bns7181j6n603a626jsv26v06s3wm86ml7vixlp234p0frypp"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-elfeed))
    (native-inputs (list emacs-ert-runner))
    (home-page "https://github.com/fasheng/elfeed-protocol")
    (synopsis "Fever/NewsBlur/ownCloud/tt-RSS protocols for Elfeed")
    (description
     "Elfeed-protocol provides extra protocols to make self-hosting RSS
readers like Fever, NewsBlur, ownCloud News and Tiny TIny RSS work
with Elfeed.")
    (license license:gpl3+)))

(define-public emacs-elfeed-score
  (package
    (name "emacs-elfeed-score")
    (version "1.2.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sp1ff/elfeed-score")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16dsv9nqc71hpdxcy8xspy6ji32q8j38ikq57kxrvkysv2zsjzy6"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #false                   ;FIXME: How to run tests properly?
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'make-info
            (lambda _
              (with-directory-excursion "doc"
                (invoke "makeinfo" "--no-split"
                        "-o" "elfeed-score.info" "elfeed-score.texi")))))))
    (native-inputs
     (list texinfo))
    (propagated-inputs
     (list emacs-elfeed))
    (home-page "https://github.com/sp1ff/elfeed-score")
    (synopsis "Gnus-style scoring for Elfeed")
    (description
     "Elfeed-score is an add-on for Elfeed, an RSS reader for Emacs.  It
brings Gnus-style scoring to your RSS feeds.  Elfeed, by default, displays
feed entries by date.  This package allows you to setup rules for assigning
numeric scores to entries, and sorting entries with higher scores ahead of
those with lower, regardless of date.  The idea is to prioritize content
important to you.")
    (license license:gpl3+)))

(define-public emacs-elfeed-tube
  (package
    (name "emacs-elfeed-tube")
    (version "0.15")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/karthink/elfeed-tube")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vsrsnvz0ysd36a99zk7n2giv0gxznlnls8zq6lcc0hwqw78i5cq"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-elfeed emacs-aio emacs-mpv))
    (home-page "https://github.com/karthink/elfeed-tube/")
    (synopsis "YouTube integration for Elfeed")
    (description
     "@code{elfeed-tube} is an extension for Elfeed that enhances Youtube RSS
feed subscriptions.")
    (license license:unlicense)))

(define-public emacs-el-x
  (package
    (name "emacs-el-x")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sigma/el-x")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1i6j44ssxm1xdg0mf91nh1lnprwsaxsx8vsrf720nan7mfr283h5"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         ;; Move the source files to the top level, which is included in
         ;; the EMACSLOADPATH.
         (add-after 'unpack 'move-source-files
           (lambda _
             (let ((el-files (find-files "./lisp" ".*\\.el$")))
               (for-each (lambda (f)
                           (rename-file f (basename f)))
                         el-files))
             #t)))))
    (home-page "https://github.com/sigma/el-x")
    (synopsis "Emacs Lisp extensions")
    (description "@command{emacs-el-x} defines the @code{dflet} macro to
provide the historic behavior of @code{flet}, as well as
@code{declare-function} stub for older Emacs.")
    (license license:gpl2+)))

(define-public emacs-epithet
  ;; No tags.
  (let ((commit "cc42338376c2c58da561214c554be8e8856f6a2b"))
    (package
      (name "emacs-epithet")
      (version "0.1")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/oantolin/epithet")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "06irgshgcgmm09nswrny8mam6l660ai71rgn0l3rmyp9li8n97j0"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/oantolin/epithet")
      (synopsis "Rename Emacs buffers with descriptive names")
      (description
       "This package provides a function---@code{epithet-rename-buffer}---to
rename the current buffer with a descriptive name.  The name suggestion is
governed by the @code{epithet-suggesters} hook variable: each hook should
return either a name suggestion or @code{nil}, they are called in turn and the
first non-nil suggestion is taken.")
      (license license:gpl3+))))

(define-public emacs-eterm-256color
  (package
    (name "emacs-eterm-256color")
    (version "0.3.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dieggsy/eterm-256color")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ysxblc90kjcz84siprnyxwh94scflivqbxylzkvjm7hbx93rsh1"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-f) emacs-xterm-color))
    (home-page "https://github.com/dieggsy/eterm-256color")
    (synopsis
     "Customizable 256 colors for Emacs @code{term} and @code{ansi-term}")
    (description "This package uses @code{emacs-xterm-color} to add
customizable 256 color support to @code{term} and @code{ansi-term}.")
    (license license:gpl3+)))

(define-public emacs-elpy
  ;; Using the latest commit fixes outstanding bugs such as the following:
  ;; https://github.com/jorgenschaefer/elpy/issues/1824
  ;; https://github.com/jorgenschaefer/elpy/pull/1951
  ;; https://github.com/jorgenschaefer/elpy/issues/1940.
  (let ((commit "7ff8ffa918411887d165764f7a5a12bc46646e73")
        (revision "2"))
    (package
      (name "emacs-elpy")
      (version (git-version "1.35.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jorgenschaefer/elpy")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0lh8w5a1abxaa7lf1c4yzgr0sh9szcwdnwd8w2004hv6mrcmyqc6"))
                (patches (search-patches "emacs-elpy-dup-test-name.patch"))))
      (build-system emacs-build-system)
      (arguments
       `(#:include (cons* "^elpy/[^/]+\\.py$" "^snippets\\/" %default-include)
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'disable-broken-tests
             ;; Some tests are known to have problems with Python 3.9; disable
             ;; them (see:
             ;; https://github.com/jorgenschaefer/elpy/issues/1856).
             ;; Aggressively remove the modules where failing tests were
             ;; discovered, as they are similar and fail in a nondeterministic
             ;; way.
             (lambda _
               (with-directory-excursion "test"
                 (for-each delete-file
                           (append (find-files "." "elpy-refactor")
                                   (find-files "." "elpy-multiedit")
                                   (find-files "." "elpy-pdb")
                                   (find-files "." "elpy-promise")))
                 ;; These test fail since upgrading Emacs from version 27 to
                 ;; 28.1 (see:
                 ;; https://github.com/jorgenschaefer/elpy/issues/1982).
                 (delete-file "elpy-project-find-git-root-test.el")
                 (substitute* "elpy-company-backend-test.el"
                   (("elpy-company-backend-should-add-shell-candidates.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-eldoc-documentation-test.el"
                   (("elpy-eldoc-documentation-should-show-object-onelinedoc.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-shell-send-file-test.el"
                   (("elpy-shell-send-file-should-accept-large-strings.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-shell-echo-inputs-and-outputs-test.el"
                   (("elpy-shell-should-echo-outputs.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 ;; This test started failing with Emacs 29 (see:
                 ;; https://github.com/jorgenschaefer/elpy/issues/2032).
                 (substitute* "elpy-folding-fold-blocks-test.el"
                   (("elpy-fold-at-point-should-NOT-fold-and-unfold-functions\
-from-after.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 ;; These tests started failing with Emacs 30.
                 ;; (TODO: report upstream)
                 (substitute* "elpy-company-backend-test.el"
                   (("elpy-company-backend-should-find-.*-prefix-string.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-shell-get-or-create-process-test.el"
                   (("elpy-shell-get-or-create-process-should-add-project-root\
-to-path.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-format-code-test.el"
                   (("elpy-should-format-code-with-default-formatter.*" all)
                    (string-append all "  :expected-result :failed\n"))))))
           ;; The default environment of the RPC uses Virtualenv to install
           ;; Python dependencies from PyPI.  We don't want/need this in Guix.
           (add-before 'check 'do-not-use-virtualenv
             (lambda _
               (setenv "ELPY_TEST_DONT_USE_VIRTUALENV" "1")
               (substitute* "elpy-rpc.el"
                 (("defcustom elpy-rpc-virtualenv-path 'default")
                  "defcustom elpy-rpc-virtualenv-path 'system"))))
           (add-before 'check 'build-doc
             (lambda _
               (with-directory-excursion "docs"
                 (invoke "make" "info" "man"))
               ;; Move .info file at the root so that it can installed by the
               ;; 'move-doc phase.
               (rename-file "docs/_build/texinfo/Elpy.info" "Elpy.info")))
           (add-after 'build-doc 'install-manpage
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out  (assoc-ref outputs "out"))
                      (man1 (string-append out "/share/man/man1")))
                 (mkdir-p man1)
                 (copy-file "docs/_build/man/elpy.1"
                            (string-append man1 "/elpy.1"))))))))
      (propagated-inputs
       (list emacs-company
             emacs-find-file-in-project
             emacs-highlight-indentation
             emacs-yasnippet
             emacs-pyvenv
             emacs-s
             ;; The following are recommended Python dependencies that make
             ;; Elpy much more useful.  Installing these avoids Elpy prompting
             ;; to install them from PyPI using pip.
             python-autopep8
             python-black
             python-flake8
             python-jedi
             python-yapf))
      (native-inputs
       (list emacs-ert-runner
             (@(bost gnu packages emacs-build) emacs-f)
             python-wrapper
             ;; For documentation.
             python-sphinx
             texinfo))
      (home-page "https://github.com/jorgenschaefer/elpy")
      (synopsis "Python development environment for Emacs")
      (description "Elpy brings powerful Python editing to Emacs.  It combines
and configures a number of other packages written in Emacs Lisp as well as
Python, together offering features such as navigation, documentation,
completion, interactive development and more.")
      (license license:gpl3+))))

(define-public emacs-gitlab-snip-helm
  (package
    (name "emacs-gitlab-snip-helm")
    (version "0.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/sasanidas/gitlab-snip-helm.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1c5js19zyb1z61hapvbfcl5jhrjqij46cxldgqij6al0scw44dga"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-xyz-2) emacs-helm)))
    (home-page "https://gitlab.com/sasanidas/gitlab-snip-helm/")
    (synopsis "GitLab snippet API interaction for Emacs")
    (description "This package provides GitLab snippet API interaction for
Emacs.")
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
    (native-inputs (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
    (home-page "https://github.com/mhayashi1120/Emacs-wgrep")
    (synopsis "Edit a grep buffer and apply those changes to the files")
    (description
     "Emacs wgrep allows you to edit a grep buffer and apply those changes
to the file buffer.  Several backends are supported beside the classic grep:
ack, ag, helm and pt.")
    (license license:gpl3+)))

;; (define-public emacs-helm
;;   (package
;;     (name "emacs-helm")
;;     (version "4.0.2")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/emacs-helm/helm")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "0l9p6yiv8w9s0rpa4fyrp9gw1dgwpyr9fmkhs53bhc6v9x7br8ix"))))
;;     (build-system emacs-build-system)
;;     (arguments (list #:tests? #f))      ; no test suite
;;     (propagated-inputs
;;      (list emacs-async emacs-popup))
;;     (home-page "https://emacs-helm.github.io/helm/")
;;     (synopsis
;;      "Incremental completion and selection narrowing framework for Emacs")
;;     (description
;;      "Helm is an incremental completion and selection narrowing framework for
;; Emacs.  It will help steer you in the right direction when you're looking for
;; stuff in Emacs (like buffers, files, etc).")
;;     (license license:gpl3+)))

;; (define-public emacs-helm-org
;;   (let ((commit "8457e1e46227bf87726e05c42cec5a4b51c2ef7b")
;;         (revision "3"))
;;     (package
;;       (name "emacs-helm-org")
;;       (version (git-version "1.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/emacs-helm/helm-org")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "0kcjhwwi492n9m2w894hvdavfvhj45zygy7bwvx103wvpay5h6h6"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs
;;        (list (@(bost gnu packages emacs-xyz-2) emacs-helm)))
;;       (home-page "https://github.com/emacs-helm/helm-org")
;;       (synopsis "Helm interface to the Silver Searcher")
;;       (description
;;        "This package provides a frontend for grepping tools like ag and ack,
;; as well as features for editing search results.")
;;       (license license:gpl3+))))

;; (define-public emacs-helm-swoop
;;   (package
;;     (name "emacs-helm-swoop")
;;     (version "3.0.0")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/emacsorphanage/helm-swoop")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "1qjay0fvryxa8n1ws6r1by512p2fylb2nj7ycm1497fcalb0d706"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-xyz-2) emacs-helm)))
;;     (native-inputs (list emacs-buttercup))
;;     (home-page "https://github.com/emacsorphanage/helm-swoop")
;;     (synopsis "Filter and jump to lines in an Emacs buffer using Helm")
;;     (description
;;      "This package builds on the Helm interface to provide several commands
;; for search-based navigation of buffers.")
;;     (license license:gpl2+)))

;; (define-public emacs-helm-ag
;;   (package
;;     (name "emacs-helm-ag")
;;     (version "0.64")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/syohex/emacs-helm-ag")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "0ml9yp3qaiwn7iixyxvsj3fxn7gw913qxisr47df57q4ka912law"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list #:test-command #~(list "emacs" "-Q" "--batch"
;;                                   "-l" "test/test-util.el"
;;                                   "-f" "ert-run-tests-batch-and-exit")))
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-xyz-2) emacs-helm)))
;;     (home-page "https://github.com/syohex/emacs-helm-ag")
;;     (synopsis "Helm interface to the Silver Searcher")
;;     (description
;;      "This package provides a frontend for grepping tools like ag and ack,
;; as well as features for editing search results.")
;;     (license license:gpl3+)))

;; (define-public emacs-helm-projectile
;;   (package
;;     (name "emacs-helm-projectile")
;;     (version "1.0.0")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/bbatsov/helm-projectile")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "05gpg90gg03yalmv9fw1y9k21i2l617iipvs0p9n80aln8nrzs8g"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-xyz-2) emacs-helm) emacs-projectile))
;;     (home-page "https://github.com/bbatsov/helm-projectile")
;;     (synopsis "Helm integration for Projectile")
;;     (description
;;      "This Emacs library provides a Helm interface for Projectile.")
;;     (license license:gpl3+)))

(define-public emacs-hexrgb
  (let ((commit "90e5f07f14bdb9966648977965094c75072691d4"))
    (package
      (name "emacs-hexrgb")
      (version "0")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/emacsmirror/hexrgb")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0y5l6hrzm5j2jfrm5jp5zrxhxgvf930m2k4nyvk0rllpx0i1271z"))))
      (build-system emacs-build-system)
      (home-page "https://www.emacswiki.org/emacs/hexrgb.el")
      (synopsis "Emacs functions to convert color formats")
      (description
       "HexRGB provides functions for converting between RGB (red, green, blue)
color components and HSV (hue, saturation, value) color components.  More
accurately, it converts Emacs color components (whole numbers from 0 through
65535), RGB and HSV floating-point components (0.0 through 1.0), Emacs
color-name strings (such as \"blue\") and hex RGB color strings (such as
\"#FC43A7912\").")
      (license license:gpl2+))))

(define-public emacs-taskrunner
  (let ((commit "3afd4a546d42339543d3d4e51b175fc3e82b3358")
        (revision "1"))
    (package
      (name "emacs-taskrunner")
      (version (git-version "0.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-taskrunner/emacs-taskrunner")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1lkdvmjn3alhqxq2i64sdr977sbw3g0b2670d9bwyzi67qh0jxrv"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-async emacs-projectile))
      (home-page "https://github.com/emacs-taskrunner/emacs-taskrunner")
      (synopsis "Retrieve tasks from various build systems and task-runners")
      (description "This package parses Makefiles and build-system files for
multiple project types.")
      (license license:gpl3+))))

(define-public emacs-tp
  (package
    (name "emacs-tp")
    (version "0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/martianh/tp.el")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1hv0j4dzwamhm2gp5123j415mq13347v5lsbxlrksha5nw9h7kds"))))
    (build-system emacs-build-system)
    (home-page "https://codeberg.org/martianh/tp.el")
    (synopsis "Utilities to create transient menus for POSTing to an API")
    (description
     "This package provides functions, classes and methods to make it easier
to create transient menus that send complex POST, PUT, or PATCH requests to
JSON APIs.")
    (license license:gpl3+)))


(define-public emacs-ivy-taskrunner
  (let ((commit "75d8d67cfe3c29663fe0f5508a887adf40ed5162")
        (revision "1"))
    (package
      (name "emacs-ivy-taskrunner")
      (version (git-version "0.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-taskrunner/ivy-taskrunner")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1wf4s4k0ap21f7g5w6128an8nsvbja7f5n889vcml5b6gjz058db"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-ivy emacs-taskrunner emacs-projectile))
      (home-page "https://github.com/emacs-taskrunner/ivy-taskrunner")
      (synopsis "Retrieve build-system tasks using Ivy")
      (description "This package provides an Ivy interface for selecting
Makefile targets.")
      (license license:gpl3+))))

(define-public emacs-helm-taskrunner
  (let ((commit "1910dac19cbc7bd4fd08b0faf9affd455339fbea")
        (revision "1"))
    (package
      (name "emacs-helm-taskrunner")
      (version (git-version "0.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-taskrunner/helm-taskrunner")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "182lmr858fx6rdhp1fy7kv8dvrhzcnxzwfck1q22s6xs8x85d5q7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-xyz-2) emacs-helm) emacs-taskrunner emacs-projectile))
      (home-page "https://github.com/emacs-taskrunner/helm-taskrunner")
      (synopsis "Retrieve build-system tasks using Helm")
      (description "This package provides a Helm interface for selecting
Makefile targets.")
      (license license:gpl3+))))

;; (define-public emacs-helm-make
;;   (let ((commit "ebd71e85046d59b37f6a96535e01993b6962c559")
;;         (revision "0"))
;;     (package
;;       (name "emacs-helm-make")
;;       (version (git-version "0.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/abo-abo/helm-make")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "14jvhhw4chl94dgfwbyy7yirwchvcz5zrsgr9w6qy4z0fhqba41a"))))
;;       (build-system emacs-build-system)
;;       (arguments (list #:tests? #f))    ; no tests
;;       (propagated-inputs
;;        (list (@(bost gnu packages emacs-xyz-2) emacs-helm) emacs-ivy emacs-projectile))
;;       (home-page "https://github.com/abo-abo/helm-make")
;;       (synopsis "Select a Makefile target with helm")
;;       (description "@code{helm-make} or @code{helm-make-projectile} will give
;; you a @code{helm} selection of directory Makefile's targets.  Selecting a
;; target will call @code{compile} on it.")
;;       (license license:gpl3+))))

(define-public emacs-islisp-mode
  (package
    (name "emacs-islisp-mode")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/sasanidas/islisp-mode")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1s6alrv1hfi1plj5lh826j0h71xvm2v092kglj3yvy34g73dgrna"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include #~(cons "\\.lsp$" %default-include)
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the extensions source files to the top level, which is
          ;; included in the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (for-each (lambda (dir)
                          (let ((files (find-files dir "\\.(lsp|el)$")))
                            (for-each (lambda (f)
                                        (rename-file f (basename f)))
                                      files)))
                        '("advance" "implementations/easy-islisp"))))
          (add-after 'move-source-files 'patch-eisl-variables
            (lambda* (#:key inputs #:allow-other-keys)
              (emacs-substitute-variables "easy-islisp.el"
                ("easy-islisp-executable"
                 (search-input-file inputs "/bin/eisl"))
                ("easy-islisp-library-directory"
                 `(or (getenv "EASY_ISLISP")
                      ,(search-input-directory inputs "share/eisl/library")))))))))
    (native-inputs (list emacs-ert-runner))
    (inputs (list eisl))
    (home-page "https://gitlab.com/sasanidas/islisp-mode")
    (synopsis "ISLisp support for Emacs")
    (description
     "This package provides support for programming with ISLisp in Emacs.  It
features a major mode with syntax highlighting, symbol autocompletion and
documentation search, among other features.  It also includes an inferior mode
with REPL integration.  Currently it only supports the Easy ISLisp (eisl)
implementation.")
    (license license:gpl3+)))

(define-public emacs-cider
  (package
    (name "emacs-cider")
    (version "1.17.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clojure-emacs/cider")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02lilk85a7h9wxxvxr6k69p12wslbl9xp3jkcbdn11078fwhif6j"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include #~(cons* "^lein\\.sh$" "^clojure\\.sh$" %default-include)
      #:exclude                        ;don't exclude 'cider-test.el'
      #~(list "^\\.dir-locals\\.el$" "^test/")
      #:test-command
      #~(list "eldev" "--use-emacsloadpath" "-dtT" "-p" "test")
      #:phases
      ;; XXX: file "test/cider-tests.el" contains a bogus "/bin/command"
      ;; string, and `patch-el-files' phase chokes on it (even though the
      ;; file is excluded from installation).  Remove the phase altogether
      ;; since there is no "/bin/executable" to replace in the code base
      ;; anyway.
      #~(modify-phases %standard-phases
          (delete 'patch-el-files)
          (add-before 'check 'skip-failing-tests
            (lambda _ ;; Require network.
              (delete-file "test/cider-jar-tests.el"))))))
    (native-inputs (list emacs-buttercup emacs-eldev))
    (propagated-inputs
     (list emacs-clojure-mode
           emacs-parseedn
           emacs-pkg-info
           emacs-queue
           emacs-sesman
           emacs-spinner))
    (home-page "https://cider.mx/")
    (synopsis "Clojure development environment for Emacs")
    (description
     "CIDER (Clojure Interactive Development Environment that Rocks) aims to
provide an interactive development experience similar to the one you'd get
when programming in Emacs Lisp, Common Lisp (with SLIME or Sly), Scheme (with
Geiser) and Smalltalk.

CIDER is the successor to the now deprecated combination of using SLIME +
swank-clojure for Clojure development.

There are plenty of differences between CIDER and SLIME, but the core ideas
are pretty much the same (and SLIME served as the principle inspiration for
CIDER).")
    (license license:gpl3+)))

(define-public emacs-cider-eval-sexp-fu
  (let ((commit "7fd229f1441356866aedba611fd0cf4e89b50921")) ;version bump
    (package
      (name "emacs-cider-eval-sexp-fu")
      (version "1.2")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/clojure-emacs/cider-eval-sexp-fu")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "01gky548v3758fyr317lkwsc9aacab6m9d9vk1mrr3qyvmciwd51"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-eval-sexp-fu))
      (home-page "https://github.com/clojure-emacs/cider-eval-sexp-fu")
      (synopsis "Eval Sexp-fu extensions for CIDER")
      (description
       "This package provides tiny improvements to expression evaluation,
e.g., the expression you've just evaluated would briefly flash and so on.")
      (license license:gpl3+))))

(define-public emacs-sly
  ;; Update together with sbcl-slynk.
  (let ((commit "9c43bf65b967e12cef1996f1af5f0671d8aecbf4")
        (revision "9"))
    ;; Versions are not always tagged.  Besides, latest master contains
    ;; important fixes.
    (package
      (name "emacs-sly")
      (version (git-version "1.0.43" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/joaotavora/sly")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "15nyr02ykkws4q79jcmxcawddg8sgq9v5l8k7jv7gg3hnpzxjlb2"))))
      (build-system emacs-build-system)
      (native-inputs
       (list sbcl texinfo))
      (arguments
       (list
        #:include #~(cons* "^contrib\\/" "^lib\\/" "^slynk\\/" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (delete 'make-autoloads) ; The package provides autoloads.
            (add-before 'install 'install-doc
              (lambda _
                (let* ((info-dir (string-append #$output "/share/info"))
                       (doc-dir (string-append #$output "/share/doc/"
                                               #$name "-" #$version))
                       (doc-files '( ;; "doc/sly-refcard.pdf" ; See sly-refcard.pdf below.
                                    "README.md" "NEWS.md" "PROBLEMS.md"
                                    "CONTRIBUTING.md")))
                  (with-directory-excursion "doc"
                    (substitute* "Makefile"
                      (("infodir=/usr/local/info")
                       (string-append "infodir=" info-dir))
                      ;; Don't rebuild contributors.texi since we are not in
                      ;; the git repo.
                      (("contributors.texi: Makefile texinfo-tabulate.awk")
                       "contributors.texi:"))
                    (invoke "make" "html/index.html")
                    (invoke "make" "sly.info")
                    ;; TODO: We need minimal texlive with "preprint" package
                    ;; (for fullpage.sty).  (invoke "make" "sly-refcard.pdf")
                    (install-file "sly.info" info-dir)
                    (copy-recursively "html" (string-append doc-dir "/html")))
                  (for-each (lambda (f)
                              (install-file f doc-dir)
                              (delete-file f))
                            doc-files)
                  (delete-file-recursively "doc"))))
            (add-before 'check 'patch-tests
              (lambda _
                (setenv "HOME" (dirname (getcwd)))
                (substitute* "test/sly-stickers-tests.el"
                  (("\
\\(define-sly-ert-test stickers-when-invalid-dont-stick .*" all)
                   (string-append all "  (skip-unless nil)\n"))))))))
      (home-page "https://github.com/joaotavora/sly")
      (synopsis "Sylvester the Cat's Common Lisp IDE")
      (description
       "SLY is Sylvester the Cat's Common Lisp IDE.  SLY is a fork of SLIME, and
contains the following improvements over it:

@enumerate
@item A full-featured REPL based on Emacs's @code{comint.el}.  Everything
can be copied to the REPL;
@item Stickers, or live code annotations that record values as code traverses them.
@item Flex-style completion out-of-the-box, using Emacs's completion API.
Company, Helm, and other supported natively, no plugin required;
@item An interactive Trace Dialog;
@item Multiple inspectors and multiple REPLs, with independent history.
@item Regexp-capable @code{M-x sly-apropos}.
@item Cleanly ASDF-loaded by default, including contribs, enabled out-of-the-box;
@item \"Presentations\" replaced by interactive backreferences, which
highlight the object and remain stable throughout the REPL session;
@end enumerate

SLY tracks SLIME's bugfixes and all its familiar features (debugger, inspector,
xref, etc.) are still available, but with better integration.")
      (license license:gpl3+))))

(define-public emacs-sly-quicklisp
  (let ((commit "01ebe3976a244309f2e277c09206831135a0b66c")
        (revision "1"))
    (package
      (name "emacs-sly-quicklisp")
      (version (git-version "0.0.0" revision commit))
      (home-page "https://github.com/joaotavora/sly-quicklisp")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1vfqmvayf35g6y3ljsm3rlzv5jm50qikhh4lv2zkkswj6gkkb1cv"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-sly))
      (arguments
       `(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)
         #:phases
         ;; The package provides autoloads.
         (modify-phases %standard-phases
           (delete 'make-autoloads)
           (delete 'enable-autoloads-compilation))))
      (synopsis "Quicklisp support for SLY")
      (description
       "@command{sly-quicklisp} is an external contrib for SLY that provides a
sly-quickload command that prompts the user for a package to install.")
      (license license:gpl3+))))

(define-public emacs-sly-asdf
  (package
    (name "emacs-sly-asdf")
    (version "0.2.0")
    (home-page "https://github.com/mmgeorge/sly-asdf")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0gncp8xv33s4wx594bgd35vr1455bcggv1bg28qv75mhv41nzw97"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-sly emacs-popup))
    (arguments
     '(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)))
    (synopsis "ASDF contrib for SLY")
    (description
     "@command{sly-asdf} is an external contrib for SLY that provides
additional support for working with ASDF projects.")
    (license license:gpl3+)))

(define-public emacs-sly-named-readtables
  (let ((commit "a5a42674ccffa97ccd5e4e9742beaf3ea719931f")
        (revision "1"))
    (package
      (name "emacs-sly-named-readtables")
      (version (git-version "0.1" revision commit))
      (home-page "https://github.com/joaotavora/sly-named-readtables")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "16asd119rzqrlclps2q6yrkis8jy5an5xgzzqvb7jdyq39zxg54q"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-sly))
      (arguments
       '(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)
         #:phases
         ;; The package provides autoloads.
         (modify-phases %standard-phases
           (delete 'make-autoloads)
           (delete 'enable-autoloads-compilation))))
      (synopsis "Named-readtables support for SLY")
      (description
       "@command{sly-named-readtables} is an external contrib for SLY that
enables different readtables to be active in different parts of the same
file.")
      (license license:gpl3+))))

(define-public emacs-sly-macrostep
  (let ((commit "5113e4e926cd752b1d0bcc1508b3ebad5def5fad")
        (revision "2"))
    (package
      (name "emacs-sly-macrostep")
      (version (git-version "0.1" revision commit))
      (home-page "https://github.com/joaotavora/sly-macrostep")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1nxf28gn4f3n0wnv7nb5sgl36fz175y470zs9hig4kq8cp0yal0r"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-sly emacs-macrostep))
      (arguments
       '(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)
         #:phases
         ;; The package provides autoloads.
         (modify-phases %standard-phases
           (delete 'make-autoloads)
           (delete 'enable-autoloads-compilation))))
      (synopsis "Expand Common Lisp macros inside source files with SLY")
      (description
       "@command{sly-macrostep} is a SLY contrib for expanding CL macros right
inside the source file.")
      (license license:gpl3+))))

(define-public emacs-sly-stepper
  (let ((commit "da84e3bba8466c2290c2dc7c27d7f4c48c27b39e"))
    (package
      (name "emacs-sly-stepper")
      (version (git-version "0.0.0" "2" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/joaotavora/sly-stepper")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07p0k797fagn1qha191p6g2b55hsqqkcj59mh0ms9id0ildydil0"))
         (modules '((guix build utils)))
         (snippet #~(for-each delete-file
                              (find-files "." ".*-autoloads\\.elc?$")))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include
        #~(cons* "\\.lisp$" "\\.asd$" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'expand-load-path 'expand-sly-contrib
              (lambda _
                (setenv "EMACSLOADPATH"
                        (string-append (elpa-directory
                                        #$(this-package-input "emacs-sly"))
                                       "/contrib:" (getenv "EMACSLOADPATH")))))
            (add-after 'install 'find-agnostic-lizard
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((file (string-append (elpa-directory #$output)
                                           "/slynk-stepper.lisp")))
                  ;; agnostic-lizard is found at runtime.
                  (emacs-substitute-sexps file
                    ("(require :asdf)"
                     `(funcall (read-from-string "asdf:load-asd")
                               ,(search-input-file inputs "\
share/common-lisp/systems/agnostic-lizard.asd"))))))))))
      (inputs (list cl-agnostic-lizard))
      (propagated-inputs (list emacs-sly))
      (home-page "https://github.com/joaotavora/sly-stepper")
      (synopsis "Portable Common Lisp stepper interface for Emacs")
      (description
       "This package features a new, portable, visual stepping facility for
Common Lisp, realized as an extension to SLY.")
      (license license:gpl3+))))

(define-public emacs-sly-package-inferred
  (let ((commit "800e71e2be631422277e2ec77e6d6f6ea20e95ef")
        (revision "1"))
    (package
      (name "emacs-sly-package-inferred")
      (version (git-version "0.1" revision commit))
      (home-page "https://github.com/40ants/sly-package-inferred")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1216idyp034nkqddhw4p53jkhhdxa6xnjjmsvijpf4rxqnfqvapg"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-sly))
      (arguments
       '(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)
         #:phases
         ;; The package provides autoloads.
         (modify-phases %standard-phases
           (delete 'make-autoloads))))
      (synopsis "Improved package inferred systems support for SLY")
      (description
       "@command{sly-package-inferred} is an external contrib for SLY that
replaces its completion with a function which is better suited for systems
using package inferred style.")
      (license license:gpl3+))))

(define-public emacs-lua-mode
  (let ((commit "d074e4134b1beae9ed4c9b512af741ca0d852ba3")
        (revision "1"))
    (package
      (name "emacs-lua-mode")
      (version (git-version "20221027" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/immerrr/lua-mode/")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00gvrmw8pll0cl7srygh2kmbf0g44sk9asj5sm77qvhr8jz4xkkq"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "buttercup" "-l" "lua-mode.el")
        #:phases
        #~(modify-phases %standard-phases
            ;; XXX: These tests are not compatible with Buttercup, and cause
            ;; build to fail.  Remove them until they are fixed by upstream.
            (add-after 'unpack 'remove-faulty-tests
              (lambda _
                (delete-file "test/test-indentation.el")
                (delete-file "test/test-fill.el"))))))
      (native-inputs
       (list emacs-buttercup lua))
      (home-page "https://github.com/immerrr/lua-mode/")
      (synopsis "Major mode for Lua")
      (description
       "This Emacs package provides a mode for @uref{https://www.lua.org/,
Lua programming language}.")
      (license license:gpl2+))))

(define-public emacs-ebuild-mode
  (package
    (name "emacs-ebuild-mode")
    (version "1.78")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dev.gentoo.org/~ulm/emacs/"
             "ebuild-mode-" version ".tar.xz"))
       (file-name (string-append name "-" version ".tar.xz"))
       (sha256
        (base32 "0yxn6b87paa0ln2mj1w0ay748j05a80y825im6z6n75yk3b8wm06"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-doc
            (lambda _
              (invoke "make" "ebuild-mode.info")
              (install-file "ebuild-mode.info"
                            (string-append #$output "/share/info")))))))
    (native-inputs
     (list texinfo))
    (home-page "https://devmanual.gentoo.org")
    (synopsis "Major modes for Gentoo package files")
    (description
     "This Emacs package provides modes for ebuild, eclass, eblit, GLEP42
news items, openrc and runscripts.")
    (license license:gpl2+)))

(define-public emacs-ebuku
  ;; Upstream has no tagged release.
  (let ((revision "1")
        (commit "0c6cf404a49bd68800221446df186fffa0139325"))
    (package
      (name "emacs-ebuku")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/flexibeast/ebuku")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "09fkzmcvzdbdjaa167wiybj0kir7y12pcq2varjywshvq2l7niz4"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/flexibeast/ebuku")
      (synopsis "Emacs interface to the buku Web bookmark manager")
      (description
       "Ebuku provides a basic interface to the @code{buku} Web bookmark
manager.")
      (license license:gpl3+))))

(define-public emacs-evil
  ;; Commit message claims this is 1.15.0, but there's no tag for it, so we
  ;; use full git-version instead
  (let ((commit "008a6cdb12f15e748979a7d1c2f26c34c84dedbf")
        (revision "0"))
    (package
      (name "emacs-evil")
      (version (git-version "1.15.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-evil/evil")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1hxhw1rsm0wbrhz85gfabncanijpxd47g5yrdnl3bbm499z1gsvg"))))
      (arguments
       `(#:test-command (list "make" "test")
         #:phases
         (modify-phases %standard-phases
           (add-before 'check 'fix-test-helpers
             (lambda _
               (substitute* "evil-test-helpers.el"
                 (("\\(undo-tree-mode 1\\)") ""))
               #t))
           (add-before 'install 'make-info
             (lambda _
               (with-directory-excursion "doc/build/texinfo"
                   (invoke "makeinfo" "--no-split"
                           "-o" "evil.info" "evil.texi")))))))
      (build-system emacs-build-system)
      (native-inputs (list texinfo))
      (home-page "https://github.com/emacs-evil/evil")
      (synopsis "Extensible Vi layer for Emacs")
      (description
       "Evil is an extensible vi layer for Emacs.  It emulates the
main features of Vim, and provides facilities for writing custom
extensions.")
      (license license:gpl3+))))

;; (define-public emacs-evil-collection
;;   (package
;;     (name "emacs-evil-collection")
;;     (version "0.0.10")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/emacs-evil/evil-collection")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "09hnxb8nh3g0hi93fz9f1y164gv9iyh5994wfn6fsq2v1xdz8phm"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list
;;       #:include #~(cons* "^modes\\/" %default-include)
;;       #:test-command #~(list "emacs" "-Q" "--batch"
;;                              "-L" "."
;;                              "-L" "./test"
;;                              "-l" "evil-collection-test.el"
;;                              "-l" "evil-collection-magit-tests.el"
;;                              "-f" "ert-run-tests-batch-and-exit")))
;;     (native-inputs
;;      (list emacs-magit))
;;     (propagated-inputs
;;      (list emacs-annalist emacs-evil))
;;     (home-page "https://github.com/emacs-evil/evil-collection")
;;     (synopsis "Collection of Evil bindings for many major and minor modes")
;;     (description "This is a collection of Evil bindings for the parts of
;; Emacs that Evil does not cover properly by default, such as @code{help-mode},
;; @code{M-x calendar}, Eshell and more.")
;;     (license license:gpl3+)))

(define-public emacs-evil-goggles
  (let ((commit "08a22058fd6a167f9f1b684c649008caef571459")
        (version "0.0.1")
        (revision "0"))
    (package
      (name "emacs-evil-goggles")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/edkolev/evil-goggles")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1p3vjrij63v9nrcyj3b5jsqzv9y7dgv9i1inx1q7x3s90vndavac"))))
      (build-system emacs-build-system)
      (arguments
       (list #:test-command #~(list "ert-runner" "test")
             #:phases
             #~(modify-phases %standard-phases
                 (add-before 'check 'skip-failing-test
                   (lambda _
                     (substitute* "test/evil-goggles-test.el"
                       (("\\(ert-deftest evil-test-last-insert-register.*" all)
                        (string-append all " (skip-unless nil)"))))))))
      (propagated-inputs
       (list emacs-evil))
      (native-inputs (list emacs-ert-runner))
      (home-page "https://github.com/edkolev/evil-goggles")
      (synopsis "Displays visual hints when editing with evil")
      (description "Creates a visual pulse to indicate the region that is
being deleted, changed, yanked, or pasted when using evil commands")
      (license license:gpl3+))))

(define-public emacs-goggles
  (package
    (name "emacs-goggles")
    (version "0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/minad/goggles")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fczxygg1blfmlwswck49rllww77rc7qn91wqw1kvjwfz31sk8z4"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "ert-runner" ".")))
    (native-inputs (list emacs-ert-runner))
    (home-page "https://github.com/minad/goggles")
    (synopsis "Pulse modified region")
    (description "Goggles highlights the modified region using Pulse.
Currently the commands undo, yank, kill and delete are supported.")
    (license license:gpl3+)))

(define-public emacs-goto-chg
  (package
    (name "emacs-goto-chg")
    (version "1.7.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-evil/goto-chg")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0rgdzhan4n5bd78wvivacqkp0g7jvnwzgh0571p2m4yra09a36mv"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/emacs-evil/goto-chg")
    (synopsis "Go to the last change in the Emacs buffer")
    (description
     "This package provides @code{M-x goto-last-change} command that goes to
the point of the most recent edit in the current Emacs buffer.  When repeated,
go to the second most recent edit, etc.  Negative argument, @kbd{C-u -}, is
used for reverse direction.")
    (license license:gpl2+)))

(define-public emacs-evil-owl
  (let ((commit "24c5f43df375194386344e69bc720ea3986c9510")
        (revision "3"))
    (package
      (name "emacs-evil-owl")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mamapanda/evil-owl")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0bqzch14whlmrcasakah3psrzswvkzd7mmi8hx5s64kfp29wbdhi"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "make" "test")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'skip-failing-test
              (lambda _
                (substitute* "test/evil-owl-test.el"
                  (("\\(ert-deftest evil-owl-test-mark-string.*" all)
                   (string-append all " (skip-unless nil)"))))))))
      (propagated-inputs
       (list emacs-evil))
      (home-page "https://github.com/mamapanda/evil-owl")
      (synopsis "Preview candidates when using Evil registers and marks")
      (description
       "This package supplements Evil's register- and mark-based commands with
a popup window for previewing candidates.")
      (license license:gpl3+))))

(define-public emacs-evil-paredit
  (let ((commit "e058fbdcf9dbf7ad6cc77f0172d7517ef233d55f"))
    (package
      (name "emacs-evil-paredit")
      (version "0.0.2")                 ; says 0.0.2 in evil-paredit.el
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/roman/evil-paredit")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0b08y4spapl4g2292j3l4cr84gjlvm3rpma3gqld4yb1sxd7v78p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-evil emacs-paredit))
      (home-page "https://github.com/roman/evil-paredit")
      (synopsis "Evil extension to integrate nicely with Paredit")
      (description
       "This package helps you to not screw up your Paredit setup when using
Evil mode.  Whenever you try to use a modifier command like @kbd{d}, @kbd{c},
@kbd{y} to modify the Paredit buffer, it will stop you to do so in the case
you break the parity of parenthesis.")
      (license license:expat))))

(define-public emacs-evil-args
  (let ((commit "758ad5ae54ad34202064fec192c88151c08cb387")
        (revision "1"))
    (package
      (name "emacs-evil-args")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/wcsmith/evil-args")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0k35glgsirc3cph8v5hhjrqfh4ndwh8a28qbr03y3jl8s453xcj7"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/wcsmith/evil-args")
      (synopsis "Motions and text objects for delimited arguments in Evil")
      (description
       "This package provides motions and text objects for delimited
arguments, such as arguments separated by commas and semicolons.")
      (license license:expat))))

(define-public emacs-evil-escape
  (package
    (name "emacs-evil-escape")
    (version "3.16")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/emacsorphanage/evil-escape")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1z30v59igndqzxg9gcx4bsbf5jkh11wp936il8azkrz3qdryaj4a"))))
    (propagated-inputs
     (list emacs-evil))
    (build-system emacs-build-system)
    (home-page "https://github.com/emacsorphanage/evil-escape")
    (synopsis "Escape from insert state and everything else in Emacs")
    (description
     "Evil escape provides a customizable key sequence to escape from insert
state and everything else in Emacs.")
    (license license:gpl3+)))

(define-public emacs-evil-exchange
  (let ((commit "47691537815150715e64e6f6ec79be7746c96120")
        (version "0.41")
        (revision "1"))
    (package
      (name "emacs-evil-exchange")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Dewdrops/evil-exchange")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0bjpn4yqig17ddym6wqq5fm1b294q74hzcbj9a6gs97fqiwf88xa"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (native-inputs (list emacs-ert-runner))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'check 'fix-makefile
             (lambda _
               (substitute* "Makefile"
                 (("cask exec ") ""))
               #t)))
         #:test-command '("make" "test")))
      (home-page "https://github.com/Dewdrops/evil-exchange")
      (synopsis "Exchange text easily within Evil")
      (description
       "This package, a port of @code{vim-exchange}, provides an Evil operator
for exchanging text.")
      (license license:gpl3+))))

(define-public emacs-evil-replace-with-register
  (let ((commit "91cc7bf21a94703c441cc9212214075b226b7f67")
        (version "0.1")
        (revision "1"))
    (package
      (name "emacs-evil-replace-with-register")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Dewdrops/evil-ReplaceWithRegister")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "14rpn76qrf287s3y2agmddcxi27r226i53ixjvd694ss039g0r11"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/Dewdrops/evil-ReplaceWithRegister")
      (synopsis "Quickly replace text with the contents of a register")
      (description
       "This package provides an Evil operator for replacing text with the
contents of a register.")
      (license license:gpl3+))))

(define-public emacs-evil-indent-plus
  (let ((commit "0c7501e6efed661242c3a20e0a6c79a6455c2c40")
        (version "1.0.0")
        (revision "1"))
    (package
      (name "emacs-evil-indent-plus")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/TheBB/evil-indent-plus")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1g6r1ydscwjvmhh1zg4q3nap4avk8lb9msdqrh7dff6pla0r2qs6"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/TheBB/evil-indent-plus")
      (synopsis "Text objects based on indentation")
      (description
       "This package adds new text objects for @code{evil-mode} based on
blocks having the same or higher indentation, including or excluding
surrounding lines.")
      (license license:gpl2+))))

(define-public emacs-evil-text-object-python
  (let ((commit "9a064fe6475429145cbcc3b270fcc963b67adb15")
        (version "1.0.1")
        (revision "1"))
    (package
      (name "emacs-evil-text-object-python")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/wbolster/evil-text-object-python")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "074zpm6mmr1wfl6d5xdf8jk1fs4ccpbzf4ahhkwga9g71xiplszv"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/wbolster/evil-text-object-python")
      (synopsis "Text objects for Python")
      (description
       "This package provides @code{evil-mode} text objects for Python.")
      (license license:gpl3+))))

(define-public emacs-evil-lion
  (let ((commit "6b03593f5dd6e7c9ca02207f9a73615cf94c93ab")
        (revision "1"))
    (package
      (name "emacs-evil-lion")
      (version (git-version "0.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/edkolev/evil-lion")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1a162hynp0jcsn50c1w5a02mrw9w3q05c7lkqzqd25px3d0p772q"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (arguments
       `(#:test-command '("make" "test")))
      (home-page "https://github.com/edkolev/evil-lion")
      (synopsis "Align operator for @code{evil-mode}")
      (description
       "This package, a port of @code{vim-lion}, provides an operator for
aligning text objects based on separators.")
      (license license:gpl3+))))

(define-public emacs-evil-expat
  (let ((commit "f4fcd0aa3edc359adb5c986b5dd9188d220d84e2")
        (revision "1"))
    (package
      (name "emacs-evil-expat")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/edkolev/evil-expat")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0872ix682hkdz0k8pn6sb54rqkx00rz5fxpd5j2snx406yagpaxz"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (arguments
       `(#:test-command '("make" "test")))
      (home-page "https://github.com/edkolev/evil-expat")
      (synopsis "Extra @code{ex} commands for @code{evil-mode}")
      (description
       "This package provides additional commands for the @code{ex} command
line, including functions for version control with Git and for copying and
pasting into and from @code{tmux} paste buffers.")
      (license license:gpl3+))))

;; (define-public emacs-evil-nerd-commenter
;;   (package
;;     (name "emacs-evil-nerd-commenter")
;;     (version "3.6.1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/redguardtoo/evil-nerd-commenter")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32
;;          "1xi4sd75pzhgcd9lzhx18hlzbrwh5q9gbscb1971qn94mzxwd60r"))))
;;     (build-system emacs-build-system)
;;     (arguments (list #:test-command #~(list "make" "test")
;;                      #:tests? #f        ; XXX: broken docstring
;;                      #:phases
;;                      #~(modify-phases %standard-phases
;;                          (add-after 'unpack 'patch-Makefile
;;                            (lambda _
;;                              (substitute* "Makefile"
;;                                (("-Q") "")
;;                                (("-L [^.]*") "")
;;                                (("deps/") "")
;;                                ((" deps") "")))))))
;;     (propagated-inputs (list emacs-evil))
;;     (native-inputs (list emacs-web-mode))
;;     (home-page "https://github.com/redguardtoo/evil-nerd-commenter")
;;     (synopsis "Comment and uncomment lines efficiently")
;;     (description
;;      "This package provides text objects and operators for comments within
;; @code{evil-mode}.")
;;     (license license:gpl3+)))

(define-public emacs-evil-visual-replace
  (package
    (name "emacs-evil-visual-replace")
    (version "0.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/troyp/evil-visual-replace")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1gfyrq7xfzmzh3x8k5f08n027dlbwi0pkkxf9c39fkxp4jngibsz"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil))
    (home-page "https://github.com/troyp/evil-visual-replace")
    (synopsis "Replacement commands for @code{evil-mode} visual blocks")
    (description
     "This package provides versions of @code{query-replace} and
@code{replace-regexp} that work for @code{evil-mode} visual blocks.")
    (license license:gpl2+)))

(define-public emacs-evil-visualstar
  (let ((commit "06c053d8f7381f91c53311b1234872ca96ced752")
        (version "0.2.0")
        (revision "1"))
    (package
      (name "emacs-evil-visualstar")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bling/evil-visualstar")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0mkbzw12fav945icibc2293m5haxqr3hzkyli2cf4ssk6yvn0x4c"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/bling/evil-visualstar")
      (synopsis "Instantly search using the visual selection")
      (description
       "This package provides @code{evil-mode} functions for using selected text
to search.")
      (license license:gpl3+))))

(define-public emacs-monky
  (package
    (name "emacs-monky")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ananthakumaran/monky")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1fgn7al4zwz2k5wb5dy3byqg9lsrjk9fra341mxh5ma2pfwxjgps"))))
    (build-system emacs-build-system)
    (home-page "https://ananthakumaran.in/monky/index.html")
    (arguments
     `(#:test-command '("emacs" "--batch"
                        "-l" "test/monky-unit-test.el"
                        "-f" "ert-run-tests-batch-and-exit")))
    (synopsis "Interactive interface for the Mercurial version control system")
    (description
     "Monky provides an Emacs interface for Mercurial (Hg).  Using Monky, you
can selectively commit files, view the diffs, and other things.")
    (license license:gpl3+)))

(define-public emacs-monroe
  (package
    (name "emacs-monroe")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sanel/monroe")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "101lfrykdbv37spkbw7zihhx26bc1lhjyxbanrcp9880bxj04jiy"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/sanel/monroe")
    (synopsis "Clojure nREPL client for Emacs")
    (description
     "Monroe is a nREPL client for Emacs, focused on simplicity and easy
distribution, primarily targeting Clojure users")
    (license license:gpl3+)))

(define-public emacs-rail
  (package
    (name "emacs-rail")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Sasanidas/Rail")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i07zv0z6r46jpg22x99a1izyfp6536xf951ibyr9kis5bql5jz9"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; tests require networking
    (home-page "https://github.com/Sasanidas/Rail")
    (synopsis "Generic nREPL client for Emacs")
    (description
     "Rail is a nREPL client based on monroe with similar features, but aims
to be a more complete implementation.")
    (license license:gpl3+)))

(define-public emacs-orgalist
  (package
    (name "emacs-orgalist")
    (version "1.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://elpa.gnu.org/packages/"
                           "orgalist-" version ".tar"))
       (sha256
        (base32 "0j78g12q66piclraa2nvd1h4ri8d6cnw5jahw6k5zi4xfjag6yx3"))))
    (build-system emacs-build-system)
    (home-page "https://elpa.gnu.org/packages/orgalist.html")
    (synopsis "Manage Org-like lists in non-Org buffers")
    (description "Orgalist writes and manages Org mode's plain lists in
non-Org buffers.  More specifically, it supports the syntax of Org mode for
numbered, unnumbered, description items, checkboxes, and counter cookies.

The library also implements radio lists, i.e., lists written in Org syntax
later translated into the host format, e.g., LaTeX or HTML.")
    (license license:gpl3+)))

(define-public emacs-writegood-mode
  (package
    (name "emacs-writegood-mode")
    (version "2.2.0")
    (home-page "https://github.com/bnbeckwith/writegood-mode")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url home-page)
                    (commit (string-append "v" version))))
              (sha256
               (base32
                "1a3gmaaa344kigr209b6wnjiw9ikkmw1j5jda04h3g8f9817njyv"))
              (file-name (string-append name "-checkout"))))
    (build-system emacs-build-system)
    (synopsis "Polish up poor writing on the fly")
    (description
     "This minor mode tries to find and highlight problems with your writing
in English as you type.  It primarily detects \"weasel words\" and abuse of
passive voice.")
    (license license:gpl3+)))

(define-public emacs-writefreely
  (let ((commit "cfbba9c3a34f580f39c0796966ea76b0cf98a23e")
        (revision "0"))
    (package
      (name "emacs-writefreely")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/dangom/writefreely.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "02gy3kg28igqcg7ai8n2p19q8m4xpgp5wn34n2fwz2bjymgf9g4s"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-ox-hugo emacs-request))
      (home-page "https://github.com/dangom/writefreely.el")
      (synopsis "Emacs interface to the WriteFreely API")
      (description
       "This library publishes Org mode files as posts to any instance of the
federated blogging platform WriteFreely.")
      (license license:gpl3+))))

(define-public emacs-neotree
  (package
    (name "emacs-neotree")
    (version "0.6.0")
    (home-page "https://github.com/jaypei/emacs-neotree")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url home-page)
                     (commit version)))
              (sha256
               (base32
                "1rwm8j48ks9fa5q3g8crpfzbikxfjj5m13w9ylimg34xniycrlq2"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command #~(list "make" "test-batch")))
    (synopsis "Folder tree view for Emacs")
    (description "This Emacs package provides a folder tree view.")
    (license license:gpl3+)))

(define-public emacs-org
  (package
    (name "emacs-org")
    (version "9.7.25")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.savannah.gnu.org/git/emacs/org-mode")
             (commit (string-append "release_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wi8kj0vhlnzslarjfbi1ljqh71jlsbi4krsx6cr1ch5cm9v78y9"))))
    (build-system emacs-build-system)
    (outputs (list "out" "test"))
    (arguments
     (list
      #:test-command #~(list "make" "test-dirty")
      #:phases
      #~(modify-phases %standard-phases
          (replace 'expand-load-path
            ;; Make sure `load-path' includes "lisp" directory, otherwise
            ;; byte-compilation fails.
            (lambda args
              (with-directory-excursion "lisp"
                (apply (assoc-ref %standard-phases 'expand-load-path) args))))
          (add-after 'expand-load-path 'bootstrap
            ;; XXX: Generate "org-loaddefs.el".
            (lambda _
              (invoke "make" "autoloads")))
          (add-before 'check 'fix-tests
            (lambda* (#:key inputs #:allow-other-keys)
              ;; XXX: Running tests updates ID locations.  The process expects
              ;; a file to be writeable in "~/.emacs.d/".
              (setenv "HOME" (getcwd))
              (mkdir-p ".emacs.d")
              ;; These files are modified during testing.
              (with-directory-excursion "testing/examples"
                (for-each make-file-writable
                          '("babel.org"
                            "ob-awk-test.org"
                            "ob-sed-test.org"))
                ;; Specify where sh executable is.
                (let ((sh (search-input-file inputs "/bin/sh")))
                  (substitute* "babel.org"
                    (("/bin/sh") sh))))
              ;; XXX: Fix failure in ob-tangle/collect-blocks.  The test
              ;; assumes that ~/../.. corresponds to /.  This isn't true in
              ;; our case.
              (substitute* "testing/lisp/test-ob-tangle.el"
                ((" ~/\\.\\./\\.\\./")
                 (string-append " ~"
                                ;; relative path from ${HOME} to / during
                                ;; build
                                (string-join
                                 (map-in-order
                                  (lambda (x)
                                    (if (equal? x "") "" ".."))
                                  (string-split (getcwd) #\/)) "/")
                                "/")))
              ;; XXX: Skip failing tests.
              (substitute* "testing/lisp/test-ob-shell.el"
                (("ob-shell/remote-with-stdin-or-cmdline .*" all)
                 (string-append all "  (skip-unless nil)\n")))
              (substitute* "testing/lisp/test-org.el"
                (("test-org/org-(encode-time|time-string-to-time) .*" all)
                 (string-append all "  (skip-unless nil)\n")))))
          (replace 'build
            (lambda args
              (with-directory-excursion "lisp"
                (apply (assoc-ref %standard-phases 'build) args))))
          (replace 'install
            (lambda _
              (let ((elpa (elpa-directory #$output))
                    (info (string-append #$output "/share/info")))
                (substitute* "local.mk"
                  (("^lispdir.*") (string-append "lispdir = " elpa))
                  (("^datadir.*") (string-append "datadir = " elpa "/etc"))
                  (("^infodir.*") (string-append "infodir = " info))))
              (invoke "make" "install" (string-append "ORGVERSION=" #$version))))
          (add-after 'install 'install-org-test
            (lambda _
              (with-directory-excursion "testing"
                (copy-recursively "."
                                  (string-append (elpa-directory #$output:test))))))
          (add-after 'install 'install-org-news
            ;; Install ORG-NEWS files in doc directory.
            (lambda _
              (install-file "etc/ORG-NEWS"
                            (string-append #$output "/share/doc/"
                                           #$name "-" #$version)))))))
    (native-inputs
     (list texinfo))
    (home-page "https://orgmode.org/")
    (synopsis "Outline-based notes management and organizer")
    (description "Org is an Emacs mode for keeping notes, maintaining TODO
lists, and project planning with a fast and effective lightweight markup
language.  It also is an authoring system with unique support for literate
programming and reproducible research.  If you work with the LaTeX output
capabilities of Org-mode, you may want to install the
@code{emacs-org-texlive-collection} meta-package, which propagates the TexLive
components required by the produced @file{.tex} file.")
    (license license:gpl3+)))

(define-public emacs-org-contrib
  (package
    (name "emacs-org-contrib")
    (version "0.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.sr.ht/~bzg/org-contrib")
             (commit (string-append "release_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08m3aa8vsrlkacbvindjwqzviv5r8i9a0vzsrl8rx01xq5b0zd42"))))
    (build-system emacs-build-system)
    (arguments
     (list #:lisp-directory "lisp"))
    (propagated-inputs
     (list emacs-org))
    (home-page "https://git.sr.ht/~bzg/org-contrib")
    (synopsis "Unmaintained add-ons for Org mode")
    (description
     "This package contains add-ons to Org.  Be warned that these libraries
receive little if no maintenance and there is no guaranty that they are
compatible with the Org stable version.")
    (license license:gpl3+)))

(define-public emacs-org-count-words
  ;; No releases.
  (let ((commit "df4f06905e3020106d6ceaada854ebd7f9a231d2")
        (revision "0"))
    (package
      (name "emacs-org-count-words")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Elilif/org-count-words.git")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "12yxgkqv33i8hcgc5z033fhrar5l937kpsi36v4jffw6lr3wrlbv"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/Elilif/org-count-words")
      (synopsis "Word count in org-mode")
      (description "This package calculates a precise word count in org-mode
by excluding unwanted elements such as code blocks, options, and drawers.  The
results are displayed on the modeline.")
      (license license:gpl3+))))

(define-public emacs-org-texlive-collection
  (package
    (name "emacs-org-texlive-collection")
    (source #f)
    (version (package-version emacs-org))
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (native-inputs '())
    (inputs '())
    (propagated-inputs
     (list texlive-capt-of
           ;; The latexrecommended collection provides fontspec, amsmath,
           ;; hyperref, graphicx, tools, etc.
           texlive-collection-latexrecommended
           texlive-soul
           texlive-standalone
           texlive-ulem
           texlive-wrapfig))
    (home-page (package-home-page emacs-org))
    (synopsis "Basic TeX Live packages for Org mode LaTeX export")
    (description "This meta-package propagates the TeX Live packages minimally
required by the LaTeX output produced by Org mode.")
    (license (license:fsf-free "https://www.tug.org/texlive/copying.html"))))

(define-public emacs-org-contacts
  ;; XXX: Upstream does not tag version bumps. Commit below matches latest
  ;; version bump.
  (let ((commit "217ba04c9d638067a6ccb0829cf1885f54c1d568"))
    (package
      (name "emacs-org-contacts")
      (version "1.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://repo.or.cz/org-contacts")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0f0vjdvx0hffj2xvyrya8yfl77djmzmpxdxsx58ym4lmdvwyb6x3"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-org))
      (home-page "https://repo.or.cz/org-contacts")
      (synopsis "Contacts management system for Org mode")
      (description "Manage your contacts from Org mode.  You can auto
complete email addresses, export contacts to a vCard file, put birthdays
in your Org Agenda, and more.")
      (license license:gpl3+))))

(define-public emacs-org-vcard
  (package
    (name "emacs-org-vcard")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/flexibeast/org-vcard")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14l3xqahqmnfl3sskqcr33xpcsic8dm9cr9wmbv5la3xv14n10k7"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/flexibeast/org-vcard")
    (synopsis "Org mode support for vCard export and import")
    (description
     "This package exports and imports vCard files from within GNU Emacs' Org
mode.")
    (license license:gpl3+)))

(define-public emacs-org-pretty-table
  ;; There is no release yet.
  (let ((commit "1331c600b83d95b28730b1bfcb48369ac1cf12ef")
        (revision "0"))
    (package
      (name "emacs-org-pretty-table")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Fuco1/org-pretty-table")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0yvqxh66y400n2n5ykmb1zrzd80bakffpwn6nmf37728x4cj8krh"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/Fuco1/org-pretty-table")
      (synopsis "Make tables in Org mode and OrgTbl mode prettier")
      (description
       "This package displays tables in Org mode and OrgTbl mode using Unicode
characters.")
      (license license:gpl3+))))

(define-public emacs-ob-sclang
  (let ((commit "cd3f3c847d8149cd4ce4a775942dac88ba92c772")
        (revision "1"))
    (package
      (name "emacs-ob-sclang")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://repo.or.cz/ob-sclang")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0dr8va2v0262plqxd63yxymqiffkql9klci7wsp5i7xgpka8925q"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-org emacs-scel))
      (home-page "https://repo.or.cz/ob-sclang")
      (synopsis "Org Babel support for SuperCollider")
      (description "This package adds support for evaluating @code{sclang} Org
mode source blocks.")
      (license license:gpl3+))))

(define-public emacs-org-edna
  (package
    (name "emacs-org-edna")
    (version "1.1.2")
    (source (origin
              (method bzr-fetch)
              (uri (bzr-reference
                    (url "bzr://bzr.savannah.nongnu.org/org-edna-el")
                    (revision version)))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "01dblddgx0yid5hrgl4swbr4grhv057kfbdy122wihzqpsrgq86n"))))
    (build-system emacs-build-system)
    (home-page "https://savannah.nongnu.org/projects/org-edna-el/")
    (synopsis "Manage Org task dependencies")
    (description "This package provides an extensible means of specifying
conditions which must be fulfilled before a task can be completed and actions
to take once it is.  Org Edna runs when either the BLOCKER or TRIGGER
properties are set on a heading, and when it is changing from a TODO state to
a DONE state.")
    (license license:gpl3+)))

(define-public emacs-toodoo
  ;; Package has no release.  Version is extracted from "Version:" keyword in
  ;; main file, and commit below matches version bump.
  (package
    (name "emacs-toodoo")
    (version "0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ChanderG/toodoo.el")
             (commit "149a563863c2f728c5f903475dbce50547c51000")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "00q7aym0kl03j9m66pivgy0snxcjjg402049b2wdy18kgyypfvx8"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil))
    (home-page "https://github.com/ChanderG/toodoo.el")
    (synopsis "Magit-like interface for a Todo workflow built on top of Org")
    (description "This package provides a minor mode for fast and easy management of Todos
using Org mode and transients.")
    (license license:asl2.0)))

;; (define-public emacs-flx
;;   (package
;;     (name "emacs-flx")
;;     (version "0.6.1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;               (url "https://github.com/lewang/flx")
;;               (commit (string-append "v" version))))
;;        (sha256
;;         (base32
;;          "0sjybrcnb2sl33swy3q664vqrparajcl0m455gciiih2j87hwadc"))
;;        (file-name (git-file-name name version))))
;;     (build-system emacs-build-system)
;;     (arguments (list #:tests? #f        ; tests require a TTY
;;                      #:test-command #~(list "make" "test")))
;;     (home-page "https://github.com/lewang/flx")
;;     (synopsis "Fuzzy matching for Emacs")
;;     (description
;;      "Flx provides fuzzy matching for emacs a la sublime text.
;; The sorting algorithm is a balance between word beginnings (abbreviation)
;; and contiguous matches (substring).  The longer the substring match,
;; the higher it scores.  This maps well to how we think about matching.
;; Flx has support for ido (interactively do things) through flx-ido.")
;;     (license license:gpl3+)))

(define-public emacs-afternoon-theme
  (let ((commit "89b1d778a1f8b385775c122f2bd1c62f0fbf931a")
        (revision "0"))
    (package
      (name "emacs-afternoon-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/osener/emacs-afternoon-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "19d5d6qs5nwmpf26rsb86ranb5p4236qp7p2b4i88cimcmzspylb"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/osener/emacs-afternoon-theme")
      (synopsis "Dark color theme with a deep blue background")
      (description
       "Afternoon theme is a dark color theme with a deep blue background.")
      (license license:gpl3+))))

(define-public emacs-cyberpunk-theme
  (package
    (name "emacs-cyberpunk-theme")
    (version "1.22")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/n3mo/cyberpunk-theme.el/")
              (commit version)))
       (sha256
        (base32
         "06nff38pcy5rgz13svkajsg0jjk73qy4a8m7p9f76yxcywxlgxlc"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (home-page "https://github.com/n3mo/cyberpunk-theme.el")
    (synopsis "Cyberpunk theme for Emacs built-in color theme support")
    (description
     "Cyberpunk color theme for the Emacs 24+ built-in color theme support
known loosely as deftheme.  Many mode-specific customizations are included.")
    (license license:gpl3+)))

(define-public emacs-dart-mode
  (package
    (name "emacs-dart-mode")
    (version "1.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bradyt/dart-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vql8m4nj0brmv58b6lkbhykik8n6j4i7d3nylcls78y7ihc2cz8"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command
                     ;; XXX: test-font-lock has one unexpected failure.
                     #~(list "emacs" "--batch" "-l" "dart-mode"
                             ;; "-l" "test/test-font-lock.el"
                             "-l" "test/test-indentation.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-flycheck emacs-s))
    (home-page "https://github.com/bradyt/dart-mode")
    (synopsis "Emacs mode for the Dart programming language")
    (description
     "Dart mode is an Emacs major mode for editing Dart files.  It provides
basic syntax highlighting and indentation.")
    (license license:gpl3+)))

(define-public emacs-denote-explore
  (package
    (name "emacs-denote-explore")
    (version "4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pprevos/denote-explore")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04lc5fw11wixbjdkzbl63g03rdybv6q4mh1dc6c9y322g8qq3r0k"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-denote (@(bost gnu packages emacs-build) emacs-dash)))
    (arguments
     (list
      #:tests? #f ;no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'build-info-manual
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "emacs"
                      "--batch"
                      "--eval=(require 'ox-texinfo)"
                      "--eval=(find-file \"denote-explore.org\")"
                      "--eval=(org-texinfo-export-to-info)"))))))
    (native-inputs (list texinfo))
    (home-page "https://github.com/pprevos/denote-explore")
    (synopsis "Analyse and visualise a collection of Denote notes")
    (description
     "The Denote Explore package provides auxiliary functions to
maintain and explore your collection of Denote files.  Denote Explore provides
four groups of Emacs commands:
@enumerate
@item Summary statistics: Count and visualize notes, attachments and keywords.
@item Random walks: Generate new ideas using Serendipity.
@item Janitor: Manage your Denote collection.
@item Visualisations: Visualise your Denote network as a network
graph.  (Optional dependencies GraphViz, D3js, to be acquired separately!)
@end enumerate")
    (license license:gpl3+)))

;; (define-public emacs-helm-org-rifle
;;   (package
;;     (name "emacs-helm-org-rifle")
;;     (version "1.7.1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/alphapapa/helm-org-rifle")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32
;;          "0pm6va26kadjvbai4qsnjc2bk379w2nk6h3b5f0c2yv3q5na0p49"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list #:test-command #~(list "buttercup" "-L" ".")))
;;     (native-inputs
;;      (list emacs-buttercup))
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f) (@(bost gnu packages emacs-xyz-2) emacs-helm) emacs-org emacs-s))
;;     (home-page "https://github.com/alphapapa/helm-org-rifle")
;;     (synopsis "Rifle through Org files")
;;     (description "This package searches both headings and contents of entries
;; in Org buffers and displays matching entries.")
;;     (license license:gpl3+)))

(define-public emacs-boon
  (package
    (name "emacs-boon")
    (version "1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jyp/boon")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jmmxav45sbch9prdxipd04rdmyh5ca1r9lpdlj61b5c4vlm4282"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; tests require networking
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-expand-region emacs-multiple-cursors
           emacs-powerline emacs-spaceline))
    (home-page "https://github.com/jyp/boon")
    (synopsis "Ergonomic command mode for Emacs")
    (description "Boon is a complete package for modal editing with a focus on
ergonomics and modularity.  Spacial allocation of keys comes first, mnemonics
second.  Most common operations are mapped to the home row, common editing
commands are bound to keys reachable with the left hand and movement keys are
reached with the right hand.")
    (license license:gpl3+)))

(define-public emacs-pippel
  (let ((commit "cb194952ee150e77601d3233dabdb521b976ee79")
        (revision "0"))
    (package
      (name "emacs-pippel")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/arifer612/pippel")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "17606l24yyrjxa4rc0p2zj50lfbayqldw4phhi59yqf61289d520"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^pippel\\.py$" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'substitute-pippel-package-path
              (lambda _
                (emacs-substitute-variables "pippel.el"
                  ("pippel-package-path" (elpa-directory #$output)))))
            (add-after 'unpack 'substitute-python-path
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "pippel.el"
                  ("pippel-python-command"
                   (search-input-file inputs "/bin/python"))))))))
      (inputs
       (list python-wrapper))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (home-page "https://github.com/arifer612/pippel")
      (synopsis "Emacs frontend to Python package manager Pip")
      (description
       "Pippel is an Emacs frontend for the Python package manager Pip.  As
Pippel also uses Tabulated List mode, it provides a similar package menu like
@code{package-list-packages}.")
      (license license:gpl3+))))

(define-public emacs-mini-echo
  (package
    (name "emacs-mini-echo")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/liuyinz/mini-echo.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fgh93xzf4y3fhi7nby0h1vnay78sc2hv06ai5x3j972qz5b0v5v"))))
    (build-system emacs-build-system)
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash) emacs-hide-mode-line))
    (home-page "https://github.com/liuyinz/mini-echo.el")
    (synopsis "Echo buffer status in minibuffer window")
    (description "This package lets you show buffer status in the echo area,
so you can get rid of the mode-line.")
    (license license:gpl3+)))

(define-public emacs-mustache
  (package
    (name "emacs-mustache")
    (version "0.23")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/mustache.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n2ymd92qpvsby6ms0l3kjhdzzc47rri2aiscc6bs07hm4mjpr9q"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command
           #~(list "emacs" "-Q" "-batch" "-L" "." "-l" "mustache-tests"
                   "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-ht emacs-s))
    (home-page "https://github.com/Wilfred/mustache.el")
    (synopsis "Mustache templating library for Emacs")
    (description "Mustache templating library for Emacs, mustache is
a simple web template system, which is described as a logic-less system
because it lacks any explicit control flow statements, both looping and
conditional evaluation can be achieved using section tags processing lists
and lambdas.")
    (license license:gpl3+)))

(define-public emacs-org2web
  (package
    (name "emacs-org2web")
    (version "0.9.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tumashu/org2web")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "103fzmadgd93x1y0c6xsdjx70z0jkwpvj0xnkybdancxz4ba8p9l"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'fix-byte-compilation
            ;; XXX: The fix below was integrated upstream and can be removed
            ;; in next release.
            (lambda _
              (substitute* "org2web-el2org.el"
                (("(define-obsolete-function-alias .*)\\)" _ lead)
                 (string-append lead " \"0.1\")"))))))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)
           emacs-el2org
           emacs-ht
           emacs-mustache
           emacs-simple-httpd))
    (home-page "https://github.com/tumashu/org2web")
    (synopsis "Static site generator based on Org mode")
    (description "Org2web is a static site generator based on Org mode, which
code derived from Kelvin H's Org page.")
    (license license:gpl2+)))

;; (define-public emacs-json-reformat
;;   (package
;;     (name "emacs-json-reformat")
;;     (version "0.0.7")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/gongo/json-reformat")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "1gaifz1brh7yh1wk1c02gddwis4ab6bggv27gy7gcd2s861f8bkx"))
;;        (patches (search-patches "emacs-json-reformat-fix-tests.patch"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      `(#:phases
;;        (modify-phases %standard-phases
;;          (add-before 'check 'make-tests-writable
;;            (lambda _
;;              (for-each make-file-writable (find-files "test"))))
;;          (add-before 'check 'delete-json-objects-order-test
;;            (lambda _
;;              (emacs-batch-edit-file "test/json-reformat-test.el"
;;                `(progn (progn (goto-char (point-min))
;;                               (re-search-forward
;;                                "ert-deftest json-reformat-test:json-reformat-region")
;;                               (beginning-of-line)
;;                               (kill-sexp))
;;                        (basic-save-buffer)))))
;;          (add-before 'check 'delete-json-reformat-region-occur-error-test
;;            (lambda _
;;              (emacs-batch-edit-file "test/json-reformat-test.el"
;;                `(progn (goto-char (point-min))
;;                        (re-search-forward
;;                         "ert-deftest json-reformat-test:json-reformat-region-occur-error")
;;                        (beginning-of-line)
;;                        (kill-sexp)
;;                        (basic-save-buffer))))))))
;;     (native-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-dash) emacs-ert-runner emacs-shut-up))
;;     (propagated-inputs
;;      (list emacs-undercover))
;;     (home-page "https://github.com/gongo/json-reformat")
;;     (synopsis "Reformatting tool for JSON")
;;     (description "@code{json-reformat} provides a reformatting tool for
;; @url{http://json.org/, JSON}.")
;;     (license license:gpl3+)))

(define-public emacs-jsonnet-mode
  (package
    (name "emacs-jsonnet-mode")
    (version "0.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tminor/jsonnet-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "14nxfa91yg2243v4d5kvynp2645x3811ispmhmpgil3x9qbl9jg9"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/tminor/jsonnet-mode")
    (synopsis "Major mode for editing jsonnet files")
    (description "This package provides syntax highlighting, indenting,
formatting, and utility methods for jsonnet files.")
    (license license:gpl3+)))

(define-public emacs-dired-hacks
  (let ((commit "d1a2bda6aa8f890cb367297ed93aee6d3b5ba388")
        (revision "3"))
    (package
      (name "emacs-dired-hacks")
      (version (git-version "0.0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Fuco1/dired-hacks")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "12m81a9kjhs4cyq3lym0vp5nx6z3sfnypyzrnia76x6rjvixjf6y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-eimp (@(bost gnu packages emacs-build) emacs-f) emacs-s))
      (home-page "https://github.com/Fuco1/dired-hacks")
      (synopsis
       "Collection of useful dired additions")
      (description
       "This package provides the following collection of Emacs dired mode
additions:

@itemize
@item dired-avfs
@item dired-columns
@item dired-filter
@item dired-hacks-utils
@item dired-images
@item dired-list
@item dired-narrow
@item dired-open
@item dired-rainbow
@item dired-ranger
@item dired-subtree
@item dired-tagsistant
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-lcr
  (package
    (name "emacs-lcr")
    (version "1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jyp/lcr")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hhn0gqkwki0dfk6j759hmbj1ijn4bs550jh3kgy9jfmnb7cd81l"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/jyp/lcr")
    (synopsis "Lightweight coroutines in Emacs Lisp")
    (description "This package provides macros that can translate code into
equivalent continuation-passing code, as well as miscellaneous utility
functions written in continuation-passing style.")
    (license license:gpl3+)))

(define-public emacs-attrap
  (package
    (name "emacs-attrap")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jyp/attrap")
             (commit version)))
       (sha256
        (base32 "0wqc7bqx9rvk8r7fd3x84h8p01v97s6w2jf29nnjb59xakwp22i7"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f) emacs-flycheck emacs-s))
    (home-page "https://github.com/jyp/attrap")
    (synopsis "Fix coding error at point")
    (description "This package provides a command to fix the Flycheck error
at point.")
    (license license:gpl3+)))

(define-public emacs-browse-at-remote
  (package
    (name "emacs-browse-at-remote")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rmuslimov/browse-at-remote")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bx4ns0jb0sqrjk1nsspvl3mhz3n12925azf7brlwb1vcgnji09v"))))
    (build-system emacs-build-system)
    (native-inputs
     (list emacs-ert-runner))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-f) emacs-s))
    (home-page "https://github.com/rmuslimov/browse-at-remote")
    (synopsis "Open github/gitlab/bitbucket/stash page from Emacs")
    (description
     "This Emacs package allows you to open a target page on
github/gitlab (or bitbucket) by calling @code{browse-at-remote} command.
It supports dired buffers and opens them in tree mode at destination.")
    (license license:gpl3+)))

(define-public emacs-ansible
  (package
    (name "emacs-ansible")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/emacs-ansible/emacs-ansible")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "189mqb5sayhll5dr005b675rcswdb6jy4k6bjspx3cxgfbakk6h8"))))
    (build-system emacs-build-system)
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-f) emacs-s))
    (home-page "https://gitlab.com/emacs-ansible/emacs-ansible")
    (synopsis "Emacs minor mode for Ansible files")
    (description
     "This is an Emacs minor mode for editing Ansible files.")
    (license license:gpl2+)))

(define-public emacs-groovy-modes
  (package
    (name "emacs-groovy-modes")
    (version "2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Groovy-Emacs-Modes\
/groovy-emacs-modes")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1jpfyqnqd8nj0g8xbiw4ar2qzxx3pvhwibr6hdzhyy9mmc4yzdgk"))))
    (build-system emacs-build-system)
    (native-inputs
     (list emacs-ert-runner emacs-undercover emacs-shut-up (@(bost gnu packages emacs-build) emacs-f)))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
    (home-page "https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes")
    (synopsis "Groovy related modes for Emacs")
    (description "This package provides @code{groovy-mode} for syntax
highlighting in Groovy source files, REPL integration with run-groovy and
Grails project navigation with the grails mode.")
    (license license:gpl3+)))

(define-public emacs-terraform-mode
  (package
    (name "emacs-terraform-mode")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/syohex/emacs-terraform-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10wndnlsv7f2yn83n1wamnhiwyhxkdlmwld9yk0m2kkxx4pwfgfj"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command #~(list "emacs" "--batch"
                                  "-l" "test/test-helper.el"
                                  "-l" "test/test-highlighting.el"
                                  "-l" "test/test-indentation.el"
                                  "-l" "test/test-command.el"
                                  "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-hcl-mode))
    (home-page "https://github.com/syohex/emacs-terraform-mode")
    (synopsis "Major mode for Terraform")
    (description
     "@code{emacs-terraform-mode} provides a major mode for working with
@uref{https://www.terraform.io/, Terraform} configuration files.  Most of the
functionality is inherited from @code{hcl-mode}.")
    (license license:gpl3+)))

(define-public emacs-frog-jump-buffer
  (let ((commit "2d7b342785ae27d45f5d252272df6eb773c78e20")
        (revision "1"))
    (package
      (name "emacs-frog-jump-buffer")
      (version (git-version "0.1.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/waymondo/frog-jump-buffer")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1z00by8hiss1r2lwmzrl8pnz6jykia2849dqqm4l3z5rf6lwvc0f"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-frog-menu emacs-avy))
      (home-page "https://github.com/waymondo/frog-jump-buffer")
      (synopsis "Jump to any Emacs buffer with minimal keystrokes")
      (description
       "This package provides a preview window of buffers that can be switched
to with quicklink-style selections.")
      (license license:gpl3+))))

(define-public emacs-pass
  (package
    (name "emacs-pass")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/NicolasPetton/pass")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jc8j421mlflspg24jvrqc2n3y5n3cpk3hjy560il8g36xi1049p"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; Tests require a tty.
           #:test-command
           #~(apply list "emacs"
                    (append
                     (apply append
                            (map (lambda (file) (list "-l" file))
                                 (find-files "." "\\.el")))
                     (list "-f" "ert-run-tests-batch-and-exit")))))
    (propagated-inputs
     (list emacs-password-store (@(bost gnu packages emacs-build) emacs-f)))
    (home-page "https://github.com/NicolasPetton/pass")
    (synopsis "Major mode for @file{password-store.el}")
    (description "This is a major mode for managing password-store (pass)
keychains.  The keychain entries are displayed in a directory-like structure
and can be consulted and modified.")
    (license license:gpl3+)))

(define-public emacs-passage
  (let ((commit "5f1ad815464b1e4ce7880b835f9e805a8b9b15a4")
        (revision "0"))
    (package
      (name "emacs-passage")
      (version (git-version "2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/anticomputer/passage.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "12sxaig36n3qrmnyq2znar74hgbgfh3sgghki4n7aq2bzxwfbn8h"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-age (@(bost gnu packages emacs-build) emacs-f) emacs-s emacs-with-editor))
      (home-page "https://github.com/anticomputer/passage.el")
      (synopsis "Pass-Age Encryption support for Emacs")
      (description
       "This package provides transparent Age file encryption and decryption
in Emacs for Pass-Age, a port of Pass, the standard Unix password manager.")
      (license license:gpl3+))))

(define-public emacs-psc-ide
  ;; There is no proper release.  The base version is extracted from the
  ;; "Version" keyword in the main file.
  (let ((commit "ce97d719458ea099b40c02f05b6609601c727e66")
        (revision "2"))
    (package
      (name "emacs-psc-ide")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/purescript-emacs/psc-ide-emacs")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0xfw93pdf744h2yswc53qwyawfzkc31rv8dmha3irq7k1nklhq6y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-company (@(bost gnu packages emacs-build) emacs-dash) emacs-flycheck emacs-let-alist
             emacs-s))
      (home-page "https://github.com/purescript-emacs/psc-ide-emacs")
      (synopsis "Emacs integration for PureScript's psc-ide tool")
      (description
       "This package provides Emacs integration for @code{psc-ide}, an IDE
protocol for PureScript programming language.  It features:

@itemize
@item Completions
@item Type at point
@item Go to definition
@item Automatic imports
@item Case split
@item Build system integration, and
@item Flycheck support
@end itemize")
      (license license:gpl3+))))

(define-public emacs-epkg
  (package
    (name "emacs-epkg")
    (version "4.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacscollective/epkg")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a6zw1z318ip4vnqfgv99b2knbm3qq6ji7spqq9g5w3lls40aqvx"))))
    (build-system emacs-build-system)
    (arguments
     `(#:lisp-directory "lisp"
       #:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         (add-before 'install 'make-info
           ;; Documentation is located in "docs/".
           (lambda* (#:key outputs #:allow-other-keys)
             (with-directory-excursion "../docs"
               (invoke "makeinfo" "-o" "epkg.info" "epkg.texi")
               (let ((info (string-append (assoc-ref outputs "out")
                                          "/share/info")))
                 (install-file "epkg.info" info))))))))
    (native-inputs
     (list texinfo))
    (propagated-inputs
     (list emacs-closql (@(bost gnu packages emacs-build) emacs-dash) emacs-llama))
    (home-page "https://emacsmirror.net")
    (synopsis "Browse the Emacsmirror package database")
    (description "This package provides access to a local copy of the
Emacsmirror package database.  It provides low-level functions for querying
the database and a @file{package.el} user interface for browsing the database.
Epkg itself is not a package manager.")
    (license license:gpl3+)))

(define-public emacs-frecency
  (package
    (name "emacs-frecency")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alphapapa/frecency.el")
                    (commit (string-append "v" version))))
              (sha256
               (base32
                "1n1ghl3jr4wmzc4f5xhkx5mfg3vfqs0kjzbra6k5drcnyh2iixkc"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-a (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/alphapapa/frecency.el")
    (synopsis "Sort items by frequency and recency of access")
    (description "This package provides a way of sorting items via
a heuristic based on frequency and recency.")
    (license license:gpl3+)))

(define-public emacs-org-recent-headings
  (let ((commit "97418d581ea030f0718794e50b005e9bae44582e")
        (revision "0"))
    (package
      (name "emacs-org-recent-headings")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/org-recent-headings")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1y11rlnhi36lzhc1cagninv6hlcwbvj88xfr0g0xzpbzy7hys021"))
         ;; Contents of makem package, but no tests.
         (snippet #~(for-each delete-file '("makem.sh" "Makefile")))))
      (build-system emacs-build-system)
      (arguments
       (list #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'inject-makem
                   (lambda* (#:key inputs #:allow-other-keys)
                     (symlink (search-input-file inputs "/bin/makem.sh")
                              "makem.sh"))))))
      (native-inputs
       (list makem-minimal))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-frecency (@(bost gnu packages emacs-xyz-2) emacs-helm) emacs-org emacs-s))
      (home-page "https://github.com/alphapapa/org-recent-headings")
      (synopsis "Navigate to recently used Org headings and lists")
      (description
       "This package maintains a list of recently used Org headings,
as well as functions for navigating between these headings.")
      (license license:gpl3+))))

(define-public emacs-org-recur
  (package
    (name "emacs-org-recur")
    (version "1.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/m-cat/org-recur")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0s2n62y3qc72ldzpaq2jz9335h532s566499n346nx21l4qsqdz6"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "emacs" "--batch" "-l" "org-recur-test.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/m-cat/org-recur")
    (synopsis "Simple recurring Org mode tasks")
    (description "This package extends Org mode and Org Agenda with support
for defining recurring tasks and easily scheduling them.")
    (license license:gpl3+)))

(define-public emacs-org-super-agenda
  (package
    (name "emacs-org-super-agenda")
    (version "1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alphapapa/org-super-agenda")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07fv4zgmfc8ppppbr7ylhx89wcw6r6vmz4a6pg0iy4v7sn5pp1wa"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "test/run" "--debug")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'prepare-for-tests.el
            (lambda _
              (make-file-writable "test/test.el")
              (emacs-substitute-variables "test/test.el"
                ("org-super-agenda-test-results-file"
                 (string-append (getcwd) "/test/results.el")))
              ;; The following tests fail.
              (substitute* "test/test.el"
                ;; TODO: Broken on emacs-org-super-agenda@1.3 and
                ;; emacs-org@9.7.4.  Verify when updating.
                ((".* org-super-agenda-test--auto-parent .*" all)
                 (string-append all "  (skip-unless nil)\n"))
                ;; Some tests are using an obsolete variable; fix its use.
                (("\\(org-super-agenda-retain-sorting ")
                 "(org-super-agenda-keep-order ")
                ;; however, they still fail ...
                ;; TODO: Broken on emacs-org-super-agenda@1.3 since before
                ;; emacs-org@9.7.4.  Verify when updating.
                ((".* org-super-agenda-test--with-retained-sorting .*" all)
                 (string-append all "  (skip-unless nil)\n"))
                ;; TODO: Broken on emacs-org-super-agenda@1.3 and
                ;; emacs-org@9.7.4.  Verify when updating.
                ((".* org-super-agenda-test--without-retained-sorting .*" all)
                 (string-append all "  (skip-unless nil)\n"))))))))
    (native-inputs
     (list (@(bost gnu packages emacs-build) emacs-f) util-linux))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-ht emacs-org emacs-s emacs-ts))
    (home-page "https://github.com/alphapapa/org-super-agenda")
    (synopsis "Supercharged Org agenda")
    (description "This package allows items in the Org agenda to be grouped
into sections while preserving the structure imposed by any timestamps.")
    (license license:gpl3+)))

(define-public emacs-org-make-toc
  (package
    (name "emacs-org-make-toc")
    (version "0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alphapapa/org-make-toc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0b3ixh8cqp9id1q1h2l6pl05n7vzk7ffp3ms5kxg8bvbn1l3c77l"))
              (snippet #~(delete-file "makem.sh"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f                  ; tests exist but cannot be run…
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'inject-makem
                 (lambda* (#:key inputs #:allow-other-keys)
                   (symlink (search-input-file inputs "/bin/makem.sh")
                            "makem.sh"))))))
    (propagated-inputs
     (list emacs-compat (@(bost gnu packages emacs-build) emacs-dash) emacs-org emacs-s))
    (native-inputs (list makem-minimal util-linux))
    (home-page "https://github.com/alphapapa/org-make-toc")
    (synopsis "Maintain a table of contents for an Org file")
    (description "This package facilitates the creation and maintenance of
tables of contents.")
    (license license:gpl3+)))

(define-public emacs-ts
  ;; XXX: Upstream did not tag last release.  Use commit matching version
  ;; bump.
  (let ((commit "552936017cfdec89f7fc20c254ae6b37c3f22c5b"))
    (package
      (name "emacs-ts")
      (version "0.3")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/ts.el")
               (commit commit)))
         (sha256
          (base32 "18lif159zndl19ddz9rfq12l90770858yasfns21ryl1yrq3aifr"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (arguments
       ;; XXX: Three tests are failing because of a timezone-related issue
       ;; with how they're written.  On my machine, all the failing test
       ;; results are 18000 seconds (5 hours) off.

       ;; The ts-parse-org function accepts a string without any timezone
       ;; info, not assumed to be in Unix time, and converts it to a so-called
       ;; ts struct.  The ts-unix function (accessor) accepts a ts struct,
       ;; then seems to assume the struct's corresponding time is in terms of
       ;; the user's current time zone, before returning a Unix time in
       ;; seconds.

       ;; The failing tests all have similar problems, but nothing else about
       ;; the library seems particularly off.
       (list
        #:test-command #~(list "emacs" "--batch"
                               "-l" "test/test.el"
                               "-f" "ert-run-tests-batch-and-exit")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'make-tests-writable
              (lambda _
                (make-file-writable "test/test.el")))
            (add-before 'check 'delete-failing-tests
              (lambda _
                (emacs-batch-edit-file "test/test.el"
                  `(progn
                    (goto-char (point-min))
                    (dolist (test-regexp
                             '("ert-deftest ts-fill"
                               "ert-deftest ts-format"
                               "ert-deftest ts-parse-org\\_>"
                               "ert-deftest ts-parse-org-element"))
                            (re-search-forward test-regexp)
                            (beginning-of-line)
                            (kill-sexp)
                            (goto-char (point-min)))
                    (basic-save-buffer))))))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (home-page "https://github.com/alphapapa/ts.el")
      (synopsis "Timestamp and date/time library")
      (description "This package facilitates manipulating dates, times, and
timestamps by providing a @code{ts} struct.")
      (license license:gpl3+))))

(define-public emacs-org-ql
  (package
    (name "emacs-org-ql")
    (version "0.8.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alphapapa/org-ql")
                    (commit (string-append "v" version))))
              (sha256
               (base32
                "043m90flbmmcaiv1n5lfw6pd5hr978r9kqbhy34rgyzm0k34sk72"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #f                       ;FIXME: check phase freezes
      #:test-command #~(list "buttercup" "-L" ".")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'remove-helm-org-ql
            (lambda _
              (delete-file "helm-org-ql.el"))))))
    (native-inputs
     (list emacs-buttercup emacs-with-simulated-input emacs-xr))
    (propagated-inputs
     (list emacs-compat
           (@(bost gnu packages emacs-build) emacs-dash)
           (@(bost gnu packages emacs-build) emacs-f)
           emacs-org
           emacs-org-super-agenda
           emacs-ov
           emacs-peg
           emacs-s
           emacs-ts))
    (home-page "https://github.com/alphapapa/org-ql/")
    (synopsis "Query language for Org buffers")
    (description "This package provides a Lispy query language for Org
files, allowing for actions to be performed based on search criteria.")
    (license license:gpl3+)))

(define-public emacs-helm-org-ql
  (package
    (inherit emacs-org-ql)
    (name "emacs-helm-org-ql")
    (arguments
     (list
      #:tests? #f                       ;no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'remove-emacs-org-ql
            (lambda _
              (install-file "helm-org-ql.el" "..")
              (let ((cwd (getcwd)))
                (with-directory-excursion ".."
                  (delete-file-recursively cwd)
                  (mkdir cwd)
                  (install-file "helm-org-ql.el" cwd))))))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)
           (@(bost gnu packages emacs-xyz-2) emacs-helm)
           (@(bost gnu packages emacs-xyz-2) emacs-helm-org)
           emacs-org-ql
           emacs-s))
    (synopsis "Helm commands for @code{emacs-org-ql}")
    (description "This package provides @code{emacs-helm} commands for
@code{emacs-org-ql}, a Lispy query language for Org files, allowing for actions to
be performed based on search criteria.")))

(define-public emacs-org-auto-expand
  (let ((commit "4938d5f6460e2f8f051ba9ac000b291bfa43ef62")
        (revision "1"))
    (package
      (name "emacs-org-auto-expand")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/alphapapa/org-auto-expand")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1my0c6xmkh37lwi6l472lz9d86lf20h6xcllzlxm1lxa24rhva6v"))
                (snippet #~(begin
                             (for-each delete-file
                                       '("makem.sh" "Makefile"))))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))  ; No tests.
      (propagated-inputs
       (list emacs-org (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/alphapapa/org-auto-expand")
      (synopsis "Automatically expand certain Org headings")
      (description "This package allows a customizable set of headings in Org
files to be expanded upon opening them.")
      (license license:gpl3+))))

(define-public emacs-biblio
  (package
    (name "emacs-biblio")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cpitclaudel/biblio.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0iya5ybc54kia5vnb3bfr8yilykhbn2xvp157vya06cw4af2cw65"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; XXX: too many broken tests
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-let-alist))
    (home-page "https://github.com/cpitclaudel/biblio.el")
    (synopsis "Browse and import bibliographic references")
    (description "This package provides an extensible Emacs package for
browsing and fetching references.

@file{biblio.el} makes it easy to browse and gather bibliographic references
and publications from various sources, by keywords or by DOI.  References are
automatically fetched from well-curated sources, and formatted as BibTeX.")
    (license license:gpl3+)))

(define-public emacs-helm-bibtex
  (let ((commit "6064e8625b2958f34d6d40312903a85c173b5261")
        (revision "2"))
    (package
      (name "emacs-helm-bibtex")
      (version (git-version "2.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tmalsburg/helm-bibtex")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1q8dm14wdxx14rnlgmz88j6gskvrrsc0f2z2639jwmfhyibw7d77"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-biblio
                               (@(bost gnu packages emacs-build) emacs-dash)
                               (@(bost gnu packages emacs-build) emacs-f)
                               (@(bost gnu packages emacs-xyz-2) emacs-helm)
                               emacs-ivy
                               emacs-parsebib
                               emacs-s))
      (home-page "https://github.com/tmalsburg/helm-bibtex")
      (synopsis "Bibliography manager based on Helm")
      (description
       "This package provides bibliography manager for Emacs,
based on Helm and the BibTeX completion backend.

Key features:

@itemize
@item Quick access to your bibliography from within Emacs
@item Powerful search capabilities
@item Provides instant search results as you type
@item Tightly integrated with LaTeX authoring, emails, Org mode, etc.
@item Open the PDFs, URLs, or DOIs associated with an entry
@item Insert LaTeX cite commands, Ebib links, or Pandoc citations,
BibTeX entries, or plain text references at point, attach PDFs to emails
@item Support for note taking
@item Quick access to online bibliographic databases such as Pubmed,
arXiv, Google Scholar, Library of Congress, etc.
@item Imports BibTeX entries from CrossRef and other sources.
@end itemize")
      (license license:gpl3+))))

(define-public emacs-md4rd
  (package
    (name "emacs-md4rd")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ahungry/md4rd")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1n6g6k4adzkkn1g7z4j27s35xy12c1fg2r08gv345ddr3wplq4ri"))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-request emacs-s emacs-tree-mode))
    (build-system emacs-build-system)
    (home-page "https://github.com/ahungry/md4rd")
    (synopsis "Emacs Mode for Reddit")
    (description
     "This package allows reading Reddit from within Emacs interactively.")
    (license license:gpl3+)))

(define-public emacs-org-mind-map
  ;; XXX: Upstream does not provide any tag.  The commit below corresponds to
  ;; an exact version bump from the main file.
  (let ((commit "477701b15cb0c8ed7f021ca76a4cb1a7d9ad6aa5"))
    (package
      (name "emacs-org-mind-map")
      (version "0.4")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/theodorewiles/org-mind-map")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08sj43py6aid4vpqgsm0v5n94mcmcil0047qjk033492glz6q55c"))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (build-system emacs-build-system)
      (home-page "https://github.com/theodorewiles/org-mind-map")
      (synopsis "Create Graphviz directed graphs from Org files")
      (description
       "This package creates Graphviz directed graphs from Org files.")
      (license license:gpl3+))))

;; (define-public emacs-elisp-refs
;;   (package
;;     (name "emacs-elisp-refs")
;;     (version "1.5")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/Wilfred/elisp-refs")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "1670jj0pya74gb0xbjlfmka4w06hzh6ya1ai9f4brxp4n9knc13i"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-dash)
;;            (@(bost gnu packages emacs-build) emacs-f)
;;            emacs-list-utils
;;            emacs-loop
;;            emacs-s
;;            emacs-shut-up))
;;     (native-inputs
;;      (list emacs-ert-runner emacs-undercover))
;;     (home-page "https://github.com/Wilfred/elisp-refs")
;;     (synopsis "Find callers of elisp functions or macros")
;;     (description "@code{elisp-refs} finds references to functions, macros or
;; variables.  Unlike a dumb text search, it actually parses the code, so it's
;; never confused by comments or @code{foo-bar} matching @code{foo}.")
;;     (license license:gpl3+)))

(define-public emacs-esup
  (let ((commit "0de8af8233d9ce1b67f05a50f25c481c4f1118d8")
        (revision "1"))
    (package
      (name "emacs-esup")
      (version (git-version "0.7.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jschaf/esup")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "01khb3xyj0ylwib6ryzzvqmkh5wvzxiq2n3l0s3h9zv7wx849bzv"))))
      (build-system emacs-build-system)
      (native-inputs
       (list emacs-noflet emacs-undercover emacs-buttercup))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (arguments
     `(#:test-command '("buttercup" "-L" ".")))
      (home-page "https://github.com/jschaf/esup")
      (synopsis "Emacs start up profiler")
      (description "Benchmark Emacs Startup time without ever leaving
your Emacs.")
      (license license:gpl2+))))

(define-public emacs-company-lua
  (let ((commit "29f6819de4d691e5fd0b62893a9f4fbc1c6fcb52")
        (revision "2"))
    (package
      (name "emacs-company-lua")
      (version (git-version "0.1" "2" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ptrv/company-lua")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ny2dcc7c585p7v3j6q0rpkbj1qmf2ismy8a5020jpr585xvz0hh"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-company emacs-s (@(bost gnu packages emacs-build) emacs-f) emacs-lua-mode))
      (arguments
       `(#:include (cons* "^lua\\/" %default-include)))
      (home-page "https://github.com/ptrv/company-lua")
      (synopsis "Company backend for Lua")
      (description
       "This package provides Company backend for Lua programming language.")
      (license license:gpl3+))))

(define-public emacs-elm-mode
  (package
    (name "emacs-elm-mode")
    (version "0.22.0")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/jcollard/elm-mode")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gnr61ibzcznfqy5f8capmbz75rcfikwy106rjdmp45qz2jwp4di"))))
    (arguments (list #:tests? #f))      ; no tests
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f) emacs-reformatter emacs-s))
    (build-system emacs-build-system)
    (home-page "https://github.com/jcollard/elm-mode")
    (synopsis "Emacs major mode for editing Elm source code")
    (description
     "This package provides a major mode for editing Elm source code, and
working with common core and third-party Elm tools.  Its features are:

@itemize
@item Syntax highlighting
@item Intelligent indentation
@item Integration with elm-make
@item Integration with elm-repl
@item Integration with elm-reactor
@item Integration with elm-package
@item Integration with elm-oracle
@item Integration with elm-format
@item Integration with elm-test
@end itemize")
    (license license:gpl3+)))

(define-public emacs-hy-mode
  (package
    (name "emacs-hy-mode")
    (version "1.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hylang/hy-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gihxlmfminadaqdr8d2zccd7wwygl3m0gfzxsk5izi7f8hl4w7f"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
    (home-page "https://github.com/hylang/hy-mode")
    (synopsis "Major mode for Hylang")
    (description "This package provides a major mode for Hylang.")
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

(define-public emacs-helm-shell-history
  (let ((commit "110d3c35c52fe4b89b29e79ea4c8626bce7266a1"))
    (package
      (name "emacs-helm-shell-history")
      (version (git-version "0.1" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yuutayamada/helm-shell-history")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "18fkjcz69g4dyaxhf9j8svr5x6dhsdnglddwisis8hdn504scpfj"))))
      (build-system emacs-build-system)
      (arguments
       '(#:phases
         (modify-phases %standard-phases
           (add-before 'check 'patch-helm-shell-history-file
             (lambda _
               (let ((file "helm-shell-history.el"))
                 (chmod file #o644)
                 (emacs-substitute-sexps file
                   ("(defvar helm-shell-history-file"
                    `(expand-file-name "~/.bash_history"))))
               #t)))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-xyz-2) emacs-helm)))
      (home-page "https://github.com/yuutayamada/helm-shell-history")
      (synopsis "Find shell history with Emacs Helm")
      (description "This package provides an Emacs Helm interface to search
throw a shell history.")
      (license license:gpl3+))))

(define-public emacs-discover-my-major
  (package
    (name "emacs-discover-my-major")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://framagit.org/steckerhalter/discover-my-major.git/")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1wlqyl03hhnflbyay3qlvdzqzvv5rbybcjpfddggda7ias9h0pr4"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; no tests
    (propagated-inputs
     (list emacs-makey))
    (home-page "https://framagit.org/steckerhalter/discover-my-major/")
    (synopsis "Discover key bindings for the current Emacs major mode")
    (description "This package discovers key bindings and
their meaning for the current Emacs major-mode.")
    (license license:gpl3+)))

(define-public emacs-org-ref
  (let ((commit "732a20bd236fd02db4a651da29f87f87f458a54a")
        (revision "0"))
    (package
      (name "emacs-org-ref")
      (version (git-version "3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jkitchin/org-ref")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1kbjxz56fvln6drd2wqdxrpgwjshzpdbyaq7dz0gn285z93y1knk"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons* "org-ref.org" "org-ref.bib" %default-include)
        #:exclude #~(list
                     ;; author doesn't recommend using it
                     "org-ref-pdf.el")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'skip-failing-test
              (lambda _
                (substitute* "test/all-org-test.el"
                  (("\\(ert-deftest preprocess .*" all)
                   (string-append all
                                  " (skip-unless (libxml-available-p))"))))))))
      (propagated-inputs
       (list emacs-avy
             emacs-citeproc
             (@(bost gnu packages emacs-build) emacs-dash)
             (@(bost gnu packages emacs-build) emacs-f)
             emacs-helm-bibtex
             emacs-htmlize
             emacs-hydra
             emacs-ox-pandoc
             emacs-parsebib
             emacs-request
             emacs-s))
      (native-inputs (list emacs-ert-runner))
      (home-page "https://github.com/jkitchin/org-ref")
      (synopsis "Citations, cross-references and bibliographies in Org mode")
      (description
       "Org Ref is an Emacs library that provides rich support for citations,
labels and cross-references in Org mode.

The basic idea of Org Ref is that it defines a convenient interface to insert
citations from a reference database (e.g., from BibTeX files), and a set of
functional Org links for citations, cross-references and labels that export
properly to LaTeX, and that provide clickable functionality to the user.  Org
Ref interfaces with Helm BibTeX to facilitate citation entry, and it can also
use RefTeX.

It also provides a fairly large number of utilities for finding bad citations,
extracting BibTeX entries from citations in an Org file, and functions to
create and modify BibTeX entries from a variety of sources, most notably from
a DOI.

Org Ref is especially suitable for Org documents destined for LaTeX export and
scientific publication.  Org Ref is also useful for research documents and
notes.")
      (license license:gpl3+))))

;; (define-public emacs-helpful
;;   (package
;;     (name "emacs-helpful")
;;     (version "0.21")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/Wilfred/helpful")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "03afgdbs5nmhw833svrqky7fmfs1zlvqzcj7j5g29sakivs60xqc"))
;;        (patches (search-patches
;;                  "emacs-helpful-fix-signature.patch"
;;                  "emacs-helpful-fix-tests.patch"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-dash) emacs-elisp-refs (@(bost gnu packages emacs-build) emacs-f) emacs-s))
;;     (native-inputs
;;      (list emacs-ert-runner emacs-undercover))
;;     (home-page "https://github.com/Wilfred/helpful")
;;     (synopsis "More contextual information in Emacs help")
;;     (description "@code{helpful} is an alternative to the built-in Emacs help
;; that provides much more contextual information.

;; @itemize
;; @item Show the source code for interactively defined functions (unlike the
;; built-in Help).
;; @item Fall back to the raw sexp if no source is available.
;; @item Show where a function is being called.
;; @item Docstrings will Highlight the summary (the first sentence), include
;; cross-references, hide superfluous puncuation.
;; @item Show you the properties that have been applied to the current
;; symbol.  This provides visibility of features like edebug or byte-code
;; optimisation.
;; @item Provide a separate @code{helpful-command} function to view interactive
;; functions.
;; @item Display any keybindings that apply to interactive functions.
;; @item Trace, disassemble functions from inside Helpful.  This is discoverable
;; and doesn't require memorisation of commands.
;; @end itemize\n")
;;     (license license:gpl3+)))

;; (define-public emacs-suggest
;;   (package
;;     (name "emacs-suggest")
;;     (version "0.7")
;;     (home-page "https://github.com/Wilfred/suggest.el")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url home-page)
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32
;;          "01v8plska5d3g19sb1m4ph1i3ayprfzk8mi6mpabjy6zad397xjl"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list emacs-loop
;;            (@(bost gnu packages emacs-build) emacs-dash)
;;            emacs-s
;;            (@(bost gnu packages emacs-build) emacs-f)
;;            emacs-spinner
;;            emacs-shut-up))
;;     (native-inputs
;;      (list emacs-ert-runner emacs-undercover))
;;     (synopsis "Suggest Elisp functions that give the output requested")
;;     (description "Suggest.el will find functions that give the output
;; requested.  It's a great way of exploring list, string and arithmetic
;; functions.")
;;     (license license:gpl3+)))

(define-public emacs-academic-phrases
  (let ((commit "0823ed8c24b26c32f909b896a469833ec4d7b656"))
    (package
      (name "emacs-academic-phrases")
      (version (git-version "0.1" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nashamri/academic-phrases")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0qfzsq8jh05w4zkr0cvq3i1hdn97bq344vcqjg46sib26x3wpz6r"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s emacs-ht))
      (home-page "https://github.com/nashamri/academic-phrases")
      (synopsis "Bypass that mental block when writing your papers")
      (description
       "When writing your academic paper, you might get stuck trying to find
the right phrase that captures your intention.  This package tries to
alleviate that problem by presenting you with a list of phrases organized by
the topic or by the paper section that you are writing.  This package has
around 600 phrases so far.

Using this package is easy, just call @code{academic-phrases} to get a list of
phrases organized by topic, or call @code{academic-phrases-by-section} to
browse the phrases by the paper section and fill-in the blanks if required.")
      (license license:gpl3+))))

(define-public emacs-grep-context
  (let ((commit "5a4e3efdf775755c1bbefcfe4b461c1166d81d7d")
        (revision "1"))
    (package
      (name "emacs-grep-context")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mkcms/grep-context")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "00q7l4a3c0ay6g5ff9bfa2qgkiswsyh4s6pqnpg0zpzhvv5710f5"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/mkcms/grep-context")
      (synopsis "Increase context in compilation and grep buffers")
      (description
       "This package provides an Emacs package for more context in
compilation/grep buffers.  Works with @code{wgrep}, @code{ack}, @code{ag},
@code{ivy}.")
      (license license:gpl3+))))

(define-public emacs-parinfer-mode
  (package
    (name "emacs-parinfer-mode")
    (version "0.4.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DogLooksGood/parinfer-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0v97ncb0w1slb0x8861l3yr1kqz6fgw1fwl1z9lz6hh8p2ih34sk"))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-rainbow-delimiters emacs-company))
    (build-system emacs-build-system)
    (home-page "https://github.com/DogLooksGood/parinfer-mode/")
    (synopsis "Lisp structure editing mode")
    (description "@code{parinfer-mode} is a proof-of-concept editor
mode for Lisp programming languages.  It will infer some changes to
keep Parens and Indentation inline with one another.")
    (license license:gpl3+)))

(define-public emacs-noflet
  (let ((version "20170629")
        (revision "1")
        (commit "7ae84dc3257637af7334101456dafe1759c6b68a"))
    (package
      (name "emacs-noflet")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicferrier/emacs-noflet")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0g70gnmfi8n24jzfci9nrj0n9bn1qig7b8f9f325rin8h7x32ypf"))))
      (build-system emacs-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'require-dash
             ;; noflet.el uses -map from dash, but (require 'dash) is
             ;; missing. So, add it.
             (lambda _
               (substitute* "noflet.el"
                 ((";;; Code:") ";;; Code:\n(require 'dash)"))
               #t)))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/nicferrier/emacs-noflet")
      (synopsis "Locally override functions")
      (description "@code{emacs-noflet} lets you locally override functions,
in the manner of @command{flet}, but with access to the original function
through the symbol: @command{this-fn}.")
      (license license:gpl3+))))

;; (define-public emacs-dumb-jump
;;   (package
;;     (name "emacs-dumb-jump")
;;     (version "0.5.4")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/jacktasia/dumb-jump")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "18d2ll5wlll6pm909hiw8w9ijdbrjvy86q6ljzx8yyrjphgn0y1y"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      `(#:tests? #f                      ; FIXME: Tests freeze when run.
;;        #:phases
;;        (modify-phases %standard-phases
;;          (add-after 'unpack 'set-shell
;;            (lambda _
;;              ;; Setting the SHELL environment variable is required for the
;;              ;; tests to find sh.
;;              (setenv "SHELL" (which "sh")))))))
;;     (native-inputs
;;      (list emacs-el-mock emacs-ert-runner emacs-noflet emacs-undercover))
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-f) emacs-popup))
;;     (home-page "https://github.com/jacktasia/dumb-jump")
;;     (synopsis "Jump to definition for multiple languages without configuration")
;;     (description "Dumb Jump is an Emacs \"jump to definition\" package with
;; support for multiple programming languages that favors \"just working\" over
;; speed or accuracy.  This means minimal --- and ideally zero --- configuration
;; with absolutely no stored indexes (tags) or persistent background processes.
;; Dumb Jump performs best with The Silver Searcher @command{ag} or ripgrep
;; @command{rg} installed.")
;;     (license license:gpl3+)))

(define-public emacs-helm-flycheck
  (let ((commit "3cf7d3bb194acacc6395f88360588013d92675d6"))
    (package
      (name "emacs-helm-flycheck")
      (version (git-version "0.4" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yasuyk/helm-flycheck")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1a2yfxhz04klwhcandqvfzysxp6b7bxyxx1xk1x3kds5hif5fkl4"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ; no tests
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-flycheck (@(bost gnu packages emacs-xyz-2) emacs-helm)))
      (home-page "https://github.com/yasuyk/helm-flycheck")
      (synopsis "Show Flycheck errors with Helm")
      (description
       "This integrates Flycheck with Helm.")
      (license license:gpl3+))))

(define-public emacs-sxiv
  (package
    (name "emacs-sxiv")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://tildegit.org/contrapunctus/sxiv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0gimq172pp143jckfhhyw319n3vpjvlkadm0vhypycas9i89mcg0"))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-sxiv-path
           (lambda* (#:key inputs #:allow-other-keys)
             (emacs-substitute-sexps "sxiv.el"
               (":command
                  (append"
                `(list ,(search-input-file inputs "bin/sxiv")))))))))
    (inputs (list sxiv))
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash)))
    (build-system emacs-build-system)
    (home-page "https://tildegit.org/contrapunctus/sxiv")
    (synopsis "Launch sxiv from Emacs with Dired integration")
    (description "This package integrates sxiv into Dired.  It adds a command
to start sxiv from a Dired buffer, allowing you to mark or unmark image files
in said buffer using sxiv.")
    (license license:unlicense)))

(define-public emacs-github-review
  (let ((commit "a13a3b4f1b6114a32af843971a145ab880f51232")
        (revision "2"))
    (package
      (name "emacs-github-review")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/charignon/github-review")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0injfpxzgfhmqalba845j5l5cdcxxqz43knhxwinf36g52nfabl0"))))
      (build-system emacs-build-system)
      (inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s emacs-ghub))
      (native-inputs
       (list emacs-buttercup emacs-undercover))
      (arguments
       (list
        #:test-command #~(list "buttercup" "-L" "test/github-review-test.el")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'compatibility-with-recent-buttercup
              (lambda _
                (emacs-batch-edit-file "test/github-review-test.el"
                  '(progn
                    (insert ";;; -*-lexical-binding:t-*-")
                    (basic-save-buffer))))))))
      (home-page "https://github.com/charignon/github-review")
      (synopsis "Review GitHub pull requests within Emacs")
      (description "This package provides commands to pull in, comment on, and
accept and reject GitHub pull requests.")
      (license license:gpl3+))))

(define-public emacs-deadgrep
  (package
    (name "emacs-deadgrep")
    (version "0.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/deadgrep")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1ry9qvvxwhh3gkb0kkwiwpx37jpdzgky1h2zkwpzjpkv5jm022dr"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'configure
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((ripgrep (search-input-file inputs "/bin/rg")))
                ;; Specify the absolute file name of rg so that everything
                ;; works out-of-the-box.
                (emacs-substitute-variables "deadgrep.el"
                  ("deadgrep-executable" ripgrep))))))))
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (inputs
     (list ripgrep))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s emacs-spinner))
    (home-page "https://github.com/Wilfred/deadgrep")
    (synopsis "Frontend for @code{ripgrep}")
    (description "This package provides an Emacs interface for performing
searches with @code{ripgrep}.")
    (license license:gpl3+)))

(define-public emacs-pandoc-mode
  (package
    (name "emacs-pandoc-mode")
    (version "2.34.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/joostkremers/pandoc-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1kraah7663cr9lsymqff25ad80nlih94y871byd925nhyl908kfl"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-hydra))
    (home-page "https://github.com/joostkremers/pandoc-mode")
    (synopsis "Minor mode for interacting with Pandoc")
    (description "This package provides a Hydra menu for interacting with the
Pandoc, the document-conversion tool.")
    (license license:bsd-3)))

(define-public emacs-ccls
  (let ((commit "675a5704c14a27931e835a431beea3631d92e8e6")
        (revision "5"))
    (package
      (name "emacs-ccls")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/MaskRay/emacs-ccls")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0l4bhyr9d8ljz1f0cfg1s2cjcmh6fiwbk5mdlvc7rrwz5hxc21is"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list ccls (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-xyz-2) emacs-lsp-mode)))
      (home-page "https://github.com/MaskRay/emacs-ccls")
      (synopsis "Emacs support for the @code{ccls} language server")
      (description "This package extends @code{lsp-mode} to work with @code{C}
and @code{C++} files through the @code{ccls} language server.")
      (license license:expat))))

(define-public emacs-racer
  (let ((commit "1e63e98626737ea9b662d4a9b1ffd6842b1c648c")
        (revision "0"))
    (package
      (name "emacs-racer")
      (version (git-version "1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/racer-rust/emacs-racer")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "12a429lajk09qp1jxgig54p8z6wndfgr4jwdmgkc9s2df9sw02d3"))))
      (native-inputs
       (list emacs-ert-runner emacs-undercover))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f) emacs-pos-tip emacs-rust-mode emacs-s))
      (build-system emacs-build-system)
      (home-page "https://github.com/racer-rust/emacs-racer")
      (synopsis "Racer support for Emacs")
      (description
       "This is the official Emacs package for Racer.  It supports code
completion of variables, functions and modules.  It can also jump to
definition of functions and types, and show a help buffer based on the
docstring of the thing at point.")
      (license license:expat))))

(define-public emacs-rustic
  (package
    (name "emacs-rustic")
    (version "3.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-rustic/rustic")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kbhad1lc7jy7frp3lk14ch8g53zh28rwy8v7nb8fixlxbla0jml"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)
           (@(bost gnu packages emacs-build) emacs-f)
           emacs-flycheck
           (@(bost gnu packages emacs-xyz-2) emacs-lsp-mode)
           emacs-markdown-mode
           emacs-project
           emacs-rust-mode
           emacs-s
           emacs-spinner
           emacs-xterm-color))
    (arguments
     ;; Tests require rust, cargo, rustfmt, and various crates to be
     ;; vendored.
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'set-without-cask
           (lambda _
             (setenv "WITHOUT_CASK" "1"))))))
    (home-page "https://github.com/emacs-rustic/rustic")
    (synopsis "Rust development environment for Emacs")
    (description "Rustic is a fork of Rust mode.
In addition to its predecessor, it offers the following features:
@itemize
@item Flycheck integration,
@item Cargo popup,
@item multiline error parsing,
@item translation of ANSI control sequences through XTerm color,
@item asynchronous Org Babel,
@item custom compilation process,
@item @command{rustfmt} errors in a Rust compilation mode,
@item automatic LSP configuration with Eglot or LSP mode,
@item optional Rust inline documentation,
@item etc.
@end itemize")
    (license (list license:expat
                   license:asl2.0))))

(define-public emacs-helm-org-contacts
  (let ((commit "741eca6239684950219c9a12802386a132491b8c")
        (revision "2"))
    (package
      (name "emacs-helm-org-contacts")
      (version (git-version "20201202" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tmalsburg/helm-org-contacts")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1xy51hc3az8bc9sj71sjzy03xpkfa4v3cdcv3gpq3cj2zhk9gr8h"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-xyz-2) emacs-helm) emacs-s))
      (home-page "https://github.com/tmalsburg/helm-org-contacts")
      (synopsis "Helm source for org-contacts")
      (description "This Helm source can be used to search contacts stored in
org-contacts format.  There are actions for inserting postal addresses, email
addresses, and phone numbers in the buffer where @command{helm-org-contacts}
was called.")
      (license license:gpl3))))

(define-public emacs-dired-rsync
  (package
    (name "emacs-dired-rsync")
    (version "0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stsquad/dired-rsync")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1zvsmpvham670i807rs8f2f0h73yk4fpaavj0hzksqcl5ykh4fgr"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-s (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/stsquad/dired-rsync/")
    (synopsis "Support for rsync from Emacs dired buffers")
    (description "This package adds a single command @code{dired-rsync} which
allows the user to copy marked files in a Dired buffer via @code{rsync}.  This
is useful, especially for large files, because the copy happens in the
background and doesn’t lock up Emacs.  It is also more efficient than using
Tramp's own encoding methods for moving data between systems.")
    (license license:gpl3+)))

;; (define-public emacs-magit-todos
;;   (package
;;     (name "emacs-magit-todos")
;;     (version "1.8")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/alphapapa/magit-todos")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32
;;          "0rjr5q73609bs8gx2h5lp7c7bk5nkplfqfd56ifwdrdzdfzn5khy"))
;;        (modules '((guix build utils)))
;;        (snippet #~(begin
;;                     (delete-file-recursively "screenshots")
;;                     ;; Contents of makem package, but no tests.
;;                     (for-each delete-file
;;                               '("makem.sh" "Makefile"))))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list #:tests? #f)) ; No tests in source.
;;     (propagated-inputs
;;      (list emacs-async
;;            (@(bost gnu packages emacs-build) emacs-dash)
;;            (@(bost gnu packages emacs-build) emacs-f)
;;            emacs-hl-todo
;;            emacs-magit
;;            emacs-pcre2el
;;            emacs-s))
;;     (home-page "https://github.com/alphapapa/magit-todos")
;;     (synopsis "Show source files' TODOs (and FIXMEs, etc) in Magit status buffer")
;;     (description "This package displays keyword entries from source code
;; comments and Org files in the Magit status buffer.  Activating an item jumps
;; to it in its file.  By default, it uses keywords from @code{hl-todo}, minus a
;; few (like NOTE).")
;;     (license license:gpl3)))

(define-public emacs-ytdl
  (let ((commit "2ea3daf2f6aa9d18b71fe3e15f05c30a56fca228")
        (revision "0"))
    (package
      (name "emacs-ytdl")
      (version (git-version "1.3.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/tuedachu/ytdl")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0y62lkgsg19j05dpd6sp6zify8vq8xvpc8caqiy4rwi7p4ahacsf"))))
      (build-system emacs-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'configure
             (lambda* (#:key inputs #:allow-other-keys)
               ;; .el is read-only in git.
               (make-file-writable "ytdl.el")
               ;; Specify the absolute file names of the various programs so
               ;; that everything works out-of-the-box.
               (emacs-substitute-variables "ytdl.el"
                 ("ytdl-command"
                  (search-input-file inputs "/bin/youtube-dl"))))))))
      (inputs
       (list youtube-dl))
      (propagated-inputs
       (list emacs-async (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://gitlab.com/tuedachu/ytdl")
      (synopsis "Emacs interface for youtube-dl")
      (description
       "This package manages a video download queue for @command{youtube-dl},
which serves as the back end.  New videos can be queued at any time.  All
youtube-dl backends are supported.  It is possible to create download profiles
depending on the downloaded URL.")
      (license license:gpl3+))))

(define-public emacs-org-web-tools
  (package
    (name "emacs-org-web-tools")
    (version "1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alphapapa/org-web-tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0x1j1y2pl6a8f97cw04nm0w6g4jh449cjfsr2aryn316ms4nj1a0"))
       ;; Contents of makem package, but no tests.
       (snippet #~(for-each delete-file '("Makefile" "makem.sh")))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-compat
           (@(bost gnu packages emacs-build) emacs-dash)
           emacs-esxml
           emacs-plz
           emacs-request
           emacs-s))
    (inputs
     (list pandoc))
    (arguments
     (list
      #:tests? #f                       ; no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-exec-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((pandoc (search-input-file inputs "/bin/pandoc")))
                (substitute* "org-web-tools.el"
                  (("\"pandoc\"") (string-append "\"" pandoc "\"")))))))))
    (home-page "https://github.com/alphapapa/org-web-tools")
    (synopsis "Display/Process web page as Org mode content")
    (description
     "This package contains library functions and commands useful
for retrieving web page content and processing it into Org mode content.

For example, you can copy a URL to the clipboard or kill-ring, then run
a command that downloads the page, isolates the ``readable'' content with
@command{eww-readable}, converts it to Org mode content with Pandoc, and
displays it in an Org mode buffer.  Another command does all of that but
inserts it as an Org entry instead of displaying it in a new buffer.")
    (license license:gpl3+)))

(define-public emacs-all-the-icons
  (package
    (name "emacs-all-the-icons")
    (version "5.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/domtronn/all-the-icons.el")
             (commit version)))
       (file-name (git-file-name name version))
       (patches
        (search-patches "emacs-all-the-icons-remove-duplicate-rs.patch"))
       (sha256
        (base32 "0lwgvgnqf7vihglm0c5bwsxbl4x7f641289cji5s7jwy2dbsqk7g"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include '(list "\\.el$" "^data/")
      #:exclude '(list "^test/")
      #:tests? #f                      ; XXX: duplicate tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-fonts
            (lambda _
              (let ((fonts (string-append #$output "/share/fonts")))
                (mkdir-p fonts)
                (with-directory-excursion "fonts"
                  (install-file "all-the-icons.ttf" fonts)
                  ;; TODO: Unbundle.
                  (install-file "file-icons.ttf" fonts)
                  (install-file "octicons.ttf" fonts)
                  (install-file "weathericons.ttf" fonts)))))
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (if tests?
                  (apply invoke "ert-runner" "-l"
                         (append (find-files "data" "\\.el")
                                 '("all-the-icons-faces.el")))
                  (format #t "test suite not run~%")))))))
    (native-inputs
     (list (@(bost gnu packages emacs-build) emacs-f) emacs-ert-runner))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-f) emacs-memoize font-awesome font-google-material-design-icons))
    (home-page "https://github.com/domtronn/all-the-icons.el")
    (synopsis "Collect icon fonts and propertize them within Emacs")
    (description
     "All-the-icons is a utility package to collect various icon fonts and
propertize them within Emacs.  Icon fonts allow you to propertize and format
icons the same way you would normal text.  This enables things such as better
scaling of and anti aliasing of the icons.")
    ;; Package is released under Expat license.  Elisp files are licensed
    ;; under GPL3+.  Fonts come with various licenses: Expat for
    ;; "all-the-icons.ttf" and "file-icons.ttf", Apache License 2.0 for
    ;; "material-design-icons.ttf", and SIL OFL 1.1 for "fontawesome.ttf",
    ;; "ocitcons.ttf" and "weathericons.ttf".
    (license
     (list license:expat license:gpl3+ license:silofl1.1 license:asl2.0))))

;; (define-public emacs-spaceline
;;   (package
;;     (name "emacs-spaceline")
;;     (version "2.0.1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/TheBB/spaceline")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32
;;          "1q8r95zfrh0vxna5ml2pq9b9f66clfqcl4d2qy2aizkvzyxg6skl"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-dash) emacs-powerline emacs-s))
;;     (home-page "https://github.com/TheBB/spaceline")
;;     (synopsis "Powerline theme from Spacemacs")
;;     (description "Spaceline provides Spacemacs' mode-line theme.
;; This package provides features for three kinds of users.

;; @itemize
;; @item You just want to use the Spacemacs mode-line theme and forget about it.
;; @item You want to use something similar to the Spacemacs mode-line theme, but
;; with a handful of easy tweaks.
;; @item You want an easy-to-use library for building your own mode-line from
;; scratch, and you think the Spacemacs theme looks good.
;; @end itemize")
;;     (license license:gpl3+)))

(define-public emacs-frame-purpose
  (package
    (name "emacs-frame-purpose")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alphapapa/frame-purpose.el")
                    (commit version)))
              (sha256
               (base32
                "0jq2aam1yvccw887ighd1wm2xkvk5bv53ffiz3crcl16a255aj4q"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (synopsis "Purpose-specific frames for Emacs")
    (description "@code{frame-purpose} makes it easy to open purpose-specific
frames that only show certain buffers, e.g. by buffers’ major mode, their
filename or directory, etc, with custom frame/X-window titles, icons, and
other frame parameters.")
    (home-page "https://github.com/alphapapa/frame-purpose.el")
    (license license:gpl3+)))

(define-public emacs-kodi-remote
  (let ((commit "f5e932036c16e2b61a63020e006fc601e38d181e")
        (revision "0"))
    (package
      (name "emacs-kodi-remote")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/spiderbit/kodi-remote.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1gck7lvqxcr9ikrzlpvcf4408cq6i4s8ijgb0kdsbkfzv0w86934"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ; tests require networking
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-f) emacs-json-mode emacs-let-alist emacs-request))
      (home-page "https://github.com/spiderbit/kodi-remote.el")
      (synopsis "Remote control for Kodi")
      (description
       "This package provides a major mode to control Kodi
instances (play/pause, volume control, media selection, etc.) remotely.")
      (license license:gpl3+))))

;; (define-public emacs-repo
;;   (package
;;     (name "emacs-repo")
;;     (version "0.3.0")
;;     (source (origin
;;               (method git-fetch)
;;               (uri (git-reference
;;                     (url "https://github.com/canatella/repo-el")
;;                     (commit version)))
;;               (file-name (git-file-name name version))
;;               (sha256
;;                (base32
;;                 "0y8j3hf5r69fxj2vsbaxwr9qdchddn53w25xzmxv1kfh6hbagzv3"))))
;;     (build-system emacs-build-system)
;;     (arguments (list #:tests? #f))      ; tests require networking
;;     (native-inputs
;;      (list emacs-el-mock emacs-ert-runner))
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-f) emacs-magit))
;;     (home-page "https://github.com/canatella/repo-el")
;;     (synopsis "Emacs interface for the Google Repo tool")
;;     (description "This package provides integration of the Google Repo tool
;; with emacs.  It displays the output of the @code{repo status} command in a
;; buffer and launches Magit from the status buffer for the project at point.")
;;     (license license:gpl3+)))

;; (define-public emacs-orgit
;;   (package
;;     (name "emacs-orgit")
;;     (version "2.0.1")
;;     (home-page "https://github.com/magit/orgit")
;;     (source (origin
;;               (method git-fetch)
;;               (uri (git-reference
;;                     (url home-page)
;;                     (commit (string-append "v" version))))
;;               (file-name (git-file-name name version))
;;               (sha256
;;                (base32
;;                 "0yi73l7hm6x5pyalfmcv0mnklhc574xij35q8zkh6ahrnfbyv8ks"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list #:tests? #f)) ; A makefile but no tests.
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-dash) emacs-magit))
;;     (synopsis "Support for Org links to Magit buffers")
;;     (description "This package defines several Org link types, which can be
;; used to link to certain Magit buffers.  Use the command
;; @command{org-store-link} while such a buffer is current to store a link.
;; Later you can insert it into an Org buffer using the command
;; @code{org-insert-link}.")
;;     (license license:gpl3+)))

(define-public emacs-docker
  (package
    (name "emacs-docker")
    (version "2.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Silex/docker.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13927ns3393q40gxrfzyqh6ajxzfjg14d0srfxi6ild3pmaz0460"))))
    (inputs
     (list emacs-undercover))
    (propagated-inputs
     (list emacs-aio
           (@(bost gnu packages emacs-build) emacs-dash)
           emacs-json-mode
           emacs-s
           emacs-tablist))
    (arguments `(#:tests? #false))      ;no tests
    (build-system emacs-build-system)
    (home-page "https://github.com/Silex/docker.el")
    (synopsis "Manage docker from Emacs")
    (description "This package provides an Emacs interface for Docker.")
    (license license:gpl3+)))

;; (define-public emacs-lsp-mode
;;   ;; Last release is one year old.
;;   ;; Latest revision enables support for new lsp spec 3.17 features.
;;   (let ((commit "147233313576c844e2bf56640827b0d0e5c2ee6c")
;;         (revision "0"))
;;     (package
;;       (name "emacs-lsp-mode")
;;       (version (git-version "9.0.1" revision commit)) ;taken from lsp-mode.el
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                 (url "https://github.com/emacs-lsp/lsp-mode/")
;;                 (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "14317wgi0mrxbcrlgrfqyf80lh86n7x6bv07b43cxl3k4c4fqk0l"))))
;;       (build-system emacs-build-system)
;;       (arguments
;;        (list
;;         #:emacs emacs                   ;need libxml support
;;         #:test-command #~(list "ert-runner"
;;                                "-L" "."
;;                                "-L" "clients"
;;                                "-t" "!no-win"
;;                                "-t" "!org")
;;         #:phases
;;         #~(modify-phases %standard-phases
;;             ;; Move libraries to the top-level.
;;             (add-after 'unpack 'move-libraries
;;               (lambda _
;;                 ;; REVIEW; Improve style, pair-for-each ?
;;                 (for-each (lambda (d)
;;                             (for-each (lambda (f)
;;                                         (rename-file f (basename f)))
;;                                       (find-files d "\\.el$")))
;;                           (list "use-package/" "clients/"))))
;;             (add-before 'check 'skip-failing-tests
;;               (lambda _
;;                 (substitute* "test/lsp-mock-server-test.el"
;;                   (("\\(ert-deftest lsp-mock-server-reports.*" all)
;;                    (string-append all "(skip-unless nil)"))
;;                   (("\\(ert-deftest lsp-mock-server-updates-.*" all)
;;                    (string-append all "(skip-unless nil)")))
;;                 (substitute* "test/lsp-common-test.el"
;;                   (("\\(require 'elenv" all)
;;                    (string-append all " nil t"))
;;                   (("\\(ert-deftest lsp--path-to-uri-1 .*" all)
;;                    (string-append all "(skip-unless (featurep 'elenv))"))
;;                   (("\\(ert-deftest lsp-byte-compilation-test .*" all)
;;                    (string-append all "(skip-unless nil)"))
;;                   (("\\(ert-deftest lsp--build-.*-response-test-[34] .*" all)
;;                    (string-append all "(skip-unless nil)")))
;;                 (substitute* "test/lsp-mode-test.el"
;;                   (("\\(ert-deftest lsp--merge-results .*" all)
;;                    (string-append all "(skip-unless nil)")))
;;                 (substitute* "test/lsp-integration-test.el"
;;                   (("\\(ert-deftest lsp-.*-hover-request(-tick)? .*" all)
;;                    (string-append all "(skip-unless nil)"))
;;                   (("\\(ert-deftest lsp-test-current-buffer-mode .*" all)
;;                    (string-append all "(skip-unless nil)")))
;;                 (delete-file "test/lsp-clangd-test.el")))
;;             (add-before 'check 'set-home
;;               (lambda _ (setenv "HOME" (getenv "TMPDIR"))))
;;             (add-after 'unpack 'enable-plists
;;               (lambda _
;;                 (substitute* "lsp-protocol.el"
;;                   ;; This is faster, and it's officially recommended,
;;                   ;; and it's required by emacs-lsp-booster.
;;                   ;; See also:
;;                   ;; <https://emacs-lsp.github.io/lsp-mode/page/performance/>.
;;                   (("\\(getenv \"LSP_USE_PLISTS\"\\)") "t"))))
;;             (add-before 'move-libraries 'fix-patch-el-files
;;               ;; /bin/ksh is only used on macOS, which we don't support, so we
;;               ;; don't want to add it as input.
;;               (lambda _
;;                 (substitute* '("clients/lsp-csharp.el"
;;                                "clients/lsp-fsharp.el")
;;                   (("/bin/ksh") "ksh")))))))
;;       (propagated-inputs
;;        (list (@(bost gnu packages emacs-build) emacs-dash)
;;              (@(bost gnu packages emacs-build) emacs-f)
;;              emacs-ht
;;              emacs-hydra
;;              emacs-markdown-mode
;;              emacs-spinner))
;;       (native-inputs
;;        (list emacs-deferred
;;              emacs-el-mock
;;              emacs-ert-runner))
;;       (home-page "https://emacs-lsp.github.io/lsp-mode/")
;;       (synopsis "Emacs client and library for the Language Server Protocol")
;;       (description
;;        "LSP mode is a client and library implementation for the Language
;; Server Protocol.  This mode creates an IDE-like experience by providing
;; optional integration with other popular Emacs packages like Company, Flycheck,
;; and Projectile.")
;;       (license license:gpl3+))))

;; (define-public emacs-treemacs
;;   (package
;;     (name "emacs-treemacs")
;;     (version "3.2")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/Alexander-Miller/treemacs")
;;              (commit version)))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "0z8pc7y8p32vhlv5ibr11mrd8r8fk09dfgsj7a63d48r992p7gih"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list
;;       #:test-command #~(list "make" "-C" "../.." "test")
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           (add-after 'unpack 'fix-makefile
;;             (lambda _
;;               (substitute* "Makefile"
;;                 (("@\\$\\(CASK\\) exec ") "")
;;                 ;; Guix does not need to prepare dependencies before testing.
;;                 (("test: prepare") "test:"))))
;;           (add-after 'fix-makefile 'chdir-elisp
;;             ;; Elisp directory is not in root of the source.
;;             (lambda _
;;               (chdir "src/elisp")))
;;           (add-before 'install 'patch-paths
;;             (lambda* (#:key inputs #:allow-other-keys)
;;               (make-file-writable "treemacs-core-utils.el")
;;               (emacs-substitute-variables "treemacs-core-utils.el"
;;                 ("treemacs-dir" (string-append #$output "/")))
;;               (make-file-writable "treemacs-icons.el")
;;               (substitute* "treemacs-icons.el"
;;                 (("icons/default")
;;                  (string-append (elpa-directory #$output) "/icons/default")))
;;               (make-file-writable "treemacs-customization.el")
;;               (emacs-substitute-variables "treemacs-customization.el"
;;                 ("treemacs-python-executable"
;;                  (search-input-file inputs "/bin/python3")))
;;               (make-file-writable "treemacs-async.el")
;;               (substitute* "treemacs-async.el"
;;                 (("src/scripts")
;;                  (string-append (elpa-directory #$output) "/scripts")))))
;;           (add-after 'install 'install-data
;;             (lambda _
;;               (with-directory-excursion "../.." ;treemacs root
;;                 (copy-recursively
;;                  "icons/default"
;;                  (string-append (elpa-directory #$output) "/icons/default"))
;;                 (copy-recursively
;;                  "src/scripts"
;;                  (string-append (elpa-directory #$output) "/scripts"))))))))
;;     (native-inputs
;;      (list emacs-buttercup emacs-el-mock))
;;     (inputs
;;      (list python))
;;     (propagated-inputs
;;      (list emacs-ace-window
;;            emacs-cfrs
;;            (@(bost gnu packages emacs-build) emacs-dash)
;;            (@(bost gnu packages emacs-build) emacs-f)
;;            emacs-ht
;;            emacs-hydra
;;            emacs-pfuture
;;            emacs-s))
;;     (home-page "https://github.com/Alexander-Miller/treemacs")
;;     (synopsis "Emacs tree style file explorer")
;;     (description
;;      "Treemacs is a file and project explorer similar to NeoTree or Vim's
;; NerdTree, but largely inspired by the Project Explorer in Eclipse.  It shows
;; the file system outlines of your projects in a simple tree layout allowing
;; quick navigation and exploration, while also possessing basic file management
;; utilities.")
;;     (license license:gpl3+)))

;; (define-public emacs-lsp-java
;;   (let ((commit "4909c14b9012eed669a9c3f11a8df055d5bb8a0e")
;;         (revision "1"))
;;     (package
;;       (name "emacs-lsp-java")
;;       (version (git-version "3.1" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/emacs-lsp/lsp-java")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "0qw824vdqk92r8hrrjsi7pd00rw60wf5jfjk1x3nhs06hijs0x0s"))))
;;       (build-system emacs-build-system)
;;       (arguments
;;        (list #:tests? #f)) ; No tests.
;;       (propagated-inputs (list emacs-dap-mode
;;                                emacs-lsp-mode
;;                                emacs-markdown-mode
;;                                (@(bost gnu packages emacs-build) emacs-dash)
;;                                (@(bost gnu packages emacs-build) emacs-f)
;;                                emacs-ht
;;                                emacs-request
;;                                emacs-treemacs))
;;       (home-page "https://github.com/emacs-lsp/lsp-java/")
;;       (synopsis "Java support for lsp-mode")
;;       (description "Emacs Java IDE using Eclipse JDT Language Server.")
;;       (license license:gpl3+))))

;; (define-public emacs-lsp-ui
;;   (package
;;     (name "emacs-lsp-ui")
;;     (version "9.0.0")
;;     (source (origin
;;               (method git-fetch)
;;               (uri (git-reference
;;                     (url "https://github.com/emacs-lsp/lsp-ui")
;;                     (commit version)))
;;               (file-name (git-file-name name version))
;;               (sha256
;;                (base32
;;                 "162bxyhiqz4saxvh6n3sdb9hx7px5wpy45wbfg5aiqzlqwgqyg42"))))
;;     (build-system emacs-build-system)
;;     (arguments
;;      (list #:test-command
;;            #~(apply list "ert-runner" "-L" "."
;;                     "-t" "'!no-win'" "-t" "'!org'"
;;                     (apply append
;;                            (map
;;                             (lambda (file)
;;                               (list "-l" file))
;;                             (find-files "test" "\\.el"))))))
;;     (native-inputs (list emacs-ert-runner emacs-rustic))
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-build) emacs-dash) emacs-lsp-mode emacs-markdown-mode emacs-flycheck))
;;     (home-page "https://github.com/emacs-lsp/lsp-ui")
;;     (synopsis "User interface extensions for @code{lsp-mode}")
;;     (description
;;      "@code{LSP-ui} contains several enhancements and integrations for
;; @code{lsp-mode}, such as visual flychecking, displaying references in-line,
;; and code peeking.")
;;     (license license:gpl3+)))

(define-public emacs-lsp-ivy
  (package
    (name "emacs-lsp-ivy")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-lsp/lsp-ivy")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nb9ypa8hyx7i38rbywh8hn2i5f9l2l567hvdr9767fk279yr97n"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-ivy (@(bost gnu packages emacs-xyz-2) emacs-lsp-mode)))
    (home-page "https://github.com/emacs-lsp/lsp-ivy")
    (synopsis "Provide LSP-enhanced completion for symbols")
    (description
     "This package enhances @code{ivy} with completion for symbols from
workspaces with a LSP-compliant server running.")
    (license license:gpl3+)))

;; (define-public emacs-helm-lsp
;;   (package
;;     (name "emacs-helm-lsp")
;;     (version "0.3")
;;     (source (origin
;;               (method git-fetch)
;;               (uri (git-reference
;;                     (url "https://github.com/emacs-lsp/helm-lsp")
;;                     (commit version)))
;;               (file-name (git-file-name name version))
;;               (sha256
;;                (base32
;;                 "0cmxdd3fgyiixg81zmxa0j68slhkq8rg5z840cx4dbb3j9w06yd1"))))
;;     (build-system emacs-build-system)
;;     (arguments (list #:tests? #f))      ; no tests
;;     (propagated-inputs
;;      (list (@(bost gnu packages emacs-xyz-2) emacs-helm) emacs-lsp-mode (@(bost gnu packages emacs-build) emacs-dash)))
;;     (home-page "https://github.com/emacs-lsp/helm-lsp")
;;     (synopsis "Provide LSP-enhanced completion for symbols")
;;     (description
;;      "This package enhances @code{helm} with completion for symbols from
;; workspaces with a LSP-compliant server running.")
;;     (license license:gpl3+)))

(define-public emacs-elmacro
  (package
    (name "emacs-elmacro")
    (version "1.1.1")
    (home-page "https://github.com/Silex/elmacro")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url home-page)
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1x4wnsshf9h10mp51x92vs5rxw5had4gmw6zz4f53czx1ymcv16a"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-s (@(bost gnu packages emacs-build) emacs-dash)))
    (synopsis "Convert keyboard macros to Emacs Lisp")
    (description
     "This package displays keyboard macros or latest interactive commands
as Emacs Lisp.")
    (license license:gpl3+)))

(define-public emacs-flycheck-haskell
  (let ((commit "32ddff87165a7d3a35e7318bee997b5b4bd41278")
        (revision "2"))
    (package
      (name "emacs-flycheck-haskell")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/flycheck/flycheck-haskell")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "10pgsbagq6qj4mshq5sypv0q0khck92b30sc793b4g1pfpsxvgjn"))))
      (build-system emacs-build-system)
      (arguments
       (list #:include #~(list "\\.el$" "\\.hs$")
             #:test-command #~(list "make" "test" "CASK=")
             #:tests? #f))  ; Several tests are failing on the haskell side.
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-flycheck emacs-haskell-mode emacs-let-alist))
      (native-inputs
       (list ghc))
      (home-page "https://github.com/flycheck/flycheck-haskell")
      (synopsis "Flycheck for Haskell")
      (description "This package configures syntax-checking for Haskell
buffers.")
      (license license:gpl3+))))

(define-public emacs-js2-refactor
  (let ((commit "d4c40b5fc86d3edd7c6a7d83ac86483ee1cb7a28")
        (revision "2"))
    (package
      (name "emacs-js2-refactor")
      (version (git-version "0.9.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magnars/js2-refactor.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "08b25y3raz0p98zxk9xdd8nj9shqd6mzrqhbq1gg4cwsmi7h7ly1"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'enable-lexical-binding
              (lambda _
                (emacs-batch-edit-file
                    "test/js2r-local-name-node-at-point-test.el"
                  '(progn
                    (add-file-local-variable-prop-line 'lexical-binding t)
                    (basic-save-buffer))))))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s emacs-js2-mode emacs-yasnippet
             emacs-multiple-cursors))
      (native-inputs
       (list emacs-buttercup emacs-espuds))
      (home-page "https://github.com/magnars/js2-refactor.el")
      (synopsis "JavaScript refactoring in Emacs")
      (description "This package provides various refactoring functions for
JavaScript.")
      (license license:gpl3+))))

(define-deprecated/public emacs-js2-refactor-el emacs-js2-refactor
  (deprecated-package "emacs-js2-refactor-el" emacs-js2-refactor))

(define-public emacs-jsdoc
  (package
    (name "emacs-jsdoc")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/isamert/jsdoc.el")
             (commit (string-append "v" version))))
       (sha256
        (base32 "0j99rax3n905ya0ya42093pl8q7kcb8xx2qz6b918f7d8q0mr44n"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)
           emacs-s
           tree-sitter-javascript))
    (home-page "https://github.com/isamert/jsdoc.el")
    (synopsis "Inserts JSDoc function comments/typedefs easily")
    (description "This package provides an easy way to insert JSDoc function
comments and typedefs using Emacs' builtin tree-sitter.")
    (license license:gpl3+)))

(define-public emacs-tco
  (let ((commit "482db5313f090b17ed22ccd856f0e141dc75afe6")
        (revision "1"))
    (package
      (name "emacs-tco")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Wilfred/tco.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1z7xkbrqznk6ni687qqknp8labcyhl8y6576hjfri89fn21385y9"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (native-inputs
       (list emacs-ert-runner emacs-undercover))
      (home-page "https://github.com/Wilfred/tco.el")
      (synopsis "Tail-call optimization for Emacs Lisp")
      (description "This package provides tail-call optimization for Emacs
Lisp functions that call themselves in tail position.")
      (license license:gpl3+))))

(define-deprecated/public emacs-tco-el emacs-tco
  (deprecated-package "emacs-tco-el" emacs-tco))

(define-public emacs-equake
  ;; Upstream provides no tagged releases, but the commit below matches an
  ;; exact release.
  (let ((commit "4d6ef75a4d91ded22caad220909518ccb67b7b87"))
    (package
      (name "emacs-equake")
      (version "0.985")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/emacsomancer/equake")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "11xfr71y78idcn461p4pz7b0k01nhz15cyl97bjqq6ii5xhbhvdx"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://gitlab.com/emacsomancer/equake/")
      (synopsis "Drop-down console for @code{Eshell} and terminal emulators")
      (description "This package provides a Quake-style drop-down console
compatible with Emacs' shell modes.")
      (license license:gpl3+))))

(define-public emacs-prodigy
  (package
    (name "emacs-prodigy")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rejeep/prodigy.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "04xspdj67nas1ivv0ldlmmkr6v7zd7y3k346pnfgvq8wzqi6x4vz"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; XXX: Missing coffescript requirement.
           #:test-command #~(list "make" "test-ert")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'inject-makel
                 (lambda* (#:key inputs #:allow-other-keys)
                   (symlink (search-input-file inputs "include/makel.mk")
                            "makel.mk"))))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f) emacs-s))
    (native-inputs
     (list emacs-ecukes emacs-el-mock emacs-ert-async emacs-shut-up makel))
    (home-page "https://github.com/rejeep/prodigy.el")
    (synopsis "Manage external services from within Emacs")
    (description "This package provides a GUI for defining and monitoring services.")
    (license license:gpl3+)))

(define-public emacs-prodigy-el
  (deprecated-package "emacs-prodigy-el" emacs-prodigy))

(define-public emacs-origami
  (let ((commit "1f38085c8f9af7842765ed63f7d6dfe4dab59366")
        (version "1.0")
        (revision "1"))
    (package
      (name "emacs-origami")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/gregsexton/origami.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ha1qsz2p36pqa0sa2sp83lspbgx5lr7930qxnwd585liajzdd9x"))
         (modules '((guix build utils)))
         (snippet #~(substitute* (find-files "." "\\.el$")
                      (("\\(require 'cl\\)")
                       "(require 'cl-lib)")
                      (("(destructuring-bind|remove-if)" all)
                       (string-append "cl-" all))
                      (("\\(face-attribute 'highlight :background\\)") "\
(let ((color (face-attribute 'highlight :background)))
  (and color (not (eq color 'unspecified)) color))")))))
      (build-system emacs-build-system)
      (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (home-page "https://github.com/gregsexton/origami.el")
      (synopsis "Flexible text-folding")
      (description
       "This package provides a minor mode for collapsing and
expanding regions of text without modifying the actual contents.")
      (license license:expat))))

(define-deprecated/public emacs-origami-el emacs-origami
  (deprecated-package "emacs-origami-el" emacs-origami))

(define-public emacs-ivy-clipmenu
  (let ((commit "d2071f2c5043a05d610cd1952e84176ca78c31dc"))
    (package
      (name "emacs-ivy-clipmenu")
      (version (git-version "0.0.1" "1" commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/wpcarro/ivy-clipmenu.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0npd8glzk5z4n7y9mzbsbzi0cf3by19fqcki052jr3dga363lds7"))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-f) emacs-ivy))
      (build-system emacs-build-system)
      (home-page "https://github.com/wpcarro/ivy-clipmenu.el")
      (synopsis "Ivy integration with clipmenu")
      (description "Ivy integration with the clipboard manager, clipmenu.")
      (license license:expat))))

(define-public emacs-org-drill-table
  ;; No releases or tags.
  (let ((commit "096387d929bcf3eb479e0a9d5da9cf32c756a759")
        (revision "0"))
    (package
      (name "emacs-org-drill-table")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/chrisbarrett/org-drill-table.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1a8ygrcag8i9hdpy2vsn0sh8lwhl9b56rv91j3rddy1jv5qx1ipb"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command
        #~(list "emacs" "--batch"
                "-l" "org-drill-table.el"
                "-l" "test/org-drill-table-tests.el"
                "-f" "ert-run-tests-batch-and-exit")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'skip-failing-tests
              (lambda _
                (substitute* "test/org-drill-table-tests.el"
                  (("ert-deftest org-drill-table--tracks-.*-separately .*" all)
                   (string-append all " (skip-unless nil)"))))))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-org emacs-s))
      (home-page "https://github.com/chrisbarrett/org-drill-table")
      (synopsis "Generate Org drill cards using Org mode tables")
      (description
       "This package generates drill cards based on an Org mode table in the
current subtree.  The cards are inserted under a new ``Cards'' heading in the
current tree.")
      (license license:gpl3+))))

(define-public emacs-dash-docs
  (let ((commit "dafc8fc9f1ddb2e4e39e0b8d066c42d5d7ce8d06")
        (revision "2"))
    (package
      (name "emacs-dash-docs")
      (version (git-version "1.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/dash-docs-el/dash-docs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0n6d3mm43gj16v8kjjradcfik93wb89dsqnfcbskb28bvcamafid"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-async))
      (native-inputs
       (list emacs-undercover emacs-ert-runner))
      (arguments
       `(#:phases
         ;; this test requires network access, so remove it
         (modify-phases %standard-phases
           (add-before 'check 'make-tests-writable
             (lambda _
               (make-file-writable "test/dash-docs-test.el")
               #t))
           (add-before 'check 'delete-test
             (lambda _
               (emacs-batch-edit-file "test/dash-docs-test.el"
                 `(progn (progn
                          (goto-char (point-min))
                          (re-search-forward "ert-deftest dash-docs-official-docsets-test")
                          (beginning-of-line)
                          (kill-sexp))
                         (basic-save-buffer)))
               #t)))))
      (home-page "https://github.com/dash-docs-el/dash-docs")
      (synopsis "Offline documentation browser for APIs using Dash docsets")
      (description "This package exposes functionality to work with Dash docsets.")
      (license license:gpl3+))))

(define-public emacs-helm-dash
  (let ((commit "7f853bd34da666f0e9a883011c80f451b06f6c59")
        (revision "2"))
    (package
      (name "emacs-helm-dash")
      (version (git-version "1.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/areina/helm-dash")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0r192vzry1212ihabg9pgw9xar8zdgnbgy0vsgvfm8s5wj6ny7jp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-xyz-2) emacs-helm) emacs-dash-docs))
      (home-page "https://github.com/areina/helm-dash")
      (synopsis "Offline documentation browser for APIs using Dash docsets")
      (description "This package uses Helm to install and navigate through
Dash docsets.")
      (license license:gpl3+))))

(define-public emacs-counsel-dash
  (let ((commit "370d5f6f14b5294d0eb717f7b2a6a8e93df1ed24")
        (revision "4"))
    (package
      (name "emacs-counsel-dash")
      (version (git-version "0.1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/dash-docs-el/counsel-dash")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fn38vbz46ijarjvhgw7iy7dj9s2a2miy95fyy9f8b5sj8nrdfvz"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-counsel emacs-dash-docs))
      (home-page "https://github.com/dash-docs-el/counsel-dash")
      (synopsis "Offline documentation browser for APIs using Dash docsets")
      (description "This package uses @code{ivy-mode} to install and navigate
through Dash docsets.")
      (license license:expat))))

(define-public emacs-calibredb
  (package
    (name "emacs-calibredb")
    (version "2.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chenyanming/calibredb.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a4gyc3gcq18j29pw2i296d70nvx5fbzlw9fdmqwzncciqz5as6m"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (make-file-writable "calibredb-core.el")
              (let ((calibredb (search-input-file inputs "/bin/calibredb"))
                    (fetch-ebook-metadata
                     (search-input-file inputs "/bin/fetch-ebook-metadata")))
                (emacs-substitute-variables "calibredb-core.el"
                  ("calibredb-fetch-metadata-program" fetch-ebook-metadata)
                  ("calibredb-program" calibredb))))))))
    (inputs
     (list calibre))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-esxml emacs-s))
    (home-page "https://github.com/chenyanming/calibredb.el")
    (synopsis "Yet another calibre client for Emacs")
    (description "This package integrates calibre into Emacs.
@enumerate
@item Powerful ebook dashboard.
@item Manage ebooks, actually not only ebooks!
@item Manage Ebook libraries.
@item Another bookmarks solution, by setting the tags and comments.
@item Quick search, filter, make actions on items with ivy and helm.
@item Org-ref support.
@end enumerate")
    (license license:gpl3)))

(define-public emacs-eval-in-repl
  (package
    (name "emacs-eval-in-repl")
    (version "0.9.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kaz-yos/eval-in-repl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mrssbl0wyc6iij8zk1y3h9bd3rv53nnrxsij7fn67l1m4z0clyn"))))
    (build-system emacs-build-system)
    (arguments
     (list #:include
           #~(list "eval-in-repl\\.el" "eval-in-repl-test\\.el" "README\\.md")))
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash) emacs-paredit emacs-ace-window))
    (home-page "https://github.com/kaz-yos/eval-in-repl")
    (synopsis "One keybinding to communicate with REPLs")
    (description
     "@code{eval-in-repl} provides a consistent ESS-like evaluation interface
for various REPLs.  In particular, it mimics ESS' C-RET binding, which sends a
line or region to an appropriately configured shell.  This package provides
just the core of @code{eval-in-repl}---for the languages themselves, see their
respective packages.")
    (license license:expat)))

(define-public emacs-ox-pandoc
  (package
    (name "emacs-ox-pandoc")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emacsorphanage/ox-pandoc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0sh8l18lc2hngbmb1vv99xb8cp4sfy90j9cbf7b09l82jmnlqmk1"))))
    (build-system emacs-build-system)
    (inputs
     (list pandoc))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-ht))
    (home-page "https://github.com/emacsorphanage/ox-pandoc")
    (synopsis "Org exporter for Pandoc")
    (description "@code{ox-pandoc} is an exporter for converting Org-mode
files to numerous other formats via Pandoc.")
    (license license:gpl3+)))

(define-public emacs-refactor
  (package
    (name "emacs-refactor")
    (version "0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wilfred/emacs-refactor")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1yky7vlv91501xb43xk19rr8mxlvrsxhawsc98jivf64nad5dqay"))))
    (build-system emacs-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-before 'check 'delete-failing-tests
                 (lambda _
                   (delete-file "test/emr-elisp-test.el"))))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s emacs-popup emacs-list-utils emacs-iedit))
    (native-inputs (list emacs-ert-runner emacs-undercover))
    (home-page "https://github.com/Wilfred/emacs-refactor/")
    (synopsis "Language-specific refactoring in Emacs")
    (description "Emacs Refactor (EMR) is a framework for providing
language-specific refactoring in Emacs.  It includes refactoring commands for
a variety of languages, including elisp itself.")
    (license license:gpl3+)))

(define-public emacs-org-jira
  (package
    (name "emacs-org-jira")
    (version "4.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ahungry/org-jira")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1mg7p9y4d4m6b6qkjvdz6lqby3kvvdb7qcjqgkrf75rzv0rsn1h2"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "emacs" "-Q" "--batch"
                             "-l" "jiralib.el"
                             "-l" "org-jira-sdk.el"
                             "-l" "org-jira.el"
                             "-l" "t/org-jira-t.el"
                             "-l" "t/jiralib-t.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-org emacs-request))
    (home-page "https://github.com/ahungry/org-jira")
    (synopsis "Syncing between Jira and Org mode")
    (description
     "This package provides an extension to Org mode for syncing issues with
JIRA issue servers.")
    (license license:gpl3+)))

(define-public emacs-ssh-agency
  (package
    (name "emacs-ssh-agency")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/magit/ssh-agency")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1i3zmsn0w2k7p2hlzssibckm32kf05l56mkhg96x4sf06g3pwq1d"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/magit/ssh-agency")
    (synopsis "Manage @code{ssh-agent} from Emacs")
    (description
     "This package provides functions to startup @code{ssh-agent}, set the
needed environment variables in Emacs, and prompt for passphrases from within
Emacs so that pushes and pulls from @code{magit} will not require entering any
passphrase.

It can also be useful on Unix-like platforms to delay having to enter your
passphrase until the first time you push to a remote.")
    (license license:gpl3+)))

(define-public emacs-eshell-git-prompt
  (package
    (name "emacs-eshell-git-prompt")
    (version "0.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xuchunyang/eshell-git-prompt")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13b7nr0819pgzyvh0szi0zjyazgpxmsbqcz65cccyhh2pq48zb7j"))))
    (build-system emacs-build-system)
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/xuchunyang/eshell-git-prompt")
    (synopsis "Themes for Emacs Shell (Eshell) prompt")
    (description
     "This package provides a variety of themes for Emacs Shell (Eshell)
prompt.")
    (license license:gpl3+)))

(define-public emacs-frames-only-mode
  ;; Latest release is from 8 years ago.
  (let ((commit "3c7d7d89398b999bac2d848c8c26d742572e8109")
        (revision "0"))
    (package
      (name "emacs-frames-only-mode")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/davidshepherd7/frames-only-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1rs01wiahqnz33x66mm4i7147jfjz75mx1q4mwjpds6yvir4mdkn"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'fix-makefile
              (lambda _
                (substitute* "Makefile"
                  (("cask") "")))))
        #:test-command #~(list "make" "test-unit")))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (native-inputs (list emacs-flycheck emacs-magit emacs-validate))
      (home-page "https://github.com/davidshepherd7/frames-only-mode")
      (synopsis "Use frames instead of Emacs windows")
      (description
       "This is an Emacs global minor mode to use Emacs frames instead of Emacs'
internal windowing system.  This combines particularly well with tiling window
managers such as XMonad.")
      (license license:gpl3+))))

(define-public emacs-shrink-path
  (package
    (name "emacs-shrink-path")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/bennya/shrink-path.el.git")
             (commit (string-append "v" version))))
       (sha256
        (base32
         "0kx0c4syd7k6ff9j463bib32pz4wq0rzjlg6b0yqnymlzfr1mbki"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-s (@(bost gnu packages emacs-build) emacs-dash) (@(bost gnu packages emacs-build) emacs-f)))
    (native-inputs (list emacs-buttercup))
    (home-page "https://gitlab.com/bennya/shrink-path.el")
    (synopsis "Fish-style path truncation in emacs-lisp")
    (description "This package provides utility functions that allow for
Fish-style truncated directories in eshell and various modelines.")
    (license license:gpl3+)))

(define-public emacs-eshell-toggle
  (let ((commit "ddfbe0a693497c4d4bc5494a19970ba4f6ab9033")
        (revision "1"))
    (package
      (name "emacs-eshell-toggle")
      (version (git-version "0.10.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/4DA/eshell-toggle")
               (commit commit)))
         (sha256
          (base32
           "0xqrp8pwbmfxjdqipgpw5nw633mvhjjjm3k3j9sh9xdpmw05hhws"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (home-page "https://github.com/4DA/eshell-toggle")
      (synopsis "Show and hide an @code{eshell} instance")
      (description "This package toggles an @code{eshell} instance for the
current buffer.")
      (license license:gpl3+))))

(define-public emacs-rime
  (package
    (name "emacs-rime")
    (version "1.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DogLooksGood/emacs-rime")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z0iwsqr92g8ykxb51gkawwxwzx0faw0027zgdi7c38ngjqld237"))))
    (build-system emacs-build-system)
    (arguments
     '(#:include (cons "\\.so$" %default-include)
       #:test-command (list "emacs" "--batch" "-l" "test.el")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-rime-data-path
           (lambda* (#:key inputs #:allow-other-keys)
             (make-file-writable "rime.el")
             (emacs-substitute-variables "rime.el"
               ("rime-share-data-dir"
                (search-input-directory inputs
                                        "share/rime-data")))))
         (add-before 'install 'build-emacs-module
           (lambda _
             (invoke "make" "lib")))
         (add-before 'check 'pre-check
           (lambda _
             (setenv "HOME" (getenv "TMPDIR"))
             (mkdir-p (string-append (getenv "HOME")
                                     "/.emacs.d/rime")))))))
    (inputs
     (list librime rime-data))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-popup emacs-posframe))
    (home-page "https://github.com/DogLooksGood/emacs-rime")
    (synopsis "Rime input method in Emacs")
    (description
     "Rime is an Emacs input method built upon Rime input method engine.")
    (license license:gpl3+)))

(define-public emacs-ivy-omni-org
  (let ((commit "5460a9fc061a4a5ae8372dc8df966ced94abab58")
        (revision "1"))
    (package
      (name "emacs-ivy-omni-org")
      (version (git-version "0.2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/akirak/ivy-omni-org")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1np1f51hc3phkl5w02a9a79gl38ra2d535i784fn4pqaasvm0rq8"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list emacs-ivy (@(bost gnu packages emacs-build) emacs-dash)))
      (synopsis "Browse anything in Org mode")
      (description "This package allows Org items to be accessed via the Ivy
interface.")
      (home-page "https://github.com/akirak/ivy-omni-org")
      (license license:gpl3+))))

(define-public emacs-esh-help
  (let ((commit "417673ed18a983930a66a6692dbfb288a995cb80")
        (revision "1"))
    (package
      (name "emacs-esh-help")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tom-tan/esh-help")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0x7d51a6ljl014zy7mi27vzcqqbcwg9z4drq29fr2ajk82mqhlgd"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (synopsis "Help functions for Eshell")
      (description "This package provides a @code{run-help} function inspired
by @code{zsh} as well as @code{eldoc} support.")
      (home-page "https://github.com/tom-tan/esh-help")
      (license license:gpl3+))))

(define-public emacs-metal-mercury-mode
  (let ((commit "99e2d8fb7177cae3bfa2dec2910fc28216d5f5a8")
        (revision "1")
        (version "0.0.0"))
    (package
      (name "emacs-metal-mercury-mode")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ahungry/metal-mercury-mode")
               (commit commit)))
         (sha256
          (base32
           "0iil5k3rgifz2vqwsy12rbv5rzyvidq4sgwazsb2hzys8xynmfn5"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)))
      (synopsis "Major mode for editing Mercury files")
      (description
       "Major mode for editing Mercury files.  This is a rewrite of the original
mercury-mode provided by Emacs as a wrapper around prolog-mode.")
      (home-page "https://github.com/ahungry/metal-mercury-mode")
      (license license:gpl3+))))

(define-public emacs-org-roam
  (package
    (name "emacs-org-roam")
    (version "2.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/org-roam/org-roam")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00ijpvsghak5d9p703gnyaksfbniwj062qids0m8xkvvxbzqsdda"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "ert-runner" "tests")
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the extensions source files to the top level, which
          ;; is included in the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files (find-files "./extensions" ".*\\.el$")))
                (for-each (lambda (f)
                            (rename-file f (basename f)))
                          el-files))))
          (add-after 'move-source-files 'patch-exec-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (make-file-writable "org-roam-graph.el")
              (emacs-substitute-variables "org-roam-graph.el"
                ("org-roam-graph-executable"
                 (search-input-file inputs "/bin/dot")))))
          (add-after 'install 'install-image
            (lambda _
              (install-file "doc/images/org-ref-citelink.png"
                            (string-append #$output "/share/info/images"))))
          (add-after 'unpack 'make-info
            (lambda _
              (invoke "make" "-C" "doc" "info")
              (copy-file "doc/org-roam.info" "org-roam.info"))))))
    (inputs
     (list graphviz))
    (native-inputs
     (list emacs-ert-runner texinfo))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)
           emacs-emacsql
           emacs-magit))
    (home-page "https://github.com/org-roam/org-roam/")
    (synopsis "Non-hierarchical note-taking with Org mode")
    (description "Emacs Org Roam is a solution for taking non-hierarchical
notes with Org mode.  Notes are captured without hierarchy and are connected
by tags.  Notes can be found and created quickly.  Org Roam should also work
as a plug-and-play solution for anyone already using Org mode for their
personal wiki.")
    (license license:gpl3+)))

(define-public emacs-org-node
  (package
    (name "emacs-org-node")
    (version "2.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meedstrom/org-node/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "03600cxy8dr2sd49d07v61izxpvdxgfyiangjzkbma4qdpbkmjgh"))))
    (build-system emacs-build-system)
    (arguments
     '(#:tests? #f ; fails
       #:test-command '("./makem.sh" "tests")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'dont-git
           (lambda _
             (substitute* "makem.sh"
               (("^cd.*\"")
                "")))))))
    (propagated-inputs
     (list emacs-el-job
           emacs-llama
           emacs-magit))
    ;; tests
    (native-inputs
     (list emacs-buttercup
           (@(bost gnu packages emacs-build) emacs-dash)
           util-linux
           grep
           sed))
    (home-page "https://github.com/meedstrom/org-node/")
    (synopsis "Non-hierarchical note-taking with Org-mode, faster than
org-roam")
    (description "This package provides a notetaking system like Roam,
using org mode; faster than org-roam.")
    (license license:gpl3+)))

(define-public emacs-org-node-3
  (package
    (name "emacs-org-node")
    (version "3.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meedstrom/org-node/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1cxzdyiqan4881m7fpzxym1gkplqlyagl3bj1pwa7a5bswhld40y"))))
    (build-system emacs-build-system)
    (arguments
     '(#:tests? #f ; fails
       #:test-command '("./makem.sh" "tests")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'dont-git
           (lambda _
             (substitute* "makem.sh"
               (("^cd.*\"")
                "")))))))
    (propagated-inputs
     (list emacs-llama
           emacs-magit
           emacs-org-mem))
    ;; tests
    (native-inputs
     (list emacs-buttercup
           (@(bost gnu packages emacs-build) emacs-dash)
           util-linux
           grep
           sed))
    (home-page "https://github.com/meedstrom/org-node/")
    (synopsis "Non-hierarchical note-taking with Org-mode, faster than
org-roam")
    (description "This package provides a notetaking system like Roam,
using org mode; faster than org-roam.  This version of org-node has
different configuration options to org-node 2 so you DO have to set
it up again.")
    (license license:gpl3+)))

(define-public emacs-plantuml-mode
  (package
    (name "emacs-plantuml-mode")
    (version "1.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/skuro/plantuml-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yp41d2dmf3sx7qnl5x0zdjcr9y71b2wwc9m0q31v22xqn938ipc"))))
    (arguments
     (list
      #:tests? #f  ; Unclear why tests fail.
      #:test-command #~(list "ert-runner")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-local-plantuml
            (lambda* (#:key inputs #:allow-other-keys)
              (symlink (search-input-file inputs "/bin/plantuml")
                       "bin/plantuml")
              (let ((file "plantuml-mode.el"))
                (chmod file #o644)
                (emacs-substitute-variables file
                  ("plantuml-jar-path"
                   (search-input-file inputs "/share/java/plantuml.jar"))
                  ("plantuml-executable-path"
                   (search-input-file inputs "/bin/plantuml"))
                  ("plantuml-server-url" 'nil)
                  ("plantuml-default-exec-mode" ''executable))
                (emacs-batch-edit-file file
                  `(progn (progn
                           (goto-char (point-min))
                           (re-search-forward "(defun plantuml-download-jar")
                           (beginning-of-line)
                           (kill-sexp))
                          (basic-save-buffer)))))))))
    (inputs (list plantuml))
    (native-inputs (list emacs-ert-runner icedtea))
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash)))
    (build-system emacs-build-system)
    (home-page "https://github.com/skuro/plantuml-mode")
    (synopsis "Major mode for editing PlantUML sources")
    (description "This package provides a major mode for editing PlantUML
sources.  It features syntax highlighting, autocompletion, preview of buffer
or region and use of locally installed binaries.")
    (license license:gpl3+)))

(define-public emacs-csound-mode
  ;; XXX: Upstream did not tag last release.  Using the commit matching
  ;; version bump.
  (let ((commit "44c49e5a9262ede4b4477bafb13b42b1ba047b9c"))
    (package
      (name "emacs-csound-mode")
      (version "0.2.3")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/hlolli/csound-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0kfhca1n0iv1400jf4ggjbarg7ry8ccd5bs7cf2brjdiqp74cvwb"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'disable-breaking-compilation
              (lambda _
                (let ((file "csound-font-lock.el"))
                  (make-file-writable file)
                  (emacs-batch-disable-compilation file)))))))
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-highlight emacs-multi emacs-shut-up))
      (home-page "https://github.com/hlolli/csound-mode")
      (synopsis "Emacs major mode for coding in CSound")
      (description "This package provides both a basic major mode for editing
CSound files, as well as a REPL for fast feedback when composing and
sound-designing using CSound.")
      (license license:gpl3+))))

(define-public emacs-html-to-hiccup
  ;; Package has no release.  Version is extracted from "Version:" keyword in
  ;; main file.
  (let ((commit "50a52e2b0d13d865187acdf775b8203d5003f2f1")
        (revision "0"))
    (package
      (name "emacs-html-to-hiccup")
      (version (git-version "1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/plexus/html-to-hiccup")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1qi092mw2n08v6yr0j6hlpx0pnlcnhxjqbsrlw9pn4yin6zk91yp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s))
      (home-page "https://github.com/plexus/html-to-hiccup")
      (synopsis "Turn HTML into Hiccup syntax")
      (description
       "This is an Emacs package that turns HTML into Hiccup syntax
which is a popular notation to use when doing Clojure/ClojureScript
web development.")
      ;; There is a conflict between the repository official LICENSE
      ;; file and the header of the main elisp file which indicates
      ;; that it is licensed under the GPL version 3 or later.
      (license (list license:mpl2.0 license:gpl3+)))))

(define-public emacs-spaceleader
  (let ((commit "5d88d120494623d6777d464ec40ff4bb7d6b1d57")
        (revision "1"))
    (package
      (name "emacs-spaceleader")
      (version (git-version "0.0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mohkale/spaceleader")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1prnjf7zs49z5a8qwhn8d0qnp60b3l0xhjkqg6v237acvk2axixr"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list (@(bost gnu packages emacs-build) emacs-dash)
             emacs-general
             emacs-which-key
             emacs-use-package
             emacs-bind-map))
      (home-page "https://github.com/mohkale/spaceleader")
      (synopsis "Emacs leader key implementation from Spacemacs")
      (description
       "@code{emacs-spaceleader} replicates Spacemacs' leader key features,
without requiring all of Spacemacs.  The @code{<Leader>} key, inspired by Vim,
provides an easy way to bind keys under a configurable prefix key.")
      (license license:gpl3+))))

(define-public emacs-seriestracker
  (package
    (name "emacs-seriestracker")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MaximeWack/seriesTracker")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gfm7ss3bwj3m2y1mb4sdmsv85mjnpkgmzasa3yfj69zbq46glhn"))))
    (build-system emacs-build-system)
    (propagated-inputs (list (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/MaximeWack/seriesTracker")
    (synopsis "Keep track of the TV shows you watch from Emacs")
    (description
     "This package provides a major mode for tracking TV shows.
TV shows data (episode list, release dates, etc.) are sourced from
the free database hosted at @url{episodate.com}.  The mode presents an
outlined list of tracked shows, their episodes and release dates, and
enables the user to see when new episodes for their favorite shows get
released, and track their progress in watching a series.")
    (license license:gpl3+)))

(define-public emacs-ein
  ;; XXX: Upstream doesn't make any release, and didn't set any version.
  (let ((commit "998ba22660be2035cd23bed1555e47748c4da8a2"))
    (package
      (name "emacs-ein")
      (version "20230826")
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/millejoh/emacs-ipython-notebook")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "09qbswzz6kbxc74dmdgagrk5wgbm89sabf0bfy76j4qlcg6550mx"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command
        #~(list "emacs" "-Q" "--batch"
                "-L" "test"
                "--load" "test/testein-loader.el")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'move-source-files
              (lambda _
                (let ((el-files (find-files "./lisp" ".*\\.el$")))
                  (for-each (lambda (f)
                              (rename-file f (basename f)))
                            el-files)))))))
      (native-inputs
       (list (@(bost gnu packages emacs-build) emacs-f) emacs-mocker))
      (propagated-inputs
       (list emacs-anaphora
             (@(bost gnu packages emacs-build) emacs-dash)
             emacs-deferred
             emacs-polymode
             emacs-request
             emacs-websocket
             emacs-with-editor))
      (home-page "https://github.com/millejoh/emacs-ipython-notebook")
      (synopsis "Jupyter client for all languages")
      (description
       "The Emacs IPython Notebook (EIN) package provides a Jupyter Notebook
client and integrated REPL (like SLIME) in Emacs.  EIN improves notebook
editing by allowing you to use Emacs.  It also expose IPython features such as
code evaluation, object inspection and code completion.  These features can be
accessed anywhere in Emacs and improve Python code editing and reading in
general in Emacs.")
      (license license:gpl3+))))

(define-public emacs-global-tags
  (let ((commit "06db25d91cc8bfb5e24e02adc04de1226c7e742d")
        (revision "0"))
    (package
      (name "emacs-global-tags")
      (version (git-version "0.7" revision commit))
      (home-page "https://git.launchpad.net/global-tags.el/")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url home-page)
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1q30cbqq0h1gfwlcbnx9s930li7w7a0y8sx2ivbvvyyc2j5gsk4j"))
                (modules '((guix build utils)))
                (snippet
                 #~(begin
                     (substitute* "global-tags.el"
                       (("\\(require 'cl-lib\\)" all)
                        (string-append all "(require 'eieio)")))))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ; XXX: 18/24 test failures
      (propagated-inputs
       (list emacs-async emacs-ht))
      (native-inputs (list emacs-buttercup
                           (@(bost gnu packages emacs-build) emacs-f)))
      (synopsis "Testeable Emacs Lisp API that wraps around GNU Global")
      (description "This package provides a testeable Emacs Lisp API that
wraps GNU Global calls and integration to editor using this API with
project.el and xref.el.")
      (license license:gpl3+))))

(define-public emacs-pyimport
  (let ((commit "a6f63cf7ed93f0c0f7c207e6595813966f8852b9")
        (revision "0"))
    (package
      (name "emacs-pyimport")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/Wilfred/pyimport")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1q5gqhvh4zq5dy8vns694warcz48j1hdnxg16sjck4gsi9xivbvs"))))
      (build-system emacs-build-system)
      (inputs
        (list python-pyflakes))
      (propagated-inputs
        (list (@(bost gnu packages emacs-build) emacs-dash) emacs-s emacs-shut-up))
      (arguments
        (list #:phases
              #~(modify-phases %standard-phases
                  (add-after 'unpack 'patch-pyflakes-executable
                    (lambda* (#:key inputs #:allow-other-keys)
                      (let ((pyflakes (search-input-file inputs "/bin/pyflakes")))
                        (make-file-writable "pyimport.el")
                        (substitute* "pyimport.el"
                          (("\"pyflakes")
                           (string-append "\"" pyflakes)))))))))
      (home-page "https://github.com/Wilfred/pyimport")
      (synopsis "Manage Python imports from Emacs")
      (description
"@code{emacs-pyimport} manages python imports from Emacs via @code{python-pyflakes}.")
      (license license:gpl3+)))) ; License is in pyimport.el

(define-public emacs-consult-lsp
  (package
    (name "emacs-consult-lsp")
    (version "2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gagbo/consult-lsp")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1y0dgpgvw90phqi44dyijnnz3z0rys4bkmbnrkkx2fbd3pyvqs1i"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-consult
      (@@(bost gnu packages emacs-xyz-2) emacs-lsp-mode)
      (@(bost gnu packages emacs-build) emacs-f))
     )
    (home-page "https://github.com/gagbo/consult-lsp/")
    (synopsis "LSP mode and Consult helping each other")
    (description
"@code{emacs-consult-lsp} provides helpers for interactively selecting LSP
workspace diagnostics, symbols, and file symbols from @code{emacs-lsp-mode}
by leveraging @code{emacs-consult} APIs.")
    (license license:expat)))

(define-public emacs-org-wild-notifier
  (package
    (name "emacs-org-wild-notifier")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/akhramov/org-wild-notifier.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "00xssqg0mvh5ma2053719bcchbrl7mmj8wzhbrjk34cl4lx9p9fb"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash) emacs-alert emacs-async))
    (license license:gpl3+)
    (home-page "https://github.com/akhramov/org-wild-notifier.el")
    (synopsis "Customizable Org Agenda notifications")
    (description
     "This package provides notification functions for Org Agenda.")))

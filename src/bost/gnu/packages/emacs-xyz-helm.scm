(define-module (bost gnu packages emacs-xyz-helm)
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

(define-public emacs-pdf-tools
  (package
    (name "emacs-pdf-tools")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vedang/pdf-tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1v861fpzck3ky21m4g42h6a6y0cbhc4sjzpzqx0zxd7sfi7rn768"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; there are no tests
       #:modules ((guix build gnu-build-system)
                  ((guix build emacs-build-system) #:prefix emacs:)
                  (guix build utils)
                  (guix build emacs-utils)
                  ((bost guix build emacs-utils) #:prefix bst:))
       #:imported-modules (,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils)
                           (bost guix build emacs-utils))
       #:phases
       (modify-phases %standard-phases
         ;; Build server side using 'gnu-build-system'.
         (add-after 'unpack 'enter-server-dir
           (lambda _ (chdir "server")))
         (add-after 'enter-server-dir 'autogen
           (lambda _
             (invoke "bash" "autogen.sh")))
         ;; Build emacs side using 'emacs-build-system'.
         (add-after 'compress-documentation 'enter-lisp-dir
           (lambda _ (chdir "../lisp")))
         (add-after 'enter-lisp-dir 'emacs-patch-variables
           (lambda* (#:key outputs #:allow-other-keys)
             (for-each make-file-writable (find-files "."))

             ;; Set path to epdfinfo program.
             (emacs-substitute-variables "pdf-info.el"
               ("pdf-info-epdfinfo-program"
                (string-append (assoc-ref outputs "out")
                               "/bin/epdfinfo")))
             ;; Set 'pdf-tools-handle-upgrades' to nil to avoid "auto
             ;; upgrading" that pdf-tools tries to perform.
             (emacs-substitute-variables "pdf-tools.el"
               ("pdf-tools-handle-upgrades" '()))))
         (add-after 'enter-lisp-dir 'emacs-make-autoloads
           (assoc-ref emacs:%standard-phases 'make-autoloads))
         (add-after 'emacs-patch-variables 'emacs-expand-load-path
           (assoc-ref emacs:%standard-phases 'expand-load-path))
         (add-after 'emacs-expand-load-path 'emacs-add-install-to-native-load-path
           (assoc-ref emacs:%standard-phases 'add-install-to-native-load-path))
         (add-after 'emacs-add-install-to-native-load-path 'emacs-install
           (assoc-ref emacs:%standard-phases 'install))
         (add-after 'emacs-install 'emacs-build
           (assoc-ref emacs:%standard-phases 'build))
         ;; The `ensure-package-description' is defined in the
         ;; emacs-build-system The `gnu-build-system' doesn't contain it.
         (add-after 'unpack 'add-needed-pkg-descriptions
           (lambda* (#:key outputs #:allow-other-keys)
             (with-directory-excursion "lisp"
               (bst:write-pkg-file "pdf-tools")))))))
    (native-inputs
     (list
      autoconf
      automake
      emacs-minimal
      pkg-config
      ))
    (inputs
     (list
      cairo
      glib
      libpng
      poppler
      zlib
      ))
    (propagated-inputs
     (list
      emacs-tablist
      ))
    (home-page "https://github.com/vedang/pdf-tools")
    (synopsis "Emacs support library for PDF files")
    (description
     "PDF Tools is, among other things, a replacement of DocView for PDF
files.  The key difference is that pages are not pre-rendered by
e.g. ghostscript and stored in the file-system, but rather created on-demand
and stored in memory.")
    (license license:gpl3+)))

(define-public emacs-pdf-view-restore
  (let ((commit "758131fbcba6a16388e6dd6b55eb4a9998f57123")
        (revision "0"))
    (package
      (name "emacs-pdf-view-restore")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/007kevin/pdf-view-restore.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0z7yxc8pls6pc3zzm0g1g3xdrkj8mwjfsf2fvdqnj7cbv8c7krrb"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pdf-tools))
      (home-page "https://github.com/007kevin/pdf-view-restore")
      (synopsis "Support for opening last known pdf position in pdfview mode")
      (description
       "Support for saving and opening last known pdf position in pdfview mode.
Information will be saved relative to the pdf being viewed so ensure
`pdf-view-restore-filename is in the same directory as the viewing pdf.")
      (license license:gpl3+))))

(define-public emacs-helm
  (let ((commit "e03edf775af41053c8a4de98f370689d4525077b")
        (revision "0"))
    (package
      (name "emacs-helm")
      (version (git-version "4.0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1amm4n5v2v5z2ln1qzhf0n2rj4v89flhk9dip3kbngdwy2a8q2h4"))))
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
                (bst:write-pkg-file "helm-core")
                (bst:write-pkg-file "helm-easymenu")
                (bst:write-pkg-file "helm-files")
                (bst:write-pkg-file "helm-net")
                )))))
      (propagated-inputs
       (list
        emacs-async
        emacs-popup
        ))
      (home-page "https://emacs-helm.github.io/helm/")
      (synopsis "Incremental completion and selection narrowing framework for Emacs")
      (description
       "Helm is an incremental completion and selection narrowing framework for
Emacs.  It will help steer you in the right direction when you're looking for
stuff in Emacs (like buffers, files, etc).")
      (license license:gpl3+))))

;; 1. <path/to/spacemacs>/layers/+checkers/spell-checking/packages.el requires flyspell-correct-helm
;; 2. flyspell-correct-helm requires helm
;; 3. helm requires helm-core
;; See (configuration-layer//get-package-deps-from-archive 'flyspell-correct-helm)
(define-public emacs-helm-core
  (package
    (inherit emacs-helm)
    (name "emacs-helm-core")))

(define-public emacs-helm-lsp
  (let ((commit "54926afd10da52039f8858a99d426cae2aa4c07d")
        (revision "0"))
    (package
      (name "emacs-helm-lsp")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/helm-lsp.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x3fwp059whrrqmdciacvchin5pfkvdv93ayw9vhvxzispp5nyw7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        (@(bost gnu packages emacs-xyz-lsp) emacs-lsp-mode)
        emacs-dash
        ))
      (home-page "https://github.com/emacs-lsp/helm-lsp")
      (synopsis "Provide LSP-enhanced completion for symbols")
      (description
       "This package enhances @code{helm} with completion for symbols from
workspaces with a LSP-compliant server running.")
      (license license:gpl3+))))

(define-public emacs-helm-sly
  (let ((commit "3691626c80620e992a338c3222283d9149f1ecb5")
        (revision "0"))
    (package
      (name "emacs-helm-sly")
      (version (git-version "0.7.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-sly.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "06x8wyx1r0s7askkvlbklgz1cszv34qsvv3gryndw350smk1v8kx"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-sly))
      (home-page "https://github.com/emacs-helm/helm-sly")
      (synopsis "Helm for SLY, a Common Lisp interaction mode for Emacs")
      (description "Helm-SLY defines a few new commands:

@itemize
@item @code{helm-sly-list-connections}: Yet another Lisp connection list with
Helm.
@item @code{helm-sly-apropos}: Yet another @command{apropos} with Helm.
@item @code{helm-sly-mini}: Like @command{helm-sly-list-connections}, but
include an extra source of Lisp-related buffers, like the events buffer or the
scratch buffer.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-slime
  (let ((commit "7886cc49906a87ebd73be3b71f5dd6b1433a9b7b")
        (revision "0"))
    (package
      (name "emacs-helm-slime")
      (version (git-version "0.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-slime.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1g9fnp818d677xhx2m4820742fyblvmnsygmkdb5530lacdaksh2"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-slime))
      (home-page "https://github.com/emacs-helm/helm-slime")
      (synopsis "Helm for SLIME, the Superior Lisp Interaction Mode for Emacs")
      (description "Helm-SLIME defines a few new commands:

@itemize
@item helm-slime-complete: Select a symbol from the SLIME completion systems.
@item helm-slime-list-connections: Yet another slime-list-connections with Helm.
@item: helm-slime-apropos: Yet another slime-apropos with Helm.
@item helm-slime-repl-history: Select an input from the SLIME REPL history and insert it.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-ls-git
  (let ((commit "754c0c27a11a416a1589ea67be7cd57ce5017d02")
        (revision "0"))
    (package
      (name "emacs-helm-ls-git")
      (version (git-version "1.9.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-ls-git.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0mx9mwgldmky4alyk0rc0908cih2ndpd4lxqrfj7m291dyxik458"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-ls-git")
      (synopsis "Helm interface for listing the files in a Git repository")
      (description
       "This package provides a Helm interface for Git files.
@itemize
@item Display the open buffers in project.
@item Display a status source showing state of project (modified files etc.).
@item Display a list of all files in project under git control.
@item Quickly look at diffs of modified files.
@item Allow switching to @code{git status} with your preferred frontend
(vc-dir, Magit,etc.).
@item Full integration of git-grep, also allow usage of @code{helm-grep} (you
can use ack-grep instead of grep).
@item Integrate usage of gid from id-utils.
@item Full integration with @code{helm-find-files}, allow you to browse
projects unrelated to current-buffer.
@item In addition, all actions of type files and buffers are provided.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-company
  (let ((commit "033be73f21778633813264ce1634a6e1ad873d8e")
        (revision "0"))
    (package
      (name "emacs-helm-company")
      (version (git-version "0.2.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Sodel-the-Vociferous/helm-company.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lschnr15c39bnfvm2zdp7f3qvyzrdk8gzzwcb1g2d9jy3mkcq05"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-company))
      (native-inputs
       (list emacs-ert-runner))
      (arguments
       (list #:tests? #t
             #:test-command #~(list "ert-runner")))
      (home-page "https://github.com/Sodel-the-Vociferous/helm-company")
      (synopsis "Helm interface for Company mode")
      (description
       "This is a Helm interface to Company mode, a text completion framework.")
      (license license:gpl3+))))

(define-public emacs-helm-descbinds
  (let ((commit "c12bc85ef3ce342fe1c78cdd86117c05d5310789")
        (revision "1"))
    (package
      (name "emacs-helm-descbinds")
      (version (git-version "1.13" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-descbinds.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0dfm8a8dc3a75pizkjl6304aqx2m9yaqcjk8j0d802ad0zk31g64"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-descbinds")
      (synopsis "Convenient @code{describe-bindings} with Helm")
      (description
       "This package is a replacement of @code{describe-bindings} for Helm.
@code{describe-bindings} is replaced with @code{helm-descbinds}.  As usual,
type @code{C-h b}, or any incomplete key sequence plus @code{C-h}, to run
@code{helm-descbinds}.  The bindings are presented in a similar way as
@code{describe-bindings} does, but you can use completion to find the command
you searched for and execute it, or view its documentation.")
    (license license:gpl3+))))

;; XXX the repo https://github.com/istib/helm-mode-manager doesn't exist anymore?!?
(define-public emacs-helm-mode-manager
  (package
    (name "emacs-helm-mode-manager")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/istib/helm-mode-manager")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1srx5f0s9x7zan7ayqd6scxfhcvr3nkd4yzs96hphd87rb18apzk"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-helm))
    (home-page "https://github.com/istib/helm-mode-manager/")
    (synopsis "Switch and toggle Emacs major and minor modes using Helm")
    (description "This package provides a Helm interface for toggling Emacs
major or minor mode.

@itemize
@item @code{helm-switch-major-mode} list of all major modes
@item @code{helm-enable-minor-mode} list of all inactive minor modes
@item @code{helm-disable-minor-mode} list of all ACTIVE minor modes
@end itemize\n

Hitting @code{RET} enables the mode, @code{C-z} shows the mode
documentation.")
    (license license:gpl3+)))

(define-public emacs-helm-org-rifle
  (let ((commit "03a52265040b8c6510a8269213d750c451779c38")
        (revision "0"))
    (package
      (name "emacs-helm-org-rifle")
      (version (git-version "1.7.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/helm-org-rifle.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wgphpa9qymrc36i4wniwm9dddx6inmj2mdv7hkb1kbld3b5apsg"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-dash emacs-f emacs-helm emacs-org emacs-s))
      (home-page "https://github.com/alphapapa/helm-org-rifle")
      (synopsis "Rifle through Org files")
      (description "This package searches both headings and contents of entries
in Org buffers and displays matching entries.")
      (license license:gpl3+))))

(define-public emacs-helm-system-packages
  (let ((commit "6e02e90ff653f06f2bb469dac09d8c8ac8ce0982")
        (revision "0"))
    (package
      (name "emacs-helm-system-packages")
      (version (git-version "1.10.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-system-packages.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0c988h9sxcrdxriq3lp27vn0sgwdx5ln4l25m03zbi8fik46vr38"))))
      (build-system emacs-build-system)
      (inputs
       (list recutils))
      (propagated-inputs
       (list emacs-helm))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'configure
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let ((recutils (assoc-ref inputs "recutils")))
                 ;; Specify the absolute file names of the various
                 ;; programs so that everything works out-of-the-box.
                 (substitute* "helm-system-packages-guix.el"
                   (("recsel") (string-append recutils "/bin/recsel")))))))))
      (home-page "https://github.com/emacs-helm/helm-system-packages")
      (synopsis "Helm System Packages is an interface to your package manager")
      (description "List all available packages in Helm (with installed
packages displayed in their own respective face).  Fuzzy-search, mark and
execute the desired action over any selections of packages: Install,
uninstall, display packages details (in Org Mode) or insert details at point,
find files owned by packages...  And much more, including performing all the
above over the network.")
      (license license:gpl3+))))

(define-public emacs-helm-xref
  (let ((commit "ea0e4ed8a9baf236e4085cbc7178241f109a53fa")
        (revision "0"))
    (package
      (name "emacs-helm-xref")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/brotzeit/helm-xref.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xbz6idr1fnqkqh0fsn9bhwavng6b2s4idc2l302s2vziygcm42d"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/brotzeit/helm-xref")
      (synopsis "Helm interface for @code{xref}")
      (description "This package provides a Helm interface for selecting
@code{xref} results.")
      (license license:gpl3+))))

(define-public emacs-helm-cider
  (let ((commit "fe7e48befdb0b20ea1b0fb3626a8a725e54ae626")
        (revision "0"))
    (package
      (name "emacs-helm-cider")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/clojure-emacs/helm-cider.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0kj3465klq4a1awfp5xzk9rvrz3gv9n6d8b1k1lsmh4vvm4bsb6g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-cider))
      (home-page "https://github.com/clojure-emacs/helm-cider")
      (synopsis "Helm interface to Clojure's CIDER")
      (description "Helm-CIDER adds Helm interfaces to
@command{cider-apropos}, @command{cider-apropos-documentation},
@command{cider-browse-ns} (namespaces).

It also provides original Helm commands: @command{helm-cider-spec},
@command{helm-cider-spec-ns}, @command{helm-cider-repl-history},
@command{helm-cider-cheatsheet}.")
      (license license:gpl3+))))

(define-public emacs-helm-cider-history
  (let ((commit "c391fcb2e162a02001605a0b9449783575a831fd")
        (revision "0"))
    (package
      (name "emacs-helm-cider-history")
      (version "0.0.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Kungi/helm-cider-history.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "18j4ikb3q8ygdq74zqzm83wgb39x7w209n3186mm051n8lfmkaif"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        ))
      (home-page
       "https://github.com/Kungi/helm-cider-history")
      (synopsis "Helm interface for CIDER REPL input history in Emacs")
      (description
       "Helm interface to browse and reuse CIDER REPL input history within
 Emacs.  It displays past REPL inputs in a Helm buffer, allowing users to
search and insert previous expressions efficiently.  The interface supports
multiline entries and integrates seamlessly with CIDER and Helm.")
      (license license:gpl3+))))

(define-public emacs-helm-css-scss
  (let ((commit "2169d83d8fdc661241df208cb3235112735d936e")
        (revision "0"))
    (package
      (name "emacs-helm-css-scss")
      (version (git-version "1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-css-scss.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jjjw7fw2ngrpgvd599vjd291zr8zr1m7xnxfq2dpqc3mf0s397z"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-css-scss")
      (synopsis "Helm interface for navigating CSS/SCSS/LESS selectors in Emacs")
      (description
       "Helm-powered interface for browsing and navigating CSS, SCSS, and LESS
 selectors within Emacs.  It allows users to view all selectors at once, jump
 to their definitions, and insert closing comments after braces.  The tool
 supports multiple buffers, enhancing efficiency in managing stylesheets.")
      (license license:gpl3+))))

(define-public emacs-helm-dictionary
  (let ((commit "725cc0df42ad57a7902c330065d9e8ee1216791c")
        (revision "0"))
    (package
      (name "emacs-helm-dictionary")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-dictionary.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ipia68s5x1ny6w99g56hfcnhphlz7zh7bhmrrjyv3aflr7d3170"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        ;; emacs-helm-easymenu ;; part of emacs-helm
        ;; emacs-helm-net      ;; part of emacs-helm
        ))
      (home-page "https://github.com/emacs-helm/helm-dictionary")
      (synopsis "Dictionary search interface for Emacs using Helm")
      (description
       "Helm-powered dictionary search interface for Emacs with support for
 various dictionary sources and intuitive access of definitions.")
      (license license:gpl3+))))

(define-public emacs-helm-git-grep
  (let ((commit "744cea07dba6e6a5effbdba83f1b786c78fd86d3")
        (revision "0"))
    (package
      (name "emacs-helm-git-grep")
      (version (git-version "0.10.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yasuyk/helm-git-grep.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "172m7wbgx9qnv9n1slbzpd9j24p6blddik49z6bq3zdg1vlnf3dv"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'fix-make-obsolete
              (lambda _
                (invoke
                 "sed" "--in-place" "742s/make-obsolete/make-obsolete-variable/"
                 "helm-git-grep.el"))))))
      (propagated-inputs
       (list
        emacs-helm
        ;; emacs-helm-core  ;; part of emacs-helm
        ;; emacs-helm-files ;; part of emacs-helm
        ))
      (home-page "https://github.com/yasuyk/helm-git-grep")
      (synopsis "Helm interface for an incremental Git grep in Emacs")
      (description
       "This package provides a Helm interface for Git's grep functionality
 within Emacs.  It allows users to perform searches across a Git
 repository,including submodules, and view results in an interactive Helm
 buffer.  Features include opening results in other windows or frames,
 toggling case sensitivity during searches, and saving search results to a
 writable grep buffer for further editing.  Integration with tools like wgrep
 enhances the usability of search results.")
      (license license:gpl3+))))

(define-public emacs-helm-pydoc
  (let ((commit "cac7b8953adcab85e898bc42b699c3afde5d33c6")
        (revision "0"))
    (package
      (name "emacs-helm-pydoc")
      (version (git-version "0.07" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-pydoc.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "11d34283zh1yffrb2ad4h1ib1n00yx5avas0l39hm56m2gvx6d89"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^helm-pydoc\\.py$" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-exec-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((python (search-input-file inputs "bin/python")))
                  (substitute* "helm-pydoc.py"
                    (("/usr/bin/env python") python))
                  (substitute* "helm-pydoc.el"
                    (("/bin/python") python))))))))
      (inputs (list python-wrapper))
      (propagated-inputs
       (list
        emacs-helm
        ;; emacs-helm-core  ;; part of emacs-helm
        ))
      (home-page "https://github.com/emacsorphanage/helm-pydoc.git")
      (synopsis "Python documentation lookup with Helm in Emacs")
      (description
       "Helm interface for searching and viewing Python
 documentation.  It enables quick access to Python docstrings, module
documentation, and function descriptions, improving efficiency by integrating
comprehensive documentation lookup directly into the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-ac-php
  ;; The latest commit "3d724e518a897343b5ede0b976d6fb46c46bcc01" contains
  ;; changes in the definition/declaration/inclusion-file provided by phpctags
  ;; which is a binary file not included in this package emacs-ac-php-core
  (package
    (name "emacs-ac-php")
    (version "2.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xcwen/ac-php.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1yn5cc6cmj3hwqgmjj44dz847xn5k99kirj36qwc04q7vhl8z8k7"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #true
      #:test-command #~(list "ert-runner")
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
              (bst:write-pkg-file "ac-php-core")
              (bst:write-pkg-file "company-php")
              )))))
    (inputs
     (list
      emacs-auto-complete
      emacs-company
      emacs-dash
      emacs-f
      emacs-helm
      emacs-php-mode
      emacs-popup
      emacs-s
      emacs-xcscope
      ))
    (native-inputs
     (list
      emacs-ert-runner
      ))
    (home-page "https://github.com/xcwen/ac-php")
    (synopsis "Emacs Auto Complete & Company mode for PHP")
    (description
     "This package provides Auto Complete and Company back-ends for PHP.")
    (license license:gpl3+)))

;; Required by <path/to/spacemacs>/layers/+lang/php/packages.el
(define-public emacs-company-php
  (package
    (inherit emacs-ac-php)
    (name "emacs-company-php")))

;; Required from company-php
;; See <path/to/spacemacs>/layers/+lang/php/packages.el
(define-public emacs-ac-php-core
  (package
    (inherit emacs-ac-php)
    (name "emacs-ac-php-core")))

(define-public emacs-helm-org
  (let ((commit "4744ca7f8b35e17bafce9cb0093deb87a232699d")
        (revision "3"))
    (package
      (name "emacs-helm-org")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-org.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1vn9jn8pkrcgi9ayzw0w69a69jygfs6cjxcrd8jcykh907bnq9sp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-org")
      (synopsis "Helm interface to the Silver Searcher")
      (description
       "This package provides a frontend for grepping tools like ag and ack,
as well as features for editing search results.")
      (license license:gpl3+))))

(define-public emacs-org-project-capture
  (let ((commit "bf1c30b750020ab8dd634dd66b2c7b76c56286c5")
        (revision "0"))
    (package
      (name "emacs-org-project-capture")
      (version (git-version "3.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/colonelpanic8/org-project-capture.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1wvw5y5s37p9j0m2ljp7n1s1casbhiyrcnfpvdghvdd0fk8wcybp"))))
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
                (bst:write-pkg-file "org-projectile")
                (bst:write-pkg-file "org-category-capture")
                (bst:write-pkg-file "org-project-capture-backend")
                )))))
      (propagated-inputs
       (list
        emacs-dash
        emacs-helm
        emacs-helm-org
        emacs-projectile
        emacs-s
        ))
      (home-page "https://github.com/colonelpanic8/org-project-capture")
      (synopsis "Integrate Org-mode TODOs with project management in Emacs")
      (description
       "This package integrates Org-mode TODOs with project management tools
 like Projectile and project.el in Emacs. It allows maintaining
 project-specific TODO lists, specifying storage locations for these lists,
 and offers customizable capture strategies. Keybindings can be established
 for easy access, enhancing the organization and management of tasks within
 Emacs.")
      (license license:gpl3+))))

;; Required by <path/to/spacemacs>/layers/+emacs/org/packages.el
(define-public emacs-org-projectile
  (package
    (inherit emacs-org-project-capture)
    (name "emacs-org-projectile")))

(define-public emacs-helm-comint
  (let ((commit "5f435ede181818b6f8c58ad7b45f47acd2721daf")
        (revision "0"))
    (package
      (name "emacs-helm-comint")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/benedicthw/helm-comint.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0k95q7hdy7sp3l8yifjnc6f7xfplnqy8qff806yfgqiyy7gpx72p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm))
      (home-page "https://github.com/benedicthw/helm-comint.git")
      (synopsis "Helm interface for navigating Comint prompts in Emacs")
      (description
       "Helm interface for accessing prompts in Emacs' Comint buffers, such as
 shell or REPL sessions.  It allows users to quickly navigate to previous
prompts using Helm's incremental search capabilities.  Originally part of Helm
core, it now exists as a standalone user-contributed package.")
      (license license:gpl3+))))

(define-public emacs-helm-purpose
  (let ((commit "9ff4c21c1e9ebc7afb851b738f815df7343bb287")
        (revision "0"))
    (package
      (name "emacs-helm-purpose")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bmag/helm-purpose.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xh6v5xlf1prgk6mrvkc6qa0r0bz74s5f4z3dl7d00chsi7i2m5v"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-window-purpose
        emacs-helm
        ))
      (home-page "https://github.com/bmag/helm-purpose")
      (synopsis "Helm integration for Purpose-based window management in Emacs")
      (description
       "Helm commands and sources tailored for the Purpose window management system
 in Emacs.  It includes commands like
`helm-purpose-switch-buffer-with-purpose`to list buffers by purpose and
`helm-purpose-mini-ignore-purpose` to bypass Purpose constraints.  Users can
enable these features by calling `helm-purpose-setup` in their configuration.")
      (license license:gpl3+))))

(define-public emacs-helm-mu
  (let ((commit "d0bbc46338337d92b58708b906b40d0e12ae8006")
        (revision "1"))
    (package
      (name "emacs-helm-mu")
      (version (git-version  "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-mu.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0l7cysci0cmg0mg64gjxismkwqc3rfwl4ixjz5a0434zc1pg502j"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        mu))
      (home-page "https://github.com/emacs-helm/helm-mu")
      (synopsis "Helm sources for searching emails and contacts")
      (description
       "Helm sources for searching emails and contacts using @code{mu} and
@code{mu4e}.  Mu is an indexer for maildirs and mu4e is a mutt-like MUA for
Emacs build on top of mu.  Mu is highly efficient making it possible to get
instant results even for huge maildirs.  It also provides search operators,
e.g: @code{from:Peter to:Anne flag:attach search term}.")
      (license license:gpl3+))))

(define-public emacs-ace-jump-helm-line
  (let ((commit "1483055255df3f8ae349f7520f05b1e43ea3ed37")
        (revision "0"))
    (package
      (name "emacs-ace-jump-helm-line")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cute-jumper/ace-jump-helm-line")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "191a2g1if1jliikbxkpwmvlp4v1sp541j71xrlymili8ygm0idq5"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-avy emacs-helm))
      (home-page "https://github.com/cute-jumper/ace-jump-helm-line")
      (synopsis "Ace-jump to a candidate in Helm window")
      (description
       "This package allows using Ace jump to a candidate in Helm window.")
      (license license:gpl3+))))

(define-public emacs-helm-gtags
  (package
    (name "emacs-helm-gtags")
    (version "1.5.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/syohex/emacs-helm-gtags")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kc1jzk10nfd2v20g8dwnb6a944afrwdwnkzl06w4ba8k4yim7gi"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-helm))
    (home-page "https://github.com/syohex/emacs-helm-gtags")
    (synopsis "Emacs Helm interface to GNU Global")
    (description
     "@code{emacs-helm-gtags} provides a Emacs Helm interface to GNU Global.")
    (license license:gpl3+)))

(define-public emacs-flymake-easy
  (let ((commit "048482a97294585c4833d0311e9254a81db39b6b")
        (revision "0"))
    (package
      (name "emacs-flymake-easy")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/flymake-easy.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08ijmbdz0cybh9jicvl0hx8j2kc13rmv11z2igl1psmj472989f1"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/purcell/flymake-easy")
      (synopsis "Helper library for building Flymake checkers in Emacs")
      (description
       "This package provides a helper function, `flymake-easy-load`, to
 simplify the creation of Flymake syntax checkers in Emacs.  It streamlines
 the setup process by handling common boilerplate code, allowing developers to
 define new checkers with minimal effort.  This utility is particularly useful
 for integrating external linting tools into Emacs' on-the-fly syntax checking
 system.")
      (license license:gpl3+))))

(define-public emacs-flymake-phpcs
  (let ((commit "65ef3ff8ac1e1f48c8cbe66f273835c73680b991")
        (revision "0"))
    (package
      (name "emacs-flymake-phpcs")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/flymake/flymake-phpcs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "13w251mgr8lvlwa8nj51gyikaiqjbyggc4dh92phf148135jam3l"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flymake-easy))
      (home-page "https://github.com/flymake/flymake-phpcs")
      (synopsis "Flymake integration for PHP CodeSniffer in Emacs")
      (description
       "This package integrates PHP CodeSniffer with Emacs' Flymake mode,
 providing on-the-fly syntax checking for PHP code. It highlights coding
 standard violations as you type, enhancing code quality and adherence to
 defined standards. Users can customize the coding standard and specify the
 location of the `phpcs` command. Note: The package requires `flymake-easy`
 and a working installation of PHP CodeSniffer.")
      (license license:gpl3+))))

(define-public emacs-drupal-mode
  (let ((commit "3f91d1d44df11ebd0137a896055fca6a1bb2f554")
        (revision "0"))
    (package
     (name "emacs-drupal-mode")
     (version (git-version "20240816.1236" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arnested/drupal-mode")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0gia6qrzdai0qa903gnxvnfn5mnva577jdf8zccz3i3f2ki02ygb"))))
     (build-system emacs-build-system)
     (arguments
      (list
       #:include #~(cons* "^drupal/.*\\.el$" %default-include)
       #:phases
       #~(modify-phases
          %standard-phases
          (add-after
           'unpack 'move-source-files
           (lambda _
             (substitute*
              "drupal/flymake-phpcs.el"
              (("\\(define-obsolete-variable-alias 'drupal/flymake-phpcs-standard 'drupal/phpcs-standard\\)")
               "(define-obsolete-variable-alias 'drupal/flymake-phpcs-standard 'drupal/phpcs-standard \"28.1\")"
               )
              (("\\(define-obsolete-variable-alias 'drupal/flymake-phpcs-dont-show-trailing-whitespace 'drupal/phpcs-dont-show-trailing-whitespace\\)")
               "(define-obsolete-variable-alias 'drupal/flymake-phpcs-dont-show-trailing-whitespace 'drupal/phpcs-dont-show-trailing-whitespace \"28.1\")"
               )))))))
     (propagated-inputs
      (list
       emacs-flymake-phpcs
       (@(gnu packages code) global) ;; provides gtags
       emacs-helm-gtags
       emacs-ggtags
       emacs-flycheck
       emacs-php-mode))
     (home-page "https://github.com/arnested/drupal-mode")
     (synopsis "Advanced minor mode for Drupal development")
     (description
      "Drupal mode is an advanced minor mode for developing in Drupal.  Drupal mode is
based on top of PHP mode and defines among other things indentation etc.  to
match Drupal Coding Standards.")
     (license license:gpl3+))))

(define-public emacs-avy-menu
  (let ((commit "621052484b80cb13c12a368aedda1c3a209d2c88")
        (revision "0"))
    (package
      (name "emacs-avy-menu")
      (version (git-version "0.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mrkkrp/avy-menu.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0cap4xbn3irmgjazdjrw3mmw04ljx8wzlhs9f46avx7cj1hdh46i"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-avy))
      (home-page "https://github.com/mrkkrp/avy-menu")
      (synopsis "Library providing avy-powered popup menu")
      (description
       "The library provides an Avy-powered popup menu.  It is used in (at
 least) the following packages: * `ace-popup-menu * `char-menu *
 `hasky-extensions It can also be used directly.")
      (license license:gpl3))))

(define-public emacs-flyspell-correct
  (let ((commit "1e7a5a56362dd875dddf848b9a9e25d1395b9d37")
        (revision "0"))
    (package
      (name "emacs-flyspell-correct")
      (version (git-version "0.6.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/d12frosted/flyspell-correct.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q6y40mm6z5ifngwzah9ax6z9dlka3rw3q1am08hmia15vk7bx4g"))))
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
                (bst:write-pkg-file "flyspell-correct-avy-menu")
                (bst:write-pkg-file "flyspell-correct-helm"))))))
      (propagated-inputs
       (list
        emacs-avy-menu
        emacs-helm
        emacs-ivy
        emacs-popup
        ))
      (home-page "https://github.com/d12frosted/flyspell-correct")
      (synopsis "Correcting words with flyspell via custom interfaces")
      (description
       "This package provides functionality for correcting words via custom
interfaces.  Several interfaces are supported beside the classic Ido: Popup,
Helm and Ivy.")
      (license license:gpl3+))))

;; Required by <path/to/spacemacs>/layers/+checkers/spell-checking/packages.el
(define-public emacs-flyspell-correct-helm
  (package
    (inherit emacs-flyspell-correct)
    (name "emacs-flyspell-correct-helm")))

(define-public emacs-helm-fish-completion
  (let ((commit "1e7a5a56362dd875dddf848b9a9e25d1395b9d37")
        (revision "0"))
    (package
      (name "emacs-helm-fish-completion")
      (version (git-version "0.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-fish-completion.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1j2vfngq3512naaayv9kx0d1q2zg1xgs69l8afc7swg72h0l0imw"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-fish-completion))
      (home-page "https://github.com/emacs-helm/helm-fish-completion")
      (synopsis "Helm interface for Emacs fish-completion")
      (description "Helm Fish Completion is a Helm interface for Emacs
fish-completion.  It can be used in both Eshell and M-x shell.")
      (license license:gpl3+))))

(define-public emacs-helm-themes
  (let ((commit "1fc4a5d6114bc6c8c444c5ca73f22abe141a690d")
        (revision "0"))
    (package
      (name "emacs-helm-themes")
      (version (git-version "0.05" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-themes.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1j74a9ynhfcikl4r0v5lym2ansvgwm643qbmj5hknblpn8g6016c"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-themes")
      (synopsis "Emacs theme selection with Helm interface")
      (description
       "Helm Themes provide an Emacs theme selection with Helm interface.")
      (license license:gpl3+))))

(define-public emacs-helm-swoop
  (let ((commit "df90efd4476dec61186d80cace69276a95b834d2")
        (revision "0"))
    (package
      (name "emacs-helm-swoop")
      (version (git-version "3.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-swoop.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "01nrak72inmic9n30dval6608cfzsbv5izwzykbim46ifjhcipag"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-swoop")
      (synopsis "Filter and jump to lines in an Emacs buffer using Helm")
      (description
       "This package builds on the Helm interface to provide several commands
for search-based navigation of buffers.")
      (license license:gpl2+))))

(define-public emacs-helm-ag
  (let ((commit "a7b43d9622ea5dcff3e3e0bb0b7dcc342b272171")
       (revision "0"))
    (package
      (name "emacs-helm-ag")
      (version (git-version "0.64" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syohex/emacs-helm-ag.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1g2clyz5289wpahalvpdafz1d3cyqsm0g7ska0j2rlhqrcy9k2vc"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/syohex/emacs-helm-ag")
      (synopsis "Helm interface to the Silver Searcher")
      (description
       "This package provides a frontend for grepping tools like ag and ack,
as well as features for editing search results.")
      (license license:gpl3+))))

(define-public emacs-helm-projectile
  (let ((commit "041076e35a6663302a91a0fa672f847c7d64bf29")
        (revision "0"))
    (package
      (name "emacs-helm-projectile")
      (version (git-version "1.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bbatsov/helm-projectile.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1yhdc6h72crnlp46hbvs20c0fc9r1x7896z7rbp1z0i0hphsrs86"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-projectile))
      (home-page "https://github.com/bbatsov/helm-projectile")
      (synopsis "Helm integration for Projectile")
      (description
       "This Emacs library provides a Helm interface for Projectile.")
      (license license:gpl3+))))

(define-public emacs-helm-make
  (let ((commit "ebd71e85046d59b37f6a96535e01993b6962c559")
        (revision "0"))
    (package
      (name "emacs-helm-make")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/abo-abo/helm-make.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "14jvhhw4chl94dgfwbyy7yirwchvcz5zrsgr9w6qy4z0fhqba41a"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-ivy emacs-projectile))
      (home-page "https://github.com/abo-abo/helm-make")
      (synopsis "Select a Makefile target with helm")
      (description "@code{helm-make} or @code{helm-make-projectile} will give
you a @code{helm} selection of directory Makefile's targets.  Selecting a
target will call @code{compile} on it.")
      (license license:gpl3+))))

(define-public emacs-helm-c-yasnippet
  (let ((commit "65ca732b510bfc31636708aebcfe4d2d845b59b0")
        (revision "1"))
    (package
      (name "emacs-helm-c-yasnippet")
      (version (git-version "0.6.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-jp/helm-c-yasnippet.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cbafjqlzxbg19xfdqsinsh7afq58gkf44rsg1qxfgm8g6zhr7f8"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-yasnippet))
      (home-page "https://github.com/emacs-jp/helm-c-yasnippet")
      (synopsis "Helm integration for Yasnippet")
      (description "This Emacs library provides Helm interface for
Yasnippet.")
      (license license:gpl2+))))

(define-module (bost gnu packages rust-apps)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system pyproject)
  #:use-module (guix deprecation)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xorg))

;; (define-public ripgrep
;;   (package
;;     (name "ripgrep")
;;     (version "14.1.0")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "ripgrep" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32 "1n3zb5jfb8pv65jm4zmrcxlgpppkpd9pmcpg1ifvv13sqhxbrg6p"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      (list
;;       #:cargo-inputs `(("rust-anyhow" ,rust-anyhow-1)
;;                        ("rust-bstr" ,rust-bstr-1)
;;                        ("rust-grep" ,rust-grep-0.3)
;;                        ("rust-ignore" ,rust-ignore-0.4)
;;                        ("rust-jemallocator" ,rust-jemallocator-0.5)
;;                        ("rust-lexopt" ,rust-lexopt-0.3)
;;                        ("rust-log" ,rust-log-0.4)
;;                        ("rust-serde-json" ,rust-serde-json-1)
;;                        ("rust-termcolor" ,rust-termcolor-1)
;;                        ("rust-textwrap" ,rust-textwrap-0.16))
;;       #:cargo-development-inputs `(("rust-serde" ,rust-serde-1)
;;                                    ("rust-serde-derive" ,rust-serde-derive-1)
;;                                    ("rust-walkdir" ,rust-walkdir-2))
;;       #:install-source? #f
;;       ;; Note: the built target 'rg' binary is required for 'install-extras
;;       #:phases #~(modify-phases %standard-phases
;;                    (add-after 'install 'install-extras
;;                      (lambda* (#:key native-inputs outputs #:allow-other-keys)
;;                        (let* ((out (assoc-ref outputs "out"))
;;                               (share (string-append out "/share"))
;;                               (bash-completions-dir
;;                                 (string-append share "/bash-completion/completions"))
;;                               (zsh-completions-dir
;;                                 (string-append share "/zsh/site-functions"))
;;                               (fish-completions-dir
;;                                 (string-append share "/fish/vendor_completions.d"))
;;                               (man1 (string-append share "/man/man1"))
;;                               (rg (if #$(%current-target-system)
;;                                     (search-input-file native-inputs "/bin/rg")
;;                                     (string-append out "/bin/rg"))))
;;                            (mkdir-p man1)
;;                            (with-output-to-file (string-append man1 "/rg.1")
;;                              (lambda _
;;                                (invoke rg "--generate" "man")))
;;                            (mkdir-p bash-completions-dir)
;;                            (with-output-to-file (string-append
;;                                                   bash-completions-dir "/rg")
;;                              (lambda _
;;                                (invoke rg "--generate" "complete-bash")))
;;                            (mkdir-p zsh-completions-dir)
;;                            (with-output-to-file (string-append
;;                                                   zsh-completions-dir "/_rg")
;;                              (lambda _
;;                                (invoke rg "--generate" "complete-zsh")))
;;                            (mkdir-p fish-completions-dir)
;;                            (with-output-to-file
;;                              (string-append fish-completions-dir "/rg.fish")
;;                              (lambda _
;;                                (invoke rg "--generate" "complete-fish")))))))
;;       #:features '(list "pcre2")))
;;     (inputs (list pcre2))
;;     (native-inputs (cons* pkg-config (if (%current-target-system)
;;                                          (list this-package)
;;                                          '())))
;;     (home-page "https://github.com/BurntSushi/ripgrep")
;;     (synopsis "Line-oriented search tool and Rust successor to @command{grep}")
;;     (description
;;      "@code{ripgrep} (@command{rg}) is a line-oriented search tool that
;; recursively searches your current directory for a regex pattern while
;; respecting your gitignore rules. @code{ripgrep} is similar to other popular
;; search tools like The Silver Searcher, @command{ack} and @command{grep}.")
;;     (license (list license:unlicense license:expat))))

(define-public ripgrep
  (package
    (name "ripgrep")
    (version "13.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ripgrep" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1gv4imhjgxmyxaa996yshcjlakmrjw9pf4rycp90pq675cn9sz7k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bstr" ,rust-bstr-0.2)
        ("rust-clap" ,rust-clap-2)
        ("rust-grep" ,rust-grep-0.2)
        ("rust-ignore" ,rust-ignore-0.4)
        ("rust-jemallocator" ,rust-jemallocator-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-cpus" ,rust-num-cpus-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-termcolor" ,rust-termcolor-1))
       #:cargo-development-inputs
       (("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-walkdir" ,rust-walkdir-2))
       #:modules ((ice-9 match)
                  (guix build cargo-build-system)
                  (guix build utils))
       #:phases
       (modify-phases %standard-phases
         (add-after 'build 'install-manpage
           ;; NOTE: This is done before 'check so that there's only one output
           ;; directory with the man page.
           (lambda* (#:key outputs #:allow-other-keys)
             (match (find-files "target" "^rg\\.1$")
               ((manpage)
                (install-file manpage (string-append
                                       (assoc-ref outputs "out")
                                       "/share/man/man1"))))
             #t)))
       #:features '("pcre2")))
    (inputs
     (list pcre2))
    (native-inputs
     (list asciidoc pkg-config))
    (home-page "https://github.com/BurntSushi/ripgrep")
    (synopsis "Line-oriented search tool")
    (description
     "ripgrep is a line-oriented search tool that recursively searches
your current directory for a regex pattern while respecting your
gitignore rules.")
    (license (list license:unlicense license:expat))))

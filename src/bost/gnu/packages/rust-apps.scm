;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2019, 2020 John Soo <jsoo1@asu.edu>
;;; Copyright © 2019-2024 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2020 Jakub Kądziołka <kuba@kadziolka.net>
;;; Copyright © 2020 Michael Rohleder <mike@rohleder.de>
;;; Copyright © 2020 Leo Famulari <leo@famulari.name>
;;; Copyright © 2020 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2020 Gabriel Arazas <foo.dogsquared@gmail.com>
;;; Copyright © 2020-2023 Nicolas Goaziou <mail@nicolasgoaziou.fr>
;;; Copyright © 2020 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2021 Sharlatan Hellseher <sharlatanus@gmail.ccom>
;;; Copyright © 2021, 2022 Zheng Junjie <873216071@qq.com>
;;; Copyright © 2021 Alexandru-Sergiu Marton <brown121407@posteo.ro>
;;; Copyright © 2021, 2023 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2021, 2022 Petr Hodina <phodina@protonmail.com>
;;; Copyright © 2021 jgart <jgart@dismail.de>
;;; Copyright © 2021 Nicolas Graves <ngraves@ngraves.fr>
;;; Copyright © 2022 Aleksandr Vityazev <avityazev@posteo.org>
;;; Copyright © 2022 Gabriel Arazas <foo.dogsquared@gmail.com>
;;; Copyright © 2022 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2022 Mathieu Laparie <mlaparie@disr.it>
;;; Copyright © 2022 ( <paren@disroot.org>
;;; Copyright © 2022 John Kehayias <john.kehayias@protonmail.com>
;;; Copyright © 2022 Greg Hogan <code@greghogan.com>
;;; Copyright © 2023 Arnav Andrew Jose <arnav.jose@gmail.com>
;;; Copyright © 2023 Wilko Meyer <w@wmeyer.eu>
;;; Copyright © 2023, 2024 Jaeme Sifat <jaeme@runbox.com>
;;; Copyright © 2023 Steve George <steve@futurile.net>
;;; Copyright © 2024 Troy Figiel <troy@troyfigiel.com>
;;; Copyright © 2024 Herman Rimm <herman@rimm.ee>
;;; Copyright © 2024 Tomas Volf <~@wolfsden.cz>
;;; Copyright © 2024 Suhail Singh <suhail@bayesians.ca>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (bost gnu packages rust-apps)
  #:use-module (bost utils)  ;; for build
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
  #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages crates-crypto)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-tls)
  #:use-module (gnu packages crates-vcs)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-windows)
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

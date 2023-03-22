(define-module (bost packages xdisorg)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system scons)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages man)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages syncthing)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages)
  #:use-module (ice-9 match))

(define-public xsel
  ;; The 1.2.0 release no longer compiles with GCC 8 and upper, see:
  ;; https://github.com/kfish/xsel/commit/d88aa9a8dba9228e6780d6bb5a5720a36f854918.
  (let ((commit "062e6d373537c60829fa9b5dcddbcd942986b3c3")
        (revision "1"))
    (package
      (name "xsel")
      (version (git-version "1.2.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/kfish/xsel")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0fbf80zsc22vcqp59r9fdx4icxhrkv7l3lphw83326jrmkzy6kri"))))
      (build-system gnu-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (replace 'bootstrap
             (lambda _
               (invoke "autoreconf" "-vfi"))))))
      (native-inputs (list autoconf automake libtool))
      (inputs
       (list libxt))
      (home-page "https://www.vergenet.net/~conrad/software/xsel/")
      (synopsis "Manipulate X selection, i.e. clipboard from the command line")
      (description
       "XSel is a command-line program for getting and setting the contents of
the X selection, i.e. clipboard.  Normally this is only accessible by manually
highlighting information and pasting it with the middle mouse button.

XSel reads from standard input and writes to standard output by default, but
can also follow a growing file, display contents, delete entries and more.")
      (license (license:x11-style "file://COPYING"
                                  "See COPYING in the distribution.")))))

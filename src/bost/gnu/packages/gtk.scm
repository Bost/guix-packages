(define-module (bost gnu packages gtk)
  #:use-module (gnu packages gtk)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix bzr-download)
  #:use-module (guix git-download)
  #:use-module (guix search-paths)
  #:use-module ((guix build utils) #:select (alist-replace))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system waf)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages iso-codes)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages man)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages pulseaudio)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 match))

(define-public pango-old
  (package
    (name "pango-old")
    (version "1.54.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/pango/"
                                  (version-major+minor version) "/"
                                  name "-" version ".tar.xz"))
              (patches (search-patches "pango-skip-libthai-test.patch"))
              (sha256
               (base32
                "1n0y5l5wfq2a86dimraazvz1v9dvqdjkmpqgzkbk9rqy09syv7la"))))
    (build-system meson-build-system)
    (arguments
     '(#:glib-or-gtk? #t             ; To wrap binaries and/or compile schemas
       #:phases (modify-phases %standard-phases
                  (add-after 'unpack 'disable-cantarell-tests
                    (lambda _
                      (substitute* "tests/meson.build"
                        ;; XXX FIXME: These tests require "font-abattis-cantarell", but
                        ;; adding it here would introduce a circular dependency.
                        (("\\[ 'test-layout'.*") "")
                        (("\\[ 'test-itemize'.*") "")
                        (("\\[ 'test-font'.*") "")
                        (("\\[ 'test-harfbuzz'.*") "")))))))
    (propagated-inputs
     ;; These are all in Requires or Requires.private of the '.pc' files.
     (list cairo
           fontconfig
           freetype
           fribidi
           glib
           harfbuzz
           libthai
           ;; Some packages, such as Openbox, expect Pango to be built with the
           ;; optional libxft support.
           libxft
           libxrender))
    (inputs
     (list bash-minimal
           zlib))
    (native-inputs
     (append (list `(,glib "bin"))      ;glib-mkenums, etc.
             (if (target-hurd?)
                 '()
                 (list gobject-introspection)) ;g-ir-compiler, etc.
             (list
              help2man
              perl
              pkg-config
              python-wrapper)))
    (synopsis "Text and font handling library")
    (description "Pango is a library for laying out and rendering of text, with
an emphasis on internationalization.  Pango can be used anywhere that text
layout is needed, though most of the work on Pango so far has been done in the
context of the GTK+ widget toolkit.  Pango forms the core of text and font
handling for GTK+-2.x.")
    (home-page "https://pango.gnome.org/")
    (license license:lgpl2.0+)))

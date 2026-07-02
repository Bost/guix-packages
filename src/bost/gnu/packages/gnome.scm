(define-module (bost gnu packages gnome)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system meson)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp))

(define-public simple-scan
  (package
    (name "simple-scan")
    (version "49.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://gnome/sources/simple-scan/"
                           (version-major version) "/"
                           "simple-scan-" version ".tar.xz"))
       (sha256
        (base32 "0d733cjq0dy07fx3yxh2rzr3ij3rslvb96czxd2miyfa3qax9s4s"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'skip-gtk-update-icon-cache
                 ;; Don't create 'icon-theme.cache'.
                 (lambda _
                   (substitute* "meson.build"
                     (("gtk_update_icon_cache: true")
                      "gtk_update_icon_cache: false")
                     (("glib_compile_schemas: true")
                      "glib_compile_schemas: false")))))))
    (native-inputs
     (list gettext-minimal
           `(,gtk "bin")
           itstool
           `(,glib "bin")               ; glib-compile-schemas, etc.
           pkg-config
           python
           vala
           libxml2))
    (inputs
     (list gtk
           zlib
           cairo
           colord
           gdk-pixbuf
           gusb
           libadwaita
           sane))
    (home-page "https://gitlab.gnome.org/GNOME/simple-scan")
    (synopsis "Document and image scanner")
    (description
     "Document Scanner is an easy-to-use application that lets you connect your
scanner and quickly capture images and documents in an appropriate format.  It
supports any scanner for which a suitable SANE driver is available, which is
almost all of them.")
    (license license:gpl3+)))

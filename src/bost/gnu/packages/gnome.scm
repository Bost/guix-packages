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
    (version "46.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://gnome/sources/simple-scan/"
                           (version-major version) "/"
                           "simple-scan-" version ".tar.xz"))
       (sha256
        (base32 "1aghnkvjdyj73kv55nd9gl5b1xjkpcxjn4j3a6z67r9g2j86avn1"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-simple-scan
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((simple-scan (string-append #$output "/bin/simple-scan"))
                    (sane-airscan-inputs (assoc-ref inputs "sane-airscan")))
                (wrap-program simple-scan
                  `("LD_LIBRARY_PATH" =
                    (,(string-append sane-airscan-inputs "/lib/sane")))
                  `("SANE_CONFIG_DIR" prefix
                    (,(string-append sane-airscan-inputs "/etc/sane.d"))))))))))
    (native-inputs
     (list gettext-minimal
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
           sane-airscan
           sane-backends))
    (home-page "https://gitlab.gnome.org/GNOME/simple-scan")
    (synopsis "Document and image scanner")
    (description
     "Document Scanner is an easy-to-use application that lets you connect your
scanner and quickly capture images and documents in an appropriate format.  It
supports any scanner for which a suitable SANE driver is available, which is
almost all of them.")
    (license license:gpl3+)))

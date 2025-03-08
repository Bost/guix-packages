(define-module (bost gnu packages guake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages wm)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils))

(define-public libutempter
  (package
    (name "libutempter")
    (version "1.2.3-alt1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/altlinux/libutempter/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "04b72ipf0vzr3d8ybknbi1w4azvqhppps5r1jlj163lvmxsrr02j"))))
    (build-system gnu-build-system)
    ;; Authentication-related tools such as passwd, su, and login
    (inputs `(("shadow" ,shadow)))
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "LIBDIR=" #$output "/lib")
              (string-append "LIBEXECDIR=" #$output "/libexec"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure) ; No configure script
          (add-after 'unpack 'chdir-to-source
            (lambda _ (chdir "libutempter")))
          (add-after 'chdir-to-source 'fix-hardcoded-paths
            (lambda* (#:key outputs #:allow-other-keys)
              (substitute* "Makefile"
                (("/usr/lib") "$(LIBDIR)")
                (("/usr/include") "$(PREFIX)/include")
                (("/usr/share/man") "$(PREFIX)/share/man"))))
          (add-before 'build 'set-cc
            (lambda _ (setenv "CC" "gcc")))
          (add-before 'install 'create-directories
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/lib"))
                (mkdir-p (string-append out "/include"))
                (mkdir-p (string-append out "/share/man/man3"))))))))
    (synopsis "Library for utmp/wtmp session recording")
    (description
     "Privileged helper for terminal emulators to manage user session records
 in utmp/wtmp files.")
    (home-page "https://github.com/altlinux/libutempter")
    ;; see libutempter/COPYING
    (license license:lgpl2.1+)))

(define-public guake
  (package
    (name "guake")
    (version "3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Guake/guake/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "11vgg5f170gqp2nskgcdh8v53ryd40502zy2330nb07m86604vws"))))
    (build-system python-build-system)
    (propagated-inputs
     (list
      gettext-minimal
      glib
      gtk+
      keybinder
      libnotify
      libutempter
      libwnck
      nss-certs
      python-dbus
      python-pycairo
      python-pygobject
      python-pyinotify
      python-pyyaml
      python-wrapper
      vte
      (list glib "bin")
      python-setuptools-scm
      ;; dconf ; Low-level GNOME configuration system
      ))
    (arguments
     (list
      #:tests? #f
      #:modules '((guix build python-build-system)
                  (guix build utils)
                  (srfi srfi-26))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check)
          (add-after 'unpack 'fix-source-code
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (LOCALE (string-append out "/share"))
                     (GLADE (string-append out "/share/guake"))
                     (IMAGE (string-append out "/share/guake/pixmaps"))
                     (SCHEMA (string-append out "/share/glib/schemas"))
                     (GUAKE_THEME (string-append out "/share/guake/guake"))
                     (AUTOSTART (string-append out "/share/guake/autostart"))
                     (LOGIN_DESTOP (string-append out "/share/guake")))

                (define (quotes s) (format #f "\"~a\"" s ))

                (substitute* "guake/paths.py.in"
                  (("\\{\\{ LOCALE_DIR \\}\\}")        (quotes LOCALE))
                  (("\\{\\{ IMAGE_DIR \\}\\}")         (quotes IMAGE))
                  (("\\{\\{ GLADE_DIR \\}\\}")         (quotes GLADE))
                  (("\\{\\{ SCHEMA_DIR \\}\\}")        (quotes SCHEMA))
                  (("\\{\\{ GUAKE_THEME_DIR \\}\\}")   (quotes GUAKE_THEME))
                  (("\\{\\{ AUTOSTART_FOLDER \\}\\}")  (quotes AUTOSTART))
                  (("\\{\\{ LOGIN_DESTOP_PATH \\}\\}") (quotes LOGIN_DESTOP)))

                (mkdir-p LOCALE)
                (mkdir-p IMAGE)
                (mkdir-p GLADE)
                (mkdir-p SCHEMA)
                (mkdir-p GUAKE_THEME)
                (mkdir-p AUTOSTART)
                (mkdir-p LOGIN_DESTOP)

                ;; Disable version lookup from git
                (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version))

              ;; Dependency check is misleading. Comment it out.
              (invoke "sed" "--in-place" "397,437s/^/#/" "guake/main.py")))

          (add-before 'build 'set-env-vars
            (lambda* (#:key inputs #:allow-other-keys)
              ;; Prevent pip from trying to create cache directory
              (setenv "PIP_CACHE_DIR" "/tmp/pip-cache")
              ;; Set SSL certificate path for pip
              (setenv "SSL_CERT_FILE"
                      (string-append (assoc-ref inputs "nss-certs")
                                     "/etc/ssl/certs/ca-certificates.crt"))))

          (add-after 'install 'install-schemas
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (schemas (string-append out "/share/glib/schemas")))

                (install-file "guake/data/org.guake.gschema.xml" schemas)
                (with-directory-excursion schemas
                  (invoke "glib-compile-schemas" "."))

                (map (cut install-file <>
                          (string-append out "/share/guake"))
                     (list
                      "guake/data/guake.glade"
                      "guake/data/about.glade"
                      "guake/data/guake.glade"
                      "guake/data/prefs.glade"
                      "guake/data/search.glade"))

                (map (cut install-file <>
                          (string-append out "/share/guake/pixmaps"))
                     (list
                      "guake/data/pixmaps/add_tab.png"
                      "guake/data/pixmaps/guake-128.png"
                      "guake/data/pixmaps/guake-48.png"
                      "guake/data/pixmaps/guake-64.png"
                      "guake/data/pixmaps/guake-notification.png"
                      "guake/data/pixmaps/guake-tray.png"
                      "guake/data/pixmaps/guake.png"
                      "guake/data/pixmaps/quick-open-python-exception.png"
                      "guake/data/pixmaps/quick-open-selection.png"
                      "guake/data/pixmaps/quick-open.png"))

                (copy-file "guake/paths.py.in"
                           (string-append
                            out "/lib/" #$(package-name python)
                            #$(version-major+minor (package-version python))
                            "/site-packages/guake/paths.py"))

                ;; Make libutempter.so.0 discoverable
                (wrap-program (string-append out "/bin/guake")
                  `("LD_LIBRARY_PATH" ":" prefix
                    (,(string-append (assoc-ref inputs "libutempter")
                                     "/lib"))))))))))
    (synopsis "Drop-down terminal for GNOME")
    (description
     "Guake provides quick access to a terminal with a simple keystroke,
inspired by the Quake console interface.")
    (home-page "https://github.com/Guake/guake")
    (license license:gpl2+)))

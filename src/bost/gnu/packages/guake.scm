(define-module (bost gnu packages guake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages wm)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  )

(define-public libutempter
  (package
    (name "libutempter")
    (version "1.2.3-alt1")
    (source
     (origin
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
                "11vgg5f170gqp2nskgcdh8v53ryd40502zy2330nb07m86604vws"
                ))))
    (build-system pyproject-build-system)

    ;; C/GI libs at runtime
    (inputs
     (list
      guile-3.0
      glib
      gtk+
      gdk-pixbuf
      harfbuzz
      at-spi2-core
      keybinder
      libnotify
      libutempter
      libwnck
      vte/gtk+-3
      (@(bost gnu packages gtk) pango-old)
      ))

    ;; Python deps at runtime
    (propagated-inputs
     (list
      python-dbus
      python-pycairo
      python-pygobject
      python-pyinotify
      python-pyyaml
      ))

    ;; Build tools
    (native-inputs
     (list
      ;; The order of glib and (list glib "bin") matters. When reversed the
      ;; "...-glib-bin" instead of "...-glib" gets picked.
      glib
      (list glib "bin")             ; glib-compile-schemas
      python-setuptools
      python-wheel
      python-installer
      python-pypa-build
      python-setuptools-scm
      ))

    (arguments
     (list
      #:tests? #f
      #:imported-modules
      `((guix build glib-or-gtk-build-system)
        ,@%pyproject-build-system-modules)
      #:modules
      '((guix build pyproject-build-system)
        ((guix build glib-or-gtk-build-system) #:prefix glib:)
        (guix build utils)
        (srfi srfi-26))
      #:phases
      #~(modify-phases %standard-phases
          ;; Avoid setuptools-scm querying VCS/network.
          (add-before 'build 'freeze-version
            (lambda _
              (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version)
              (setenv "SETUPTOOLS_SCM_NO_LOCAL" "1")))

          ;; Write absolute paths into guake/paths.py.
          (add-after 'unpack 'prepare-paths
            (lambda* (#:key outputs #:allow-other-keys)
              (define (as-str s) (format #f "\"~a\"" s))
              (let* ((out       (assoc-ref outputs "out"))
                     (share     (string-append out "/share"))
                     (guake-dir (string-append share "/guake"))
                     (pixmaps   (string-append guake-dir "/pixmaps"))
                     (schemas   (string-append share "/glib-2.0/schemas"))
                     (theme     (string-append guake-dir "/guake"))
                     (autostart (string-append guake-dir "/autostart")))
                (substitute* "guake/paths.py.in"
                  (("\\{\\{ LOCALE_DIR \\}\\}")        (as-str share))
                  (("\\{\\{ IMAGE_DIR \\}\\}")         (as-str pixmaps))
                  (("\\{\\{ GLADE_DIR \\}\\}")         (as-str guake-dir))
                  (("\\{\\{ SCHEMA_DIR \\}\\}")        (as-str schemas))
                  (("\\{\\{ GUAKE_THEME_DIR \\}\\}")   (as-str theme))
                  (("\\{\\{ AUTOSTART_FOLDER \\}\\}")  (as-str autostart))
                  (("\\{\\{ LOGIN_DESTOP_PATH \\}\\}") (as-str guake-dir)))
                (copy-file "guake/paths.py.in" "guake/paths.py")
                (map mkdir-p
                     (list guake-dir pixmaps schemas theme autostart)))))

          ;; Install UI files & schema (wheel sometimes misses these paths).
          (add-after 'install 'install-data-and-schemas
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out     (assoc-ref outputs "out"))
                     (share   (string-append out "/share"))
                     (guake   (string-append share "/guake"))
                     (pixmaps (string-append guake "/pixmaps"))
                     (schemas (string-append share "/glib-2.0/schemas")))
                (mkdir-p guake)
                (mkdir-p pixmaps)
                (mkdir-p schemas)
                (map (cut install-file <> guake)
                     (list
                      "guake/data/guake.glade"
                      "guake/data/about.glade"
                      "guake/data/prefs.glade"
                      "guake/data/search.glade"))
                (map (cut install-file <> pixmaps)
                     (find-files "guake/data/pixmaps" "\\.png$"))
                (install-file "guake/data/org.guake.gschema.xml" schemas))))

          ;; Compile schemas & do the standard GTK wrap.
          (add-after 'install-data-and-schemas 'glib-or-gtk-compile-schemas
            (assoc-ref glib:%standard-phases 'glib-or-gtk-compile-schemas))

          (add-after 'wrap 'glib-or-gtk-wrap
            (assoc-ref glib:%standard-phases 'glib-or-gtk-wrap))

          ;; Install a D-Bus service so org.guake3.RemoteControl can auto-activate.
          (add-after 'glib-or-gtk-wrap 'install-dbus-service
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out     (assoc-ref outputs "out"))
                     (svc-dir (string-append out "/share/dbus-1/services")))
                (mkdir-p svc-dir)
                (call-with-output-file
                    (string-append svc-dir
                                   "/org.guake3.RemoteControl.service")
                  (lambda (port)
                    (format port "[D-BUS Service]~%")
                    (format port "Name=org.guake3.RemoteControl~%")
                    (format port "Exec=~a/bin/guake~%" out))))))

          ;; Prepend all GI dirs and libs.
          (add-after 'glib-or-gtk-wrap 'wrap-gi
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (define lst-gi-dirs
                '(
                  ("at-spi2-core"    "/lib/girepository-1.0")
                  ("gdk-pixbuf"      "/lib/girepository-1.0")
                  ("glib"            "/lib/girepository-1.0")
                  ("gtk+"            "/lib/girepository-1.0")
                  ("harfbuzz"        "/lib/girepository-1.0")
                  ("keybinder"       "/lib/girepository-1.0")
                  ("libnotify"       "/lib/girepository-1.0")
                  ("libwnck"         "/lib/girepository-1.0")
                  ("pango-old"       "/lib/girepository-1.0")
                  ("vte-with-gtk+3"  "/lib/girepository-1.0")
                  ))

              (define filter-dirs
                (compose
                 (cut filter file-exists? <>)
                 (cut map (cut apply
                               (lambda (key suffix)
                                 (let ((val (assoc-ref inputs key)))
                                   (and val (string-append val suffix))))
                               <>)
                      <>)))

              (let* ((out (assoc-ref outputs "out"))
                     (bindir (string-append out "/bin"))
                     ;; absolute path to Guile for the shebang
                     (guile-bin (or (search-input-file inputs "bin/guile")
                                    (error "Missing 'guile' in inputs")))
                     (gi-dirs  (filter-dirs lst-gi-dirs))
                     (lib-dirs (filter-dirs (append
                                             lst-gi-dirs
                                             '(("libutempter" "/lib"))))))
                ((compose
                  ;; Augment the existing wrapper (which is a shell script)
                  ;; by prepending a Guile stub that exports our vars
                  (cut map
                       (cut wrap-script <>
                            #:guile guile-bin
                            `("GI_TYPELIB_PATH" ":" prefix ,gi-dirs)
                            `("LD_LIBRARY_PATH" ":" prefix ,lib-dirs)
                            ;; ensure D-Bus sees $out/share/dbus-1/services
                            `("XDG_DATA_DIRS"   ":"
                              prefix (,(string-append out "/share"))))
                       <>)
                  ;; Only wrap actual entry points, not dotfiles or *-real
                  (cut filter file-exists? <>)
                  (cut map (cut string-append bindir <>) <>))
                 (list "/guake" "/guake-toggle"))))))))

    (home-page "https://github.com/Guake/guake")
    (synopsis "Drop-down terminal for GNOME")
    (description "Guake is a Quake-style drop-down terminal for GNOME.")
    (license license:gpl2+)))

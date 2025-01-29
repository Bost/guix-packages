#|
I'd like to write a guix package for the guake drop-down terminal. Please help me with that. The repository is here https://github.com/Guake/guake

The installation from the source for debian, arch or fedora is described here https://guake.readthedocs.io/en/latest/user/installing.html#install-from-source

The bootstrap-dev scripts are here:
https://raw.githubusercontent.com/Guake/guake/refs/heads/master/scripts/bootstrap-dev-debian.sh
https://raw.githubusercontent.com/Guake/guake/refs/heads/master/scripts/bootstrap-dev-pip.sh
https://raw.githubusercontent.com/Guake/guake/refs/heads/master/scripts/bootstrap-dev-arch.sh
https://raw.githubusercontent.com/Guake/guake/refs/heads/master/scripts/bootstrap-dev-fedora.sh
|#

(define-module (bost gnu packages guake)
  #:use-module (bost utils)  ;; for build
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix search-paths)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)

  #:use-module (gnu packages python)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages commencement)
  ;; #:use-module (guix build python-build-system)
  #:use-module (guix build-system python)
  #:use-module (guix git-download)
  )

;; (define-public guake
;;   (package
;;     (name "guake")
;;     (version "3.10")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (string-append "https://github.com/Guake/guake/archive/refs/tags/"
;;                                   version ".tar.gz"))
;;               (sha256
;;                (base32
;;                 "11vgg5f170gqp2nskgcdh8v53ryd40502zy2330nb07m86604vws" ; 3.10
;;                 ;; "0v3w3jqjwl355l4v9nch9w8r8cg84faws2sycdgp39y378pcn5ln" ;; latest commit
;;                 ))))
;;     (build-system gnu-build-system)
;;     (inputs
;;      `(
;;        ;; ("python-gtk" ,python-gtk)  ; Python GTK bindings
;;        ("gtk" ,gtk+)
;;        ("vte" ,vte)  ; VTE terminal widget dependency
;;        ("python3-pip" ,python-pip)  ; Python pip for additional modules
;;        ("python3-setuptools" ,python-setuptools)  ; Needed for packaging Python apps
;;        ("libgnomecanvas" ,libgnomecanvas) ; A library dependency for the interface

;;        ("python" ,python)
;;        ;; ("libutempter" ,libutempter)
;;        ("keybinder" ,keybinder)
;;        ("python-pycairo" ,python-pycairo)
;;        ("python-pygobject" ,python-pygobject)
;;        ("python-dbus" ,python-dbus)
;;        ("gtk+" ,gtk+)
;;        ("glib" ,glib)
;;        ("gettext" ,gettext-minimal)
;;        ))
;;     (native-inputs
;;      `(("pkg-config" ,pkg-config)
;;        ("intltool" ,intltool)
;;        ("glib:bin" ,glib "bin") ; For glib-compile-schemas
;;        ))
;;     (home-page "https://guake-project.org/")
;;     (synopsis "Drop-down terminal for GNOME")
;;     (description
;;      "Guake is a drop-down terminal for GNOME. It’s designed for quick access to a
;; terminal without taking up too much space.")
;;     (license license:gpl3)))


#|

The https://raw.githubusercontent.com/altlinux/libutempter/4caa8ab94ff8b207228fa723a89214bf5e929321/ci/install-dependencies.sh expects that an environment variable CC is defined.

Guix uses a minimal environment for builds, so it doesn't have the 'cc' symlink.

However, it looks like the gnu-build-system includes the necessary gcc-toolchain. (I'm not 100% sure, please have a look at https://git.savannah.gnu.org/cgit/guix.git/plain/guix/build-system/gnu.scm)

If I'm right then IMO adding gcc-toolchain to native-inputs is superfluous.

> The correct approach here is to include gcc-toolchain in native-inputs because
> the package requires a C compiler to build. Even though Guix's build
> environment might have some compilers, specifying it explicitly ensures that
> the correct version is used and makes the package definition more
> self-contained.

I disagree.
I argue, it's better to use gnu-build-system as it is, without overriding or explicitly specifying anything, if not necessary.

Otherwise for example, any potential bugfix in the gnu-build-system would require a manual analysis of the libutempter package, meaning that the libutempter does not automatically benefit from such a bugfix.

What do you think?

|#
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
     `(
       #:tests? #f
       #:make-flags
       (list (string-append "PREFIX=" %output)
             (string-append "LIBDIR=" %output "/lib")
             (string-append "LIBEXECDIR=" %output "/libexec"))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-after 'unpack 'chdir-to-source
           (lambda _ (chdir "libutempter")))
         (add-after 'chdir-to-source 'patch-makefile
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "Makefile"
               ;; Fix hardcoded installation paths
               (("/usr/lib") "$(LIBDIR)")
               (("/usr/include") "$(PREFIX)/include")
               (("/usr/share/man") "$(PREFIX)/share/man")
               ;; Fix mkdir commands to use DESTDIR
               (("mkdir -p /usr/lib") "mkdir -p $(DESTDIR)$(LIBDIR)")
               (("mkdir -p /usr/include") "mkdir -p $(DESTDIR)$(PREFIX)/include")
               (("mkdir -p /usr/share/man") "mkdir -p $(DESTDIR)$(PREFIX)/share/man"))))
         (add-before 'build 'set-cc
           (lambda _ (setenv "CC" "gcc"))) ; Ensure 'gcc' is used explicitly
         (add-before 'install 'create-directories
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (mkdir-p (string-append out "/lib"))
               (mkdir-p (string-append out "/libexec"))))))))
    (synopsis "Library for utmp/wtmp session recording")
    (description "Privileged helper for terminal emulators.")
    (home-page "https://github.com/altlinux/libutempter")
    (license license:lgpl2.1+)))

(define-public guake
  (package
    (name "guake")
    (version "3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Guake/guake/archive/refs/tags/"
                                  version ".tar.gz"))
              (sha256
               (base32
                "11vgg5f170gqp2nskgcdh8v53ryd40502zy2330nb07m86604vws" ; 3.10
                ;; "0v3w3jqjwl355l4v9nch9w8r8cg84faws2sycdgp39y378pcn5ln" ;; latest commit
                ))))
    (build-system gnu-build-system)
    ;; (build-system python-build-system)
    (inputs
     `(
       ("python" ,python)
       ("libutempter" ,libutempter)
       ("libptytty", libptytty)
       ("keybinder" ,keybinder)
       ("python-pycairo" ,python-pycairo)
       ("python-pygobject" ,python-pygobject)
       ("python-dbus" ,python-dbus)
       ("gtk+" ,gtk+)
       ("glib" ,glib)
       ("gettext" ,gettext-minimal)
       ))
    (native-inputs
     `(
       ("pkg-config" ,pkg-config)
       ("intltool" ,intltool)
       ("glib:bin" ,glib "bin") ; For glib-compile-schemas
       ))
    (arguments
     `(#:tests? #f ; Tests may require a display or specific environment
       #:make-flags (list (string-append "PREFIX=" %output))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-paths
           (lambda* (#:key outputs #:allow-other-keys)
             ;; Substitute hardcoded paths
             (substitute* "src/guake/paths.py"
               (("/usr") (assoc-ref outputs "out")))))
         (delete 'configure) ; No configure script
         (add-after 'install 'compile-schemas
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (invoke "glib-compile-schemas"
                       (string-append out "/share/glib-2.0/schemas"))))))
       ))
    (synopsis "Drop-down terminal for GNOME")
    (description
     "Guake is a drop-down terminal for GNOME, inspired by the Quake game
 terminal.  It provides quick access to the command line with a simple keystroke.")
    (home-page "https://github.com/Guake/guake")
    (license license:gpl2+)))

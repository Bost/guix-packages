;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2015-2021, 2023-2026 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016 Mckinley Olsen <mck.olsen@gmail.com>
;;; Copyright © 2016, 2017, 2019 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2016 David Craven <david@craven.ch>
;;; Copyright © 2016-2017, 2019-2020, 2025 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2016, 2017 José Miguel Sánchez García <jmi2k@openmailbox.org>
;;; Copyright © 2017–2022 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017 Kei Kebreau <kkebreau@posteo.net>
;;; Copyright © 2017, 2018, 2019 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2017 Petter <petter@mykolab.ch>
;;; Copyright © 2018 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2018 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Gabriel Hondet <gabrielhondet@gmail.com>
;;; Copyright © 2019 Rutger Helling <rhelling@mykolab.com>
;;; Copyright © 2018, 2019, 2021 Eric Bavier <bavier@posteo.net>
;;; Copyright © 2019 Julien Lepiller <julien@lepiller.eu>
;;; Copyright © 2019, 2021 Pierre Langlois <pierre.langlois@gmx.com>
;;; Copyright © 2019, 2020 Brett Gilio <brettg@gnu.org>
;;; Copyright © 2020 Jakub Kądziołka <kuba@kadziolka.net>
;;; Copyright © 2020 Valentin Ignatev <valentignatev@gmail.com>
;;; Copyright © 2020 Michael Rohleder <mike@rohleder.de>
;;; Copyright © 2020, 2021 Marius Bakke <marius@gnu.org>
;;; Copyright © 2020, 2021 Nicolas Goaziou <mail@nicolasgoaziou.fr>
;;; Copyright © 2020 Leo Famulari <leo@famulari.name>
;;; Copyright © 2020 luhux <luhux@outlook.com>
;;; Copyright © 2021 Ekaitz Zarraga <ekaitz@elenq.tech>
;;; Copyright © 2021, 2022, 2024 Raphaël Mélotte <raphael.melotte@mind.be>
;;; Copyright © 2021 ikasero <ahmed@ikasero.com>
;;; Copyright © 2021 Brice Waegeneire <brice@waegenei.re>
;;; Copyright © 2021 Solene Rapenne <solene@perso.pw>
;;; Copyright © 2021 Petr Hodina <phodina@protonmail.com>
;;; Copyright © 2022 Felipe Balbi <balbi@kernel.org>
;;; Copyright © 2022 ( <paren@disroot.org>
;;; Copyright © 2022, 2023 jgart <jgart@dismail.de>
;;; Copyright © 2023 Aaron Covrig <aaron.covrig.us@ieee.org>
;;; Copyright © 2023 Foundation Devices, Inc. <hello@foundationdevices.com>
;;; Copyright © 2023, 2024 Zheng Junjie <873216071@qq.com>
;;; Copyright © 2023 Jaeme Sifat <jaeme@runbox.com>
;;; Copyright © 2024 Suhail <suhail@bayesians.ca>
;;; Copyright © 2024 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2024-2026 Ashish SHUKLA <ashish.is@lostca.se>
;;; Copyright © 2024 Ashvith Shetty <ashvithshetty10@gmail.com>
;;; Copyright © 2024, 2025-2026 Artyom V. Poptsov <poptsov.artyom@gmail.com>
;;; Copyright © 2025 Roman Scherer <roman@burningswell.com>
;;; Copyright © 2025 Liam Hupfer <liam@hpfr.net>
;;; Copyright © 2026 Janneke Nieuwenhuizen <janneke@gnu.org>
;;; Copyright © 2026 Nemin <bergengocia@protonmail.com>
;;; Copyright © 2026 Rostislav Svoboda <Rostislav.Svoboda@posteo.net>
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

(define-module (bost gnu packages terminals)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages dlang)
  #:use-module (gnu packages digest)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fcitx5)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages golang-compression)
  #:use-module (gnu packages golang-maths)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages man)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (srfi srfi-26))

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
    ;; Authentication-related tools such as passwd, su, and login.
    (inputs (list shadow))
    (arguments
     (list
      #:tests? #f                      ;no test suite
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "LIBDIR=" #$output "/lib")
              (string-append "LIBEXECDIR=" #$output "/libexec"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)           ;no configure script
          (add-after 'unpack 'chdir-to-source
            (lambda _ (chdir "libutempter")))
          (add-after 'chdir-to-source 'fix-hardcoded-paths
            (lambda _
              (substitute* "Makefile"
                (("/usr/lib") "$(LIBDIR)")
                (("/usr/include") "$(PREFIX)/include")
                (("/usr/share/man") "$(PREFIX)/share/man"))))
          (add-before 'build 'set-cc
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "CC" (search-input-file inputs "bin/gcc"))))
          (add-before 'install 'create-directories
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/lib"))
                (mkdir-p (string-append out "/include"))
                (mkdir-p (string-append out "/share/man/man3"))))))))
    (home-page "https://github.com/altlinux/libutempter")
    (synopsis "Library for utmp/wtmp session recording")
    (description
     "Libutempter is a privileged helper library that lets unprivileged
terminal emulators register and remove @file{utmp}/@file{wtmp} session
records, without needing to run as @code{root} or be installed setuid
themselves.")
    ;; See libutempter/COPYING in the source tree.
    (license license:lgpl2.1+)))

(define-public guake
  (package
    (name "guake")
    (version "3.10.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Guake/guake")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0kmd85ld77fhpdmmgpk4ppi6szv13s51j2g7bbljdv9pwcjxac2d"))))
    (build-system pyproject-build-system)
    ;; C/GObject-introspection libraries end up in the resulting binary.
    (inputs
     (list guile-3.0
           glib
           gtk+
           gdk-pixbuf
           gobject-introspection        ; for cairo-1.0.typelib
           harfbuzz
           at-spi2-core
           keybinder
           libnotify
           libutempter
           libwnck
           vte/gtk+-3
           pango))
    ;; Python packages added to the user's profile.
    (propagated-inputs
     (list python-dbus
           python-pycairo
           python-pygobject
           python-pyinotify
           python-pyyaml))
    (native-inputs
     (list
      ;; The order of glib and (list glib "bin") matters; reversed, the
      ;; "...-glib-bin" output gets picked instead of "...-glib".
      glib
      (list glib "bin")                 ; glib-compile-schemas
      python-setuptools
      python-wheel
      python-installer
      python-pypa-build
      python-setuptools-scm))
    (arguments
     (list
      #:tests? #f                       ; no test suite
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
                (for-each mkdir-p
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
                (for-each (cut install-file <> guake)
                          (list "guake/data/guake.glade"
                                "guake/data/about.glade"
                                "guake/data/prefs.glade"
                                "guake/data/search.glade"))
                (for-each (cut install-file <> pixmaps)
                          (find-files "guake/data/pixmaps" "\\.png$"))
                (install-file "guake/data/org.guake.gschema.xml" schemas))))
          ;; Compile schemas & do the standard GTK wrap.
          (add-after 'install-data-and-schemas 'glib-or-gtk-compile-schemas
            (assoc-ref glib:%standard-phases 'glib-or-gtk-compile-schemas))
          (add-after 'wrap 'glib-or-gtk-wrap
            (assoc-ref glib:%standard-phases 'glib-or-gtk-wrap))
          ;; Prepend all GI dirs and libs.
          (add-after 'glib-or-gtk-wrap 'wrap-gi
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (define lst-gi-dirs
                '(("at-spi2-core"          "/lib/girepository-1.0")
                  ("gdk-pixbuf"            "/lib/girepository-1.0")
                  ("glib"                  "/lib/girepository-1.0")
                  ("gobject-introspection" "/lib/girepository-1.0")
                  ("gtk+"                  "/lib/girepository-1.0")
                  ("harfbuzz"              "/lib/girepository-1.0")
                  ("keybinder"             "/lib/girepository-1.0")
                  ("libnotify"             "/lib/girepository-1.0")
                  ("libwnck"               "/lib/girepository-1.0")
                  ("pango"                 "/lib/girepository-1.0")
                  ("vte-with-gtk+3"        "/lib/girepository-1.0")))
              (define filter-dirs
                (compose
                 (cut filter (lambda (x) (and x (file-exists? x))) <>)
                 (cut map (cut apply
                               (lambda (key suffix)
                                 (let ((val (assoc-ref inputs key)))
                                   (and val (string-append val suffix))))
                               <>)
                      <>)))
              (let* ((out (assoc-ref outputs "out"))
                     (bindir (string-append out "/bin"))
                     ;; Absolute path to Guile for the shebang.
                     (guile-bin (or (search-input-file inputs "bin/guile")
                                    (error "Missing 'guile' in inputs")))
                     (gi-dirs  (filter-dirs lst-gi-dirs))
                     (lib-dirs (filter-dirs (append
                                             lst-gi-dirs
                                             '(("libutempter" "/lib"))))))
                ((compose
                  ;; Augment the existing wrapper (which is a shell script)
                  ;; by prepending a Guile stub that exports our vars.
                  (cut map
                       (cut wrap-script <>
                            #:guile guile-bin
                            `("GI_TYPELIB_PATH" ":" prefix ,gi-dirs)
                            `("LD_LIBRARY_PATH" ":" prefix ,lib-dirs)
                            ;; Ensure D-Bus sees $out/share/dbus-1/services.
                            `("XDG_DATA_DIRS"   ":"
                              prefix (,(string-append out "/share"))))
                       <>)
                  ;; Only wrap actual entry points, not dotfiles or *-real.
                  (cut filter file-exists? <>)
                  (cut map (cut string-append bindir <>) <>))
                 (list "/guake" "/guake-toggle"))))))))
    (home-page "https://github.com/Guake/guake")
    (synopsis "Drop-down terminal for GNOME")
    (description
     "Guake is a drop-down terminal for the GNOME desktop environment,
inspired by the terminals in first-person shooter games.  It slides down
from the top of the screen on a keypress (@kbd{F12} by default) and
retracts when dismissed.")
    (license license:gpl2+)))

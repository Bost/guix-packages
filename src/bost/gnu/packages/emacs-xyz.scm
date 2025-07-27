(define-module (bost gnu packages emacs-xyz)
  #:use-module (gnu packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix deprecation)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages chez)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fpga)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages golang-apps)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages idris)
  #:use-module (gnu packages java)
  #:use-module (gnu packages julia-xyz)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages music)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages racket)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages ruby-check)
  #:use-module (gnu packages ruby-xyz)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages scheme)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages animation)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages screen)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages tor)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages telegram)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wget)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  )

(define-public emacs-cursory
  (let ((commit "892c3b81037ece0e1753ab058e3cfda93f985693")
        (revision "0"))
    (package
      (name "emacs-cursory")
      (version (git-version "1.20" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/protesilaos/cursory.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256 (base32 "0dflm51avbmqgxp867yvrjxq1h1ag902f6b2ndykam97ggv788k7"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/protesilaos/cursory.git")
      (synopsis "Manage Emacs cursor styles using presets")
      (description
       "Define and switch between cursor style presets in graphical Emacs.  It wraps
built-in cursor-related variables, supporting presets like ‘block
slow-blinking’ or ‘bar fast-blinking’.  Users can set and persist their
preferred cursor style configurations with ease.")
      (license license:gpl3+))))

;; c -r 113082:113101 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-scss-mode
  (let ((commit "cf58dbec5394280503eb5502938f3b5445d1b53d")
        (revision "0"))
    (package
      (name "emacs-scss-mode")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/antonj/scss-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0raja19l0igwr0pn0ghr1pj1d8i9k3m3764ma4r8nwzxcj9qw4ja"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/antonj/scss-mode.git")
      (synopsis "Major mode for editing SCSS files in Emacs")
      (description
       "This package provides a major mode for editing SCSS (Sassy CSS) files
 in Emacs.  It includes syntax highlighting, indentation support, and
 integration with compilation commands, helping developers work more
 efficiently with SCSS code.  The mode is designed to make SCSS editing in
 Emacs convenient and productive.")
      (license license:gpl3+))))

;; bat -r 68039:68058 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-js-doc
  (let ((commit "f0606e89d5aa89146f96edb38cf69af0068a9d1e")
        (revision "0"))
    (package
      (name "emacs-js-doc")
      (version (git-version "0.0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mooz/js-doc.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ffayl6hca9zanbznh6rkql7fbr53id1lyrj2vllx8zakfac4dyv"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/mooz/js-doc.git")
      (synopsis "Generate JSDoc comments for JavaScript in Emacs")
      (description
       "This package provides tools to automatically generate JSDoc comments
 for JavaScript code in Emacs.  It helps streamline documentation by creating
 standardized comment templates based on function and variable definitions,
 allowing developers to maintain consistent and informative documentation in
 their code.")
      (license license:gpl3+))))

;; bat -r 98865:98884 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-pcache
  (let ((commit "507230d094cc4a5025fe09b62569ad60c71c4226")
        (revision "0"))
    (package
      (name "emacs-pcache")
      (version (git-version "0.5.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sigma/pcache")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fjdn4g9ww70f3x6vbzi3gqs9dsmqg16isajlqlflzw2716zf2nh"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/sigma/pcache")
      (synopsis "Persistent caching library for Emacs")
      (description
       "This package provides a persistent caching library for Emacs, enabling
 data to be stored and retrieved across Emacs sessions.  It supports storing
 arbitrary objects in a cache that persists on disk, improving performance for
 tasks that benefit from cached data.  The library is designed to be flexible
 and easily integrated into other Emacs packages.")
      (license license:gpl3+))))

(define-public emacs-powerline  ;; PR sent
  (let ((commit "c35c35bdf5ce2d992882c1f06f0f078058870d4a")
        (revision "0"))
    (package
      (name "emacs-powerline")
      (version (git-version "2.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/milkypostman/powerline")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0k1n5pg8v3ybkqxcipw80jqv94ka0dp63qxl0hvjwlxk16gxp8kb"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/milkypostman/powerline/")
      (synopsis "Mode-line plugin for Emacs")
      (description "Powerline is a utility plugin which allows you to create
a better-looking, more functional Emacs mode-line.  A collection of predefined
themes comes with the package.")
      (license license:gpl3+))))

(define-public emacs-spaceline
  (package
    (name "emacs-spaceline")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/TheBB/spaceline")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1q8r95zfrh0vxna5ml2pq9b9f66clfqcl4d2qy2aizkvzyxg6skl"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-powerline
      emacs-s
      ))
    (home-page "https://github.com/TheBB/spaceline")
    (synopsis "Powerline theme from Spacemacs")
    (description "Spaceline provides Spacemacs' mode-line theme.
This package provides features for three kinds of users.

@itemize
@item You just want to use the Spacemacs mode-line theme and forget about it.
@item You want to use something similar to the Spacemacs mode-line theme, but
with a handful of easy tweaks.
@item You want an easy-to-use library for building your own mode-line from
scratch, and you think the Spacemacs theme looks good.
@end itemize")
    (license license:gpl3+)))

(define-public emacs-spaceline-all-the-icons
  (package
    (name "emacs-spaceline-all-the-icons")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/domtronn/spaceline-all-the-icons.el")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "186v71d8n1iy73drayyf57pyzlz973q74mazkyvb8w3fj8bb3llm"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-all-the-icons
           emacs-memoize
           emacs-spaceline))
    (home-page "https://github.com/domtronn/spaceline-all-the-icons.el")
    (synopsis
     "Theme for @code{emacs-spaceline} using @code{emacs-all-the-icons}")
    (description
     "This package is a theme for @code{emacs-spaceline} that recreates most
of the segments available in that package using icons from
@code{emacs-all-the-icons}.  Icon fonts allow for more tailored and detailed
information in the mode line.")
    (license license:expat)))

(define-public emacs-logito
  (let ((commit "d5934ce10ba3a70d3fcfb94d742ce3b9136ce124")
        (revision "0"))
    (package
      (name "emacs-logito")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/sigma/logito.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bnkc6smvaq37q08q1wbrxw9mlcfbrax304fxw4fx7pc1587av0d"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/sigma/logito")
      (synopsis "Tiny logging framework for Emacs")
      (description "Tiny logging framework for Emacs.")
      (license license:gpl2+))))

(define-public emacs-system-packages
  (let ((commit "c087d2c6e598f85fc2760324dce20104ea442fa3")
        (revision "0"))
    (package
      (name "emacs-system-packages")
      (version (git-version "1.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/jabranham/system-packages.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00idwy8jzvkgs8qzafiy6s344rgms452n8mxbjg6yszwp3y3hmq1"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://gitlab.com/jabranham/system-packages")
      (synopsis "Manage system packages from within Emacs")
      (description
       "Manage installed system packages directly from Emacs.  It supports
 various package managers, including Guix, Nix, APT, and Homebrew.  Users can
install, update, and remove packages without leaving the editor.")
      (license license:gpl3+))))

;; bat -r 74119:74143 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-live-py-mode
  (let ((commit "fa2ea9a45738012d4a391e0a35809a655692b0fc")
        (revision "0"))
    (package
      (name "emacs-live-py-mode")
      (version (git-version "4.12" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/donkirkby/live-py-plugin.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03gk9nxjafgzgqrch159zf1r1575wf50pc5yjc9q4qmvcisyaf6j"))))
      (build-system emacs-build-system)
      (arguments
       '(#:include (cons* "^emacs-live-py-mode/live-py-mode.el$"
                          "^plugin/PySrc/[^/]+$"
                          %default-include)))
      (home-page "http://donkirkby.github.io/live-py-plugin/")
      (synopsis "Live Python coding with real-time visualization in Emacs")
      (description
       "Minor mode for Emacs that enables live coding in Python.  As you type,
 your code is continuously executed, and the results are displayed in
real-time, including variable states, exceptions, and graphical outputs like
matplotlib plots and turtle graphics.  This immediate feedback loop aids in
understanding and debugging code more efficiently.  The mode is particularly
beneficial for learning, teaching, and rapid prototyping in Python.")
      (license license:expat-0))))

;; bat -r 84174:84195 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-nerd-icons
  (let ((commit "1cb883d928ec046358d2b65db0bb898a1dfffd0a")
        (revision "0"))
    (package
      (name "emacs-nerd-icons")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rainstormstudio/nerd-icons.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0r3gv9z04asqjsnasjm2avk9gllqkng6ns14l0svrqxac4c2pp70"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons* "^data/" %default-include)))
      (home-page "https://github.com/rainstormstudio/nerd-icons.el")
      (synopsis "Nerd Font icon library for Emacs")
      (description
       "Library for integrating Nerd Font icons into Emacs.  It serves as an
 alternative to all-the-icons, offering compatibility with both GUI and
terminal environments.  The package includes functions to retrieve icons for
files, modes, and URLs, enhancing the visual experience in Emacs interfaces
such as Dired, Eshell, and modelines.")
      (license license:gpl3+))))

(define-public emacs-hide-comnt
  (package
    (name "emacs-hide-comnt")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.emacswiki.org/emacs/download/hide-comnt.el")
       (sha256
        (base32 "0v3wgl9r9w0qbvs1cxgl7am9hvpy6hyhvfbsjqix5n0zmdg68s4n"))))
    (build-system emacs-build-system)
    (home-page "https://www.emacswiki.org/emacs/download/hide-comnt.el")
    (synopsis "Hide or show comments in code buffers")
    (description
     "Commands to hide or show comments in the current buffer or active region.
  It allows toggling comment visibility to reduce visual clutter when editing
code.  The package also offers an option to hide whitespace preceding
comments.")
    (license license:gpl3+)))

(define-public emacs-info+
  (package
    (inherit emacs-info-plus)
    (name "emacs-info+")))

;; bat -r 81159:81181 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-molokai-theme
  (let ((commit "cc53e997e7eff93b58ad16a376a292c1dd66044b")
        (revision "0"))
    (package
      (name "emacs-molokai-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alloy-d/color-theme-molokai.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "109z13y6f54idzxk4incd4r0d3fr7wm7r8ifmd0s5hv1v1i93jc0"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:exclude #~(cons* "^color-theme-molokai.el$" %default-exclude)))
      (home-page "https://github.com/alloy-d/color-theme-molokai")
      (synopsis "Molokai color theme for Emacs")
      (description
       "Molokai color theme for Emacs, inspired by the popular Molokai theme
 from Vim.  It features a dark background with vibrant, contrasting colors,
 designed to reduce eye strain and improve code readability, especially during
 long coding sessions.  The theme is well-suited for developers who prefer a
 visually appealing and functional dark theme in their Emacs setup.")
      (license license:gpl3+))))

;; bat -r 50529:50550 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-gitignore-templates
  (let ((commit "d28cd1cec00242b688861648d36d086818b06099")
        (revision "0"))
    (package
      (name "emacs-gitignore-templates")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/xuchunyang/gitignore-templates.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x4pg4jpgmbvfw854ps9w3xgp8bgm7n7vmcvk3kp7h2s56l8s2xb"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/xuchunyang/gitignore-templates.el")
      (synopsis
       "Create .gitignore files in Emacs from GitHub or gitignore.io templates")
      (description
       "Generate .gitignore files by fetching templates from either GitHub's
gitignore repository or the gitignore.io API.  Users can insert templates
directly into the current buffer or create new .gitignore files based on
specified templates.  The package offers customization options to select the
preferred API source and supports proxy configurations for network access.")
      (license license:gpl3+))))

;; bat -r 23602:23623 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-define-word
  (let ((commit "31a8c67405afa99d0e25e7c86a4ee7ef84a808fe")
        (revision "0"))
    (package
      (name "emacs-define-word")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/abo-abo/define-word.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0h3dasg81f1b08xvz38nyd887pdlv60kj8q50kk2aqlpkr8j0y18"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/abo-abo/define-word")
      (synopsis "Display word definitions in Emacs using online dictionaries")
      (description
       "Commands to display the definition of the word or phrase at point
 within Emacs.  It retrieves definitions from online dictionary services and
presents them in a popup buffer, eliminating the need to switch to a web
browser.  Users can customize the backend service and keybindings to suit
their workflow.")
      (license license:gpl3+))))

;; bat -r 41925:41945 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-flx
  (let ((commit "4b1346eb9a8a76ee9c9dede69738c63ad97ac5b6")
        (revision "0"))
    (package
      (name "emacs-flx")
      (version (git-version "0.6.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/lewang/flx")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q49p1y3kpx140h0f97kfw4kfx8mlzzxbninbarvygmlg2fkfi1n"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/lewang/flx")
      (synopsis "Fuzzy matching for Emacs")
      (description
       "Flx provides fuzzy matching for emacs a la sublime text.
The sorting algorithm is a balance between word beginnings (abbreviation)
and contiguous matches (substring).  The longer the substring match,
the higher it scores. This maps well to how we think about matching.
Flx has support for ido (interactively do things) through flx-ido.")
      (license license:gpl3+))))

;; bat -r 41947:41968 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-flx-ido
  (let ((commit "4b1346eb9a8a76ee9c9dede69738c63ad97ac5b6")
        (revision "0"))
    (package
      (name "emacs-flx-ido")
      (version (git-version "0.6.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/lewang/flx.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q49p1y3kpx140h0f97kfw4kfx8mlzzxbninbarvygmlg2fkfi1n"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-flx
        ))
      (home-page "https://github.com/lewang/flx")
      (synopsis "Flx integration for ido")
      (description
       "Fuzzy matching for Emacs a la Sublime Text.  A more powerful
alternative to `ido-mode''s built-in flex matching.")
      (license license:gpl3+))))

;; bat -r 49221:49241 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-gh-md
  (let ((commit "e721fd5e41e682f47f2dd4ce26ef2ba28c7fa0b5")
        (revision "0"))
    (package
      (name "emacs-gh-md")
      (version (git-version "0.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-pe/gh-md.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xnfq6bbc5bgkd0mzkr7r66sd85qfn859swpsp6sr0xfl8cq12wm"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/emacs-pe/gh-md.el")
      (synopsis "Render Markdown using GitHub API in Emacs")
      (description
       "Functions to render Markdown content in Emacs using GitHub's Markdown
 API.  It offers commands to preview Markdown from a region or buffer,
displaying the rendered HTML within Emacs.  The package supports GitHub
Flavored Markdown (GFM) and allows exporting the rendered content to an HTML
file.")
      (license license:gpl3+))))

;; bat -r 34846:34866 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-erc-view-log
  (let ((commit "c5a25f0cbca84ed2e4f72068c02b66bd0ea3b266")
        (revision "0"))
    (package
      (name "emacs-erc-view-log")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Niluge-KiWi/erc-view-log.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bzi2sh2fhrz49j5y53h6jgf41av6rx78smb3bbk6m74is8vim2y"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/Niluge-KiWi/erc-view-log")
      (synopsis "Major mode for viewing ERC logs with syntax highlighting")
      (description
       "Major mode for viewing logs generated by ERC (Emacs IRC client).  It
applies syntax highlighting to nicknames, timestamps, and messages, enhancing
readability.  Users can customize nickname highlighting and integrate with
`auto-revert-tail-mode` for real-time log updates.  Note: This mode is
incompatible with `erc-fill-mode`.")
      (license license:gpl3+))))

;; bat -r 34802:34822 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-erc-tweet
  (let ((commit "91fed61e139fa788d66a7358f0d50acc896414b8")
        (revision "0"))
    (package
      (name "emacs-erc-tweet")
      (version (git-version "0.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kidd/erc-tweet.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "118q4zj9dh5xnimcsi229j5pflhcd8qz0p212kc4p9dmyrx2iw0n"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/kidd/erc-tweet.el")
      (synopsis "Display inline tweets in ERC buffers")
      (description
       "Enhance ERC (Emacs IRC client) by displaying tweet content directly
 within IRC buffers. When a Twitter URL is detected in the chat, the
corresponding tweet text is fetched and shown inline, providing immediate
context without the need to open external links. This feature improves the
chat experience by integrating external content seamlessly into the
conversation.")
      (license license:gpl3+))))

;; bat -r 54504:54523 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-haml-mode
  (let ((commit "a64d58df8f098f858c6c11fa1629a90969f9c7e8")
        (revision "0"))
    (package
      (name "emacs-haml-mode")
      (version (git-version "3.2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nex3/haml-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0d0b8xy8d6vd79y0vcjbgjgakn3nz5vdysw5m1ci2xz31agggf6f"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nex3/haml-mode")
      (synopsis "Major mode for editing Haml files in Emacs")
      (description
       "Emacs major mode for editing Haml files.  It offers syntax
highlighting and indentation support tailored to Haml's indentation-based
syntax.  Optional integration with Flycheck and Flymake enables real-time
syntax checking.  Additional syntax highlighting is available for embedded
`:javascript`, `:markdown`, and `:textile` blocks when corresponding modes are
installed.")
      (license license:expat)))) ; MIT

;; bat -r 14175:14196 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-clean-aindent-mode
  (let ((commit "a97bcae8f43a9ff64e95473e4ef0d8bafe829211")
        (revision "0"))
    (package
      (name "emacs-clean-aindent-mode")
      (version (git-version "1.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pmarinov/clean-aindent-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07dgx09j6nn5dl9vpqfcs5yqm79kza3h3r1lb7r09wpkmrg0c2cr"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/pmarinov/clean-aindent-mode")
      (synopsis "Minor mode for clean auto-indent and unindent in Emacs")
      (description
       "Minor mode for Emacs that enhances indentation behavior.  It offers an
auto-indent function that removes unused whitespace when pressing RET and an
unindent function (M-backspace) that aligns the cursor with the best
indentation candidate from previous lines.  A simple auto-indent mode is
available, which aligns lines based solely on the indentation of the line
above, disregarding language-specific rules.")
      (license license:gpl3+))))

(define-public emacs-kbd-mode
  (let ((commit "f8951b2efc5c29954b0105a9e57e973515125b0d")
        (revision "0"))
    (package
      (name "emacs-kbd-mode")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kmonad/kbd-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mzq240fz7z5m78qqlldvx3pw98kw9dg8a0zcip62gb1jd957b4g"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/kmonad/kbd-mode")
      (synopsis "Major mode for editing KMonad .kbd configuration files in Emacs")
      (description "Emacs major mode for editing KMonad `.kbd` configuration
files.  It offers syntax highlighting tailored to KMonad's Lisp-like
configuration language, facilitating easier reading and editing.
Additionally, it includes a demo mode that allows users to test configurations
within Emacs by starting and stopping KMonad processes directly from the
editor.")
      (license license:gpl3+))))

;; bat -r 67812:67833 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-journalctl-mode
  (let ((commit "631d10a5c8f466c94c38c3cd7410a27026f5f822")
        (revision "0"))
    (package
      (name "emacs-journalctl-mode")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/SebastianMeisel/journalctl-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1p3mgza73yls8f7v063jb49z0ylmvni4v812abqvvvrn5q396286"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/SebastianMeisel/journalctl-mode")
      (synopsis "Major mode for viewing journalctl logs in Emacs")
      (description
       "Emacs major mode for viewing systemd's journalctl output. It offers
features like syntax highlighting, chunked loading for performance,
keyword-based highlighting, and a follow mode to simulate 'tail -f'
functionality.  Users can customize log level appearances and define keywords
for different log severities.  The mode includes keybindings for navigating
through log chunks and integrates a transient interface for journalctl
command-line options.")
      (license license:gpl3+))))

;; bat -r 61724:61744 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-hungry-delete
  (let ((commit "d919e555e5c13a2edf4570f3ceec84f0ade71657")
        (revision "0"))
    (package
      (name "emacs-hungry-delete")
      (version (git-version "1.1.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/nflath/hungry-delete.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1hjihncj6q971zj1xfnfmyvx8wv19wdnglnmz1278fwsgrcs050d"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "http://github.com/nflath/hungry-delete")
      (synopsis "Minor mode for hungry deletion of whitespace in Emacs")
      (description
       "This package provides a minor mode for Emacs that enables hungry
 deletion, allowing the deletion of all contiguous whitespace characters with
 a single keystroke. It enhances editing efficiency by reducing the number of
 key presses needed to remove unwanted spaces.")
      (license license:gpl3+))))

;; bat -r 60220:60240 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-highlight-parentheses
  (let ((commit "965b18dd69eff4457e17c9e84b3cbfdbfca2ddfb")
        (revision "0"))
    (package
      (name "emacs-highlight-parentheses")
      (version (git-version "2.2.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://sr.ht/~tsdh/highlight-parentheses.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wvhr5gzaxhn9lk36mrw9h4qpdax5kpbhqj44745nvd75g9awpld"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://sr.ht/~tsdh/highlight-parentheses.el")
      (synopsis "Highlight surrounding parentheses in Emacs")
      (description
       "This package provides an Emacs minor mode that dynamically highlights
 the parentheses surrounding the point, based on nesting level. It uses
 configurable lists of colors and other properties to enhance code readability
 by visually indicating the scope of nested expressions.")
      (license license:gpl3+))))

;; bat -r 89142:89163 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-omtose-phellack-themes
  (let ((commit "b96905deb9b2bef097e0c573100874812c1e9aa8")
        (revision "0"))
    (package
      (name "emacs-omtose-phellack-themes")
      (version (git-version "20240928.1241" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/omtose-phellack-themes.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1kyg55njj19licj4wkp5ahabnbmpjfksv89l75axcib6hj3rgk5k"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/emacsorphanage/omtose-phellack-themes")
      (synopsis "Dark, soothing themes for Emacs with a cold bluish touch")
      (description
       "This package provides two dark themes for Emacs, 'omtose-darker' and
 'omtose-softer', both featuring a cold bluish aesthetic. Inspired by the
 'Omtose Phellack' realm from the Malazan Book of the Fallen series by Steven
 Erikson, these themes aim to offer a visually soothing coding environment.
 They require Emacs version 24.0 or higher and can be installed via MELPA.
 Users can switch between the darker and softer variants to suit their
 preferences.")
      (license license:gpl3+))))

;; bat -r 89347:89368 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-open-junk-file
  (let ((commit "558bec7372b0fed4c4cb6074ab906535fae615bd")
        (revision "0"))
    (package
      (name "emacs-open-junk-file")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rubikitch/open-junk-file.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0kcgkxn5v9bsbkcvpjxjqhj1w3c29bfb33bmiw32gzbfphmrvhh1"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/rubikitch/open-junk-file")
      (synopsis "Quickly open a new buffer for temporary notes in Emacs")
      (description
       "This package provides a command to open a new buffer with a unique
 name based on the current date and time, allowing users to quickly jot down
 temporary notes or test code snippets without disrupting their workflow. The
 buffers are saved in a designated directory, making it easy to review or
 manage them later.")
      (license license:gpl3+))))

;; bat -r 87152:87173 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-ob-elixir
  (let ((commit "8990a8178b2f7bd93504a9ab136622aab6e82e32")
        (revision "0"))
    (package
      (name "emacs-ob-elixir")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/zweifisch/ob-elixir")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "19awvfbjsnd5la14ad8cfd20pdwwlf3d2wxmz7kz6x6rf48x38za"))))
      (build-system emacs-build-system)
      (home-page "http://github.com/zweifisch/ob-elixir")
      (synopsis "Org-babel support for Elixir code blocks in Emacs")
      (description
       "This package enables the execution of Elixir code blocks within
 Org-mode documents using org-babel in Emacs. It allows users to write and
 evaluate Elixir code seamlessly alongside documentation, supporting
 interactive and reproducible workflows. The package also facilitates
 connections to remote Elixir shells, enhancing the integration between
 Org-mode and Elixir development.")
      (license license:gpl3+))))

;; bat -r 22060:22079 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-cython-mode
  (let ((commit "3e4790559d3168fe992cf2aa62f01423038cedb5")
        (revision "0"))
    (package
      (name "emacs-cython-mode")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cython/emacs-cython-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03kilbl9mp1hs7mpqb6vs6sbmhplpm4qg93sn1vhn34q710iccb0"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/cython/emacs-cython-mode")
      (synopsis "Major mode for editing Cython files in Emacs")
      (description
       "This package provides `cython-mode`, a major mode for Emacs tailored
 for editing Cython source files. It offers syntax highlighting, indentation
 support, and integration with Emacs' compilation framework, enhancing the
 development experience for Cython code.")
      (license license:asl2.0))))

;; bat -r 48473:48493 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-geben
  (let ((commit "1779492d73534e18fbcfdd7c6cc175859527d019")
        (revision "0"))
    (package
      (name "emacs-geben")
      (version (git-version "1.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ahungry/geben.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "161916kz125ah5msh8c02inmlr3rr858k6ywb18x27pnqx6n8lvg"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/ahungry/geben")
      (synopsis "DBGp protocol debugger integration for Emacs")
      (description
       "Geben is an Emacs package that interfaces with the DBGp protocol,
 enabling interactive debugging of scripts within Emacs. It supports multiple
 scripting languages through DBGp-compatible extensions, including PHP with
 Xdebug, and Perl, Python, Ruby, and Tcl with Komodo Debugger Extensions. Key
 features include setting and managing breakpoints, stepping through code,
 evaluating expressions, inspecting variables, and viewing backtraces, all
 within the Emacs environment.")
      (license license:gpl3+))))

;; bat -r 103243:103264 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-prettier-js
  (let ((commit "e9b73e81d3e1642aec682195f127a42dfb0b5774")
        (revision "0"))
    (package
      (name "emacs-prettier-js")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/prettier/prettier-emacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0hj4fv3fgc60i6jrsx4a81s5c9fsxxafhhs3q2q1dypsscjci9ph"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/prettier/prettier-emacs")
      (synopsis "Emacs minor mode for formatting code with Prettier")
      (description
       "This package provides an Emacs minor mode that formats code using
 Prettier, an opinionated code formatter supporting multiple languages. It
 enables automatic code formatting on file save, ensuring consistent code
 style across JavaScript, TypeScript, JSON, CSS, and other supported
 languages. The package allows customization of Prettier's command-line
 arguments and integrates seamlessly with popular Emacs modes like `js2-mode`
 and `web-mode`. For optimal performance, ensure that the Prettier executable
 is installed and accessible in your system's PATH.")
      (license license:gpl3+))))

(define-public emacs-sqlite3
  (package
    (inherit emacs-sqlite3-api)
    (name "emacs-sqlite3")))

(define-public emacs-systemd
  (package
    (inherit emacs-systemd-mode)
    (name "emacs-systemd")))

;; bat -r 83083:83102 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-mvn
  (let ((commit "223723d9ceeb2878b884e83abb8ca74ad2e42081")
        (revision "0"))
    (package
      (name "emacs-mvn")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/apgwoz/mvn-el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1sl7kfg5w73cw9mv4x1m497dg27h42zgx2ywl4s8fmx2k9f2pq1q"))))
      (build-system emacs-build-system)
      ;; contains (defvar mvn-command "mvn")
      (home-page "https://github.com/apgwoz/mvn-el")
      (synopsis "Emacs integration for Apache Maven build automation")
      (description
       "This package provides Emacs helpers for interacting with Apache Maven,
 facilitating build automation within the editor.  It allows users to execute
 Maven commands directly from Emacs, such as compile, clean, and test, and
 integrates with Emacs' compilation mode for streamlined development
 workflows.  The package supports customization for non-standard Maven setups
 and offers functions for running specific Maven goals.")
      (license license:gpl3+))))

;; bat -r 99016:99036 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-pcsv
  (let ((commit "aa421d12c0da0adb9bc74a050a591dcbabf934ae")
        (revision "0"))
    (package
      (name "emacs-pcsv")
      (version (git-version "1.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mhayashi1120/Emacs-pcsv.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "15pwxzr8k98k82p9ni49hh84fh4mrcdcd7nx7xgv3lpm5nj0ix9z"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/mhayashi1120/Emacs-pcsv")
      (synopsis "RFC 4180-compliant CSV parser for Emacs")
      (description
       "This package provides a CSV parser for Emacs that adheres to RFC 4180
 standards.  It offers functions to parse CSV data from buffers, files, and
 regions, facilitating the handling of CSV content within Emacs.  For large
 CSV files, it includes a lazy parser to efficiently process data without
 excessive memory usage.")
      (license license:gpl3+))))

;; bat -r 117444:117465 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-smeargle
  (let ((commit "afe34e7e3ce811d44880bca11f9fe1e3d91e272f")
        (revision "0"))
    (package
      (name "emacs-smeargle")
      (version (git-version "0.03" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/smeargle.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1yy2lqvn67dr6jhbyqv3zd93rmpw7bggklb1hbhp8spagflvj6li"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/emacsorphanage/smeargle")
      (synopsis "Highlighting regions in Emacs based on version control history")
      (description
       "This package provides an Emacs minor mode that highlights regions of a
 buffer based on version control history.  It visually indicates lines
 modified since the last commit, helping users quickly identify recent
 changes.  The mode supports various version control systems and offers
 customizable highlighting styles.")
      (license license:gpl3+))))

;; bat -r 136224:136244 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-yapfify
  (let ((commit "c9347e3b1dec5fc8d34883e206fcdc8500d22368")
        (revision "0"))
    (package
      (name "emacs-yapfify")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/JorisE/yapfify.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0gkz4f0yfpfchh78v1c0plbjafag23y18gcg8a8rc5s21nqqhkj4"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/JorisE/yapfify")
      (synopsis "Emacs minor mode for formatting Python code with YAPF")
      (description
       "This package provides an Emacs minor mode, `yapf-mode`, which formats
 Python code using YAPF. It can be configured to automatically format buffers
 before saving, ensuring consistent code style. Unlike similar tools, `yapfify`
 operates directly on the original file, respecting project-specific YAPF
 configurations.")
      (license license:gpl3+))))

;; bat -r 133178:133198 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-wfnames
  (let ((commit "164e4efa2a96bed201a0a5402e137ebeef15bcc6")
        (revision "0"))
    (package
      (name "emacs-wfnames")
      (version (git-version "1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/thierryvolpiatto/wfnames.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bv0jky553kyvp8g2fhglnq5af6nqassswmjxlr8vz3ahyy06l3y"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/thierryvolpiatto/wfnames")
      (synopsis "Edit multiple filenames directly within Emacs buffers")
      (description
       "Edit multiple filenames directly within an Emacs buffer. It supports
 editing lists of absolute file paths, enabling modifications to both
filenames and their directory components. Changes are highlighted, and file
completion is provided to streamline the renaming process. This tool is
particularly useful for batch renaming files across various directories
without leaving the Emacs environment.")
      (license license:gpl3+))))

;; bat -r 63823:63843 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-indent-guide
  (let ((commit "d388c3387781a370ca13233ff445d03f3c5cf12f")
        (revision "0"))
    (package
      (name "emacs-indent-guide")
      (version (git-version "2.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/zk-phi/indent-guide.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0r303mzxj57l8rclzsmvhnx2p3lhf2k4zvn8a6145wb10jvcwfxi"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/zk-phi/indent-guide")
      (synopsis "Show vertical lines to guide indentation in Emacs")
      (description
       "This package provides a minor mode for Emacs that displays vertical
 lines to visually guide indentation levels.  It enhances code readability by
 indicating indentation depth, making it easier to understand code structure.
  The mode is customizable, allowing users to adjust the appearance of the
 guide lines to fit their preferences.")
      (license license:gpl3+))))

;; bat -r 64818:64838 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-insert-shebang
  (let ((commit "cc8cea997a8523bce9f303de993af3a73eb0d2e2")
        (revision "0"))
    (package
      (name "emacs-insert-shebang")
      (version (git-version "0.9.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/psachin/insert-shebang.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wvcdv2lfv68r3zyfzr9yahm3gvc60yzk8zi39l70vsgzh4yfq91"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page
       "https://gitlab.com/psachin/insert-shebang.git")
      (synopsis "Automatic shebang line insertion for Emacs")
      (description
       "This package provides an Emacs extension that automatically inserts
 shebang lines into scripts based on their file types.  It supports various
 scripting languages and can be customized to recognize additional file types
 or headers.  The extension streamlines script creation by ensuring the
 correct interpreter is specified, enhancing workflow efficiency.")
      (license license:gpl3+))))

;; bat -r 63823:63843 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-indent-guide
  (let ((commit "d388c3387781a370ca13233ff445d03f3c5cf12f")
        (revision "0"))
    (package
      (name "emacs-indent-guide")
      (version (git-version "2.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/zk-phi/indent-guide.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0r303mzxj57l8rclzsmvhnx2p3lhf2k4zvn8a6145wb10jvcwfxi"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/zk-phi/indent-guide")
      (synopsis "Show vertical lines to guide indentation in Emacs")
      (description
       "This package provides a minor mode for Emacs that displays vertical
 lines to visually guide indentation levels.  It enhances code readability by
 indicating indentation depth, making it easier to understand code structure.
  The mode is customizable, allowing users to adjust the appearance of the
 guide lines to fit their preferences.")
      (license license:gpl3+))))

;; bat -r 131490:131511 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-vline ;; PR sent https://issues.guix.gnu.org/78044
  (let ((commit "f5d7b5743dceca75b81c8c95287cd5b0341debf9")
        (revision "0"))
    (package
      (name "emacs-vline")
      (version (git-version "1.11" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/buzztaiki/vline.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "06qqpjaxsacslxb3f2bm790lwygbq6387n9ccn4v9vz9xlyn9dmi"))))
      (build-system emacs-build-system)
      (home-page "https://www.emacswiki.org/emacs/VlineMode")
      (synopsis "Column highlighting (vertical line displaying) mode")
      (description
       "Emacs minor mode for highlighting column at cursor position.  It
 enhances text editing by visually indicating the vertical line.")
      (license license:gpl3+))))

(define-public emacs-lv
  (package
    (inherit emacs-hydra)
    (name "emacs-lv")))
;; bat -r 135318:135350 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-xhair ;; PR sent https://issues.guix.gnu.org/issue/78045
  (let ((commit "c7bd7c501c3545aa99dadac386c882fe7c5edd9c")
        (revision "0"))
    (package
      (name "emacs-xhair")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Boruch-Baum/emacs-xhair.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03m15lbspk73x59wvb77wgvnkrmrlq4w6kmnrr2i69jgafqh0421"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-vline
        ))
      (home-page "https://github.com/Boruch-Baum/emacs-xhair")
      (synopsis "Highlight the current line and column")
      (description
       "Simultaneously apply `vline-mode and `hl-line-mode', with tweaks,to
 present POINT in highlighted cross-hairs, reporting the value of POINT as a
message in the echo area.  This will remain in effect until toggled
manually (function `xhair-mode by default), or until the next
keypress (function `xhair by default), or for a set interval (function
`xhair-flash by default).")
      (license license:gpl3+))))

;; bat -r 5586:5607 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-auto-dictionary
  (let ((commit "b364e08009fe0062cf0927d8a0582fad5a12b8e7")
        (revision "0"))
    (package
      (name "emacs-auto-dictionary")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nschum/auto-dictionary-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0rfjx0x2an28821shgb4v5djza4kwn5nnrsl2cvh3px4wrvw3izp"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/nschum/auto-dictionary-mode.git")
      (synopsis "Automatic dictionary switcher for Emacs")
      (description
       "This package provides an automatic dictionary switcher for Emacs.  It
 detects the language of the text being edited and automatically selects the
 appropriate dictionary for spell-checking.  This is especially useful for
 multilingual users who frequently switch between languages, ensuring that the
 correct dictionary is always in use.")
      (license license:gpl3+))))

;; bat -r 100343:100364 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-php-runtime
  (let ((commit "37beef404c70d7b80dc085b1ee1e13fd9c375fe6")
        (revision "0"))
    (package
      (name "emacs-php-runtime")
      (version (git-version "0.3.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/php-runtime.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1sd65nhbcxr5r935z1ik3skz73kkpyr4r259nahn5gjvvww3if20"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/emacs-php/php-runtime.el")
      (synopsis "Evaluate PHP code from Emacs using php-runtime.el")
      (description
       "Functions to evaluate PHP code directly from Emacs.  It enables
 executing PHP expressions and scripts, retrieving results, and interacting
with PHP's standard input.  Users can specify the PHP executable path and
construct PHP expressions programmatically, facilitating seamless integration
between Emacs and PHP.")
      (license license:gpl3+))))

;; bat -r 128301:128325 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-ucs-utils
  (let ((commit "91b9e0207fff5883383fd39c45ad5522e9b90e65")
        (revision "0"))
    (package
      (name "emacs-ucs-utils")
      (version (git-version "0.9.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rolandwalker/ucs-utils.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "18yqzy8w4icp60z25ckbrx6wradm3m26vic35kmzr88msc0qdsva"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/rolandwalker/ucs-utils")
      (synopsis "Utilities for Unicode characters in Emacs")
      (description
       "Utilities for manipulating Unicode characters, with integrated ability
 to return fallback characters when Unicode display is not possible.")
      (license license:gpl3+))))

;; bat -r 99599:99622 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-persistent-soft
  (let ((commit "a1e0ddf2a12a6f18cab565dee250f070384cbe02")
        (revision "0"))
    (package
      (name "emacs-persistent-soft")
      (version (git-version "0.8.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rolandwalker/persistent-soft.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "14p20br8vzxs39d4hswzrrkgwql5nnmn5j17cpbabzjvck42rixc"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/rolandwalker/persistent-soft")
      (synopsis "Persistent storage for Emacs, returning nil on failure")
      (description "Wrapper around pcache.el, providing \"soft\" fetch and
 store routines which never throw an error, but instead return nil on failure.")
      (license license:gpl3+))))

;; bat -r 82671:82693 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-multi-line
  (let ((commit "06ea7294c4e4ace0c3253b7952a6d937a169eb55")
        (revision "0"))
    (package
      (name "emacs-multi-line")
      (version (git-version "0.1.5" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/colonelpanic8/multi-line")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32 "0iby3h9ypmnd35f9mvs53cghlpl9jjj97z5p191y99k3w4dzp4z1"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
        (list
         emacs-shut-up
         (@(bost gnu packages emacs-build) emacs-dash)
         emacs-s
         ))
      (home-page "https://github.com/colonelpanic8/multi-line")
      (synopsis
       "Emacs package for splitting single-line statements into multiple lines")
      (description
       "This package provides functionality for splitting single-line
 statements into multiple lines in Emacs, improving code readability and
 organization.  It is especially useful for languages with long expressions or
 complex statements, allowing users to easily format code for better clarity.")
      (license license:gpl3+))))

;; bat -r 53684:53705 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-groovy-imports
  (let ((commit "a60c3202973e3185091db623d960f71840a22205")
        (revision "0"))
    (package
      (name "emacs-groovy-imports")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mbezjak/emacs-groovy-imports.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1bsmf64ycmfnsb0r0nyaky1h3x2fpr4qyck3ihw16pa6d7spaw8c"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-pcache
        emacs-s
        ))
      (home-page "https://github.com/mbezjak/emacs-groovy-imports.git")
      (synopsis "Automatic import management for Groovy in Emacs")
      (description
       "This package provides automatic import management for Groovy files in
 Emacs.  It enables users to add and manage import statements based on the
 classes used in the code, streamlining the development process for Groovy
 projects.  The package helps keep imports organized and reduces the need for
 manual import adjustments.")
      (license license:gpl3+))))

(define-public emacs-spacemacs-base
  (let ((commit "6751dae7ab8785f90edea585160926bad5e3e2ff")
        (revision "0"))
    (package
      (name "emacs-spacemacs-base")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/spacemacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "054zsdfyfqg00wh0k5hj2cxnq9njjghsy8ji4fl5j3qwwv6y0cba"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include
        #~(cons*
           "^layers/\\+lang/python/local/pylookup/pylookup\\.py$"
           "^layers/\\+lang/c-c\\+\\+/global_conf\\.py$"
           "^layers/\\+lang/python/local/pylookup/pylookup\\.el$"
           %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-exec-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((python (search-input-file inputs "bin/python")))
                  (substitute* "layers/+lang/python/local/pylookup/pylookup.py"
                    (("/usr/bin/env python") python))
                  (substitute* "layers/+lang/c-c++/global_conf.py"
                    (("/usr/bin/env python") python))))))))
      (propagated-inputs
       (list
        python-wrapper
        ))
      (home-page "http://spacemacs.org/")
      (synopsis
       "Community-driven Emacs distribution - The best editor is neither Emacs
 nor Vim, it's Emacs *and* Vim!")
      (description
       "Spacemacs is a new way of experiencing Emacs - it's a sophisticated
 and polished set-up, focused on ergonomics, mnemonics and consistency.")
      (license license:gpl3+))))

(define all-info-include (quote (list "^.*\\.info$")))

(define-public emacs-rst-lists
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-lists")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+lang/restructuredtext/local/rst-lists"
                      "rst-lists\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-versions
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-versions")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-versions\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-load-paths
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-load-paths")
    (arguments
     (list
      #:tests? #f
      #:include #~(cons* "^core/.*" %default-include)
      #:phases
      #~(modify-phases %standard-phases
          ;; ;; Move the source files to the top level, which is included in
          ;; ;; the EMACSLOADPATH.
          ;; (add-after 'unpack 'move-source-files
          ;;   (lambda _
          ;;     (let ((el-files
          ;;            (find-files
          ;;             "core"
          ;;             "core-load-paths\\.el$")))
          ;;       (for-each (lambda (f) (rename-file f (basename f)))
          ;;                 el-files))))
          ;; ;; TODO check user-emacs-directory
          ;; (add-after 'move-source-files 'fix-user-emacs-directory
          ;;   (lambda _
          ;;     (substitute* "core-load-paths.el"
          ;;       (("user-emacs-directory") "\"./\""))))

          ;; (add-after 'unpacs 'fix-user-emacs-directory
          ;;   (lambda _
          ;;     (substitute* "core/core-load-paths.el"
          ;;       (("user-emacs-directory") "\"./\""))))
          )))
    (propagated-inputs
     (list
      emacs-spacemacs-theme
      ;; emacs-core-spacemacs-buffer
      ;; emacs-core-progress-bar
      ;; emacs-core-funcs
      ;; emacs-core-dotspacemacs
      ;; emacs-spacemacs-ht
      ;; python-wrapper
      ))
    ))

(define-public emacs-spacemacs-ht
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-ht")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs/forks"
                      "spacemacs-ht\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-dotspacemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-dotspacemacs")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-dotspacemacs\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-core-load-paths
      ;; emacs-core-spacemacs-buffer
      ;; emacs-core-progress-bar
      ;; emacs-core-funcs
      ;; emacs-core-dotspacemacs
      ;; emacs-spacemacs-ht
      python-wrapper
      ))))

(define-public emacs-core-spacemacs-buffer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacemacs-buffer")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-spacemacs-buffer\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list emacs-core-dotspacemacs))))

(define-public emacs-core-use-package-ext
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-use-package-ext")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-use-package-ext\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-fonts-support
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-fonts-support")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-fonts-support\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-command-line
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-command-line")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-command-line\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-transient-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-transient-state")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-transient-state\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-early-funcs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-early-funcs")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-early-funcs\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-documentation
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-documentation")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-documentation\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-compilation
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-compilation")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-compilation\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-env
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-env")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-env\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-hooks
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-hooks")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-hooks\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-display-init
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-display-init")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-display-init\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-zemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-zemacs")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/aprilfool"
                      "zemacs\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://www.emacswiki.org/emacs/download/irfc.el
(define-public emacs-irfc
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-irfc")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+misc/ietf/local/irfc"
                      "irfc\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/melpa/package-build
(define-public emacs-package-build
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-build")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "package-build\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-spacebind
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacebind")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-spacebind\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-package-build-badges
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-build-badges")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "package-build-badges\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-custom-settings
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-custom-settings")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-custom-settings\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/creichert/ido-vertical-mode.el
(define-public emacs-ido-vertical-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ido-vertical-mode")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "ido-vertical-mode\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-configuration-layer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-configuration-layer")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-configuration-layer\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-core-load-paths
      emacs-core-spacemacs-buffer
      emacs-core-progress-bar
      emacs-core-funcs
      emacs-core-dotspacemacs
      emacs-spacemacs-ht
      ))))

(define-public emacs-core-customization
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-customization")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-customization\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list emacs-validate))))

(define-public emacs-spacemacs-common
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-common")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs/spacemacs-theme"
                      "spacemacs-common\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/nashamri/spacemacs-theme
(define-public emacs-spacemacs-theme
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-theme")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs/spacemacs-theme"
                      "spacemacs-theme\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; (define-public emacs-page-break-lines
;;   (package
;;     (inherit emacs-spacemacs-base)
;;     (name "emacs-page-break-lines")
;;     (arguments
;;      (list
;;       #:tests? #f
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           ;; Move the source files to the top level, which is included in
;;           ;; the EMACSLOADPATH.
;;           (add-after 'unpack 'move-source-files
;;             (lambda _
;;               (let ((el-files
;;                      (find-files
;;                       "core/libs"
;;                       "page-break-lines\\.el$"
;;                       )))
;;                 (for-each (lambda (f) (rename-file f (basename f)))
;;                           el-files)))))))))

(define-public emacs-page-break-lines
  (let ((commit "982571749c8fe2b5e2997dd043003a1b9fe87b38")
        (revision "0"))
    (package
      (name "emacs-page-break-lines")
      (version (git-version "0.15" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/page-break-lines.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0d74j7mqgzbwj00sirz3wa37f5yv0y48lgp2v20k61lq54sxk75g"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/purcell/page-break-lines")
      (synopsis "Display page breaks as tidy horizontal lines")
      (description
       "This library provides a global mode which displays form feed characters
as horizontal rules.")
      (license license:gpl3+))))

(define-public emacs-package-recipe-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-recipe-mode")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "package-recipe-mode\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/TeMPOraL/nyan-mode/
(define-public emacs-nyan-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-nyan-mode")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+themes/colors/local/nyan-mode"
                      "nyan-mode\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-erc-yank
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-yank")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+chat/erc/local/erc-yank"
                      "erc-yank\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-debug
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-debug")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-debug\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-load-env-vars
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-load-env-vars")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs/forks"
                      "load-env-vars\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-themes-support
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-themes-support")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-themes-support\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/sigma/mocker.el
(define-public emacs-mocker
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-mocker")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "mocker\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-release-management
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-release-management")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-release-management\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-compleseus-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-compleseus-spacemacs-help")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+completion/compleseus/local/compleseus-spacemacs-help"
                      "compleseus-spacemacs-help\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-consult
      emacs-core-configuration-layer
      ))))

(define-public emacs-erc-tex
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-tex")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+chat/erc/local/erc-tex"
                      "erc-tex\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-keybindings
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-keybindings")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-keybindings\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-erc-sasl
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-erc-sasl")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+chat/erc/local/erc-sasl"
                      "erc-sasl\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-dumper
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-dumper")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-dumper\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-cycle
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-cycle")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-cycle\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

;; Upstream uses https://github.com/larstvei/ox-gfm
(define-public emacs-ox-gfm
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ox-gfm")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+emacs/org/local/ox-gfm"
                      "ox-gfm\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-jump
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-jump")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-jump\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-package-recipe
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-package-recipe")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "package-recipe\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-helm-spacemacs-faq
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-spacemacs-faq")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+completion/helm/local/helm-spacemacs-help"
                      "helm-spacemacs-faq\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-quelpa
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-quelpa")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core/libs"
                      "quelpa\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files))))
          ;; TODO check user-emacs-directory
          (add-after 'move-source-files 'fix-user-emacs-directory
            (lambda _
              (substitute* "quelpa.el"
                (("user-emacs-directory") "\"./\"")))))))))

(define-public emacs-helm-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-spacemacs-help")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+completion/helm/local/helm-spacemacs-help"
                      "helm-spacemacs-help\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-ivy-spacemacs-help
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-ivy-spacemacs-help")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+completion/ivy/local/ivy-spacemacs-help"
                      "ivy-spacemacs-help\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-funcs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-funcs")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-funcs\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files))))
          ;; TODO check user-emacs-directory
          (add-after 'move-source-files 'fix-user-emacs-directory
            (lambda _
              (substitute* "core-funcs.el"
                (("user-emacs-directory") "\"./\"")))))))))

(define-public emacs-tmux
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-tmux")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+tools/tmux/local/tmux"
                      "tmux\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-progress-bar
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-progress-bar")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-progress-bar\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-micro-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-micro-state")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-micro-state\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-toggle
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-toggle")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-toggle\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-emacs-backports
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-emacs-backports")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-emacs-backports\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-spacemacs-purpose-popwin
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-purpose-popwin")
    (propagated-inputs
     (list emacs-window-purpose))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-purpose/local/spacemacs-purpose-popwin"
                      "spacemacs-purpose-popwin\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-spacemacs-whitespace-cleanup
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-whitespace-cleanup")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-editing/local/spacemacs-whitespace-cleanup"
                      "spacemacs-whitespace-cleanup\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-help-fns-plus
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-help-fns-plus")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-defaults/local/help-fns+"
                      "help-fns+\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-helm-games
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-helm-games")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+fun/games/local/helm-games"
                      "helm-games\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-hybrid-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-hybrid-mode")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+distributions/spacemacs-bootstrap/local/hybrid-mode"
                      "hybrid-mode\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files))
              (substitute* "hybrid-mode.el"
                ((";;; Code:")
                 ;; The following doesn't work. The macro must be autoloaded
                 ;; ";;; Code:\n(require 'core-funcs)"
                 (string-append
                  ";;; Code:\n\n"
                  ";;;###autoload\n"
                  "(defmacro spacemacs|dotspacemacs-backward-compatibility (variable default)
  \"Return `if' sexp for backward compatibility with old dotspacemacs
  values.\"
  `(if (boundp ',variable) ,variable ',default))"))))))))
    (propagated-inputs
     (list
      ;; emacs-core-funcs ;; Doesn't work - see above
      emacs-evil
      ))))

(define-public emacs-vim-colors
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-vim-colors")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-modeline/local/vim-powerline"
                      "vim-colors\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-space-doc
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-space-doc")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-org/local/space-doc"
                      "space-doc\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-rst-sphinx
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-sphinx")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+tools/sphinx/local/rst-sphinx"
                      "rst-sphinx\\.el$"
                      )))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-vim-powerline
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-vim-powerline")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-modeline/local/vim-powerline"
                      "vim-powerline-theme\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-vim-colors))))

(define-public emacs-evil-unimpaired
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-evil-unimpaired")
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      ))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+spacemacs/spacemacs-evil/local/evil-unimpaired"
                      "evil-unimpaired\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-pylookup
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-pylookup")
    (arguments
     (list
      #:tests? #f
      #:include
      #~(cons*
         "^layers/\\+lang/python/local/pylookup/pylookup\\.el$"
         "^layers/\\+lang/python/local/pylookup/pylookup\\.py$"
         %default-include)
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'specify-python-location
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((python3 (search-input-file inputs "/bin/python3")))
                (substitute* '("layers/+lang/python/local/pylookup/pylookup.py")
                  (("/usr/bin/env python3?") python3)))))
          (replace 'expand-load-path
            (lambda args
              (with-directory-excursion
                  "layers/+lang/python/local/pylookup"
                (apply (assoc-ref %standard-phases 'expand-load-path) args))))
          (replace 'make-autoloads
            (lambda args
              (with-directory-excursion
                  "layers/+lang/python/local/pylookup"
                (apply (assoc-ref %standard-phases 'make-autoloads) args))))
          (replace 'install
            (lambda args
              (with-directory-excursion
                  "layers/+lang/python/local/pylookup"
                (apply (assoc-ref %standard-phases 'install) args))))
          (replace 'build
            (lambda args
              (with-directory-excursion
                  "layers/+lang/python/local/pylookup"
                (apply (assoc-ref %standard-phases 'build) args)))))))
    ;; (propagated-inputs
    ;;  (list
    ;;   emacs-browse-url ;; missing
    ;;   emacs-simple     ;; missing
    ;;   ))
    (native-inputs
     (list
      python-wrapper
      ))))

;; bat -r 34665:34685 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-erc-image
  (let ((commit "883084f0801d46a5ccf183e51ae9a734755bbb97")
        (revision "4"))
    (package
      (name "emacs-erc-image")
      (version (git-version "0.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kidd/erc-image.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "081c8pjmpwnmqah7dbpkj20bk7ln57g4n7c1zxzdlsz80pxnfay4"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            ;; The package autoloader fails to provide the image module when
            ;; handled by Guix. Don't autoload the (eval-after-load 'erc ...),
            ;; and let the package handle the `eval-after-load' procedure.
            (add-before 'make-autoloads 'patch-autoloads
              (lambda _
                (lambda _
                  (substitute* "erc-image.el"
                    ((";;;###autoload")
                     ";; do not autoload this ;;;###autoload"))))))))
      (home-page "https://github.com/kidd/erc-image.el")
      (synopsis "Show inlined images (png/jpg/gif/svg) in ERC buffers")
      (description "This plugin subscribes to hooks @code{erc-insert-modify-hook}
and @code{erc-send-modify-hook} to download and show images.")
      (license license:gpl3+))))

(define-public emacs-evil-evilified-state
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-evil-evilified-state")
    (propagated-inputs
     (list
      emacs-evil
      emacs-bind-map))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+distributions/spacemacs-bootstrap/local/evil-evilified-state"
                      "evil-evilified-state\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-spacemacs-xclipboard
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-spacemacs-xclipboard")
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+tools/xclipboard/local/spacemacs-xclipboard"
                      "spacemacs-xclipboard\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-theme-changer
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-theme-changer")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+tools/geolocation/extensions/theme-changer"
                      "theme-changer\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-holy-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-holy-mode")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+distributions/spacemacs-bootstrap/local/holy-mode"
                      "holy-mode\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-jr-mode
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-jr-mode")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+lang/jr/local/jr-mode"
                      "jr-mode\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-rst-directives
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-rst-directives")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "layers/+lang/restructuredtext/local/rst-directives"
                      "rst-directives\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))))

(define-public emacs-core-spacemacs
  (package
    (inherit emacs-spacemacs-base)
    (name "emacs-core-spacemacs")
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the source files to the top level, which is included in
          ;; the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files
                     (find-files
                      "core"
                      "core-spacemacs\\.el$")))
                (for-each (lambda (f) (rename-file f (basename f)))
                          el-files)))))))
    (propagated-inputs
     (list
      emacs-core-versions
      emacs-core-versions
      emacs-core-load-paths
      emacs-core-emacs-backports
      emacs-core-env
      emacs-page-break-lines
      emacs-core-hooks
      emacs-core-debug
      emacs-core-command-line
      emacs-core-configuration-layer
      emacs-core-dotspacemacs
      emacs-core-custom-settings
      emacs-core-release-management
      emacs-core-jump
      emacs-core-display-init
      emacs-core-themes-support
      emacs-core-fonts-support
      emacs-core-spacemacs-buffer
      emacs-core-keybindings
      emacs-core-toggle
      emacs-core-early-funcs
      emacs-core-cycle
      emacs-core-funcs
      emacs-core-micro-state
      emacs-core-transient-state
      emacs-core-use-package-ext
      emacs-core-spacebind
      emacs-core-compilation
      emacs-core-dumper
      ))))

#|
The license was identified as 'bsd-2' by ChatGPT using following prompt:

Have a look at the BSD License definitions 'bsd-0', 'bsd-1', 'bsd-2',
'bsd-3', 'bsd-4', in the 'guix/guix/licenses.scm' from the source code of the
GNU Guix project identify the definition to which the text bellow
corresponds. The solution MUST be one of the aforementioned 'bsd-0', 'bsd-1',
'bsd-2', 'bsd-3', 'bsd-4'.

----------------------------

Text between the lines 98 - 129:
https://github.com/rolandwalker/font-utils/blob/abc572eb0dc30a26584c0058c3fe6c7273a10003/font-utils.el#L98-L129
|#
;; bat -r 46683:46706 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-font-utils
  (let ((commit "abc572eb0dc30a26584c0058c3fe6c7273a10003")
        (revision "0"))
    (package
      (name "emacs-font-utils")
      (version (git-version "0.7.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/rolandwalker/font-utils.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0hx3k2zx2kdavivr1b957jq7kcwk301yzw77aprxzbs7jz73a35x"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-persistent-soft
        ))
      (home-page "http://github.com/rolandwalker/font-utils")
      (synopsis "Utility functions for working with fonts in Emacs")
      (description
       "Font-utils is a collection of functions for working with fonts.  This library
has no user-level interface, it is only useful for programming in Emacs Lisp.")
      (license license:bsd-2))))

;; bat -r 128853:128879 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-unicode-fonts
  (let ((commit "6245b97d8ddaeaf1de4dbe2cd85ca0f3b20ef81b")
        (revision "0"))
    (package
      (name "emacs-unicode-fonts")
      (version (git-version "0.4.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rolandwalker/unicode-fonts.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ckcvy10sz4qvjy1bqrpvaijw92q2da4b6bxbgxaxvrw5d0ih81f"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-ucs-utils
        ;; the guix-dev channel lists also the following 4 inputs:
        ;; emacs-font-utils
        ;; emacs-list-utils
        ;; emacs-persistent-soft
        ;; emacs-pcache
        ))
      (home-page "https://github.com/rolandwalker/unicode-fonts")
      (synopsis "Configure Unicode fonts for Emacs")
      (description
       "Mappings for 233 of the 255 blocks in the Unicode 8.0 standard which
 are public and have displayable characters.")
      (license license:gpl3+))))

(define-public emacs-use-package
  ;; XXX: Upstream did not tag latest release.  Using commit matching exact
  ;; version bump.
  (let ((commit "a6e856418d2ebd053b34e0ab2fda328abeba731c")
        (revision "0"))
    (package
      (name "emacs-use-package")
      (version (git-version "2.4.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jwiegley/use-package.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0g1smk27ry391gk8bb8q3i42s0p520zwhxfnxvzv5cjj93mcpd8f"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; #:tests? #t
        #:test-command #~(list "emacs" "--batch"
                               "-l" "use-package-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'install 'install-manual
              (lambda _
                (let ((info-dir (string-append #$output "/share/info")))
                  (install-file "use-package.info" info-dir))))
            (add-before 'install-manual 'build-manual
              (lambda _
                (invoke "make" "info" "use-package.texi")))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; The commented packages out are part of the Emacs
                ;; (bst:write-pkg-file "use-package-bind-key")
                ;; (bst:write-pkg-file "use-package-core")
                ;; (bst:write-pkg-file "use-package-delight")
                ;; (bst:write-pkg-file "use-package-diminish")
                ;; (bst:write-pkg-file "use-package-ensure-system-package")
                ;; (bst:write-pkg-file "use-package-ensure")
                ;; (bst:write-pkg-file "use-package-jump")
                ;; (bst:write-pkg-file "use-package-lint")
                ;; (bst:write-pkg-file "use-package")
                (bst:write-pkg-file "bind-chord")
                (bst:write-pkg-file "bind-key")
                (bst:write-pkg-file "use-package-chords")
                )))))
      (native-inputs
       (list
        texinfo
        ))
      (propagated-inputs
       (list
        emacs-diminish
        ))
      (home-page "https://github.com/jwiegley/use-package")
      (synopsis "Declaration for simplifying your .emacs")
      (description "The use-package macro allows you to isolate package
configuration in your @file{.emacs} file in a way that is both
performance-oriented and tidy.")
      (license license:gpl2+))))

;; (bst:write-pkg-file "bind-chord") doesn't help
(define-public emacs-bind-chord
  (package
    (inherit emacs-use-package)
    (name "emacs-bind-chord")))

(define-public emacs-key-chord
  (package
    (name "emacs-key-chord")
    (version "0.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/emacsorphanage/key-chord")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1lr5vgkcn13vq0lhyxl4lvwqnmvyf3kk5fs705qrv56l2hl4k2rm"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #f
      #:modules '((guix build emacs-build-system)
                  (guix build utils)
                  (guix build emacs-utils)
                  ((bost guix build emacs-utils) #:prefix bst:))
      #:imported-modules `(,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils)
                           (bost guix build emacs-utils))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'ensure-package-description 'add-needed-pkg-descriptions
            (lambda* (#:key outputs #:allow-other-keys)
              (bst:write-pkg-file "key-chord")
              )))))
    (home-page "https://www.emacswiki.org/emacs/key-chord.el")
    (synopsis "Map pairs of simultaneously pressed keys to Emacs commands")
    (description "@code{emacs-key-chord} provides @code{key-chord-mode}, a
mode for binding key chords to commands.  A key chord is defined as two keys
pressed simultaneously or a single key quickly pressed twice.")
    (license license:gpl2+)))

;; (bst:write-pkg-file "use-package-chords") doesn't help
(define-public emacs-use-package-chords
  (package
    (inherit emacs-use-package)
    (name "emacs-use-package-chords")))

;; TODO compare emacs-use-package-chords with:
;; bat -r 129644:129667 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
;; (define-public emacs-use-package-chords
;;   (package
;;     (name "emacs-use-package-chords")
;;     (version "20250330.1852")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/waymondo/use-package-chords.git")
;;              (commit
;;               "0793b50e2bf1ec8bfc532b10baeef716c5aa947a")))
;;        (sha256
;;         (base32
;;          "0dkiic5yrdmjkyrahm10ggx0scp4ixqbb184i55f6fpf8yvy6nd8"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list
;;       emacs-bind-chord
;;       emacs-key-chord
;;       ))
;;     (arguments '(#:files ("use-package-chords.el")))
;;     (home-page
;;      "https://github.com/jwiegley/use-package")
;;     (synopsis "Key-chord keyword for use-package")
;;     (description
;;      "Documentation at https://melpa.org/#/use-package-chords")
;;     (license #f)))

;; bat -r 12662:12693 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-chatgpt-shell ;; PR sent
  (let ((commit "3c8d95d9a550d2fb278bdf32e8446fed1974af03")
        (revision "0"))
    (package
      (name "emacs-chatgpt-shell")
      (version (git-version "2.18.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/xenodium/chatgpt-shell.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fdav9jj06nav696xlqq4shmqshchsxyankmbllz6hlsjyxgfwvm"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            ;; (add-after 'unpack 'disable-save-variables
            ;;   (lambda _
            ;; ;;; Override chatgpt-shell--save-variables chatgpt-shell--load-variables to
            ;; ;;; prevent writing to ~/.emacs.d
            ;; ;;; TODO try (locate-user-emacs-file "chatgpt-shell") however this may not be
            ;; ;;; needed after all.
            ;;     (substitute* "chatgpt-shell.el"
            ;;       (("\\(provide 'chatgpt-shell\\)")
            ;;        (string-append
            ;;         "(defun chatgpt-shell--save-variables () nil)"
            ;;         "(defun chatgpt-shell--load-variables () nil)"
            ;;         "(provide 'chatgpt-shell)")))))

            ;; (add-before 'build 'inspect-environment-before-build
            ;;   (lambda* (#:key inputs #:allow-other-keys)
            ;;     (let* (
            ;;            (h                  "/homeless-shelter")
            ;;            (d (string-append h "/.emacs.d"))
            ;;            (f (string-append d "/.chatgpt-shell.el")))
            ;;       (format #t "### ~a exists?   ~a\n" h (access? h F_OK))
            ;;       (format #t "### ~a writable? ~a\n" h (access? h W_OK))
            ;;       (format #t "### ~a exists?   ~a\n" d (access? d F_OK))
            ;;       (format #t "### ~a writable? ~a\n" d (access? d W_OK))
            ;;       (format #t "### ~a exists?   ~a\n" f (access? f F_OK))
            ;;       (format #t "### ~a writable? ~a\n" f (access? f W_OK)))
            ;;     (substitute* "chatgpt-shell.el"
            ;;       #;(("user-emacs-directory") ".")
            ;;       (("user-emacs-directory") "\"./\""))
            ;;     ))

            ;; This phase prevents build phase failure.
            (add-before 'build 'generate-empty-config-file
              ;; (lambda _
              ;;   (call-with-output-file
              ;;       (string-append
              ;;        "~/.emacs.d.distros/spguimacs/" ;; user-emacs-directory
              ;;        ".chatgpt-shell.el")
              ;;     (lambda (port)
              ;;       (display "nil" port))))
              (lambda _
                (setenv "HOME" (getcwd))
                (mkdir-p ".emacs.d")
                (call-with-output-file ".emacs.d/.chatgpt-shell.el"
                  (lambda (port)
                    (display "nil" port))))))))
      (propagated-inputs
       (list
        emacs-shell-maker
        ))
      (home-page "https://github.com/xenodium/chatgpt-shell")
      (synopsis "ChatGPT and DALL-E Emacs shells and Org Babel libraries")
      (description
       "Chatgpt Shell is a Comint-based ChatGPT shell for Emacs.")
      (license license:gpl3+))))

;; bat -r 77928:77951 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-markdown-toc
  (let ((commit "1b0c5ae7f306f60b909390cad009b76660dd5acd")
        (revision "0"))
    (package
      (name "emacs-markdown-toc")
      (version (git-version "0.1.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ardumont/markdown-toc.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03z4yayf2wvpbig8s4z07pz4hy83vsf4pbq4gn56yz64qxv03jh5"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-markdown-mode
        emacs-s
        ))
      (home-page "https://github.com/ardumont/markdown-toc")
      (synopsis "Generate a table of contents for Markdown files in Emacs")
      (description
       "This package provides a tool to generate and update a table of
 contents (TOC) for Markdown files within Emacs.  It automatically creates TOC
 entries based on the headers in the document and updates them as the file
 changes.  This simplifies navigation and organization in large Markdown
 documents.")
      (license license:gpl3+))))

;; bat -r 100390:100418 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-phpactor
  (let ((commit "037187f9e204d3ed17017e7fb54236c005725fb7")
        (revision "0"))
    (package
      (name "emacs-phpactor")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/phpactor.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vz9ckpkbqcf30aca7swizc1nx2jaghmyr4b1s64cncwr8z4jg5h"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-async
        emacs-composer
        emacs-php-runtime
        ))
      (home-page "https://github.com/emacs-php/phpactor.el")
      (synopsis "Emacs interface to Phpactor for PHP code introspection and refactoring")
      (description
       "Emacs interface to Phpactor, an intelligent code-completion and
 refactoring tool for PHP.  It enables features such as class navigation,
 method extraction, variable renaming, and code generation through Phpactor's
 RPC protocol.  Note: This package is in alpha stage and may be superseded by
 LSP-based alternatives.")
      (license license:gpl3+))))

(define-public emacs-company-phpactor
  (package
    (inherit emacs-phpactor)
    (name "emacs-company-phpactor")))

;; bat -r 123218:123240 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-tblui
  (let ((commit "62ab5f62982c061a902fd3e54d94a68a4706572c")
        (revision "0"))
    (package
      (name "emacs-tblui")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Yuki-Inoue/tblui.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fq0dsvh9a8h7n4d4cj7sn73nzbg5chqjby9pzpbs5grx4kf0zi6"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-magit-popup
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-tablist
        ))
      (home-page "https://github.com/Yuki-Inoue/tblui.el")
      (synopsis "Emacs library for building table-based user interfaces")
      (description
       "This package provides a library for building table-based user
 interfaces in Emacs.  It allows users to create and manipulate tables within
 Emacs buffers, offering an easy way to organize and display data in a
 structured format.  The package is designed to be flexible and integrates
 well with other Emacs features, making it a useful tool for developers and
 users who need to present tabular data in their workflows.")
      (license license:gpl3+))))

(define-public emacs-openai
  (let ((commit "91115cd20781b2db9febadadc4ae89c35a9a6df5")
        (revision "0"))
    (package
      (name "emacs-openai")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/openai.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0146abvgygs787x75jlqhgp0qz77jw0mjn3n7y7zsarxrb2c5hqh"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-tblui
        emacs-request
        emacs-let-alist
        ))
      (home-page
       "https://github.com/emacs-openai/openai")
      (synopsis "Emacs client for OpenAI API interaction")
      (description
       "This package provides an Emacs client for interacting with the OpenAI
 API, allowing users to send requests and receive responses directly within
 the Emacs environment.  It supports a range of OpenAI services, including
 text completion, code generation, and more, enabling seamless integration of
 AI-powered tools into various Emacs workflows.")
      (license license:gpl3+))))

(define-public emacs-ht
  (let ((commit "1c49aad1c820c86f7ee35bf9fff8429502f60fef")
        (revision "0"))
    (package
      (name "emacs-ht")
      (version (git-version "2.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/Wilfred/ht.el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1vyk81xav1ghdb39fqi99yf6yvzsh6p007v7yhzk1bbqqffkvqdj"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "ht")
                )))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (home-page "https://github.com/Wilfred/ht.el")
      (synopsis "Hash table library for Emacs")
      (description
       "This package simplifies the use of hash tables in elisp.  It also
provides functions to convert hash tables from and to alists and plists.")
      (license license:gpl3+))))

;; bat -r 12662:12693 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-chatgpt
  (let ((commit "05957238635b1b9087ca3486761f9e3f534cea37")
        (revision "1"))
    (package
      (name "emacs-chatgpt")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/chatgpt.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "19ccm7f870dlvsbk5pg3r0sx4v2xwp7pd94n9i3cx6zwphvl7l23"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-lv
        emacs-ht
        emacs-let-alist
        emacs-markdown-mode
        emacs-spinner
        emacs-openai
        ))
      (home-page "https://github.com/emacs-openai/chatgpt")
      (synopsis "Emacs client for interacting with ChatGPT")
      (description
       "This package provides an Emacs client for interacting with ChatGPT,
 allowing users to send prompts and receive AI-generated responses directly
 within Emacs.  It supports maintaining conversations, integrating AI-driven
 assistance into various text-based workflows, and enhancing productivity by
 making AI tools easily accessible in the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-pythonic
  (let ((commit "9eff417654c1fc3eca367c357b5b2cddb3fd8ce4")
        (revision "1"))
    (package
      (name "emacs-pythonic")
      (version (git-version "0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pythonic-emacs/pythonic")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00rkab305iwbn61jspcbxhvbwryf91ly7jz1axa2fzdkfqaj6727"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ; missing tests
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-s
        emacs-tramp
        ))
      (home-page "https://github.com/pythonic-emacs/pythonic")
      (synopsis "Utility functions for writing Pythonic in Emacs")
      (description
       "The Pythonic Emacs package provides function for convenient running
Python on different platforms on local and remote hosts including Docker
containers and Vagrant virtual machines.  To use Pythonic with Docker you need
to install Docker Tramp Emacs package.")
      (license license:gpl3+))))

;; bat -r 105754:105775 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-pyenv-mode
  (let ((commit "ba1a8c7bd7d03c006f8411c856990c083c814c9c")
        (revision "0"))
    (package
      (name "emacs-pyenv-mode")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/proofit404/pyenv-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0yzz0fhbcknlf7ms9f00151iwz31avniaaa6793gxhqdkzd9i5wc"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      ;; contains (executable-find "pyenv")
      (propagated-inputs
       (list
        emacs-pythonic
        ))
      (home-page "https://github.com/proofit404/pyenv-mode")
      (synopsis "Integrate pyenv with Emacs python-mode")
      (description
       "This package integrates pyenv with Emacs' python-mode, allowing
 seamless switching between different Python versions and virtual environments
 within Emacs. It sets the `PYENV_VERSION` environment variable and
 `python-shell-virtualenv-path` based on user input, enabling packages that
 utilize python.el to support pyenv virtual environments out-of-the-box. This
 integration enhances the Python development workflow by providing flexibility
 in managing Python versions directly from the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-groovy-modes
  (package
    (name "emacs-groovy-modes")
    (version "2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Groovy-Emacs-Modes\
/groovy-emacs-modes")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1jpfyqnqd8nj0g8xbiw4ar2qzxx3pvhwibr6hdzhyy9mmc4yzdgk"))))
    (build-system emacs-build-system)
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      emacs-shut-up
      (@(bost gnu packages emacs-build) emacs-f)
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      ))
    (home-page "https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes")
    (synopsis "Groovy related modes for Emacs")
    (description "This package provides @code{groovy-mode} for syntax
highlighting in Groovy source files, REPL integration with run-groovy and
Grails project navigation with the grails mode.")
    (license license:gpl3+)))

(define-public emacs-groovy-mode
  (package
    (inherit emacs-groovy-modes)
    (name "emacs-groovy-mode")))

;; bat -r 106096:106117 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-pytest
  (let ((commit "8692f965bf4ddf3d755cf1fbf77a7a768e22460e")
        (revision "0"))
    (package
      (name "emacs-pytest")
      (version (git-version "0.2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ionrock/pytest-el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "13s3zqxjlas4rq70gxgl8nrhasrx8j8ml9xls7lgghk12ppiqil9"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        ))
      (home-page "https://github.com/ionrock/pytest-el")
      (synopsis "Emacs integration for running pytest on Python code")
      (description
       "Set of functions to run pytest on Python code within Emacs. It allows
executing tests on specific functions, classes,modules, or entire suites
directly from the editor. Users can configure the test runner executable,
integrate with project-specific virtual environments,and define custom
keybindings for test operations, enhancing the Python development workflow in
Emacs.")
      (license license:gpl3+))))

;; bat -r 63632:63655 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-impatient-mode
  (let ((commit "a4e4e12852840996b027cb8e9fb2b809c37a0ee3")
        (revision "0"))
    (package
      (name "emacs-impatient-mode")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/skeeto/impatient-mode.git")
               (commit commit)))
         (sha256
          (base32
           "1cwascc08pzmvgjf0z5fh3w3jf85rgk13haz085qbdkhxsbivav2"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-simple-httpd
        emacs-htmlize
        ))
      (home-page "https://github.com/netguy204/imp.el")
      (synopsis "Live preview of Emacs buffers in a web browser")
      (description
       "Enables real-time preview of Emacs buffers in a web browser.  It
 utilizes an internal HTTP server to serve buffer contents,allowing users to
see changes as they type.  Designed primarily for HTML editing, it can be
extended to support other formats like Markdown by customizing the content
filter.  Note: Activating this mode exposes the buffer's directory over HTTP,
which may have security implications.")
      (license license:gpl3))))

;; bat -r 63730:63754 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-importmagic
  (let ((commit "570fb4f519d5e84dd681f932447cb995e8460840")
        (revision "0"))
    (package
      (name "emacs-importmagic")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/anachronic/importmagic.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xrlnighvzgmfb4fwnp07bnj1wyym1pn4ap62swq0h0mcq8gjr80"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-epc
        ))
      (home-page "https://github.com/anachronic/importmagic.el")
      (synopsis "Suggest and insert missing Python imports in Emacs buffers")
      (description
       "Emacs interface to the Python importmagic library.  It analyzes Python
 buffers to identify unresolved symbols and suggests appropriate import
statements.  Users can automatically insert missing imports, customize import
formatting styles, and configure the Python interpreter path.  The package
requires the `importmagic` and `epc` Python packages to be installed in the
active environment.")
      (license license:gpl3+))))

;; bat -r 78404:78426 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-maven-test-mode
  (let ((commit "a19151861df2ad8ae4880a2e7c86ddf848cb569a")
        (revision "0"))
    (package
      (name "emacs-maven-test-mode")
      (version (git-version "0.1.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/rranelli/maven-test-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xn2yyr8mr90cynbxgv0h5v180pzf0ydnjr9spg34mrdicqlki6c"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-s
        ))
      (home-page "http://github.com/rranelli/maven-test-mode")
      (synopsis "Minor mode for running Maven tests in Emacs")
      (description
       "Emacs minor mode that enhances `java-mode` by integrating Maven test
 tasks. It offers keybindings to toggle between test and implementation files,
run tests at various scopes (method, class, project), and re-run the last test
command.  Inspired by `rspec-mode`, it streamlines the testing workflow for
Java projects using Maven.")
      (license license:gpl3+))))

;; bat -r 100949:100970 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-pipenv
  (let ((commit "3af159749824c03f59176aff7f66ddd6a5785a10")
        (revision "0"))
    (package
      (name "emacs-pipenv")
      (version (git-version "0.0.1-beta" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pwalsh/pipenv.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ak9dvjqhdm12i7yamgbqjmc4zmvy2f0gd1nia1q9dy3n6576ryq"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-pyvenv
        emacs-s
        ))
      (home-page "https://github.com/pwalsh/pipenv.el")
      (synopsis "Emacs integration for Pipenv-based Python workflows")
      (description
       "Pipenv integration into Emacs. It provides commands to manage virtual
environments and dependencies directly from the editor.  It offers a minor
mode with keybindings for common Pipenv operations, seamless integration with
Projectile and Flycheck, and functions to activate or deactivate environments
using pyvenv.  The package also includes an Emacs-native implementation of
`pipenv open`, allowing users to open modules within Emacs.")
      (license license:gpl3+))))

;; bat -r 101877:101897 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-poetry
  (let ((commit "1dff0d4a51ea8aff5f6ce97b154ea799902639ad")
        (revision "0"))
    (package
      (name "emacs-poetry")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cybniv/poetry.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0n5v6c75pal2xd8p453jrd046zkv0y1pzgn5w2n2ws1009pw6crs"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pyvenv
        ))
      (home-page "https://github.com/cybniv/poetry.el")
      (synopsis "Emacs interface for Python dependency management with Poetry")
      (description
       "Emacs interface to Poetry, a Python dependency management and
 packaging tool.  It offers a transient-based UI for common tasks such as
adding dependencies, building packages, and running scripts.  Additionally, it
includes a global minor mode to automatically activate the appropriate virtual
environment when visiting project files.")
      (license license:gpl3+))))

;; bat -r 109979:110001 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-reveal-in-folder
  (let ((commit "cfa667ad1ef488e68c30f67e280985f205629dc3")
        (revision "0"))
    (package
      (name "emacs-reveal-in-folder")
      (version (git-version "0.1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jcs-elpa/reveal-in-folder.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1wmszjc54bvsgrcfci606z0qb4jrdjd51myqkc91wf21vmi8g1rw"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-s
        ))
      (home-page "https://github.com/jcs-elpa/reveal-in-folder")
      (synopsis "Reveal current file or directory in system file manager from Emacs")
      (description
       "Provides commands to reveal the current file or directory in the
 system's file manager directly from Emacs.  It supports various contexts,
including the current buffer, point location, and default directory.  Unlike
platform-specific alternatives, it aims to offer cross-platform compatibility,
enhancing navigation between Emacs and the operating system's file explorer.")
      (license license:gpl3+))))

;; bat -r 112243:112264 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-sass-mode
  (let ((commit "247a0d4b509f10b28e4687cd8763492bca03599b")
        (revision "0"))
    (package
      (name "emacs-sass-mode")
      (version (git-version "3.0.16" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nex3/sass-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1nhk12lhvkwdk8s8fx33p6rssi0gcfx2zkanq23rz6k28v5zi5yp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-haml-mode
        ))
      (home-page "https://github.com/nex3/sass-mode")
      (synopsis "Major mode for editing Sass files in Emacs")
      (description
       "Major mode for editing Sass files in Emacs.  It offers syntax
 highlighting for selectors, variables, and directives, as well as indentation
support tailored to Sass's indentation-based syntax.  The mode is derived from
`haml-mode` and requires it as a dependency.  Users can customize indentation
levels and other settings to fit their preferences.")
      (license license:expat)))) ; MIT

;; bat -r 114781:114802 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-shfmt
  (let ((commit "78a96e66d2685672de3d0b7d627cd57a3b0caaf2")
        (revision "0"))
    (package
      (name "emacs-shfmt")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/emacs-shfmt.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x96q2ag85859mzfqjq4gy7s2h883nwc99nw4l4r9cfw7hpplwxb"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-reformatter
        ))
      (home-page "https://github.com/purcell/emacs-shfmt")
      (synopsis "Emacs integration for formatting shell scripts using shfmt")
      (description
       "Emacs commands and a minor mode for formatting shell script source code
 using the external `shfmt` program.  Users can format entire buffers or
selected regions, and enable automatic formatting on save in `sh-mode`
buffers.  The `shfmt-command` variable allows customization of the formatter's
invocation.")
      (license license:gpl3+))))

;; bat -r 120658:120679 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-string-edit-at-point
  (let ((commit "87936d816ae24184dd83688136531b6b6f1943fe")
        (revision "0"))
    (package
      (name "emacs-string-edit-at-point")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magnars/string-edit.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ggn7l3bisjx1ab4jrhija3z3bh6zbafhzjl5cq92n7i2plz8qdm"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/magnars/string-edit.el")
      (synopsis "Edit string literals in a separate buffer with unescaped content")
      (description
       "Command to edit string literals in Emacs by opening their unescaped
 content in a temporary buffer.  After editing, the content is re-escaped and
inserted back into the original string.  It is particularly useful for editing
embedded HTML or JavaScript templates within code.")
      (license license:gpl3+))))

;; bat -r 96170:96192 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-overseer
  (let ((commit "7fdcf1a6fba6b1569a09c1666b4e51bcde266ed9")
        (revision "0"))
    (package
      (name "emacs-overseer")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tonini/overseer.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1f0nm253n0k2rcx0zydj8c4nn5gmvhabzraajxdqycb2ak77nbif"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-pkg-info
        (@(bost gnu packages emacs-build) emacs-f)
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/tonini/overseer.el")
      (synopsis "Integrate ert-runner with Emacs for running ERT tests")
      (description
       "Integrate the ert-runner test framework into Emacs, allowing users to
 run ERT tests directly from the editor.  It provides a minor mode with
keybindings for executing tests at point, in the current buffer, or across the
project.  The package leverages Cask for managing dependencies and supports
interactive commands for various test operations.")
      (license license:gpl3+))))

;; bat -r 33957:33986 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-emr
  (let ((commit "cac1b52932926f56d7f6d2923732d20bbd20670d")
        (revision "0"))
    (package
      (name "emacs-emr")
      (version (git-version "0.4.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Wilfred/emacs-refactor.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "06rmknnhzcm3fy1iipvryl85fcshpalz50500rrz8k3vkl2dps2i"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-popup
        emacs-s
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-list-utils
        emacs-iedit
        ))
      (home-page "https://github.com/Wilfred/emacs-refactor")
      (synopsis "Framework for language-specific code refactoring in Emacs")
      (description
       "Emacs Refactor framework offering language-specific refactoring
commands. It supports various programming languages, including Emacs Lisp,
JavaScript, Ruby, and Scheme, enabling context-sensitive refactoring
operations such as extracting functions or variables, inlining code, and
tidying imports.")
      (license license:gpl3+))))

;; bat -r 34913:34934 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-erc-yt
  (let ((commit "43e7d49325b17a3217a6ffb4a9daf75c5ff4e6f8")
        (revision "0"))
    (package
      (name "emacs-erc-yt")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yhvh/erc-yt.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dlw34kaslyvnsrahf4rm76r2b7qqqn589i4mmhr23prl8xbz9z9"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/yhvh/erc-yt")
      (synopsis "Display inline YouTube previews in ERC buffers")
      (description
       "Enhances Emacs' ERC (IRC client) by displaying inline clickable YouTube
thumbnails, titles, and descriptions when YouTube links are shared in chat.
It uses the YouTube Data API v3 to fetch video metadata and supports
customization of thumbnail click behavior, image caching, and description
length.")
      (license license:gpl3+))))

;; bat -r 32008:32030 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-elisp-def
  (let ((commit "1ad4baccbf3d0d13e7607d332ae6bc60a5dd7360")
        (revision "0"))
    (package
      (name "emacs-elisp-def")
      (version (git-version "1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Wilfred/elisp-def.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0k1r4fyai53p7y5vqwqjxdiqlnmrrxqaxglc22j54kdic8j1lbl7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-s
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/Wilfred/elisp-def")
      (synopsis "Enhanced Emacs Lisp symbol definition navigation")
      (description
       "Enhance navigation for Emacs Lisp development by accurately locating
definitions of functions, variables, and macros.  It supports global and local
bindings, handles macro-generated code, and distinguishes between function and
variable namespaces.  Additionally, it integrates with various Emacs modes to
improve the developer experience.")
      (license license:gpl3+))))

;; bat -r 22261:22282 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-dall-e
  (let ((commit "24b1315b57d8e9329f5af1c9d7f8be9e8a6f932e")
        (revision "0"))
    (package
      (name "emacs-dall-e")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/dall-e.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03b9r8am5i4rkf3hqvnqzslbh1636vidlsmqkzyqk73a5hhvhqnd"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-lv
        emacs-openai
        emacs-reveal-in-folder
        emacs-async
        emacs-ht
        emacs-spinner
        ))
      (home-page "https://github.com/emacs-openai/dall-e")
      (synopsis "Generate images from text prompts using DALL·E in Emacs")
      (description
       "Emacs interface to OpenAI's DALL·E API, enabling users to generate
 images from text prompts directly within the editor.  It supports
customization options such as the number of images, image size, and display
width.  Generated images are cached locally and displayed in a dedicated
buffer.  An OpenAI API key is required for usage.")
      (license license:gpl3+))))

;; (define-public emacs-concurrent
;;   (let ((commit "2239671d94b38d92e9b28d4e12fd79814cfb9c16")
;;         (revision "0"))
;;     (package
;;       (name "emacs-concurrent")
;;       (version (git-version "0.5.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/kiwanami/emacs-deferred")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32 "0vz59lm7pfz0gbsgrb44y555js85wbdjn0zm6p8wfqjiqf63ds3i"))))
;;       (build-system emacs-build-system)
;;       (propagated-inputs
;;        (list
;;         emacs-deferred
;;         ))
;;       (home-page "https://github.com/kiwanami/emacs-deferred")
;;       (synopsis "")
;;       (description "")
;;       (license license:gpl3+))))

;; bat -r 17763:17786 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-company-shell
  (let ((commit "5f959a63a6e66eb0cbdac3168cad523a62cc2ccd")
        (revision "0"))
    (package
      (name "emacs-company-shell")
      (version (git-version "1.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/company-shell.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lrkvfg0z9gwfcj90yihanysg8icxpbqq3wqyb734bi5fpmgmzr4"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-company
        ))
      (home-page "https://github.com/Alexander-Miller/company-shell")
      (synopsis "Company-mode backends for shell command and environment completion")
      (description
       "Company-mode backends for shell scripting in Emacs.  It offers
 completions for shell commands available in the system's PATH, environment
variables, and fish shell functions.  The completions are cached for
performance, and optional documentation strings can be retrieved from man
pages or the '--help' output of commands.")
      (license license:gpl3+))))

;; bat -r 37134:37155 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-evil-easymotion
  (let ((commit "f96c2ed38ddc07908db7c3c11bcd6285a3e8c2e9")
        (revision "0"))
    (package
      (name "emacs-evil-easymotion")
      (version (git-version "20160228" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pythonnut/evil-easymotion.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0xsva9bnlfwfmccm38qh3yvn4jr9za5rxqn4pwxbmhnx4rk47cch"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-avy
        emacs-evil
        ))
      (home-page "https://github.com/pythonnut/evil-easymotion")
      (synopsis "Vim-style quick navigation for evil-mode in Emacs")
      (description
       "Port of Vim's EasyMotion for Emacs' evil-mode.  It enables rapid cursor
 movement by displaying target labels for jump points, allowing users to
navigate efficiently with minimal keystrokes.  The package supports most
standard motions and offers macros for defining custom motions with optional
scoping and hooks.  It leverages avy for visual selection and can be
configured with a prefix key using `evilem-default-keybindings`.")
      (license license:gpl3+))))

;; bat -r 38633:38650 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-evil-tutor
  (let ((commit "4e124cd3911dc0d1b6817ad2c9e59b4753638f28")
        (revision "0"))
    (package
      (name "emacs-evil-tutor")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/evil-tutor.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00yfq8aflxvp2nnz7smgq0c5wlb7cips5irj8qs6193ixlkpffvx"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        ))
      (home-page "https://github.com/syl20bnr/evil-tutor")
      (synopsis "Interactive Evil-mode tutorial inspired by Vimtutor")
      (description
       "Interactive tutorial for Emacs users learning Evil-mode, modeled after
 Vim's vimtutor.  It guides users through modal editing concepts within a
dedicated major mode, allowing navigation between lessons using `C-j` and
`C-k`.  The tutorial preserves progress between sessions and is accessible via
`M-x evil-tutor-start`.")
      (license license:gpl3+))))

(define-public emacs-codegpt
  (let ((commit "4c2af3fc359afb90d2da21653a52e17a128e0249")
        (revision "0"))
    (package
      (name "emacs-codegpt")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-openai/codegpt.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "17pb2khgxl4x3cvmi6bsi345fqi4g9bwx1cfr0xivr2vgd434l8m"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-spinner
        emacs-markdown-mode
        emacs-openai
        ))
      (home-page "https://github.com/emacs-openai/codegpt")
      (synopsis "Emacs interface to OpenAI's GPT models for code generation and editing")
      (description
       "Integrates OpenAI's GPT models into Emacs, allowing users to generate,
 explain, refactor, and document code directly within the editor.  It provides
commands such as `codegpt-explain`, `codegpt-fix`, and `codegpt-doc`, and
supports both completion and chat-based interactions.  Users can customize the
model, temperature, and token limits, and an OpenAI API key is required for
usage.")
      (license license:gpl3+))))

;; bat -r 25658:25678 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-dired-quick-sort
  (let ((commit "611acc82919e99ac37ce504934f5e8c605ad7efa")
        (revision "0"))
    (package
      (name "emacs-dired-quick-sort")
      (version (git-version "0.2+" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/xuhdev/dired-quick-sort.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "176zr0qcagfcmiqx5hg3vzbw41xfdmc8ws0sr6drc00izl8kj5jp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-hydra
        ))
      (home-page "https://gitlab.com/xuhdev/dired-quick-sort")
      (synopsis "Hydra-based quick sorting for Dired buffers in Emacs")
      (description
       "Persistent quick sorting of Dired buffers in Emacs using Hydra.  It
 allows users to sort files by various criteria—such as name, size, or
modification time—via an interactive menu.  The last used sorting preference
is remembered across sessions when `savehist-mode` is enabled.  The package
requires GNU `ls` and is compatible with TRAMP, though with limited
functionality.")
      (license license:gpl3+))))

;; bat -r 37562:37586 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-evil-lisp-state
  (let ((commit "3c65fecd9917a41eaf6460f22187e2323821f3ce")
        (revision "0"))
    (package
      (name "emacs-evil-lisp-state")
      (version (git-version "8.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/evil-lisp-state.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1n6r8xs670r5qp4b5f72nr9g8nlqcrx1v7yqqlbkgv8gns8n5xgh"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-bind-map
        emacs-smartparens
        emacs-evil
        ))
      (home-page "https://github.com/syl20bnr/evil-lisp-state")
      (synopsis "Evil-mode state for structured Lisp editing with smartparens")
      (description
       "Dedicated Evil-mode state for structured editing of Lisp code using
 smartparens.  It provides keybindings for operations like slurping, barfing,
wrapping, and transposing s-expressions.")
      (license license:gpl3+))))

;; bat -r 38510:38530 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-evil-textobj-line
  (let ((commit "9eaf9a5485c2b5c05e16552b34632ca520cd681d")
        (revision "0"))
    (package
      (name "emacs-evil-textobj-line")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/evil-textobj-line.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1w98gc1sqik8ab35a1hg5853dwar98a8qd94lxpq4ckabpgypins"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-evil
        ))
      (home-page "https://github.com/emacsorphanage/evil-textobj-line")
      (synopsis "Evil-mode text object for entire lines")
      (description
       "Emacs port of Vim's textobj-line, introducing a line-based text object
 for evil-mode.  It allows users to select entire lines using the 'vil' (inner
line) and 'val' (a line) motions.  The default keybinding is 'l' for both
inner and outer line objects, customizable via `evil-textobj-line-i-key` and
`evil-textobj-line-a-key`.")
      (license license:gpl3+))))

;; bat -r 38733:38753 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-evil-visual-mark-mode
  (let ((commit "2bbaaae56ae53e68a8bcc7bc2cfe830a14843b4d")
        (revision "0"))
    (package
      (name "emacs-evil-visual-mark-mode")
      (version (git-version "0.0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/roman/evil-visual-mark-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ggxifiz2qm26v2fw8m9ccjp3jbmhyhb8wv93m8k1pnyh8b7la2m"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-evil
        ))
      (home-page "https://github.com/roman/evil-visual-mark-mode")
      (synopsis "Display Evil-mode marks visually in Emacs buffers")
      (description
       "Minor mode for Emacs that displays all active Evil-mode marks directly
 within the buffer.  It enhances navigation by making marks visible, allowing
users to track important positions without manually cycling through them.
Users can customize which marks are displayed by modifying the
`evil-visual-mark-exclude-marks` list.")
      (license license:gpl3+))))

;; bat -r 100472:100494 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-phpunit
  (let ((commit "650a50898de1fa4eeb47360b12aeb1126b2448c2")
        (revision "0"))
    (package
      (name "emacs-phpunit")
      (version (git-version "0.17.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nlamirault/phpunit.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03vs9ni9nhm7rzr3qkgcjbldqxcds20ai2c52sw8wc6zpp5qijsc"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-s
        ))
      (home-page "https://github.com/nlamirault/phpunit.el")
      (synopsis "Run PHPUnit tests from Emacs")
      (description
       "Emacs commands to execute PHPUnit tests directly from the editor.  It
 allows running tests in the current buffer or project, supports customizable
test commands, and integrates with `php-mode`.  Users can configure the
PHPUnit executable path and additional options to suit their development
environment.")
      (license license:gpl2))))

;; bat -r 100926:100947 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-pip-requirements
  (let ((commit "31e0dc62abb2d88fa765e0ea88b919d756cc0e4f")
        (revision "0"))
    (package
      (name "emacs-pip-requirements")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Wilfred/pip-requirements.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08q225h8kahh632qkzpb1ih3jqg5imlzgrrh8ynkyxrr710madkl"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/Wilfred/pip-requirements.el")
      (synopsis "Major mode for editing pip requirements files in Emacs")
      (description
       "Major mode for editing pip requirements files in Emacs.  It offers
syntax highlighting, toggling of comments, and auto-completion of package
names from PyPI using Emacs' built-in completion mechanisms.  The mode
supports files like `requirements.txt` and `requirements.in`, and integrates
with completion frameworks such as Company and Auto Complete.")
      (license license:gpl3+))))

;; bat -r 42133:42154 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-flycheck-bashate
  (let ((commit "5e673c591d017329d0a07a61dc1223fa98639ee2")
        (revision "0"))
    (package
      (name "emacs-flycheck-bashate")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alexmurray/flycheck-bashate.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1gaih50mkyby0r4qnmc03dy111ik4and5p6r3lvsflpvd3hcxjn3"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck
        ))
      (home-page "https://github.com/alexmurray/flycheck-bashate")
      (synopsis "Flycheck checker for Bash scripts using bashate")
      (description
       "Integrate the `bashate` linter with Flycheck in Emacs, enabling
 real-time syntax checking of Bash scripts.  It helps enforce coding style
guidelines and detect common issues in shell scripts.  The checker activates
automatically in `sh-mode` buffers when `bashate` is available in the system
path.")
      (license license:gpl3+))))

;; bat -r 42468:42489 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-flycheck-credo
  (let ((commit "e285bd042a535d0f13e0b4c5226df404cdda4033")
        (revision "0"))
    (package
      (name "emacs-flycheck-credo")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/aaronjensen/flycheck-credo.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1n41liayykjmh1xwfnhdvw9bdxjca7d274gkpjfzhvhmbv7dig19"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck
        ))
      (home-page "https://github.com/aaronjensen/flycheck-credo")
      (synopsis "Flycheck checker for Elixir using Credo")
      (description
       "Integrate the Credo static code analysis tool with Flycheck in Emacs,
 enabling real-time linting of Elixir code.  It provides a Flycheck checker
that runs Credo, allowing developers to identify code issues and maintain code
quality directly within the editor.  Users can configure the checker to run in
strict mode and customize its behavior through Flycheck variables.")
      (license license:gpl3+))))

;; bat -r 42908:42929 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-flycheck-elsa
  (let ((commit "d60db9544d0c4213f2478bcea0fd0e668e31cf34")
        (revision "0"))
    (package
      (name "emacs-flycheck-elsa")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-elsa/flycheck-elsa.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ig9dc7ch3cdxp4p24v21h7hrdph9y5jy9421bfww6agymbj8i85"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck
        ))
      (home-page "https://github.com/emacs-elsa/flycheck-elsa")
      (synopsis "Flycheck integration for Elsa, the Emacs Lisp static analyzer")
      (description
       "Integrate Elsa, a static analysis and gradual type system for Emacs
 Lisp, with Flycheck to provide real-time linting and type checking within
Emacs.  It supports both Eask and Cask backends for dependency management.  To
enable, install `flycheck-elsa` from MELPA and add `flycheck-elsa-setup` to
your `emacs-lisp-mode-hook`.  Elsa analyzes code without executing it,
ensuring safe and side-effect-free checks.")
      (license license:gpl3+))))

;; bat -r 44002:44025 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-flycheck-pos-tip
  (let ((commit "dc57beac0e59669926ad720c7af38b27c3a30467")
        (revision "0"))
    (package
      (name "emacs-flycheck-pos-tip")
      (version (git-version "0.4-cvs" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/flycheck/flycheck-pos-tip.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "15h4m5cfk0vh1g630vlwfxmcpa1jdalrrldnvijsqla99mb2jm1w"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pos-tip
        emacs-flycheck
        ))
      (home-page "https://github.com/flycheck/flycheck-pos-tip")
      (synopsis "Display Flycheck errors using pos-tip tooltips")
      (description
       "Flycheck extension that displays syntax errors and warnings in
graphical popups using the pos-tip library.  When enabled, it shows error
messages at point in a tooltip, offering a more visually integrated
alternative to the minibuffer.  The extension is particularly useful in GUI
environments and can be customized via the `flycheck-pos-tip-timeout` variable
to control the duration of tooltip visibility.")
      (license license:gpl3+))))

;; bat -r 74213:74236 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-livid-mode
  (let ((commit "dfe5212fa64738bc4138bfebf349fbc8bc237c26")
        (revision "0"))
    (package
      (name "emacs-livid-mode")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pandeiro/livid-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "178ldzpk8a9m9abn8xlplxn5jgcca71dpkp82bs5g7bsccp3rx6p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        emacs-skewer-mode
        ))
      (home-page "https://github.com/pandeiro/livid-mode")
      (synopsis "Live JavaScript evaluation in Emacs via Skewer integration")
      (description
       "Minor mode for Emacs that automatically evaluates JavaScript code in the
browser whenever the buffer changes.  Built on top of `skewer-mode`, it
compares the current buffer content to the previously evaluated version,
checks for syntax errors using the external `js` command, and sends the code
to the browser for evaluation if valid.  This facilitates a live coding
experience similar to browser-based HTML/JS/CSS editors.")
      (license license:gpl3+))))

;; bat -r 131167:131195 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-vimish-fold
  (let ((commit "a6501cbfe3db791f9ca17fd986c7202a87f3adb8")
        (revision "0"))
    (package
      (name "emacs-vimish-fold")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mrkkrp/vimish-fold.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256 (base32 "0w0r951c6vn890h1cz5l8rl6hicna6rbdzfgbg4lpm280yds9lpb"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "vimish-fold"))))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        ))
      (home-page "https://github.com/mrkkrp/vimish-fold")
      (synopsis "Persistent, Vim-style text folding for Emacs")
      (description
       "Vim-like text folding capabilities in Emacs.  It allows users to fold
 active regions, automatically create folds from markers like `{{{` and `}}}`,
and persist folds across sessions.  Features include visual indicators for
folded regions, mouse support for toggling folds, and integration with `avy`
for quick fold navigation.  The package is lightweight and scales well, making
it suitable for managing folds in large projects.")
      (license license:gpl3+))))

;; bat -r 38709:38731 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-evil-vimish-fold
  (let ((commit "b6e0e6b91b8cd047e80debef1a536d9d49eef31a")
        (revision "0"))
    (package
      (name "emacs-evil-vimish-fold")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alexmurray/evil-vimish-fold.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "14qhfhk3d4c7v4jhr909dbxy8222flpqwk73bwg0pqwpkcifyv7n"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "evil-vimish-fold"))))))
      (propagated-inputs
       (list
        emacs-vimish-fold
        emacs-evil
        ))
      (home-page "https://github.com/alexmurray/evil-vimish-fold")
      (synopsis "Vim-style folding for Evil-mode using vimish-fold")
      (description
       "Integrate vimish-fold with Evil-mode in Emacs, providing Vim-like
folding commands.  It enables users to create and delete folds using `zf` and
`zd`, toggle folds with `za`, open and close folds with `zo` and `zc`, and
navigate between folds using `zj` and `zk`.  The mode can be activated
globally for specified major modes or configured per mode.  It requires both
`evil` and `vimish-fold` to function.")
      (license license:gpl3+))))

(define-public emacs-pet
  (let ((commit "0b2baf67579f6db874c6d89c5ac848e68f9334c1")
        (revision "0"))
    (package
      (name "emacs-pet")
      (version (git-version "3.4.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/wyuenho/emacs-pet.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08mxq4kffa9fip2klpb5bkj45k85m0vv6wldclkhsz3hm316dcc6"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-map
        ))
      (home-page "https://github.com/wyuenho/emacs-pet/")
      (synopsis "Automatically configure Python tooling paths in Emacs")
      (description
       "Minor mode for Emacs that automatically detects and sets the correct
 paths to Python tooling executables (e.g., linters, formatters) based on the
project's virtual environment.  It supports various virtual environment tools
such as poetry, pipenv, conda, and direnv, ensuring seamless integration with
Emacs packages like flycheck and lsp-mode.")
      (license license:gpl3+))))

(define-public emacs-marshal
  (let ((commit
         "bc00044d9073482f589aad959e34d563598f682a")
        (revision "0"))
    (package
      (name "emacs-marshal")
      (version (git-version "0.9.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sigma/marshal.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0v5ncg88bghn4rpqw6fnvxpd0276mwn2bh6fpch7s1ibpaj2bsp0"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-ht))
      (home-page "https://github.com/sigma/marshal.el")
      (synopsis "Eieio extension for automatic (un)marshalling")
      (description
       "Inspired by Go tagged structs.  alist, plist and json drivers are provided, but
implementing others just requires to inherit from `marshal-driver'.  Sometimes
the types are not enough (for example with lists, whose elements are not
explicitly typed.  In those cases, a small extension on top of types can be
used.")
      (license license:gpl2+))))

(define-public emacs-gh
  (let ((commit
         "b5a8d8209340d49ad82dab22d23dae0434499fdf")
        (revision "0"))
    (package
      (name "emacs-gh")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sigma/gh.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1vab2qdjyv4c3hfp09vbkqanfwj8ip7zi64gqbg93kf1aig1qgl9"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "gh-api")
                (bst:write-pkg-file "gh-auth")
                (bst:write-pkg-file "gh-cache")
                (bst:write-pkg-file "gh-comments")
                (bst:write-pkg-file "gh-common")
                (bst:write-pkg-file "gh-gist")
                (bst:write-pkg-file "gh-issue-comments")
                (bst:write-pkg-file "gh-issues")
                (bst:write-pkg-file "gh-oauth")
                (bst:write-pkg-file "gh-orgs")
                (bst:write-pkg-file "gh-pkg")
                (bst:write-pkg-file "gh-profile")
                (bst:write-pkg-file "gh-pull-comments")
                (bst:write-pkg-file "gh-pulls")
                (bst:write-pkg-file "gh-repos")
                (bst:write-pkg-file "gh-search")
                (bst:write-pkg-file "gh-url")
                (bst:write-pkg-file "gh-users")
                )))))
      (propagated-inputs
       (list
        emacs-marshal
        emacs-pcache
        emacs-logito
        ))
      (home-page "https://github.com/sigma/gh.el")
      (synopsis "Emacs client for GitHub API")
      (description
       "Emacs interface to the GitHub API, enabling users to create issues, list
repositories, manage pull requests, and more, directly from Emacs.  It
supports authentication with GitHub credentials and integration with other
Emacs tools, facilitating seamless GitHub workflows within the editor.")
      (license license:gpl2+))))

(define-public emacs-gist
  (let ((commit
         "314fe6ab80fae35b95f0734eceb82f72813b6f41")
        (revision "0"))
    (package
      (name "emacs-gist")
      (version (git-version "1.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/defunkt/gist.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vbyzww9qmsvdpdc6d6wq6drlq1r9y92807fjhs0frgzmq6dg0rh"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-gh))
      (home-page "https://github.com/defunkt/gist.el")
      (synopsis "Emacs integration for gist.github.com")
      (description
       "An Emacs interface for managing gists (http://gist.github.com).")
      (license license:gpl2+))))

(define-public emacs-with-editor
  (let ((commit "ca902ae02972bdd6919a902be2593d8cb6bd991b")
        (revision "0"))
    (package
      (name "emacs-with-editor")
      (version (git-version "3.4.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/with-editor.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0h21qs60qihv4p72x5wbmc0xly4g74wc25qj8m9slfbc4am9mwys"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f                       ; no test suite
        #:lisp-directory "lisp"
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'install 'make-info
              (lambda _
                (with-directory-excursion "../docs"
                  (invoke "makeinfo" "--no-split"
                          "-o" "with-editor.info" "with-editor.texi")
                  (install-file "with-editor.info" "../lisp"))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "with-editor")))
            )))
      (native-inputs
       (list
        texinfo
        ))
      (propagated-inputs
       (list
        emacs-async
        emacs-compat
        ))
      (home-page "https://github.com/magit/with-editor")
      (synopsis "Emacs library for using Emacsclient as EDITOR")
      (description
       "This package provides an Emacs library to use the Emacsclient as
@code{$EDITOR} of child processes, making sure they know how to call home.
For remote processes a substitute is provided, which communicates with Emacs
on stdout instead of using a socket as the Emacsclient does.")
      (license license:gpl3+))))

(define-public emacs-magit
  (let ((commit "9e6791796facd87d6d46abca2628e802edf01ec4")
        (revision "0"))
    (package
      (name "emacs-magit")
      (version (git-version "4.3.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "191j1azzvd9jvycdgxlqrswj2hn03ak3hrdqs6wqgb5f0q2i9zvs"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; #:tests? #t
        #:lisp-directory "lisp"
        #:test-command #~(list "make" "-C" ".." "test")
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'build-info-manual
              (lambda _
                (invoke "make" "-C" ".." "info")
                ;; Copy info files to the lisp directory, which acts as
                ;; the root of the project for the emacs-build-system.
                (rename-file "../docs/magit.info" "../lisp/magit.info")))
            (add-after 'unpack 'patch-version-executables
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "magit.el"
                  ("magit-version" #$version))
                (emacs-substitute-variables "magit-git.el"
                  ("magit-git-executable"
                   (search-input-file inputs "/bin/git")))
                (emacs-substitute-variables "magit-sequence.el"
                  ("magit-perl-executable"
                   (search-input-file inputs "/bin/perl")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "git-commit")
                ;; `guix build ... emacs-magit-section` doesn't automatically
                ;; create the magit-section-pkg.el
                (bst:write-pkg-file "magit-section")
                )))))
      (native-inputs
       ;; (list texinfo pkg-config)
       (list texinfo))
      (inputs
       (list git perl))
      (propagated-inputs
       ;; Note: the 'git-commit' and 'magit-section' dependencies are part of
       ;; magit itself.
       (list
        emacs-compat
        emacs-transient
        emacs-with-editor
        emacs-llama
        ))
      (home-page "https://magit.vc/")
      (synopsis "Emacs interface for the Git version control system")
      (description
       "With Magit, you can inspect and modify your Git repositories
with Emacs.  You can review and commit the changes you have made to
the tracked files, for example, and you can browse the history of past
changes.  There is support for cherry picking, reverting, merging,
rebasing, and other common Git operations.")
      (license license:gpl3+))))

;; Required by <path/to/spacemacs>/layers/+source-control/git/packages.el
(define-public emacs-magit-section
  (package
    (inherit emacs-magit)
    (name "emacs-magit-section")))

(define-public emacs-taxy
  (package
    (name "emacs-taxy")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://elpa.gnu.org/packages/taxy-" version ".tar"))
       (sha256
        (base32
         "1nmlx2rvlgzvmz1h3s5yn3qnad12pn2a83gjzxf3ln79p8rv1mj6"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-magit))
    (home-page "https://github.com/alphapapa/taxy.el")
    (synopsis "Programmable taxonomical grouping for arbitrary objects")
    (description
     "Taxy provides a programmable way to classify arbitrary objects into
a hierarchical taxonomy.  Allows you to automatically put things in nested
groups.")
    (license license:gpl3+)))

(define-public emacs-taxy-magit-section
  (package
    (name "emacs-taxy-magit-section")
    (version "0.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://elpa.gnu.org/packages/taxy-magit-section-" version
                    ".tar"))
              (sha256
               (base32
                "16j1a2vx9awr5vk1x3i1m526ym6836zxlypx1f50fcwjy0w8q8a3"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-magit emacs-taxy))
    (home-page "https://github.com/alphapapa/taxy.el")
    (synopsis "View Taxy structs in a Magit Section buffer")
    (description
     "This library provides a way to view @code{taxy} structs in a column-based,
@code{magit-section} buffer.  Columns are defined using simple top-level
forms, and new columns may be easily defined by users in their
configurations.")
    (license license:gpl3+)))

(define-public emacs-tweaks
  (let ((commit "29352eba87ca21be17e818532edc72684926bff1")
        (revision "0"))
    (package
      (name "emacs-tweaks")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/tweaks.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "09n4z9ax3bs5a8x03s9f4mwcdqdna3wyqrm11sdfscgvysr0ryv4"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-copy-sexp
        emacs-drag-stuff
        emacs-evil
        emacs-evil-iedit-state
        emacs-jump-last
        emacs-kill-buffers
        emacs-magit
        emacs-yasnippet
        emacs-zoom-frm
        ))
      (home-page "https://github.com/Bost/tweaks")
      (synopsis "Various tweaks")
      (description "Various tweaks")
      (license license:gpl3+))))

(define-public emacs-forge
  (package
    (name "emacs-forge")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magit/forge")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02ks8zc3nqqqqfq2picf0pxsw7wygb5hv9abnva1cv44x091w6zw"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f                     ;no tests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'build-info-manual
           (lambda _
             (invoke "make" "info")
             ;; Move the info file to lisp so that it gets installed by the
             ;; emacs-build-system.
             (rename-file "docs/forge.info" "lisp/forge.info")))
         (add-after 'build-info-manual 'chdir-lisp
           (lambda _
             (chdir "lisp"))))))
    (native-inputs (list texinfo))
    (propagated-inputs
     (list
      emacs-closql
      emacs-emacsql
      emacs-ghub
      emacs-llama
      emacs-let-alist
      emacs-magit
      emacs-markdown-mode
      emacs-yaml
      ))
    (home-page "https://github.com/magit/forge/")
    (synopsis "Access Git forges from Magit")
    (description "Work with Git forges, such as Github and Gitlab, from the
comfort of Magit and the rest of Emacs.")
    (license license:gpl3+)))

(define-public emacs-uuidgen
  (let ((commit "cebbe09d27c63abe61fe8c2e2248587d90265b59")
        (revision "0"))
    (package
     (name "emacs-uuidgen")
     (version (git-version "1.3" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kanru/uuidgen-el.git")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ih6kj3inwdxypbqj2n5vnfxmc6rfrx114w8bdy60yd8klx7273d"))))
     (build-system emacs-build-system)
     (home-page "https://github.com/kanru/uuidgen-el")
     (synopsis "UUID generation library for Emacs")
     (description
      "This package provides functions to generate Universally Unique
Identifiers (UUIDs) within Emacs.  It supports the creation of UUIDs
conforming to RFC 4122, including versions 1, 3, 4, and 5.  The
library allows for time-based, name-based (using MD5 or SHA-1
hashing), and random UUID generation, facilitating the creation of
unique identifiers directly in Emacs.")
     (license license:gpl3+))))

(define-public emacs-code-review
  (let ((commit "fba8fe3343665cb8000781590b2f20dc0351acb9")
        (revision "0"))
    (package
      (name "emacs-code-review")
      (version (git-version "0.0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/doomelpa/code-review.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0fgsbdydhsv15c0i9bajkshgf6cyijky5pdziq03jx7h3ph9y5fs"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-uuidgen
        emacs-deferred
        emacs-emojify
        emacs-forge
        emacs-closql
        emacs-magit
        emacs-a
        emacs-ghub
        emacs-transient
        emacs-markdown-mode
        ))
      (home-page "https://github.com/doomelpa/code-review")
      (synopsis "Perform code reviews from Emacs for GitHub, GitLab, and Bitbucket")
      (description
       "Emacs interface for conducting code reviews directly within the editor.  It
supports reviewing pull requests from GitHub,GitLab, and Bitbucket, offering
features such as reading and replying to comments, adding suggestions,
approving or requesting changes, and editing pull request metadata.  The
interface leverages `magit-section` and `transient` for a modern user
experience, enabling developers to manage code reviews without leaving Emacs.")
      (license license:gpl3+))))

(define-public emacs-magit-annex
  (let ((commit "83f438af33442c0ebc92922a562dad66208a45ff")
        (revision "0"))
    (package
      (name "emacs-magit-annex")
      (version (git-version "1.9.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit-annex.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "143y8kwbfgwq5zjg6v2gxxdrwwgllf4qarp60av2w186jr1j9zyw"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-magit))
      (home-page "https://github.com/magit/magit-annex/")
      (synopsis "Git-annex support for Magit")
      (description
       "Magit-annex adds a few git-annex operations to the Magit interface.")
      (license license:gpl3+))))

(define-public emacs-magit-tbdiff
  (let ((commit "1cb315269df2df2382edc3db21ed52418f13a0d6")
        (revision "0"))
      (package
        (name "emacs-magit-tbdiff")
        (version (git-version "1.2.0" revision commit))
        (source
         (origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/magit/magit-tbdiff.git")
                 (commit commit)))
           (file-name (git-file-name name version))
           (sha256
            (base32 "10qgl5mg8dj7g1yg0qc1aqraj96pywkj142i8xgnrdp6yngv8g56"))))
        (build-system emacs-build-system)
        (arguments (list #:tests? #f))
        (propagated-inputs (list emacs-magit))
        (home-page "https://github.com/magit/magit-tbdiff")
        (synopsis "Magit extension for range diffs")
        (description
         "Magit-tbdiff provides a Magit interface to @code{git-range-diff} (and its
third-party predecessor @code{git-tbdiff}), a Git subcommand for comparing two
versions of a topic branch.")
        (license license:gpl3+))))

(define-public emacs-magit-gerrit
  (let ((commit "07307dbdff9ec8042457dbeed21281c336fba104")
        (revision "1"))
    (package
      (name "emacs-magit-gerrit")
      (version (git-version "0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/magit-gerrit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "175vw3khs3bcm4ry98bcpd8dw7n1y8al01z4p5xcrlrzfp21cn0y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-magit))
      (home-page "https://github.com/emacsorphanage/magit-gerrit")
      (synopsis "Magit extension for Gerrit")
      (description "This Magit extension provides integration with Gerrit,
which makes it possible to conduct Gerrit code reviews directly from within
Emacs.")
      (license license:gpl3+))))

(define-public emacs-magit-stgit
  (let ((commit "b19d96f8f62bd4def83eb1c09e9cd2582856351e")
        (revision "0"))
    (package
      (name "emacs-magit-stgit")
      (version (git-version "3.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/stacked-git/magit-stgit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "10ql7gi586w65vds6wsh8bw5nr444xqhgh87khzcpfaglnw2lyaf"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f)) ;no tests
      (propagated-inputs
       (list
        emacs-magit
        emacs-transient
        emacs-llama
        ))
      (home-page "https://github.com/stacked-git/magit-stgit")
      (synopsis "StGit extension for Magit")
      (description
       "This package provides basic support for @code{stgit} in
@code{emacs-magit}.  When @code{magit-stgit-mode} is turned on, the
current patch series is displayed in the status buffer.  While point is on a
patch the changes it introduces can be shown using @code{RET}, it can be selected
as the current patch using @code{a}, and it can be discarded using @code{k}.  Other
@code{StGit} commands are available from the @code{StGit} transient on @code{/}.")
      (license license:gpl3+))))

(define-public emacs-magit-svn
  (let ((commit "ca637c648835eddbeb277cc8089d3ffd6f75ae13")
        (revision "0"))
    (package
      (name "emacs-magit-svn")
      (version (git-version "2.2.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/magit-svn.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x419qz80ir9ni94j3n08a5ygfq1265fpr13dsnxjjnlwjbq7sx7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-with-editor
        emacs-magit))
      (home-page "https://github.com/magit/magit-svn")
      (synopsis "Git-SVN extension to Magit")
      (description
       "This package is an extension to Magit, the Git Emacs mode, providing
support for Git-SVN.")
      (license license:gpl3+))))

(define-public emacs-evil-collection
  (let ((commit "fca81ddb2ca1ac3838aa7e8969b2313712807a45")
        (revision "0"))
    (package
      (name "emacs-evil-collection")
      (version (git-version "0.0.10" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-evil/evil-collection.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0grp87nb9pxx47rzclhngqn9gvgbn39yfk0szz6a4xh0pf56f100"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons* "^modes\\/" %default-include)
        #:tests? #true
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-L" "."
                               "-L" "./test"
                               "-l" "evil-collection-test.el"
                               "-l" "evil-collection-magit-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (native-inputs (list emacs-magit))
      (propagated-inputs
       (list
        emacs-annalist
        emacs-evil
        ))
      (home-page "https://github.com/emacs-evil/evil-collection")
      (synopsis "Collection of Evil bindings for many major and minor modes")
      (description "This is a collection of Evil bindings for the parts of
Emacs that Evil does not cover properly by default, such as @code{help-mode},
@code{M-x calendar}, Eshell and more.")
      (license license:gpl3+))))

(define-public emacs-magit-org-todos-el
  (let ((commit "9ffa3efb098434d837cab4bacd1601fdfc6fe999")
        (revision "0"))
    (package
      (name "emacs-magit-org-todos-el")
      (version (git-version "0.1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/danielma/magit-org-todos.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0kxz5q8q5np4zm1ls4hx1h53vlnhj0mnmbq12p5nzk5zcxycbcpz"))))
      (propagated-inputs
       (list emacs-magit))
      (build-system emacs-build-system)
      (home-page "https://github.com/danielma/magit-org-todos.el")
      (synopsis "Get todo.org into Emacs Magit status")
      (description "This package allows you to get @file{todo.org} into your
magit status.

If you have a @file{todo.org} file with @code{TODO} items in the root of your
repository, @code{magit-org-todos} will create a section in your Magit status
buffer with each of your todos.")
      (license license:gpl3+))))

(define-public emacs-magit-todos
  (let ((commit "bd27c57eada0fda1cc0a813db04731a9bcc51b7b")
        (revision "0"))
    (package
      (name "emacs-magit-todos")
      (version (git-version "1.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/magit-todos.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q3rplkvd4ny02zpnrzkfhflg8yx7zq2brq15c603f2yjiwiy7xl"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-async
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-hl-todo
        emacs-magit
        emacs-pcre2el
        emacs-s
        ))
      (home-page "https://github.com/alphapapa/magit-todos")
      (synopsis "Show source files' TODOs (and FIXMEs, etc) in Magit status buffer")
      (description "This package displays keyword entries from source code
comments and Org files in the Magit status buffer.  Activating an item jumps
to it in its file.  By default, it uses keywords from @code{hl-todo}, minus a
few (like NOTE).")
      (license license:gpl3))))

(define-public emacs-nix-mode
  (let ((commit "719feb7868fb567ecfe5578f6119892c771ac5e5")
        (revision "0"))
    (package
      (name "emacs-nix-mode")
      (version (git-version "1.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/NixOS/nix-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1i2yh8wgn97q9hwaihznb5d7jql9acdjyj5q375gqwpq144g3xjv"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-company
        emacs-json-mode
        emacs-magit
        emacs-mmm-mode
        ))
      (home-page "https://github.com/NixOS/nix-mode")
      (synopsis "Emacs major mode for editing Nix expressions")
      (description "@code{nixos-mode} provides an Emacs major mode for editing
Nix expressions.  It supports syntax highlighting, indenting and refilling of
comments.")
      (license license:lgpl2.1+))))

(define-public emacs-orgit
  (let ((commit "efd98e5caaac1d08677dae95be40fab65dcda2c8")
        (revision "0"))
    (package
      (name "emacs-orgit")
      (version (git-version "2.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/orgit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0pzcmd4d82nmg98nrnk73qr02k1hy0qyagsbrxyjdpfzrg3ysmp9"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-magit
        ))
      (home-page "https://github.com/magit/orgit")
      (synopsis "Support for Org links to Magit buffers")
      (description "This package defines several Org link types, which can be
used to link to certain Magit buffers.  Use the command
@command{org-store-link} while such a buffer is current to store a link.
Later you can insert it into an Org buffer using the command
@code{org-insert-link}.")
      (license license:gpl3+))))

(define-public emacs-orgit-forge
  (let ((commit "764820769e321a76622aaafe7617b4231985b5f0")
        (revision "0"))
    (package
      (name "emacs-orgit-forge")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magit/orgit-forge.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0v79xc4ss9c4wz6spplrlfzzgynfs264c6gxhzjffpa9vqnvbc6g"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-orgit
        emacs-forge
        emacs-compat
        ))
      (home-page "https://github.com/magit/orgit-forge")
      (synopsis "Org links to Forge topic buffers in Emacs")
      (description
       "This package defines the Org link type `orgit-topic`, enabling users
 to create links to Forge topic buffers within Org-mode documents in Emacs.
 Similar to the `orgit` package, which links to various Magit buffers,
 `orgit-forge` facilitates seamless navigation between Org documents and Forge
 topics, enhancing integration between version control and documentation
 workflows.")
      (license license:gpl3+))))

(define-public emacs-vdiff-magit
  ;; Need to use a more recent commit than the latest release version because
  ;; of Magit and Transient
  (let ((commit "cc9e2dbd81d7f717381981501472808b7a4c6d79")
        (revision "0"))
    (package
      (name "emacs-vdiff-magit")
      (version (git-version "0.3.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/justbur/emacs-vdiff-magit.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jybs0ddgvl1xfa750prw3phvilqxq3a4gpjpcljyjbjdqhdfrym"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-vdiff
        emacs-magit
        ))
      (home-page "https://github.com/justbur/emacs-vdiff-magit/")
      (synopsis "Frontend for diffing based on vimdiff")
      (description "This package permits comparisons of two or three buffers
based on diff output.")
      (license license:gpl3+))))

(define-public emacs-undo-tree
  (package
    (name "emacs-undo-tree")
    (version "0.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://gitlab.com/tsc25/undo-tree")
              (commit "42aab056e37e033816b2d192f9121b89410b958e"))) ; no 0.8.2 tag
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xvkxc078b4z5zqwndz6jcv4ga8yd2ci32v7l8pdvqjmz7fq7bfz"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-queue
      ))
    (home-page "https://www.dr-qubit.org/undo-tree.html")
    (synopsis "Treat undo history as a tree")
    (description
     "Tree-like interface to Emacs undo system, providing
graphical tree presentation of all previous states of buffer that
allows easily move between them.")
    (license license:gpl3+)))

(define-public emacs-evil-nerd-commenter
  (package
    (name "emacs-evil-nerd-commenter")
    (version "3.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/redguardtoo/evil-nerd-commenter")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1xi4sd75pzhgcd9lzhx18hlzbrwh5q9gbscb1971qn94mzxwd60r"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")
                     #:tests? #f        ; XXX: broken docstring
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-after 'unpack 'patch-Makefile
                           (lambda _
                             (substitute* "Makefile"
                               (("-Q") "")
                               (("-L [^.]*") "")
                               (("deps/") "")
                               ((" deps") "")))))))
    (propagated-inputs
     (list
      emacs-evil
      ))
    (native-inputs (list emacs-web-mode))
    (home-page "https://github.com/redguardtoo/evil-nerd-commenter")
    (synopsis "Comment and uncomment lines efficiently")
    (description
     "This package provides text objects and operators for comments within
@code{evil-mode}.")
    (license license:gpl3+)))

(define-public emacs-zenburn-theme
  (package
    (name "emacs-zenburn-theme")
    (version "2.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/bbatsov/zenburn-emacs")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00zyx2knfchxkml19kf4wfgigsbgzqf47mvbgrmk3nfznnnnyvmf"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/bbatsov/zenburn-emacs")
    (synopsis "Low contrast color theme for Emacs")
    (description
     "Zenburn theme is a port of the popular Vim Zenburn theme for Emacs.
It is built on top of the custom theme support in Emacs 24 or later.")
    (license license:gpl3+)))

(define-public emacs-loop
  (package
    (name "emacs-loop")
    (version "1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Wilfred/loop.el")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gs95xnmnn8aa4794k7h8mw1sz1nfdh9v0caqj6yvnsdnwy74n5x"))))
    (build-system emacs-build-system)
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (home-page "https://github.com/Wilfred/loop.el")
    (synopsis "Imperative loop structures for Emacs")
    (description "Loop structures familiar to users of other languages.  This
library adds a selection of popular loop structures as well as break and
continue.")
    (license license:gpl3+)))

(define-public emacs-vterm
  (let ((commit "056ad74653704bc353d8ec8ab52ac75267b7d373")
        (revision "2"))
    (package
      (name "emacs-vterm")
      (version (git-version "0.0.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/akermu/emacs-libvterm")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0mh1xx3ggrr3kampm1b9cxydbn6csihipaa2bpjv08py98wi0434"))))
      (build-system emacs-build-system)
      (arguments
       `(#:modules ((guix build emacs-build-system)
                    ((guix build cmake-build-system) #:prefix cmake:)
                    (guix build emacs-utils)
                    (guix build utils))
         #:imported-modules (,@%emacs-build-system-modules
                             (guix build cmake-build-system))
         ;; Include the `etc' folder for shell-side configuration files
         #:include (cons* "^etc/.*" %default-include)
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'replace-bin-bash
             ;; This is necessary to avoid errors in phase 'patch-el-files'.
             (lambda* (#:key inputs #:allow-other-keys)
               (substitute* "vterm.el"
                 (("\\/bin\\/bash") (search-input-file inputs "/bin/bash")))))
           (add-after 'unpack 'substitute-vterm-module-path
             (lambda* (#:key outputs #:allow-other-keys)
               (chmod "vterm.el" #o644)
               (emacs-substitute-sexps "vterm.el"
                 ("(require 'vterm-module nil t)"
                  `(module-load
                    ,(string-append (assoc-ref outputs "out")
                                    "/lib/vterm-module.so"))))))
           (add-after 'build 'configure
             ;; Run cmake.
             (lambda* (#:key outputs #:allow-other-keys)
               ((assoc-ref cmake:%standard-phases 'configure)
                #:outputs outputs
                #:out-of-source? #f
                #:configure-flags '("-DUSE_SYSTEM_LIBVTERM=ON"))))
           (add-after 'configure 'make
             ;; Run make.
             (lambda* (#:key (make-flags '()) outputs #:allow-other-keys)
               ;; Compile the shared object file.
               (apply invoke "make" "all" make-flags)
               ;; Move the file into /lib.
               (install-file
                "vterm-module.so"
                (string-append (assoc-ref outputs "out") "/lib")))))
         #:tests? #f))
      (native-inputs
       (list cmake-minimal libtool libvterm))
      (home-page "https://github.com/akermu/emacs-libvterm")
      (synopsis "Emacs libvterm integration")
      (description "This package implements a bridge to @code{libvterm} to
display a terminal in an Emacs buffer.")
      (license license:gpl3+))))

(define-public emacs-elisp-refs
  (package
    (name "emacs-elisp-refs")
    (version "1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/elisp-refs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1670jj0pya74gb0xbjlfmka4w06hzh6ya1ai9f4brxp4n9knc13i"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-list-utils
      emacs-loop
      emacs-s
      emacs-shut-up
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (home-page "https://github.com/Wilfred/elisp-refs")
    (synopsis "Find callers of elisp functions or macros")
    (description "@code{elisp-refs} finds references to functions, macros or
variables.  Unlike a dumb text search, it actually parses the code, so it's
never confused by comments or @code{foo-bar} matching @code{foo}.")
    (license license:gpl3+)))

(define-public emacs-paradox
  (let ((commit "dec73d4ba3512e0f85983a4b992080b225d199ee")
        (revision "0"))
    (package
      (name "emacs-paradox")
      (version (git-version "2.5.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Malabarba/paradox.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0dnfyfznps3p15zn3g4ay2y1wsrnkwrplsg0ramby4pkm61a5a5m"))))
      (build-system emacs-build-system)
      ;; (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-hydra
        emacs-let-alist
        emacs-spinner
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        (@(bost gnu packages emacs-build) emacs-undercover)
        ))
      (home-page "https://github.com/Malabarba/paradox")
      (synopsis "Paradox is an extension to Emacs packages menu")
      (description
       "Paradox is a project for modernizing Emacs' Package menu.  It provides
improved appearance, mode-line information, GitHub integration,
customizability and asynchronous upgrading.")
      (license license:gpl2+))))

(define-public emacs-json-reformat
  (package
    (name "emacs-json-reformat")
    (version "0.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gongo/json-reformat")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gaifz1brh7yh1wk1c02gddwis4ab6bggv27gy7gcd2s861f8bkx"))
       (patches (search-patches "emacs-json-reformat-fix-tests.patch"))))
    (build-system emacs-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'make-tests-writable
           (lambda _
             (for-each make-file-writable (find-files "test"))))
         (add-before 'check 'delete-json-objects-order-test
           (lambda _
             (emacs-batch-edit-file "test/json-reformat-test.el"
               `(progn (progn (goto-char (point-min))
                              (re-search-forward
                               "ert-deftest json-reformat-test:json-reformat-region")
                              (beginning-of-line)
                              (kill-sexp))
                       (basic-save-buffer)))))
         (add-before 'check 'delete-json-reformat-region-occur-error-test
           (lambda _
             (emacs-batch-edit-file "test/json-reformat-test.el"
               `(progn (goto-char (point-min))
                       (re-search-forward
                        "ert-deftest json-reformat-test:json-reformat-region-occur-error")
                       (beginning-of-line)
                       (kill-sexp)
                       (basic-save-buffer))))))))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      emacs-shut-up
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (home-page "https://github.com/gongo/json-reformat")
    (synopsis "Reformatting tool for JSON")
    (description "@code{json-reformat} provides a reformatting tool for
@url{http://json.org/, JSON}.")
    (license license:gpl3+)))

(define-public emacs-yasnippet-snippets
  (package
    (name "emacs-yasnippet-snippets")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AndreaCrotti/yasnippet-snippets")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0p38k8a3l9vpph1g2a6wz40y30wb2nhp770rv8947bxzjc5xc0gf"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include #~(cons* "^snippets\\/" %default-include)
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'set-home
            (lambda _
              (setenv "HOME" (getcwd)))))))
    (propagated-inputs
     (list
      emacs-yasnippet
      ))
    (home-page "https://github.com/AndreaCrotti/yasnippet-snippets")
    (synopsis "Collection of YASnippet snippets for many languages")
    (description "This package provides an extensive collection of YASnippet
snippets.  When this package is installed, the extra snippets it provides are
automatically made available to YASnippet.")
    (license license:gpl3+)))

(define-public emacs-volatile-highlights
  (let ((commit "3952439feb0173745ce36c1fc192c84494186b55")
        (revision "0"))
    (package
      (name "emacs-volatile-highlights")
      (version (git-version "1.18" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "http://github.com/k-talo/volatile-highlights.el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ykjry3adcc7k6bmhxixr1xykpp83n7m8nwd7kpqhq35f4w8pmfm"))))
      (build-system emacs-build-system)
      (home-page "http://github.com/k-talo/volatile-highlights.el")
      (synopsis "Emacs minor mode for visual feedback on some operations")
      (description "@code{volatile-highlights-mode} brings visual feedback to
some operations by highlighting portions relating to the operations.  All of
highlights made by this library will be removed when any new operation is
executed.")
      (license license:gpl3+))))

(define-public emacs-suggest
  (package
    (name "emacs-suggest")
    (version "0.7")
    (home-page "https://github.com/Wilfred/suggest.el")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "01v8plska5d3g19sb1m4ph1i3ayprfzk8mi6mpabjy6zad397xjl"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-loop
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-spinner
      emacs-shut-up
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (synopsis "Suggest Elisp functions that give the output requested")
    (description "Suggest.el will find functions that give the output
requested.  It's a great way of exploring list, string and arithmetic
functions.")
    (license license:gpl3+)))

(define-public emacs-vundo
  (let ((commit "30f85b4ae1f2a7189d44bb738b49559928d046cb")
        (revision "0"))
    (package
      (name "emacs-vundo")
      (version (git-version "2.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/casouri/vundo.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1a2y73xf6bb37mp15w40mh21x0zlzvyf4a4j0r9psyfhi145c1cy"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "vundo.el"
                               "-l" "test/vundo-test.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (home-page "https://github.com/casouri/vundo/")
      (synopsis "Visualize the undo tree")
      (description
       "Vundo (visual undo) displays the undo history as a tree and lets you
move in the tree to go back to previous buffer states.  To use vundo, type
@kbd{M-x vundo RET} in the buffer you want to undo.  An undo tree buffer
should pop up.")
      (license license:gpl3+))))

(define-public emacs-unfill
  (let ((commit "4a15511876983eeaa75e57fcab8d4d51fe9b3840")
        (revision "0"))
    (package
      (name "emacs-unfill")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/purcell/unfill.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cj8xdkg39ja6f29ws67bqrvjy2gzk45yimcqmj0xv3v66r555lg"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        ;; #:test-command #~(list "make" "unit" "INIT_PACKAGES=t")
        ))
      (home-page "https://github.com/purcell/unfill")
      (synopsis "Inverse of Emacs' @code{fill-paragraph} and @code{fill-region}")
      (description
       "The functions in this package provide the inverse of Emacs'
@code{fill-paragraph} and @code{fill-region}.")
      (license license:gpl3+))))

(define-public emacs-yaml-mode
  (package
    (name "emacs-yaml-mode")
    (version "0.0.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yoshiki/yaml-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jqg2hmh7qsgqywwd6fy3k8z8j45nqhpdzr3hw4hd5s2hry3zhg1"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")))
    (home-page "https://github.com/yoshiki/yaml-mode")
    (synopsis "Major mode for editing YAML files")
    (description
     "Yaml mode is an Emacs major mode for editing files in the YAML data
serialization format.  As YAML and Python share the fact that indentation
determines structure, this mode provides indentation and indentation command
behavior very similar to that of Python mode.")
    (license license:gpl3+)))

(define-public emacs-evil-matchit
  (package
    (name "emacs-evil-matchit")
    (version "4.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/redguardtoo/evil-matchit")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06ayyw8nim5fi819hr30x54wx2ba6aqvlh7r0vld06xc0zsjdhm3"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "make" "test")
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-after 'unpack 'patch-Makefile
                           (lambda _
                             (substitute* "Makefile"
                               (("-Q") "")
                               (("-L [^.]*") "")
                               (("deps/") "")
                               ((" deps") "")))))))
    (propagated-inputs
     (list
      emacs-evil
      ))
    (native-inputs
     (list
      emacs-lua-mode
      emacs-markdown-mode
      emacs-tuareg
      emacs-yaml-mode
      ))
    (home-page "https://github.com/redguardtoo/evil-matchit")
    (synopsis "Vim matchit ported into Emacs")
    (description
     "@code{evil-matchit} is a minor mode for jumping between matching tags in
evil mode using @kbd{%}.  It is a port of @code{matchit} for Vim.")
    (license license:gpl3+)))

(define-public emacs-xterm-color
  (package
    (name "emacs-xterm-color")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atomontage/xterm-color")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "127lq50q62x06kd1xrf8lyc4rkqbfhfy86gsx1x4x169am2xk397"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/atomontage/xterm-color")
    (synopsis "ANSI & xterm-256 color text property translator for Emacs")
    (description "@code{xterm-color.el} is an ANSI control sequence to
text-property translator.")
    (license license:bsd-2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; beg: done
(define-public emacs-color-theme-sanityinc-solarized ;; PL sent
  (let ((commit "9c62a49fe0a5ff456bcf3984ba825e75861534b9")
        (revision "0"))
    (package
      (name "emacs-color-theme-sanityinc-solarized")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/color-theme-sanityinc-solarized")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0vakjdm5xf7ahxf39j4bc38irkwyv8xkp45akqfc7z252vpxi44k"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/purcell/color-theme-sanityinc-solarized")
      (synopsis "Solarized color themes for Emacs")
      (description
       "An alternate Emacs color-theme version of Ethan Schoonover's \"Solarized\"
theme pair.")
      (license license:gpl3+))))

(define-public emacs-moe-theme
  (package
    (name "emacs-moe-theme")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kuanyui/moe-theme.el")
               (commit
                 "171d76b0c69e42a9d7b62c5c472944951cb2be6c")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0g4dci8r0p69vmhbp5djrjvqv7z90xw7pznzapgxy8dqmbvc14k0"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/kuanyui/moe-theme.el")
    (synopsis
     "A customizable colorful eye-candy theme for Emacser. Moe, moe, kyun!")
    (description
     "A customizable colorful eye-candy theme for Emacser. Moe, moe, kyun!")
    (license license:gpl3+)))

(define-public emacs-slim-mode
  (package
    (name "emacs-slim-mode")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "http://github.com/slim-template/emacs-slim")
               (commit
                 "3636d18ab1c8b316eea71c4732eb44743e2ded87")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1sqylm6ipmlh9249mmwfb16b4pv94cvzdwvi3zakdpz713phyjw5"))))
    (build-system emacs-build-system)
    (home-page "http://slim-lang.com/")
    (synopsis "Syntax highlighting for Slim.")
    (description
     "slim-mode provides Emacs support for editing Slim templates. It's based
on haml-mode.")
    (license license:gpl3+)))

(define-public emacs-lush-theme
  (package
    (name "emacs-lush-theme")
    (version "0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/andre-richter/emacs-lush-theme")
               (commit
                 "645e1959143532df8f7ef90e1184e9556df18af7")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0j9gbr3chaxc16yysyaaa1n2cvlrdc1y063l1kxj0mf435d1l7py"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/andre-richter/emacs-lush-theme")
    (synopsis "A dark theme with lush colors for Emacs24")
    (description "A dark theme with lush colors for Emacs24.")
    (license license:expat)))

(define-public emacs-vi-tilde-fringe ;; PR sent
  (let ((commit "f1597a8d54535bb1d84b442577b2024e6f910308")
        (revision "0"))
    (package
      (name "emacs-vi-tilde-fringe")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/vi-tilde-fringe")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wdm8k49zl6i6wnh7vjkswdh5m9lix56jv37xvc90inipwgs402z"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/syl20bnr/vi-tilde-fringe")
      (synopsis "Display tildes on empty lines in the Emacs fringe a la Vi")
      (description
       "Display tildes on empty lines in the Emacs fringe a la Vi.")
      (license license:gpl3+))))

(define-public emacs-popwin ;; PR sent
  (let ((commit "58adcd0ca7c3dbd58626ec7019252d64cbc73042")
        (revision "2"))
    (package
      (name "emacs-popwin")
      (version (git-version "1.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/popwin")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mqwzc6fwhwq1kl8b3i1hm2ylfh8blrxrw6mzr5wyifbwpg7dq10"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/emacsorphanage/popwin")
      (synopsis "Popup window manager for Emacs")
      (description
       "This package provides utilities for treating certain windows as @dfn{pop
up windows}, which close automatically when quitting a command or selecting
another window.")
      (license license:gpl3+))))

(define-public emacs-centered-cursor-mode
  (package
    (name "emacs-centered-cursor-mode")
    (version "0.5.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/andre-r/centered-cursor-mode.el")
             (commit
              "ebaeb80fba0bafdf6f95706308123dec2cf4b99f")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0rf6csfn3sprr4mlwq5gzl5di9xyhd4v46927vjhjj3k1qahvmpb"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/andre-r/centered-cursor-mode.el")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-company-statistics
  (package
    (name "emacs-company-statistics")
    (version "0.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/company-mode/company-statistics")
             (commit
              "e62157d43b2c874d2edbd547c3bdfb05d0a7ae5c")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "12mwviz1mwx4ywks2lkmybbgh1wny67wkzlq5y3ml8gvyc288n3i"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-company))
    (home-page "https://github.com/company-mode/company-statistics")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-json-navigator
  (package
    (name "emacs-json-navigator")
    (version "0.1.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/DamienCassou/json-navigator")
               (commit
                 "afd902e0b5cde37fad4786515a695d17f1625286")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0gn19qn11n86rn9b6knp9fb5jx9m2q1khhm4vnh0vjck7jxi9sqr"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))
    (home-page
      "https://github.com/DamienCassou/json-navigator")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-eziam-themes
  (package
    (name "emacs-eziam-themes")
    (version "4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thblt/eziam-theme-emacs")
             (commit
              "7fba717293072d0afdbd1c45351ddf47b26b3064")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "14v23aqyl971yaw00xmqymlmw6abkx1biflqy1q0908q6fzg170n"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/thblt/eziam-theme-emacs")
    (synopsis
     "A mostly grayscale theme for Emacs, inspired by Tao and Leuven.")
    (description
     "An Emacs theme, which tries to combine the simplicity of Tao with the
org-mode goodness of Leuven. Unlike Tao, keeps some very minimal color
indications, while remaining mainly grayscale and trying to avoid the “angry
fruit salad” syndrome. Unlike Leuven, it remains mostly grayscale, with no
color for syntax, and easily allows multiple variants.")
    (license license:gpl3+)))

(define-public emacs-erc-social-graph
  (package
    (name "emacs-erc-social-graph")
    (version "1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/vibhavp/erc-social-graph")
               (commit
                 "e6ef3416a1c5064054bf054d9f0c1c7bf54a9cd0")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0k3gp4c74g5awk7v9lzb6py3dvf59nggh6dw7530cswxb6kg2psa"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/vibhavp/erc-social-graph")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-hlint-refactor
  (package
    (name "emacs-hlint-refactor")
    (version "0.0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mpickering/hlint-refactor-mode")
               (commit
                 "c4307f86aad6d02e32e9b30cb6edc115584c791c")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1c71w9s34n0i7mm4njchxn6s3ri1y6mh3akgbg4nq41d42h8iap3"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/mpickering/hlint-refactor-mode")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-chocolate
  (package
    (name "emacs-chocolate")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SavchenkoValeriy/emacs-chocolate-theme")
             (commit
              "ccc05f7ad96d3d1332727689bf6250443adc7ec0")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1d8a9jwv9y0sncw24k840c8yyrig30f2d6q2zqlc09f05yzq9p9p"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-autothemer
      ))
    (home-page "https://github.com/SavchenkoValeriy/emacs-chocolate-theme")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-gruber-darker
  (package
    (name "emacs-gruber-darker")
    (version "0.7")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/rexim/gruber-darker-theme")
               (commit
                 "6de7a37d7b18cf3f0ec51db799f4f2aa6e3e89ff")))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1bqjn67s0kcnf86qjxz0ayaash4rbwfwqsppqyy7p9qfc00cjix2"))))
    (build-system emacs-build-system)
    (home-page
      "https://github.com/rexim/gruber-darker-theme")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public emacs-writeroom-mode
  (package
    (inherit emacs-writeroom)
    (name "emacs-writeroom-mode")))

(define-public emacs-farmhouse-themes
  (let ((commit
         "30c763d01611dad88f1a1ff88451431e2629016d")
        (revision "0"))
    (package
      (name "emacs-farmhouse-themes")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/farmhouse-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1ywm5k2zwamqm5h13fydsvahpfml5s292xy1ds1k9j33r44rqcyl"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/emacsorphanage/farmhouse-themes")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-farmhouse-light-mod-theme
  (let ((commit "8bd216bd12655828a07917a498052f5959515efd")
        (revision "0"))
    (package
      (name "emacs-farmhouse-light-mod-theme")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/farmhouse-light-mod-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "133wa7lxvb2bk7ba5yvdnfz4hf7l1zpdmakidg1b3ca9rcprivvq"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (map bst:write-pkg-file
                     (list
                      "farmhouse-light-mod-a-theme"
                      "farmhouse-light-mod-b-theme"
                      "farmhouse-light-mod-c-theme")))))))
      (home-page "https://github.com/Bost/farmhouse-light-mod-theme")
      (synopsis "Modded farmhouse-light theme for Emacs")
      (description "Modded farmhouse-light theme for Emacs.")
      (license license:gpl3+))))

(define-public emacs-web-completion-data
  (let ((commit "c272c94e8a71b779c29653a532f619acad433a4f")
        (revision "0"))
    (package
      (name "emacs-web-completion-data")
      (version (git-version "0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/osv/web-completion-data")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "19nzjgvd2i5745283ck3k2vylrr6lnk9h3ggzwrwdhyd3m9433vm"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page
       "https://github.com/osv/web-completion-data")
      (synopsis "Shared web completion data for Emacs ac-html and company-web")
      (description
       "Shared web completion data dependency package for Emacs ac-html and
company-web.")
      (license license:gpl3+))))

(define-public emacs-company-web
  (let ((commit "863fb84b81ed283474e50330cd8d27b1ca0d74f1")
        (revision "0"))
    (package
      (name "emacs-company-web")
      (version (git-version "2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/osv/company-web")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0awl7b6p4vrxv0cy5xcxwihqzgk7kk6l7jsivyrj8s0f5jv2q71v"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-company
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-web-completion-data))
      (home-page "https://github.com/osv/company-web")
      (synopsis "Emacs company backend for html, jade and slim")
      (description
       "Company-web is an alternative Emacs plugin for autocompletion in
html-mode, web-mode, jade-mode, slim-mode and use data of ac-html.  It uses
company-mode.")
      (license license:gpl3+))))

(define-public emacs-anaconda-mode
  (let ((commit "f900bd7656a03aa24ef3295251f266736f7756eb")
        (revision "0"))
    (package
      (name "emacs-anaconda-mode")
      (version (git-version "0.1.16" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pythonic-emacs/anaconda-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1gricygbs9f210z7bnzdhcmqpwnpzs4mwbw8rvabfplcbiw7sg6r"))))
      (build-system emacs-build-system)
      (arguments
       (list #:include #~(cons "^anaconda-mode\\.py$" %default-include)
             #:tests? #f))              ; no tests
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-pythonic
        emacs-s
        emacs-tramp
        emacs-xref
        ))
      (home-page "https://github.com/pythonic-emacs/anaconda-mode")
      (synopsis
       "Python code navigation, documentation lookup and completion in Emacs")
      (description
       "This package provides Python code navigation, documentation lookup,
and code completion for Emacs.  It uses a lightweight Python backend to offer
features like jumping to definitions, finding references, and viewing
documentation, enhancing the Python development experience within Emacs.")
      (license license:gpl3+))))

(define-public emacs-company-anaconda
  (let ((commit "169252fca79a79da41ef22f2ec0eab0cf1313966")
        (revision "0"))
    (package
      (name "emacs-company-anaconda")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pythonic-emacs/company-anaconda.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1kq035si3syi3pcacr6i5pbayqag5rfx4xw8brmrc92z5wlqm3ba"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-anaconda-mode
        emacs-company
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (home-page "https://github.com/pythonic-emacs/company-anaconda.git")
      (synopsis
       "Company backend for Python code completion using Anaconda mode")
      (description
       "This package provides a Company backend for Python code completion,
 leveraging Anaconda mode in Emacs.  It integrates with the Company (Complete
 Anything) framework to offer intelligent and context-aware code completions
 for Python, enhancing the coding experience with more accurate and efficient
 suggestions.")
      (license license:gpl3+))))

(define-public emacs-copilot
  (let ((commit "d2126f288cebd9cd7e768c53a4cbfa6eedcb0666")
        (revision "0"))
    (package
      (name "emacs-copilot")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/copilot-emacs/copilot.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "14qnhp9pzilkrkaz2w52ylanjg44idi41dg6g7lqqc4fk0ib12kj"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^assets/" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'substitute-copilot-node-executable
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "copilot.el"
                  ("copilot-node-executable"
                   (search-input-file inputs "/bin/node"))))))))
      (inputs (list node-lts))
      (propagated-inputs
       (list
        ;; emacs-copilot-balancer
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-editorconfig
        emacs-s
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-jsonrpc))
      (home-page "https://github.com/copilot-emacs/copilot.el")
      (synopsis "An unofficial Copilot plugin for Emacs")
      (description
       "Copilot.el is an Emacs plugin for GitHub Copilot. This plugin is
unofficial and based on binaries provided by copilot.vim. Note: You need
access to GitHub Copilot to use this plugin.")
      (license license:gpl3+))))

(define-public emacs-ample-zen-theme
  (let ((commit
          "b277bb7abd4b6624e8d59f02474b79af50a007bd")
        (revision "0"))
    (package
      (name "emacs-ample-zen-theme")
      (version (git-version "0.3" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mjwall/ample-zen")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "18z9jl5d19a132k6g1dvwqfbbdh5cx66b2qxlcjsfiqxlxglc2sa"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/mjwall/ample-zen")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-anti-zenburn-theme
  (let ((commit
          "dbafbaa86be67c1d409873f57a5c0bbe1e7ca158")
        (revision "0"))
    (package
      (name "emacs-anti-zenburn-theme")
      (version (git-version "2.5.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/m00natic/anti-zenburn-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1h4lachmrpjiblah4rjd2cpvz6n6qh3i5cdp4wra2dk177h7kj6h"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/m00natic/anti-zenburn-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-apropospriate-theme
  (let ((commit
          "9fd52d4b0dec6e805097e7f216db47dc37bc3abc")
        (revision "0"))
    (package
      (name "emacs-apropospriate-theme")
      (version (git-version "0.2.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/waymondo/apropospriate-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "189n4ds7mhz52hnk57gaqngi3m807cffgvasw9ysv9h42b0mp3kk"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/waymondo/apropospriate-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-badwolf-theme
  (let ((commit
          "ea01a3d9358e968f75e3ed15dec6a2a96ce3d9a1")
        (revision "0"))
    (package
      (name "emacs-badwolf-theme")
      (version (git-version "1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/bkruczyk/badwolf-emacs")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0a6adsxvmw3mgji17is75jrq3ifmzpch8rwqqyfgc99xzndvab7l"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/bkruczyk/badwolf-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-birds-of-paradise-plus-theme
  (let ((commit
          "bb9f9d4ef7f7872a388ec4eee1253069adcadb6f")
        (revision "0"))
    (package
      (name "emacs-birds-of-paradise-plus-theme")
      (version (git-version "0.1.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jimeh/birds-of-paradise-plus-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1n5icy29ks5rxrxp7v4sf0523z7wxn0fh9lx4y6jb7ppdjnff12s"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jimeh/birds-of-paradise-plus-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-bubbleberry-theme
  (let ((commit
          "22e9adf4586414024e4592972022ec297321b320")
        (revision "0"))
    (package
      (name "emacs-bubbleberry-theme")
      (version (git-version "0.1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jasonm23/emacs-bubbleberry-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1aha8rzilv4k300rr4l9qjfygydfwllkbw17lhm8jz0kh9w6bd28"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jasonm23/emacs-bubbleberry-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-busybee-theme
  (let ((commit
          "66b2315b030582d0ebee605cf455d386d8c30fcd")
        (revision "0"))
    (package
      (name "emacs-busybee-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/mswift42/busybee-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1cvj5m45f5ky3w86khh6crvdqrdjxg2z6b34jlm32qpgmn0s5g45"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/mswift42/busybee-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-cherry-blossom-theme
  (let ((commit
          "eea7653e00f35973857ee23b27bc2fae5e753e50")
        (revision "0"))
    (package
      (name "emacs-cherry-blossom-theme")
      (version (git-version "0.0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/inlinestyle/emacs-cherry-blossom-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0m97xr6lddy2jdmd4bl4kbp2568p4n110yfa9k7fqc20ihq8jkyd"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/inlinestyle/emacs-cherry-blossom-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-clues-theme
  (let ((commit
          "abd61f2b7f3e98de58ca26e6d1230e70c6406cc7")
        (revision "0"))
    (package
      (name "emacs-clues-theme")
      (version (git-version "1.0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/emacsfodder/emacs-clues-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "118k5bnlk9sc2n04saaxjncmc1a4m1wlf2y7xyklpffkazbd0m72"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/emacsfodder/emacs-clues-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-dakrone-theme
  (let ((commit
          "232ad1be5f3572dcbdf528f1655109aa355a6937")
        (revision "0"))
    (package
      (name "emacs-dakrone-theme")
      (version (git-version "0.0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/dakrone/dakrone-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0p51zni42hv090vv6mk9v0v88achmgxlsmlr40y8y6ng57w51r4s"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/dakrone/dakrone-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-darkmine-theme
  (let ((commit
          "7f7e82ca03bcad52911fa41fb3e204e32d6ee63e")
        (revision "0"))
    (package
      (name "emacs-darkmine-theme")
      (version (git-version "0.5" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/pierre-lecocq/darkmine-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0d2g4iyp8gyfrcc1gkvl40p1shlw1sadswzhry0m1lgbyxiiklrz"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/pierre-lecocq/darkmine-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-darkokai-theme
  (let ((commit
          "5820aeddfc8c869ba840cc534eba776936656a66")
        (revision "0"))
    (package
      (name "emacs-darkokai-theme")
      (version (git-version "0.1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/sjrmanning/darkokai")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1bj7l5sh6nzxcw575kjcscjpjqmwlxhvi30qviqg4d6aymzkgr53"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/sjrmanning/darkokai")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-darktooth-theme
  (let ((commit
          "fd3df73a4d937fa9e12f0b18acb009a9d40f245e")
        (revision "0"))
    (package
      (name "emacs-darktooth-theme")
      (version (git-version "1.0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/emacsfodder/emacs-theme-darktooth")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0dvfk9kyza6yq0jn9g2ffb5gv07xnjg6myxkqfxpll7m2s0zasi7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-autothemer
        ))
      (home-page "http://github.com/emacsfodder/emacs-theme-darktooth")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-django-theme
  (let ((commit
         "86c8142b3eb1addd94a43aa6f1d98dab06401af0")
        (revision "0"))
    (package
      (name "emacs-django-theme")
      (version (git-version "1.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/andrzejsliwa/django-theme.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1azf4p6salga7269l0kf13bqlxf9idp0ys8mm20qpyjpj79p5g9w"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/andrzejsliwa/django-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-espresso-theme
  (let ((commit
          "580f673729f02aa07070c5300bedf24733d56e74")
        (revision "0"))
    (package
      (name "emacs-espresso-theme")
      (version (git-version "1.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/dgutov/espresso-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1fxnsz0v7hizs7wf8pjfm7jwbrm9vg5gvxv1a6ixgfajka79amfw"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/dgutov/espresso-theme")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public emacs-flatland-theme
  (let ((commit
          "a98a6f19ad4dff0fa3fad1ea487b7d0ef634a19a")
        (revision "0"))
    (package
      (name "emacs-flatland-theme")
      (version (git-version "0.1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/gregchapple/flatland-emacs")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "02gbzxd1v003aaj5rn3vr00n4390bhdx2jhpa7nb430fg3s1ppdy"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/gregchapple/flatland-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flatui-theme
  (let ((commit
          "9c15db5526c15c8dba55023f5698372b19c2a780")
        (revision "0"))
    (package
      (name "emacs-flatui-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/john2x/flatui-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0ybgpnbq3b0ml3lzgkispn667acpjww7z6cr7hgwg3j1zrqpwi75"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/john2x/flatui-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-gandalf-theme
  (let ((commit
          "4e472fc851431458537d458d09c1f5895e338536")
        (revision "0"))
    (package
      (name "emacs-gandalf-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/ptrv/gandalf-theme-emacs")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0sn3y1ilbg532mg941qmzipvzq86q31x86ypaf0h0m4015r7l59v"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/ptrv/gandalf-theme-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-gotham-theme
  (let ((commit
          "4b8214df0851bb69b44c3e864568b7e0030a95d2")
        (revision "0"))
    (package
      (name "emacs-gotham-theme")
      (version (git-version "1.1.9" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://depp.brause.cc/gotham-theme.git")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "19ylb7d5jxr7mwjrmgq7acvb4a1q39909xaz3y6s3kjvsyg426pg"))))
      (build-system emacs-build-system)
      (home-page
        "https://depp.brause.cc/gotham-theme.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-grandshell-theme
  (let ((commit
          "0ed8e4273607dd4fcaa742b4097259233b09eda6")
        (revision "0"))
    (package
      (name "emacs-grandshell-theme")
      (version (git-version "" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://framagit.org/steckerhalter/grandshell-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "04vx5p1ffln5b9rxgfi15q735plxcjvskby3c5k4slgwf4p91bpq"))))
      (build-system emacs-build-system)
      (home-page
        "https://framagit.org/steckerhalter/grandshell-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-gruber-darker-theme
  (let ((commit
          "6de7a37d7b18cf3f0ec51db799f4f2aa6e3e89ff")
        (revision "0"))
    (package
      (name "emacs-gruber-darker-theme")
      (version (git-version "0.7" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/rexim/gruber-darker-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1bqjn67s0kcnf86qjxz0ayaash4rbwfwqsppqyy7p9qfc00cjix2"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/rexim/gruber-darker-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-hc-zenburn-theme
  (let ((commit
          "8a1f9d28f503615e5d9b3eac59a2f3c14e75fc20")
        (revision "0"))
    (package
      (name "emacs-hc-zenburn-theme")
      (version (git-version "2.8.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/bbatsov/zenburn-emacs")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "00zyx2knfchxkml19kf4wfgigsbgzqf47mvbgrmk3nfznnnnyvmf"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/bbatsov/zenburn-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-hemisu-theme
  (let ((commit
          "5c206561aa2c844ecdf3e3b672c3235e559ddd7f")
        (revision "0"))
    (package
      (name "emacs-hemisu-theme")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/andrzejsliwa/hemisu-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "178dvigiw162m01x7dm8pf61w2n3bq51lvk5q7jzpb9s35pz1697"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/andrzejsliwa/hemisu-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-heroku-theme
  (let ((commit
         "8083643fe92ec3a1c3eb82f1b8dc2236c9c9691d")
        (revision "0"))
    (package
      (name "emacs-heroku-theme")
      (version (git-version "2.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jonathanchu/heroku-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "15hk0v6ck076mahsz4spq75jcnv587fx4d3w50c7bdh423fl0xvx"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/jonathanchu/heroku-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-inkpot-theme
  (let ((commit
          "43c008f05b982fa41fc477b2f487ce04023dd073")
        (revision "0"))
    (package
      (name "emacs-inkpot-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://codeberg.org/ideasman42/emacs-theme-inkpot")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "12si69yrp0r34i1fswcfv94y3i2qykcxwpw086lcsylfrx88ydf2"))))
      (build-system emacs-build-system)
      (home-page
        "https://codeberg.org/ideasman42/emacs-theme-inkpot")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-ir-black-theme
  (let ((commit
          "36e930d107604b5763c80294a6f92aaa02e6c272")
        (revision "0"))
    (package
      (name "emacs-ir-black-theme")
      (version (git-version "1.0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jmdeldin/ir-black-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1cy9xwhswj9vahg8zr16r2crm2mm3vczqs73gc580iidasb1q1i2"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jmdeldin/ir-black-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-jazz-theme
  (let ((commit
          "d67e09f320d03ace79a05bd28f967b1ac61f2348")
        (revision "0"))
    (package
      (name "emacs-jazz-theme")
      (version (git-version "1.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/donderom/jazz-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "07m17yqhlc0fc3ga3dhkcrp9h8kr17s00ky3zwr8f2k6chj7xmn2"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/donderom/jazz-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-jbeans-theme
    (let ((commit
         "a63916a928324c42bfbe3016972c2ecff598b1ae")
        (revision "0"))
    (package
      (name "emacs-jbeans-theme")
      (version (git-version "1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/synic/jbeans-emacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1kw5czn7ddzhjhdhb8jpqbd2ha8s68fkk4m4iir09wnqdg6icvl8"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/synic/jbeans-emacs")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public emacs-light-soap-theme
  (let ((commit
          "76a787bd40c6b567ae68ced7f5d9f9f10725e00d")
        (revision "0"))
    (package
      (name "emacs-light-soap-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/light-soap-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "04dik8z2mg6qr4d3fkd26kg29b4c5crvbnc1lfsrzyrik7ipvsi8"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/light-soap-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-madhat2r-theme
  (let ((commit
          "6b387f09de055cfcc15d74981cd4f32f8f9a7323")
        (revision "0"))
    (package
      (name "emacs-madhat2r-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/madhat2r/madhat2r-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1nnjdqqbarzv62ic3ddc2z9wmh93zjia4nvfjmji8213dngrrf88"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/madhat2r/madhat2r-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-majapahit-themes
  (let ((commit
         "77c96df7619666b2102d90d452eeadf04adc89a6")
        (revision "0"))
    (package
      (name "emacs-majapahit-themes")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://gitlab.com/franksn/majapahit-theme.git")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
             "0wnhfdk2zwxqfh8d74xmszqgibcgxiq825pq8381zg4nkz5cckfb"))))
      (build-system emacs-build-system)
      (home-page
       "https://gitlab.com/franksn/majapahit-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-material-theme
  (let ((commit
          "6823009bc92f82aa3a90e27e1009f7da8e87b648")
        (revision "0"))
    (package
      (name "emacs-material-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "http://github.com/cpaulik/emacs-material-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1c0z2dxfwzgl71xwli3dmyn96xadm5wnhnp5inv5f01mp7iwhf8a"))))
      (build-system emacs-build-system)
      (home-page
        "http://github.com/cpaulik/emacs-material-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-minimal-theme
  (let ((commit
          "221b43aad320d226863892dfe4d85465e8eb81ce")
        (revision "0"))
    (package
      (name "emacs-minimal-theme")
      (version (git-version "0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/anler/minimal-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1zsabgn5mi63ry8jg1li866jcix9mf588ypdfajk8747a6127qd0"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/anler/minimal-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

;; obsolete - replaced by emacs-color-theme-modern
(define-public emacs-color-theme
  (let ((commit
         "3a2f6b615f5e2401e30d93a3e0adc210bbb4b7aa")
        (revision "0"))
    (package
      (name "emacs-color-theme")
      (version (git-version "6.6.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsattic/color-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "09imx996afh3j207163kg8sc92hd7wljkpban1pnn6f67bgyrvlv"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (home-page
       "https://github.com/emacsattic/color-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-monochrome-theme
  (let ((commit "bfca67fe7365310bc47ae9ca96c417caada54896")
        (revision "0"))
    (package
      (name "emacs-monochrome-theme")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/fxn/monochrome-theme.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jvsss38rgry37dnshxbqxcj7qh1q6iyza58kix47h5wbnrpvszn"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/fxn/monochrome-theme.el")
      (synopsis "Minimalistic monochrome color theme for Emacs")
      (description
       "This package provides a minimalistic monochrome color theme for Emacs.
  It uses shades of gray to create a distraction-free, high-contrast
 environment, ideal for users who prefer a simple, non-intrusive interface.
  The theme aims to reduce eye strain while maintaining readability and focus
 on content, without relying on multiple colors.")
      (license license:gpl3+))))

(define-public emacs-mustang-theme
  (let ((commit
          "dda6d04803f1c9b196b620ef564e7768fee15de2")
        (revision "0"))
    (package
      (name "emacs-mustang-theme")
      (version (git-version "0.3" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/mustang-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0pg3iay0iinf361v4ay8kizdxs5rm23ir556cwwgz3m3gbs0mgsh"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/mustang-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-naquadah-theme
  (let ((commit "430c3b7bd51922cb616b3f60301f4e2604816ed8")
        (revision "0"))
    (package
      (name "emacs-naquadah-theme")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jd/naquadah-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0z2dn05xgbdfw6rwgsq31rm5dr098dk411qk83fbx2bkdxxfr60w"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/jd/naquadah-theme")
      (synopsis "Naquadah theme for Emacs")
      (description "A theme based on Tango color set.")
      (license license:gpl3+))))

(define-public emacs-noctilux-theme
  (let ((commit "a3265a1be7f4d73f44acce6d968ca6f7add1f2ca")
        (revision "0"))
    (package
      (name "emacs-noctilux-theme")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sjrmanning/noctilux-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "12xx0v8d97kjvlkj0ii78vxxvzgmcfc4hzv4yvxymg50rsy0zzqi"))
         (patches
          (search-patches
           "emacs-noctilux-theme--fix-byte-compilation.patch"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/sjrmanning/noctilux-theme")
      (synopsis "Dark theme inspired by LightTable")
      (description
       "Dark color theme for Emacs 24+ (using deftheme), inspired by the
default dark theme in Light Table 0.4.0.  This color theme is based off the
definitions and format in sellout's awesome emacs-color-theme-solarized,
providing support for a lot of modes.")
      (license license:gpl3+))))

(define-public emacs-obsidian-theme
  (let ((commit "f45efb2ebe9942466c1db6abbe2d0e6847b785ea")
        (revision "0"))
    (package
      (name "emacs-obsidian-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mswift42/obsidian-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1d36mdq8b1q1x84a2nb93bwnzlpdldiafh7q7qfjjm9dsgbij73b"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/mswift42/obsidian-theme")
      (synopsis "Port of the Eclipse obsidian theme")
      (description "Port of the Eclipse obsidian theme.")
      (license license:gpl3+))))

(define-public emacs-occidental-theme
  (let ((commit
          "fd2db7256d4f78c43d99c3cddb1c39106d479816")
        (revision "0"))
    (package
      (name "emacs-occidental-theme")
       (version (git-version "1.0" revision commit))
       (source
         (origin
           (method git-fetch)
           (uri (git-reference
                  (url "https://github.com/olcai/occidental-theme")
                  (commit commit)))
           (file-name (git-file-name name version))
           (sha256
             (base32
               "0pnliw02crqw8hbg088klz54z6s1ih8q2lcn9mq5f12xi752hxm8"))))
       (build-system emacs-build-system)
       (home-page
         "https://github.com/olcai/occidental-theme")
       (synopsis "")
       (description "")
       (license license:gpl3+))))

(define-public emacs-oldlace-theme
  (let ((commit
         "5c6f437203b0783b36a7aff4a578de4a0c8c4ee6")
        (revision "0"))
    (package
      (name "emacs-oldlace-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mswift42/oldlace-theme.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0y9fxrsxp1158fyjp4f69r7g2s7b6nbxlsmsb8clwqc8pmmg2z82"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/mswift42/oldlace-theme.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-organic-green-theme
  (let ((commit
         "7ca93a1c42bba1bcced181bd8cc34cb57be39537")
        (revision "0"))
    (package
      (name "emacs-organic-green-theme")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kostafey/organic-green-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1fa27522nb3jqswbii9qsi1csjqw5p6a7lsrylhw2vll8w9v4mma"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/kostafey/organic-green-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-phoenix-dark-mono-theme
  (let ((commit
         "a54f515d162148bcb38676980bc2316adb3d7b8b")
        (revision "0"))
    (package
      (name "emacs-phoenix-dark-mono-theme")
      (version (git-version "2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/j0ni/phoenix-dark-mono")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1zr334qsjrajd2vrrlc1rfm4b4kdw15jfh5d102vj5bp7z7ajhb4"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/j0ni/phoenix-dark-mono")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-phoenix-dark-pink-theme
  (let ((commit
         "ddd98a45775be105984ec598384e68df3d3e8046")
        (revision "0"))
    (package
      (name "emacs-phoenix-dark-pink-theme")
      (version (git-version "3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/j0ni/phoenix-dark-pink")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "02fhna45wq3wja51yrwm0xysdvyck1r0a3dx41i5sh89504gl6a9"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/j0ni/phoenix-dark-pink")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-planet-theme
  (let ((commit
         "b0a310ff36565fe22224c407cf59569986698a32")
        (revision "0"))
    (package
      (name "emacs-planet-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cmack/emacs-planet-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1xdj59skmldq5dnarirhwq4qycipas86nbyqwl8zsv0bh20nl1rs"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/cmack/emacs-planet-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-professional-theme
  (let ((commit
          "0927d1474049a193f9f366bde5eb1887b9ba20ed")
        (revision "0"))
    (package
      (name "emacs-professional-theme")
      (version (git-version "0.0.3" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/juanjux/emacs-professional-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0hx7rxa3smdippcpj4j63k0r5l4wflllb0vpnwwknc9j93r7042b"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/juanjux/emacs-professional-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-purple-haze-theme
  (let ((commit
          "3e245cbef7cd09e6b3ee124963e372a04e9a6485")
        (revision "0"))
    (package
      (name "emacs-purple-haze-theme")
      (version (git-version "" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jasonm23/emacs-purple-haze-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "15myw5rkbnnpgzpiipm5xl4cyzymv8hh66x9al4aalb5nf52dckc"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jasonm23/emacs-purple-haze-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-reverse-theme
  (let ((commit
          "8319d0d5342890a3530ffa4daafdb7c35feda1ca")
        (revision "0"))
    (package
      (name "emacs-reverse-theme")
      (version (git-version "0.03" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/emacsorphanage/reverse-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "002ywhjms8ybk7cma2p2i11z3fz6kb0w8mlafysm911rvcq2hg5f"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/emacsorphanage/reverse-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-seti-theme
  (let ((commit
          "9d76db0b91d4f574dd96ac80fad41da35bffa109")
        (revision "0"))
    (package
      (name "emacs-seti-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/caisah/seti-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "14fqkkvjbq2gj737k3yz3s0dkya33fi0dj4wds99zyzss2xp37f8"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/caisah/seti-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-smyx-theme
  (let ((commit
          "6263f6b401bbabaed388c8efcfc0be2e58c51401")
        (revision "0"))
    (package
      (name "emacs-smyx-theme")
      (version (git-version "0.10" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/tacit7/smyx")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1z2sdnf11wh5hz1rkrbg7fs4ha3zrbj9qnvfzq9005y89d7cs95x"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/tacit7/smyx")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-soft-charcoal-theme
  (let ((commit
          "5607ab977fae6638e78b1495e02da8955c9ba19f")
        (revision "0"))
    (package
      (name "emacs-soft-charcoal-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/soft-charcoal-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "07056pnjgsgw06c67776qp7jci96iqbzlprbavzz2l1j8ywz8cwm"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/soft-charcoal-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-soft-morning-theme
  (let ((commit
          "c0f9c70c97ef2be2a093cf839c4bfe27740a111c")
        (revision "0"))
    (package
      (name "emacs-soft-morning-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/soft-morning-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "06q82v1hndvznsqg0r6jrxvgxhycg9m65kay4db4yy0gmc66v2xf"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/soft-morning-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-soft-stone-theme
  (let ((commit
          "fb475514cfb02cf30ce358a61c48e46614344d48")
        (revision "0"))
    (package
      (name "emacs-soft-stone-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/soft-stone-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "030mf8b0sf9mmzwhg85zh0ccvcg768kckwvbm0yzg7vmq1x46hjl"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/soft-stone-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-subatomic256-theme
  (let ((commit
          "326177d6f99cd2b1d30df695e67ee3bc441cd96f")
        (revision "0"))
    (package
      (name "emacs-subatomic256-theme")
      (version (git-version "1.3" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/d11wtq/subatomic256")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1w7mimyqc25phlww20l49wlafnxp6c7dwibvphg3vwl61g0llpq8"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/d11wtq/subatomic256")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-subatomic-theme
  (let ((commit
          "9d0ac6aa5272d0285965a48505eb35658c5472b0")
        (revision "0"))
    (package
      (name "emacs-subatomic-theme")
      (version (git-version "1.8.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/cryon/subatomic")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0fs1y53b025fwd690dl5iipsh3nz5g0jvj8ny1az614697yx90xw"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/cryon/subatomic")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-sunny-day-theme
  (let ((commit
          "420e0a6eb33fcc9b75c2c9e88ab60a975d782a00")
        (revision "0"))
    (package
      (name "emacs-sunny-day-theme")
      (version (git-version "0.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/sunny-day-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0mhyhkjjwszwl5wzkys9pgvgx9sps9r46k1s1hpzzf4s3vi015mc"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/sunny-day-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-tango-2-theme
  (let ((commit
          "64e44c98e41ebbe3b827d54280e3b9615787daaa")
        (revision "0"))
    (package
      (name "emacs-tango-2-theme")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://gist.github.com/2024464.git")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1lqkazis9pfcfdsb2lar4l1n4pd085v60xmnlkdrdllwamqachkk"))))
      (build-system emacs-build-system)
      (home-page "https://gist.github.com/2024464.git")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-tango-plus-theme
  (let ((commit
          "30495d1ab1df6213ecac008c599b91e6f9244c12")
        (revision "0"))
    (package
      (name "emacs-tango-plus-theme")
      (version (git-version "2.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/tmalsburg/tango-plus-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1qdz7nf4wqv58ck02ralp7l4an1ashh1bnjgqkp444as3vyli2c4"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/tmalsburg/tango-plus-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-tangotango-theme
  (let ((commit
          "dbefd8638c36595467efbce5a26da208320ac30a")
        (revision "0"))
    (package
      (name "emacs-tangotango-theme")
      (version (git-version "0.0.7" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/juba/color-theme-tangotango")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "093izf3zppfcb85bgdmq516sarkmwvwfi4b6jnpd6cnj7wl9zr1j"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/juba/color-theme-tangotango")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-toxi-theme
  (let ((commit
          "90c8828b91025adf5adc96011a35d25682991b8a")
        (revision "0"))
    (package
      (name "emacs-toxi-theme")
      (version (git-version "0.1.2" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/postspectacular/toxi-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1pnsky541m8kzcv81w98jkv0hgajh04hxqlmgddc1y0wbvi849j0"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/postspectacular/toxi-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-twilight-anti-bright-theme
  (let ((commit
          "523b95fcdbf4a6a6483af314ad05354a3d80f23f")
        (revision "0"))
    (package
      (name "emacs-twilight-anti-bright-theme")
      (version (git-version "0.3.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jimeh/twilight-anti-bright-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0g6qqfgbg507r8lgq99zj2b5n3r9m23hpx19m36c3i55mh94dl2h"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jimeh/twilight-anti-bright-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-twilight-bright-theme
  (let ((commit
          "322157cb2f3bf7920ecd209dafc31bc1c7959f49")
        (revision "0"))
    (package
      (name "emacs-twilight-bright-theme")
      (version (git-version "0.1.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jimeh/twilight-bright-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1awqc4rvg8693myynb1d4y4dfdaxkd5blnixxs3mdv81l07zyn8c"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jimeh/twilight-bright-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-twilight-theme
  (let ((commit
          "77c4741cb3dcf16e53d06d6c2ffdc660c40afb5b")
        (revision "0"))
    (package
      (name "emacs-twilight-theme")
      (version (git-version "1.0.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/developernotes/twilight-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0d7vd1h0rwwgrh7f9kmdgy2ni0p20da9c8ylwlg33nsb26345wfs"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/developernotes/twilight-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-ujelly-theme
  (let ((commit
          "bf724ce7806a738d2043544061e5f9bbfc56e674")
        (revision "0"))
    (package
      (name "emacs-ujelly-theme")
      (version (git-version "1.2.9" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/marktran/color-theme-ujelly")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0pz26q5qfq4wiqcpfkq26f19q5gyiv8q71sq4k77hkss5a5b5fqg"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/marktran/color-theme-ujelly")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-underwater-theme
  (let ((commit
          "4eb9ef014f580adc135d91d1cd68d37a310640b6")
        (revision "0"))
    (package
      (name "emacs-underwater-theme")
      (version (git-version "1.1.0" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/jmdeldin/underwater-theme.el")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1ypxpv5vw2ls757iwrq3zld6k0s29q3kg3spcsl5ks4aqpnkxpva"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/jmdeldin/underwater-theme.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-white-sand-theme
  (let ((commit
          "729dd52cc1936250183d6761eed406c4be514a71")
        (revision "0"))
    (package
      (name "emacs-white-sand-theme")
      (version (git-version "0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/mswift42/white-sand-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0vlq6wywhc08z4ivyahpagcxbxfww6ipbmvgw4sgc8c6h3vb8v9s"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/mswift42/white-sand-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-zen-and-art-theme
  (let ((commit
          "a7226cbce0bca2501d69a620cb2aeabfc396c232")
        (revision "0"))
    (package
      (name "emacs-zen-and-art-theme")
      (version (git-version "1.0.1" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/developernotes/zen-and-art-theme")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0dnaxhsw549k54j0mgydm7qbl4pizgipfyzc15f9afsxa107rpnl"))))
      (build-system emacs-build-system)
      (home-page
        "https://github.com/developernotes/zen-and-art-theme")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

;; Defines emacs-omtose-darker-theme emacs-omtose-softer-theme
(define-public emacs-omtose-phellack-theme
  (let ((commit
         "66f99633e199e65bd28641626435e8e59246529a")
        (revision "0"))
    (package
      (name "emacs-omtose-phellack-theme")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url
                "https://github.com/franksn/omtose-phellack-theme"
                ;; "https://github.com/emacsmirror/omtose-phellack-theme"
                )
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0imf2pcf93srm473nvaksw5pw5i4caqxb6aqfbq6xww8gdbqfazy"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; contains code for omtose-darker-theme, omtose-softer-theme
        #:include #~(cons "^variants/" %default-include)))
      (home-page
       "https://github.com/emacsmirror/omtose-phellack-theme")
      (synopsis "Dark theme with cold bluish touch")
      (description "A dark, soothing theme for Emacs with a cold bluish touch.")
      (license license:gpl3+))))

(define-public emacs-sublime-themes
  (let ((commit
         "60ee40af82eb55b79d5ed4026f1911326311603f")
        (revision "0"))
    (package
      (name "emacs-sublime-themes")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/owainlewis/emacs-color-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "17fcqvavgyl9cmv1hwcid2bw513vhawlsmac1w2adiz567594i6h"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/owainlewis/emacs-color-themes")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-cider-hydra
  (let ((commit
          "c3b8a15d72dddfbc390ab6a454bd7e4c765a2c95")
        (revision "0"))
    (package
      (name "emacs-cider-hydra")
      (version
        (git-version "0.2.0-snapshot" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/clojure-emacs/cider-hydra")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "0qrxja9bxx07m1ij8ly36sib901a6qhczgxsp4ap4wszy63lx93r"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-hydra
        emacs-cider
        ;; emacs-cider-inspector
        ;; emacs-cider-test
        ;; emacs-cider-repl
        ;; emacs-cider-mode
        ;; emacs-cider-macroexpansion
        ;; emacs-cider-eval
        ;; emacs-cider-clojuredocs
        ;; emacs-cider-doc
        ;; emacs-cider-client
        ;; emacs-cider-apropos
        ))
      (home-page "https://github.com/clojure-emacs/cider-hydra")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-flycheck-joker
  (let ((commit
         "93576295fef7a749bf779eeece5edd85e21868e2")
        (revision "0"))
    (package
      (name "emacs-flycheck-joker")
      (version (git-version "1.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/candid82/flycheck-joker")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1hz5nlrhbrlwwk8rcjvc3jhj0g9wgm6xw903ap8fxq470mj99gln"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck
        ))
      (home-page "https://github.com/candid82/flycheck-joker")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-kaocha-runner
  (let ((commit
         "9ba7b47d3a3834964f7fcad389081b3b282f692c")
        (revision "0"))
    (package
      (name "emacs-kaocha-runner")
      (version (git-version "" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magnars/kaocha-runner.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0slspzc3zppavmdnw8xpih1iiqyqbyx4mm286lz0naw7g4yrpb12"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-s
        emacs-parseedn
        emacs-cider))
      (home-page "https://github.com/magnars/kaocha-runner.el")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-sayid
  (let ((commit
         "879aff586336a0ec4d46c0ed4720fb1de22082bd")
        (revision "0"))
    (package
      (name "emacs-sayid")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/clojure-emacs/sayid")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "013afdzz0rvb428pla78an052jvw2q95zzqvnq9z9w16y5yd1n0c"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include #~(cons "^src/el/" %default-include)))
      (propagated-inputs (list emacs-cider))
      (home-page "https://github.com/clojure-emacs/sayid")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-kaolin-themes
  (let ((commit
         "facb2a08d3179103d4c3a9905b37c87831fe1665")
        (revision "0"))
    (package
      (name "emacs-kaolin-themes")
      (version (git-version "1.6.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ogdenwebb/emacs-kaolin-themes")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0r8lc175iswvwwqf2yqdc8sx07m8b8l0mylw0p1gxri45qd69hcq"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        ;; emacs-kaolin-themes-lib
        ;; emacs-color
        emacs-map
        emacs-autothemer
        ))
      (home-page "https://github.com/ogdenwebb/emacs-kaolin-themes")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-emacsql-sqlite3
  ;; This commit contains changes necessary for Sqlite 3.38+.
  (let ((commit "2113618732665f2112cb932a66c0e89c404d8777")
        (revision "1"))
    (package
      (name "emacs-emacsql-sqlite3")
      (version (git-version "1.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cireu/emacsql-sqlite3")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0r8svrd0d4cflx8a8gkynnhafcpv3ksn9rds8dhyx5yibximbzsw"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
         ;; #:tests? #t
         ;; #:test-command #~(list
         ;;                   "emacs" "-Q" "--batch" "-L" "."
         ;;                  "--load" "emacsql-sqlite3-test.el"
         ;;                  "-f" "ert-run-tests-batch-and-exit")
         #:phases
         #~(modify-phases %standard-phases
             (add-after 'unpack 'embed-path-to-sqlite3
               (lambda _
                 (substitute* "emacsql-sqlite3.el"
                   (("\\(executable-find \"sqlite3\"\\)")
                    (string-append "\"" (which "sqlite3") "\""))))))))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (inputs
       (list
        sqlite
        ))
      (propagated-inputs
       (list
        emacs-emacsql
        ))
      (home-page "https://github.com/cireu/emacsql-sqlite3")
      (synopsis "EmacSQL backend for SQLite")
      (description "This is yet another EmacSQL backend for SQLite which uses
official @command{sqlite3} executable to access SQL database.")
      (license license:gpl3+))))

(define-public emacs-zonokai-emacs
  (let ((commit
         "38ee819b711e848437ba6d563594129a0ecac598")
        (revision "0"))
    (package
      (name "emacs-zonokai-emacs")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ZehCnaS34/zonokai-emacs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "16ni0va1adpqdnrkiwmpxwrhyanxp5jwbknii2wnbhgq62s7gv43"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        ;; emacs-color
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/ZehCnaS34/zonokai-emacs")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-kill-buffers
  (let ((commit
         "eb2a195f4c98e62c8c541ea27a4f0398e8187b99")
        (revision "0"))
    (package
      (name "emacs-kill-buffers")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/kill-buffers")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ssnyvy80h1pc1khimcazxf0mqkzz0xmzjg2if7xc6js235rcksf"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-cider))
      (home-page "https://github.com/Bost/kill-buffers")
      (synopsis "Kill various unwanted buffers")
      (description "Kill various unwanted buffers.")
      (license license:gpl3+))))

(define-public emacs-copy-sexp
  (let ((commit
         "97f39a0651e50765e5f0d669b5566f251a2a9a7b")
        (revision "0"))
    (package
      (name "emacs-copy-sexp")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/copy-sexp")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1pd6nrgv6b6134w60zlxb3dnvn3nw8975wq5h6smach9cfxf7iry"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-smartparens
        emacs-eval-sexp-fu
        ))
      (home-page "https://github.com/Bost/copy-sexp")
      (synopsis "")
      (description "")
      (license license:gpl3+))))

(define-public emacs-jump-last
  (let ((commit
         "66103a31c16eaa41e4ce69680f378f934d39cd79")
        (revision "0"))
    (package
      (name "emacs-jump-last")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Bost/jump-last")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0r31d7597dzi01y09acqvzqxn7fqb1amxngjq7zk5gp5n61frf9s"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-goto-chg))
      (home-page "https://github.com/Bost/jump-last")
      (synopsis "Jump to the Last Edit Location, regardless of the file")
      (description "Jump to the Last Edit Location, regardless of the file.")
      (license license:gpl3+))))

(define-public emacs-evil-iedit-state
  (let ((commit
         "6f7b502447ba35676375169d7707372ebad2791f")
        (revision "0"))
    (package
      (name "emacs-evil-iedit-state")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syl20bnr/evil-iedit-state")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0vjzjmp3ba0nzf0v04bhxvzgdwwm11vivxqjzgnvp3kq95kajr5h"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        emacs-iedit))
      (home-page "https://github.com/syl20bnr/evil-iedit-state")
      (synopsis "Slick Evil states for iedit")
      (description "This package adds two new Evil states:
* iedit state
* iedit-insert state
It has also a nice integration with expand-region for quick edit of the
current selected text by pressing e.")
      (license license:gpl3+))))

(define-public emacs-term-cursor
  (let ((commit
         "d6c9b46c6ad73875db4ce04cac335846f86fb7e7")
        (revision "0"))
    (package
      (name "emacs-term-cursor")
      (version (git-version "0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/h0d/term-cursor.el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0jh284j7z4xmdd18ciaczlzc30g67gk14fv31kr20hgmd1fzv1m6"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/h0d/term-cursor.el.git")
      (synopsis "Bring GUI Emacs cursor behaviour to the terminal")
      (description "Display Emacs cursor in terminal as it would be in GUI,
 with or without evil-mode.  Send terminal escape codes to change cursor shape
in TTY Emacs.  Using VT520 DECSCUSR (cf
https://invisible-island.net/xterm/ctlseqs/ctlseqs.html).  Does not interfere
with GUI Emacs behavior.")
      (license license:gpl3+))))

(define-public emacs-winum
  (let ((commit "c5455e866e8a5f7eab6a7263e2057aff5f1118b9")
        (revision "0"))
    (package
      (name "emacs-winum")
      (version (git-version "2.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/deb0ch/emacs-winum")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lj4cp7ml7cjhkd66f6ivcl6sbfs2my8ajjlynzl3pm5qansfw5i"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/deb0ch/emacs-winum")
      (synopsis "Window number management for Emacs")
      (description
       "This package provides window number management for Emacs, enabling
 quick and easy navigation between windows using numbers.  It assigns numbers
 to windows dynamically and allows users to switch to a specific window by its
 number with minimal keystrokes.")
      (license license:gpl3+))))

(define-public emacs-frame-fns
  (package
    (name "emacs-frame-fns")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.emacswiki.org/emacs/download/frame-fns.el")
       (sha256
        (base32
         "00lpahlvm9z2sl7bcff0jd6f62zf2jg9mliwimwnpjz1dkmy5sj7"))))
    (build-system emacs-build-system)
    (home-page "https://www.emacswiki.org/emacs/frame-fns.el")
    (synopsis "Non-interactive frame and window functions")
    (description "Non-interactive frame and window functions.")
    (license license:gpl3+)))

(define-public emacs-frame-cmds
  (package
    (name "emacs-frame-cmds")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.emacswiki.org/emacs/download/frame-cmds.el")
       (sha256
        (base32
         "07bycmx9d7kd7yzsjy3xa0iqnrqzmhzjzah77qybcickp539dqf9"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-frame-fns
      ))
    (home-page "https://www.emacswiki.org/emacs/frame-cmds.el")
    (synopsis "Frame and window commands (interactive functions)")
    (description "Frame and window commands (interactive functions).")
    (license license:gpl3+)))

(define-public emacs-zoom-frm
  (package
    (name "emacs-zoom-frm")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.emacswiki.org/emacs/download/zoom-frm.el")
       (sha256
        (base32
         "1l39hw0n3w96980varljd3z37d8a2x0yj577hcaf3qbwqywfgv9v"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-frame-cmds
      ))
    (home-page "https://www.emacswiki.org/emacs/zoom-frm.el")
    (synopsis "Commands to zoom frame font size")
    (description "Commands to zoom frame font size.")
    (license license:gpl3+)))

(define-public emacs-auto-highlight-symbol
  (let ((commit
         "5847f06f86fd50be3fa041d65528d9665eea25dd")
        (revision "0"))
    (package
     (name "emacs-auto-highlight-symbol")
     (version (git-version "1.61" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/elp-revive/auto-highlight-symbol")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "04iz99x942i5awngj6fdshm2jh1ghnm47sck6xflj17pa2rzjyp4"))))
     (build-system emacs-build-system)
     (arguments
      (list
       #:tests? #f))
     (propagated-inputs (list emacs-ht))
     (home-page "https://github.com/elp-revive/auto-highlight-symbol")
     (synopsis "Automatic highlighting current symbol minor mode")
     (description
      "Minor mode for Emacs for automatic highlighting current symbol minor
 mode:
   * automatic highlighting current symbol like eclipse IDE.
   * cycle through highlighted locations.
   * can specify the range to highlight.
   * can edit the highlighted symbols at a time.")
     (license license:gpl3+))))

#|
(load "/home/bost/dev/dotfiles/guix/home/utils.scm")
(load "/home/bost/dev/guix-packages/packages/bost/packages/emacs-xyz.scm")
(use-modules (guix store)
             (guix derivations)
             (guix packages)
             (guix utils)
             (guix git)
             (guix git-download)
             ((guix licenses) #:prefix license:)
             (guix build-system emacs)
             (gnu packages emacs-xyz)
             (gnu packages mail)
             (bost gnu packages emacs-xyz)
             (utils)
             ;; ((utils) #:prefix bo:)
             )
(build emacs-copilot)
(build emacs-pythonic)
|#

(define-public emacs-lsp-mode
  (package
    (inherit (@(gnu packages emacs-xyz) emacs-lsp-mode))
    (name "emacs-lsp-mode")
    ;; TODO how to inherit from arguments
    (arguments
     (list
      #:emacs emacs                   ;need libxml support
      #:test-command #~(list "ert-runner"
                             "-L" "."
                             "-L" "clients"
                             "-t" "!no-win"
                             "-t" "!org")
      #:modules '((guix build emacs-build-system)
                  (guix build utils)
                  (guix build emacs-utils)
                  ((bost guix build emacs-utils) #:prefix bst:))
      #:imported-modules `(,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils)
                           (bost guix build emacs-utils))
      #:phases
      #~(modify-phases %standard-phases
          ;; Move libraries to the top-level.
          (add-after 'unpack 'move-libraries
            (lambda _
              ;; REVIEW; Improve style, pair-for-each ?
              (for-each (lambda (d)
                          (for-each (lambda (f)
                                      (rename-file f (basename f)))
                                    (find-files d "\\.el$")))
                        (list "use-package/" "clients/"))))
          (add-before 'check 'skip-failing-tests
            (lambda _
              (substitute* "test/lsp-mock-server-test.el"
                (("\\(ert-deftest lsp-mock-server-reports.*" all)
                 (string-append all "(skip-unless nil)"))
                (("\\(ert-deftest lsp-mock-server-updates-.*" all)
                 (string-append all "(skip-unless nil)")))
              (substitute* "test/lsp-common-test.el"
                (("\\(require 'elenv" all)
                 (string-append all " nil t"))
                (("\\(ert-deftest lsp--path-to-uri-1 .*" all)
                 (string-append all "(skip-unless (featurep 'elenv))"))
                (("\\(ert-deftest lsp-byte-compilation-test .*" all)
                 (string-append all "(skip-unless nil)"))
                (("\\(ert-deftest lsp--build-.*-response-test-[34] .*" all)
                 (string-append all "(skip-unless nil)")))
              (substitute* "test/lsp-mode-test.el"
                (("\\(ert-deftest lsp--merge-results .*" all)
                 (string-append all "(skip-unless nil)")))
              (substitute* "test/lsp-integration-test.el"
                (("\\(ert-deftest lsp-.*-hover-request(-tick)? .*" all)
                 (string-append all "(skip-unless nil)"))
                (("\\(ert-deftest lsp-test-current-buffer-mode .*" all)
                 (string-append all "(skip-unless nil)")))
              (delete-file "test/lsp-clangd-test.el")))
          (add-before 'check 'set-home
            (lambda _ (setenv "HOME" (getenv "TMPDIR"))))
          (add-after 'unpack 'enable-plists
            (lambda _
              (substitute* "lsp-protocol.el"
                ;; This is faster, and it's officially recommended,
                ;; and it's required by emacs-lsp-booster.
                ;; See also:
                ;; <https://emacs-lsp.github.io/lsp-mode/page/performance/>.
                (("\\(getenv \"LSP_USE_PLISTS\"\\)") "t"))))
          (add-before 'move-libraries 'fix-patch-el-files
            ;; /bin/ksh is only used on macOS, which we don't support, so we
            ;; don't want to add it as input.
            (lambda _
              (substitute* '("clients/lsp-csharp.el"
                             "clients/lsp-fsharp.el")
                (("/bin/ksh") "ksh"))))
          (add-after 'ensure-package-description 'add-needed-pkg-descriptions
            (lambda* (#:key outputs #:allow-other-keys)
              (map bst:write-pkg-file
                   (list
                    "lsp-mode"
                    ;; "lsp"
                    ;; "lsp-actionscript"
                    ;; "lsp-ada"
                    ;; "lsp-angular"
                    ;; "lsp-ansible"
                    ;; "lsp-asm"
                    ;; "lsp-astro"
                    ;; "lsp-autotools"
                    ;; "lsp-awk"
                    ;; "lsp-bash"
                    ;; "lsp-beancount"
                    ;; "lsp-bufls"
                    ;; "lsp-c3"
                    ;; "lsp-camel"
                    ;; "lsp-clangd"
                    ;; "lsp-clojure"
                    ;; "lsp-cmake"
                    ;; "lsp-cobol"
                    ;; "lsp-completion"
                    ;; "lsp-copilot"
                    ;; "lsp-credo"
                    ;; "lsp-crystal"
                    ;; "lsp-csharp"
                    ;; "lsp-css"
                    ;; "lsp-cucumber"
                    ;; "lsp-cypher"
                    ;; "lsp-d"
                    ;; "lsp-dhall"
                    ;; "lsp-diagnostics"
                    ;; "lsp-dired"
                    ;; "lsp-doc"
                    ;; "lsp-dockerfile"
                    ;; "lsp-dot"
                    ;; "lsp-earthly"
                    ;; "lsp-elixir"
                    ;; "lsp-elm"
                    ;; "lsp-emmet"
                    ;; "lsp-erlang"
                    ;; "lsp-eslint"
                    ;; "lsp-fennel"
                    ;; "lsp-fortran"
                    ;; "lsp-fsharp"
                    ;; "lsp-futhark"
                    ;; "lsp-gdscript"
                    ;; "lsp-generate-bindings"
                    ;; "lsp-generate-settings"
                    ;; "lsp-gleam"
                    ;; "lsp-glsl"
                    ;; "lsp-go"
                    ;; "lsp-golangci-lint"
                    ;; "lsp-graphql"
                    ;; "lsp-groovy"
                    ;; "lsp-hack"
                    ;; "lsp-haxe"
                    ;; "lsp-headerline"
                    ;; "lsp-html"
                    ;; "lsp-hy"
                    ;; "lsp-icons"
                    ;; "lsp-ido"
                    ;; "lsp-idris"
                    ;; "lsp-iedit"
                    ;; "lsp-inline-completion"
                    ;; "lsp-javascript"
                    ;; "lsp-jq"
                    ;; "lsp-json"
                    ;; "lsp-jsonnet"
                    ;; "lsp-kotlin"
                    ;; "lsp-kubernetes-helm"
                    ;; "lsp-lens"
                    ;; "lsp-lisp"
                    ;; "lsp-lua"
                    ;; "lsp-magik"
                    ;; "lsp-markdown"
                    ;; "lsp-marksman"
                    ;; "lsp-matlab"
                    ;; "lsp-mdx"
                    ;; "lsp-meson"
                    ;; "lsp-mint"
                    ;; "lsp-modeline"
                    ;; "lsp-mojo"
                    ;; "lsp-move"
                    ;; "lsp-nextflow"
                    ;; "lsp-nginx"
                    ;; "lsp-nim"
                    ;; "lsp-nix"
                    ;; "lsp-nushell"
                    ;; "lsp-ocaml"
                    ;; "lsp-odin"
                    ;; "lsp-openscad"
                    ;; "lsp-perl"
                    ;; "lsp-perlnavigator"
                    ;; "lsp-php"
                    ;; "lsp-pls"
                    ;; "lsp-postgres"
                    ;; "lsp-prolog"
                    ;; "lsp-protocol"
                    ;; "lsp-purescript"
                    ;; "lsp-pwsh"
                    ;; "lsp-pyls"
                    ;; "lsp-pylsp"
                    ;; "lsp-python-ty"
                    ;; "lsp-qml"
                    ;; "lsp-r"
                    ;; "lsp-racket"
                    ;; "lsp-remark"
                    ;; "lsp-rf"
                    ;; "lsp-roc"
                    ;; "lsp-roslyn"
                    ;; "lsp-rpm-spec"
                    ;; "lsp-rubocop"
                    ;; "lsp-ruby-lsp"
                    ;; "lsp-ruby-syntax-tree"
                    ;; "lsp-ruff"
                    ;; "lsp-rust"
                    ;; "lsp-semantic-tokens"
                    ;; "lsp-semgrep"
                    ;; "lsp-sml"
                    ;; "lsp-solargraph"
                    ;; "lsp-solidity"
                    ;; "lsp-sorbet"
                    ;; "lsp-sql"
                    ;; "lsp-sqls"
                    ;; "lsp-start-plain"
                    ;; "lsp-steep"
                    ;; "lsp-svelte"
                    ;; "lsp-terraform"
                    ;; "lsp-test-utils"
                    ;; "lsp-tex"
                    ;; "lsp-tilt"
                    ;; "lsp-toml"
                    ;; "lsp-toml-tombi"
                    ;; "lsp-trunk"
                    ;; "lsp-ts-query"
                    ;; "lsp-ttcn3"
                    ;; "lsp-typeprof"
                    ;; "lsp-typespec"
                    ;; "lsp-use-package"
                    ;; "lsp-v"
                    ;; "lsp-vala"
                    ;; "lsp-verilog"
                    ;; "lsp-vetur"
                    ;; "lsp-vhdl"
                    ;; "lsp-vimscript"
                    ;; "lsp-volar"
                    ;; "lsp-wgsl"
                    ;; "lsp-xml"
                    ;; "lsp-yaml"
                    ;; "lsp-yang"
                    ;; "lsp-zig"
                    )))))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-ht
      emacs-hydra
      emacs-markdown-mode
      emacs-spinner
      ))))

(define-public emacs-lsp-ui
  (let ((commit "a0dde8b52b4411cbac2eb053ef1515635ea0b7ed")
        (revision "0"))
    (package
      (name "emacs-lsp-ui")
      (version (git-version "9.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-ui.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0zyv1rar9vmxxs5n0mly5m9k5m8gia85c8c5rjap8fvrrbmjcfaa"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-lsp-mode
        emacs-markdown-mode
        emacs-flycheck
        ))
      (home-page "https://github.com/emacs-lsp/lsp-ui")
      (synopsis "User interface extensions for @code{lsp-mode}")
      (description
       "@code{LSP-ui} contains several enhancements and integrations for
@code{lsp-mode}, such as visual flychecking, displaying references in-line,
and code peeking.")
      (license license:gpl3+))))

(define-public emacs-lsp-haskell
  (let ((commit "081d5115ceb1f1647497a8a3de4ca0702aaadb48")
        (revision "0"))
    (package
      (name "emacs-lsp-haskell")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-haskell.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cjxf2xqdmhi1mq4d1k4k8xh1lqglr8s6r1yw12b8956sjm9ykv9"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-haskell-mode
        emacs-lsp-mode
        ))
      (home-page "https://github.com/emacs-lsp/lsp-haskell")
      (synopsis "LSP client integration for Haskell in Emacs")
      (description
       "Emacs integration for the Haskell Language Server (HLS) via lsp-mode.
  It facilitates features such as code completion,diagnostics, and formatting
 by launching and configuring HLS automatically.  Users can customize server
 settings through Emacs' customization system, and support is provided for
 both haskell-mode and haskell-literate-mode.")
      (license license:gpl3+))))

(define-public emacs-lsp-pyright
  (let ((commit "73377169beff8fe22cc6d52d65099db88bf49679")
        (revision "0"))
    (package
      (name "emacs-lsp-pyright")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-pyright.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1nbvl850ifnzfbncbl9wvarbh3l8r3yapj6c0pxk2r5b9mifgp75"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-ht
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-lsp-mode
        ))
      (home-page "https://github.com/emacs-lsp/lsp-pyright")
      (synopsis "LSP client integration for Python using (Based)Pyright")
      (description
       "This package integrates the Pyright and BasedPyright language servers
 with Emacs' lsp-mode, providing advanced Python language support.  It offers
features such as type checking, auto-import completions, inlay hints, and
diagnostics.  The package automatically detects virtual environments and
supports extensive customization through Emacs variables and
pyrightconfig.json.")
      (license license:gpl3+))))

(define-public emacs-lsp-origami
  (let ((commit "f757a7b45538b6cf1da04183e99171e59e92c9a7")
        (revision "0"))
    (package
      (name "emacs-lsp-origami")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-origami.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "05lfm13bg7na7p0372p5arjbyr9m9fyrq3v7q1aavrg6vd2bdc6q"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-lsp-mode
        emacs-origami
        ))
      (home-page "https://github.com/emacs-lsp/lsp-origami")
      (synopsis "Origami-based code folding integration for lsp-mode in Emacs")
      (description
       "This package integrates origami.el with Emacs' lsp-mode by utilizing
 the Language Server Protocol's textDocument/foldingRange feature.  It enables
 structural code folding based on language server data, providing accurate and
 efficient folding capabilities.  Users can activate it by adding
 `lsp-origami-try-enable` to `lsp-after-open-hook`, enhancing code navigation
 and readability.")
      (license license:gpl3+))))

(define-public emacs-lsp-python-ms
  (let ((commit "7bda327bec7b219d140c34dab4b1e1fbd41bc516")
        (revision "0"))
    (package
      (name "emacs-lsp-python-ms")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-python-ms.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1i7l06cw25fb202fbhqhx8xyfynz6sinka9ybh8n4cxjq19ffm8b"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-lsp-mode))
      (home-page "https://github.com/emacs-lsp/lsp-python-ms")
      (synopsis "LSP client integration for Microsoft's Python Language
 Server in Emacs")
      (description
       "This package integrates Microsoft's Python Language Server with Emacs'
 lsp-mode, providing features such as code completion, diagnostics, and
 navigation for Python development.  It is now deprecated in favor of
 lsp-pyright, which offers improved performance and ongoing support.")
      (license license:bsd-3))))

(define-public emacs-lsp-lens
  (package
    (inherit
     emacs-lsp-mode
     )
    (name "emacs-lsp-lens")))

(define-public emacs-lsp-protocol
  (package
    (inherit
     emacs-lsp-mode
     )
    (name "emacs-lsp-procotol")))

;; bat -r 75388:75410 /home/bost/dev/guix-emacs/emacs/packages/melpa.scm
(define-public emacs-lsp-latex
  (let ((commit "36a37a8e0a6b0edbea8e67dab89d12980d2a368f")
        (revision "0"))
    (package
      (name "emacs-lsp-latex")
      (version (git-version "3.10.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ROCKTAKEY/lsp-latex.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0yfmqjp1bmp8rp9vl9y5qmic3wr2f5p10gyb2rlmpgfnx5c8575g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-consult
        emacs-lsp-mode
        ))
      (home-page "https://github.com/ROCKTAKEY/lsp-latex")
      (synopsis "Enhanced LSP support for LaTeX in Emacs using Texlab")
      (description
       "This package provides comprehensive Language Server Protocol (LSP)
 support for LaTeX editing in Emacs, utilizing the Texlab server. It extends
 the basic functionality offered by lsp-mode's lsp-tex.el, delivering features
 such as real-time syntax checking, code completion, and document formatting.
 Additionally, it supports forward and inverse search between Emacs and PDF
 viewers, enhancing the LaTeX editing workflow.")
      (license license:gpl3+))))

(define-public emacs-org-cliplink
  (let ((commit "13e0940b65d22bec34e2de4bc8cba1412a7abfbc")
        (revision "0"))
    (package
      (name "emacs-org-cliplink")
      (version (git-version "0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/rexim/org-cliplink")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1avyiw8vlv4n1r7zqvc6wjlsz7jl2pqaprzpm782gzp0c999pssl"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-curl-executable
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "org-cliplink-transport.el"
                  (("\\(executable-find \"curl\"\\)")
                   (let ((curl (search-input-file inputs "/bin/curl")))
                     (string-append "\"" curl "\""))))))
            (add-before 'check 'fix-failing-test
              ;; XXX: Fix randomly (!) failing test, which doesn't account for
              ;; the fact that (random) may return a negative number.
              (lambda _
                (substitute* "test/org-cliplink-transport-test.el"
                  (("curl-rexim.me-\\[a-z0-9\\]\\+")
                   "curl-rexim.me--?[a-z0-9]+")))))))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-el-mock)
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        (@(bost gnu packages emacs-build) emacs-undercover)
        ))
      (inputs
       (list curl))
      (home-page "https://github.com/rexim/org-cliplink/")
      (synopsis "Insert Org mode links from the clipboard")
      (description
       "Org Cliplink provides a simple command that takes a URL from the
clipboard and inserts an Org mode link with a title of a page found by the URL
into the current buffer.")
      (license license:expat))))

(define-public emacs-terminal-here
  (package
    (name "emacs-terminal-here")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/davidshepherd7/terminal-here")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1iv1c2mbvhn00ha46c6f98j9syc71xhjpk8m5wa5p32sk4wcc9f4"))))
    (build-system emacs-build-system)
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-el-mock)
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      emacs-validate
      ))
    (home-page "https://github.com/davidshepherd7/terminal-here")
    (synopsis "Open external terminals from Emacs")
    (description
     "This package provides commands to open external terminal emulators from
Emacs, whose initial working directories are determined in relation to the
current buffer.")
    (license license:gpl3+)))

(define-public emacs-dumb-jump
  (package
    (name "emacs-dumb-jump")
    (version "0.5.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jacktasia/dumb-jump")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18d2ll5wlll6pm909hiw8w9ijdbrjvy86q6ljzx8yyrjphgn0y1y"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f                      ; FIXME: Tests freeze when run.
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-shell
           (lambda _
             ;; Setting the SHELL environment variable is required for the
             ;; tests to find sh.
             (setenv "SHELL" (which "sh")))))))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-el-mock)
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      emacs-noflet
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-popup
      ))
    (home-page "https://github.com/jacktasia/dumb-jump")
    (synopsis "Jump to definition for multiple languages without configuration")
    (description "Dumb Jump is an Emacs \"jump to definition\" package with
support for multiple programming languages that favors \"just working\" over
speed or accuracy.  This means minimal --- and ideally zero --- configuration
with absolutely no stored indexes (tags) or persistent background processes.
Dumb Jump performs best with The Silver Searcher @command{ag} or ripgrep
@command{rg} installed.")
    (license license:gpl3+)))

(define-public emacs-repo
  (let ((commit "1572f3ee82eaadc06e741f03e1889281308c79fa")
        (revision "0"))
    (package
      (name "emacs-repo")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/canatella/repo-el.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0y8j3hf5r69fxj2vsbaxwr9qdchddn53w25xzmxv1kfh6hbagzv3"))))
      (build-system emacs-build-system)
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-el-mock)
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-magit))
      (home-page "https://github.com/canatella/repo-el")
      (synopsis "Emacs interface for the Google Repo tool")
      (description "This package provides integration of the Google Repo tool
with emacs.  It displays the output of the @code{repo status} command in a
buffer and launches Magit from the status buffer for the project at point.")
      (license license:gpl3+))))

(define-public emacs-google-translate
  (package
    (name "emacs-google-translate")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atykhonov/google-translate/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0rwpij2bm8d4jq2w5snkp88mfryplw8166dsrjm407n2p6xr48zx"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-bump-version
            (lambda* (#:key inputs #:allow-other-keys)
              ;; Needed for `guix build --with-input=emacs-minimal=emacs emacs-google-translate`
              (substitute* ".bump-version.el"
                (("^") ";; -*- no-byte-compile: t -*-\n"))))
          (add-before 'check 'disable-failing-tests
            (lambda _
              (let-syntax
                  ((disable-tests
                    (syntax-rules ()
                      ((_ file ())
                       (syntax-error "test names list must not be empty"))
                      ((_ file (test-name ...))
                       (substitute* file
                         (((string-append "^\\(ert-deftest " test-name ".*") all)
                          (string-append all "(skip-unless nil)\n")) ...)))))
                ;; These tests fail due to a missing requirement:
                ;;   (void-function facemenu-set-face)
                (disable-tests
                 "test/google-translate-core-ui-test.el"
                 ("test-google-translate--suggestion"
                  "test-google-translate--text-phonetic/show-phonetic"
                  "test-google-translate--translation-phonetic/show-phonetic"
                  "test-google-translate--translated-text"))))))))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-el-mock)
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (home-page "https://github.com/atykhonov/google-translate")
    (synopsis "Emacs interface to Google Translate")
    (description
     "This package provides an Emacs interface to the Google Translate
on-line service.")
    (license license:gpl3+)))

(define-public emacs-lsp-volar
  (package
    (name "emacs-lsp-volar")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/jadestrong/lsp-volar")
              (commit
               "6f0c2bc3be5fc4d8d8aa1cf5ee3546fcf6ef36be")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0bvma47dhnsipf3rdxlb5m040a40dxpkpbh7jcbr21r4g6z3xmlr"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-lsp-mode))
    (home-page
     "https://github.com/jadestrong/lsp-volar")
    (synopsis "Language support for Vue3")
    (description "Language support for Vue3
This package has been merged into lsp-mode, so you can use lsp-mode
directly. There will only be some experimental updates here. Once stable, they
will be submitted to lsp-mode.")
    (license license:gpl3+)))

(define-public emacs-helm-lsp
  (let ((commit "54926afd10da52039f8858a99d426cae2aa4c07d")
        (revision "0"))
    (package
      (name "emacs-helm-lsp")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/helm-lsp.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0x3fwp059whrrqmdciacvchin5pfkvdv93ayw9vhvxzispp5nyw7"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-helm
        emacs-lsp-mode
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/emacs-lsp/helm-lsp")
      (synopsis "Provide LSP-enhanced completion for symbols")
      (description
       "This package enhances @code{helm} with completion for symbols from
workspaces with a LSP-compliant server running.")
      (license license:gpl3+))))

(define-public emacs-lsp-docker
  (let ((commit "ff41f4a76b640d39dc238bacba7f654c297827fa")
        (revision "0"))
    (package
      (name "emacs-lsp-docker")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/emacs-lsp/lsp-docker.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1frlfcy5vwn8rprgfyrh2qjp2cwwyjsgsp112cxws98s91601v1j"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-lsp-mode
        emacs-yaml
        ))
      (home-page "https://github.com/emacs-lsp/lsp-docker")
      (synopsis "Leverage LSP mode in Docker environment")
      (description
       "This package provides scripts and configurations to leverage LSP mode
in Docker environment.")
      (license license:gpl3+))))

(define-public emacs-dap-mode
  (let ((commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0"))
    (package
      (name "emacs-dap-mode")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cgqhv036fzcv9dg89k5czcfx5w56jkm4rm216lra004nph0sj82"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include #~(cons* "\\.png$" %default-include)))
      (propagated-inputs
       (list
        emacs-bui
        emacs-lsp-docker
        emacs-lsp-mode
        emacs-posframe
        emacs-lsp-treemacs
        ))
      (home-page "https://emacs-lsp.github.io/dap-mode")
      (synopsis "Emacs client/library for Debug Adapter Protocol")
      (description
       "Dap mode is an Emacs client/library for Debug Adapter
Protocol (DAP), a wire protocol for communication between client and
debug server.  It is similar to the LSP but provides integration with
Debug server.")
      (license license:gpl3+))))

(define emacs-dap-base
  (let ((commit "b97756665709bea37b9ffe262c5fa9196f1b4577")
        (revision "0"))
    (package
      (name "emacs-dap-base")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/dap-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cgqhv036fzcv9dg89k5czcfx5w56jkm4rm216lra004nph0sj82"))))
      (build-system emacs-build-system)
      (arguments
       (list
;;; Exclusions are done on top of the inclusions. However using (inherit
;;; emacs-dap-base) we can effectivelly invert that. So then the order is will
;;; be:
;;; 1. emacs-dap-base include
;;; 2. emacs-dap-base exclude
;;; 3. emacs-dap-<..> include

        ;; Exclude all el-files in the working directory. el-files in the
        ;; subdirectories are NOT excluded.
        ;; Also, matching every string except "foo" using lookahead assertion
        ;; "^\\(?!foo$\\).*" doesn't work. Lookahead assertions are not
        ;; supported in POSIX regular expressions used by Guile
        #:exclude #~(cons*
                     "^[^/]*\\.el$"
                     %default-exclude)))
      (home-page "https://github.com/emacs-lsp/dap-mode")
      (synopsis "Debug Adapter Protocol client integration for Emacs")
      (description
       "Emacs client for the Debug Adapter Protocol (DAP),enabling interactive
debugging capabilities within the editor.  It integrates with lsp-mode and
supports various programming languages, including Java,Python, Ruby, Elixir,
and C/C++.  Features include breakpoints, call stacks,variable inspection, and
a hydra-based UI for controlling debug sessions. Users can define reusable
debug templates and configure per-language adapters to streamline the
debugging workflow.")
      (license license:gpl3+))))

(define all-info-include (quote (list "^[^/]*\\.info$" "^doc/.*\\.info$")))

(define-public emacs-dap-launch
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-launch")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-launch\\.el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-dap-tasks
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-tasks")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-tasks.\\el$"
                       ,all-info-include)))
    (propagated-inputs (list emacs-lsp-mode))))

(define-public emacs-dap-overlays
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-overlays")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                       "^dap-overlays\\.el$"
                       ,all-info-include)))))

(define-public emacs-dap-utils
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-utils")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                  "^dap-utils\\.el$"
                  ,all-info-include)))
    (propagated-inputs (list emacs-dap-mode))))

(define-public emacs-dap-chrome
  (package
    (inherit emacs-dap-base)
    (name "emacs-dap-chrome")
    (arguments
     (list
      #:tests? #f
      #:include `(cons*
                  "^dap-chrome\\.el$"
                  ,all-info-include)))
    (propagated-inputs
     (list
      emacs-dap-utils
      emacs-dap-mode
      ))))

(define-public emacs-treemacs
  (let ((commit "820b09db106a48db76d95e3a266d1e67ae1b6bdb")
        (revision "0"))
    (package
      (name "emacs-treemacs")
      (version (git-version "3.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Alexander-Miller/treemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1gmp3dvji3ank0qh0fhygla2iy9pc2pg07d342wzs1mysgcdj2l8"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "make" "-C" "../.." "test")
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'fix-makefile
              (lambda _
                (substitute* "Makefile"
                  (("@\\$\\(CASK\\) exec ") "")
                  ;; Guix does not need to prepare dependencies before testing.
                  (("test: prepare") "test:"))))
            (add-after 'fix-makefile 'chdir-elisp
              ;; Elisp directory is not in root of the source.
              (lambda _
                (chdir "src/elisp")))
            (add-before 'install 'patch-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (make-file-writable "treemacs-core-utils.el")
                (emacs-substitute-variables "treemacs-core-utils.el"
                  ("treemacs-dir" (string-append #$output "/")))
                (make-file-writable "treemacs-icons.el")
                (substitute* "treemacs-icons.el"
                  (("icons/default")
                   (string-append (elpa-directory #$output) "/icons/default")))
                (make-file-writable "treemacs-customization.el")
                (emacs-substitute-variables "treemacs-customization.el"
                  ("treemacs-python-executable"
                   (search-input-file inputs "/bin/python3")))
                (make-file-writable "treemacs-async.el")
                (substitute* "treemacs-async.el"
                  (("src/scripts")
                   (string-append (elpa-directory #$output) "/scripts")))))
            (add-after 'install 'install-data
              (lambda _
                (with-directory-excursion "../.." ;treemacs root
                  (copy-recursively
                   "icons/default"
                   (string-append (elpa-directory #$output) "/icons/default"))
                  (copy-recursively
                   "src/scripts"
                   (string-append (elpa-directory #$output) "/scripts"))
                  ;; (copy-recursively
                  ;;  "src/extra"
                  ;;  (string-append (elpa-directory #$output) "/extra"))
                  )))
            ;; (add-after 'ensure-package-description 'add-needed-pkg-descriptions
            ;;   (lambda* (#:key outputs #:allow-other-keys)
            ;;     ;; (format #t "(getcwd) : ~a\n" (getcwd))
            ;;     ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
            ;;     (bst:write-pkg-file "treemacs-treelib")
            ;;     (with-directory-excursion "../extra"
            ;;       (bst:write-pkg-file "treemacs-all-the-icons")
            ;;       (bst:write-pkg-file "treemacs-evil")
            ;;       (bst:write-pkg-file "treemacs-icons-dired")
            ;;       (bst:write-pkg-file "treemacs-magit")
            ;;       (bst:write-pkg-file "treemacs-mu4e")
            ;;       (bst:write-pkg-file "treemacs-persp")
            ;;       (bst:write-pkg-file "treemacs-perspective")
            ;;       (bst:write-pkg-file "treemacs-projectile")
            ;;       (bst:write-pkg-file "treemacs-tab-bar")
            ;;       )))
            )))
      (native-inputs
       (list
        emacs-buttercup
        (@(bost gnu packages emacs-build) emacs-el-mock)
        ))
      (inputs
       (list
        python
        ))
      (propagated-inputs
       (list
        ;; emacs-projectile    ; for src/extra
        ;; emacs-perspective   ; for src/extra
        ;; emacs-persp-mode    ; for src/extra
        ;; mu                  ; for src/extra ; emacs-lisp package providing mu4e
        ;; emacs-magit         ; for src/extra
        ;; emacs-evil          ; for src/extra
        ;; emacs-all-the-icons ; for src/extra
        emacs-ace-window
        emacs-cfrs
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-ht
        emacs-hydra
        emacs-pfuture
        emacs-s))
      (home-page "https://github.com/Alexander-Miller/treemacs")
      (synopsis "Emacs tree style file explorer")
      (description
       "Treemacs is a file and project explorer similar to NeoTree or Vim's
NerdTree, but largely inspired by the Project Explorer in Eclipse.  It shows
the file system outlines of your projects in a simple tree layout allowing
quick navigation and exploration, while also possessing basic file management
utilities.")
      (license license:gpl3+))))

(define-public emacs-treemacs-extra
  (package
    (inherit emacs-treemacs)
    (name "emacs-treemacs-extra")
    (arguments
     (substitute-keyword-arguments
         (package-arguments emacs-treemacs)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'chdir-elisp 'copy-extra
              (lambda _
                (copy-recursively "../extra" ".")))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "treemacs-all-the-icons")
                (bst:write-pkg-file "treemacs-evil")
                (bst:write-pkg-file "treemacs-icons-dired")
                (bst:write-pkg-file "treemacs-magit")
                (bst:write-pkg-file "treemacs-mu4e")
                (bst:write-pkg-file "treemacs-persp")
                (bst:write-pkg-file "treemacs-perspective")
                (bst:write-pkg-file "treemacs-projectile")
                (bst:write-pkg-file "treemacs-tab-bar")))
            ))))
    (propagated-inputs
     (modify-inputs (package-propagated-inputs emacs-treemacs)
       (append
        emacs-all-the-icons
        emacs-evil
        emacs-magit
        emacs-projectile
        emacs-persp-mode
        emacs-perspective
        mu           ; emacs-lisp package which provides mu4e
        )))))

(define-public emacs-treemacs-evil
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-evil")))

(define-public emacs-treemacs-icons-dired
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-icons-dired")))

(define-public emacs-treemacs-magit
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-magit")))

(define-public emacs-treemacs-persp
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-persp")))

(define-public emacs-treemacs-projectile
  (package
    (inherit emacs-treemacs-extra)
    (name "emacs-treemacs-projectile")))

(define-public emacs-lsp-java
  (let ((commit "21c89243adfca4b70e244b0a10cfaa0cd78c61e7")
        (revision "1"))
    (package
      (name "emacs-lsp-java")
      (version (git-version "3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-java.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mp99vyi104r3jm4dlg0c9ri6w543h70mi5qq797xlb70n3sxqw3"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-dap-mode
        emacs-lsp-mode
        emacs-markdown-mode
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-ht
        emacs-request
        emacs-treemacs
        ))
      (home-page "https://github.com/emacs-lsp/lsp-java/")
      (synopsis "Java support for lsp-mode")
      (description "Emacs Java IDE using Eclipse JDT Language Server.")
      (license license:gpl3+))))

(define-public emacs-lean4-mode
  (let ((commit "76895d8939111654a472cfc617cfd43fbf5f1eb6")
        (revision "0"))
    (package
      (name "emacs-lean4-mode")
      (version (git-version "1.1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/leanprover-community/lean4-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1i4l614n0hs02y0a4xfnzc4xkilkp6bzx28pys4jkp96vp2ivf0c"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      ;; TODO: Just emacs-magit-section instead of emacs-magit would be enough.
      (propagated-inputs
       (list
        emacs-compat
        emacs-lsp-mode
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-magit
        ))
      (synopsis "Lean 4 major mode for Emacs")
      (description "This package provides a major mode for the Lean theorem
prover, version 4.")
      (home-page "https://lean-lang.org/")
      (license license:asl2.0))))


(define-public emacs-lsp-metals
  (let ((commit "e1d9d04f3bab7e6e74916054b36ab1a87e831367")
        (revision "0"))
    (package
      (name "emacs-lsp-metals")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-metals.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00jyy2aqbci9k9x4rxxadpwlkpajg0xp0600ddk630nxfnr77vbv"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                ;; (format #t "(getcwd) : ~a\n" (getcwd))
                ;; /tmp/guix-build-emacs-treemacs-3.2-0.820b09d.drv-0/source/src/elisp
                (bst:write-pkg-file "lsp-metals-protocol")
                (bst:write-pkg-file "lsp-metals-treeview")
                )))))
      (propagated-inputs
       (list
        emacs-scala-mode
        emacs-lsp-mode
        emacs-lsp-treemacs
        emacs-dap-mode
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-ht
        emacs-treemacs
        ))
      (home-page "https://github.com/emacs-lsp/lsp-metals")
      (synopsis "Scala support for LSP mode")
      (description "This package is an Emacs Scala IDE using LSP mode to connect
to Metals.")
      (license license:gpl3+))))

(define-public emacs-lsp-treemacs
  (let ((commit "3e5550f278db74f15ebe34add0138b138207ec08")
        (revision "0"))
    (package
      (name "emacs-lsp-treemacs")
      (version (git-version "0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-lsp/lsp-treemacs.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dkbq1sc1xwlvy1baxc4px9yi6lp614nl3n9vidpxsmbryaapimq"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:include #~(cons "^icons\\/" %default-include)
        )
       )
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-ht
        emacs-treemacs
        emacs-lsp-mode
        ))
      (home-page "https://github.com/emacs-lsp/lsp-treemacs")
      (synopsis "Integration between LSP mode and treemacs")
      (description
       "This package provides integration between LSP mode and treemacs, and
implementation of treeview controls using treemacs as a tree renderer.")
      (license (list license:gpl3+
                     license:cc-by4.0  ; microsoft/vscode-icons
                     license:expat)))))

(define* (%emacs-lsp-treemacs-upstream-source #:key commit version hash)
  (origin
    (method git-fetch)
    (uri (git-reference
           (url "https://github.com/emacs-lsp/lsp-treemacs")
           (commit commit)))
    (file-name (git-file-name "emacs-lsp-treemacs" version))
    (hash hash)))

(define-public emacs-pdf-tools
  (package
    (name "emacs-pdf-tools")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vedang/pdf-tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1v861fpzck3ky21m4g42h6a6y0cbhc4sjzpzqx0zxd7sfi7rn768"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; there are no tests
       #:modules ((guix build gnu-build-system)
                  ((guix build emacs-build-system) #:prefix emacs:)
                  (guix build utils)
                  (guix build emacs-utils)
                  ((bost guix build emacs-utils) #:prefix bst:))
       #:imported-modules (,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils)
                           (bost guix build emacs-utils))
       #:phases
       (modify-phases %standard-phases
         ;; Build server side using 'gnu-build-system'.
         (add-after 'unpack 'enter-server-dir
           (lambda _ (chdir "server")))
         (add-after 'enter-server-dir 'autogen
           (lambda _
             (invoke "bash" "autogen.sh")))
         ;; Build emacs side using 'emacs-build-system'.
         (add-after 'compress-documentation 'enter-lisp-dir
           (lambda _ (chdir "../lisp")))
         (add-after 'enter-lisp-dir 'emacs-patch-variables
           (lambda* (#:key outputs #:allow-other-keys)
             (for-each make-file-writable (find-files "."))

             ;; Set path to epdfinfo program.
             (emacs-substitute-variables "pdf-info.el"
               ("pdf-info-epdfinfo-program"
                (string-append (assoc-ref outputs "out")
                               "/bin/epdfinfo")))
             ;; Set 'pdf-tools-handle-upgrades' to nil to avoid "auto
             ;; upgrading" that pdf-tools tries to perform.
             (emacs-substitute-variables "pdf-tools.el"
               ("pdf-tools-handle-upgrades" '()))))
         (add-after 'enter-lisp-dir 'emacs-make-autoloads
           (assoc-ref emacs:%standard-phases 'make-autoloads))
         (add-after 'emacs-patch-variables 'emacs-expand-load-path
           (assoc-ref emacs:%standard-phases 'expand-load-path))
         (add-after 'emacs-expand-load-path 'emacs-add-install-to-native-load-path
           (assoc-ref emacs:%standard-phases 'add-install-to-native-load-path))
         (add-after 'emacs-add-install-to-native-load-path 'emacs-install
           (assoc-ref emacs:%standard-phases 'install))
         (add-after 'emacs-install 'emacs-build
           (assoc-ref emacs:%standard-phases 'build))
         ;; The `ensure-package-description' is defined in the
         ;; emacs-build-system The `gnu-build-system' doesn't contain it.
         (add-after 'unpack 'add-needed-pkg-descriptions
           (lambda* (#:key outputs #:allow-other-keys)
             (with-directory-excursion "lisp"
               (bst:write-pkg-file "pdf-tools")))))))
    (native-inputs
     (list
      autoconf
      automake
      emacs-minimal
      pkg-config
      ))
    (inputs
     (list
      cairo
      glib
      libpng
      poppler
      zlib
      ))
    (propagated-inputs
     (list
      emacs-tablist
      ))
    (home-page "https://github.com/vedang/pdf-tools")
    (synopsis "Emacs support library for PDF files")
    (description
     "PDF Tools is, among other things, a replacement of DocView for PDF
files.  The key difference is that pages are not pre-rendered by
e.g. ghostscript and stored in the file-system, but rather created on-demand
and stored in memory.")
    (license license:gpl3+)))

(define-public emacs-pdf-view-restore
  (let ((commit "758131fbcba6a16388e6dd6b55eb4a9998f57123")
        (revision "0"))
    (package
      (name "emacs-pdf-view-restore")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/007kevin/pdf-view-restore.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0z7yxc8pls6pc3zzm0g1g3xdrkj8mwjfsf2fvdqnj7cbv8c7krrb"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-pdf-tools))
      (home-page "https://github.com/007kevin/pdf-view-restore")
      (synopsis "Support for opening last known pdf position in pdfview mode")
      (description
       "Support for saving and opening last known pdf position in pdfview mode.
Information will be saved relative to the pdf being viewed so ensure
`pdf-view-restore-filename is in the same directory as the viewing pdf.")
      (license license:gpl3+))))

(define-public emacs-helm
  (let ((commit "7f6137bb8e9fc9415cd1ffc53bb119f1c4ca4cc4")
        (revision "0"))
    (package
      (name "emacs-helm")
      (version (git-version "4.0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "19096kj95yn8l54bmab7b15xg5l1sfbpn8s5dq2dpi40k8flfgkh"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "helm-core")
                (bst:write-pkg-file "helm-easymenu")
                (bst:write-pkg-file "helm-files")
                (bst:write-pkg-file "helm-net")
                )))))
      (propagated-inputs
       (list
        emacs-async
        emacs-popup
        ))
      (home-page "https://emacs-helm.github.io/helm/")
      (synopsis "Incremental completion and selection narrowing framework for Emacs")
      (description
       "Helm is an incremental completion and selection narrowing framework for
Emacs.  It will help steer you in the right direction when you're looking for
stuff in Emacs (like buffers, files, etc).")
      (license license:gpl3+))))

;; 1. <path/to/spacemacs>/layers/+checkers/spell-checking/packages.el requires flyspell-correct-helm
;; 2. flyspell-correct-helm requires helm
;; 3. helm requires helm-core
;; See (configuration-layer//get-package-deps-from-archive 'flyspell-correct-helm)
(define-public emacs-helm-core
  (package
    (inherit emacs-helm)
    (name "emacs-helm-core")))

(define-public emacs-helm-sly
  (let ((commit "3691626c80620e992a338c3222283d9149f1ecb5")
        (revision "0"))
    (package
      (name "emacs-helm-sly")
      (version (git-version "0.7.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-sly.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "06x8wyx1r0s7askkvlbklgz1cszv34qsvv3gryndw350smk1v8kx"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-sly))
      (home-page "https://github.com/emacs-helm/helm-sly")
      (synopsis "Helm for SLY, a Common Lisp interaction mode for Emacs")
      (description "Helm-SLY defines a few new commands:

@itemize
@item @code{helm-sly-list-connections}: Yet another Lisp connection list with
Helm.
@item @code{helm-sly-apropos}: Yet another @command{apropos} with Helm.
@item @code{helm-sly-mini}: Like @command{helm-sly-list-connections}, but
include an extra source of Lisp-related buffers, like the events buffer or the
scratch buffer.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-slime
  (let ((commit "7886cc49906a87ebd73be3b71f5dd6b1433a9b7b")
        (revision "0"))
    (package
      (name "emacs-helm-slime")
      (version (git-version "0.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-slime.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1g9fnp818d677xhx2m4820742fyblvmnsygmkdb5530lacdaksh2"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-slime))
      (home-page "https://github.com/emacs-helm/helm-slime")
      (synopsis "Helm for SLIME, the Superior Lisp Interaction Mode for Emacs")
      (description "Helm-SLIME defines a few new commands:

@itemize
@item helm-slime-complete: Select a symbol from the SLIME completion systems.
@item helm-slime-list-connections: Yet another slime-list-connections with Helm.
@item: helm-slime-apropos: Yet another slime-apropos with Helm.
@item helm-slime-repl-history: Select an input from the SLIME REPL history and insert it.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-ls-git
  (let ((commit "754c0c27a11a416a1589ea67be7cd57ce5017d02")
        (revision "0"))
    (package
      (name "emacs-helm-ls-git")
      (version (git-version "1.9.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-ls-git.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0mx9mwgldmky4alyk0rc0908cih2ndpd4lxqrfj7m291dyxik458"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-ls-git")
      (synopsis "Helm interface for listing the files in a Git repository")
      (description
       "This package provides a Helm interface for Git files.
@itemize
@item Display the open buffers in project.
@item Display a status source showing state of project (modified files etc.).
@item Display a list of all files in project under git control.
@item Quickly look at diffs of modified files.
@item Allow switching to @code{git status} with your preferred frontend
(vc-dir, Magit,etc.).
@item Full integration of git-grep, also allow usage of @code{helm-grep} (you
can use ack-grep instead of grep).
@item Integrate usage of gid from id-utils.
@item Full integration with @code{helm-find-files}, allow you to browse
projects unrelated to current-buffer.
@item In addition, all actions of type files and buffers are provided.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-helm-company
  (let ((commit "033be73f21778633813264ce1634a6e1ad873d8e")
        (revision "0"))
    (package
      (name "emacs-helm-company")
      (version (git-version "0.2.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Sodel-the-Vociferous/helm-company.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0lschnr15c39bnfvm2zdp7f3qvyzrdk8gzzwcb1g2d9jy3mkcq05"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        emacs-company
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (arguments
       (list #:tests? #t
             #:test-command #~(list "ert-runner")))
      (home-page "https://github.com/Sodel-the-Vociferous/helm-company")
      (synopsis "Helm interface for Company mode")
      (description
       "This is a Helm interface to Company mode, a text completion framework.")
      (license license:gpl3+))))

(define-public emacs-helm-descbinds
  (let ((commit "c12bc85ef3ce342fe1c78cdd86117c05d5310789")
        (revision "1"))
    (package
      (name "emacs-helm-descbinds")
      (version (git-version "1.13" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-descbinds.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0dfm8a8dc3a75pizkjl6304aqx2m9yaqcjk8j0d802ad0zk31g64"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-descbinds")
      (synopsis "Convenient @code{describe-bindings} with Helm")
      (description
       "This package is a replacement of @code{describe-bindings} for Helm.
@code{describe-bindings} is replaced with @code{helm-descbinds}.  As usual,
type @code{C-h b}, or any incomplete key sequence plus @code{C-h}, to run
@code{helm-descbinds}.  The bindings are presented in a similar way as
@code{describe-bindings} does, but you can use completion to find the command
you searched for and execute it, or view its documentation.")
    (license license:gpl3+))))

;; XXX the repo https://github.com/istib/helm-mode-manager doesn't exist anymore?!?
(define-public emacs-helm-mode-manager
  (package
    (name "emacs-helm-mode-manager")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/istib/helm-mode-manager")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1srx5f0s9x7zan7ayqd6scxfhcvr3nkd4yzs96hphd87rb18apzk"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-helm))
    (home-page "https://github.com/istib/helm-mode-manager/")
    (synopsis "Switch and toggle Emacs major and minor modes using Helm")
    (description "This package provides a Helm interface for toggling Emacs
major or minor mode.

@itemize
@item @code{helm-switch-major-mode} list of all major modes
@item @code{helm-enable-minor-mode} list of all inactive minor modes
@item @code{helm-disable-minor-mode} list of all ACTIVE minor modes
@end itemize\n

Hitting @code{RET} enables the mode, @code{C-z} shows the mode
documentation.")
    (license license:gpl3+)))

(define-public emacs-helm-org-rifle
  (let ((commit "03a52265040b8c6510a8269213d750c451779c38")
        (revision "0"))
    (package
      (name "emacs-helm-org-rifle")
      (version (git-version "1.7.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/helm-org-rifle.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wgphpa9qymrc36i4wniwm9dddx6inmj2mdv7hkb1kbld3b5apsg"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-helm
        emacs-org
        emacs-s
        ))
      (home-page "https://github.com/alphapapa/helm-org-rifle")
      (synopsis "Rifle through Org files")
      (description "This package searches both headings and contents of entries
in Org buffers and displays matching entries.")
      (license license:gpl3+))))

(define-public emacs-helm-system-packages
  (let ((commit "6e02e90ff653f06f2bb469dac09d8c8ac8ce0982")
        (revision "0"))
    (package
      (name "emacs-helm-system-packages")
      (version (git-version "1.10.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-system-packages.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0c988h9sxcrdxriq3lp27vn0sgwdx5ln4l25m03zbi8fik46vr38"))))
      (build-system emacs-build-system)
      (inputs
       (list recutils))
      (propagated-inputs
       (list emacs-helm))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'configure
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let ((recutils (assoc-ref inputs "recutils")))
                 ;; Specify the absolute file names of the various
                 ;; programs so that everything works out-of-the-box.
                 (substitute* "helm-system-packages-guix.el"
                   (("recsel") (string-append recutils "/bin/recsel")))))))))
      (home-page "https://github.com/emacs-helm/helm-system-packages")
      (synopsis "Helm System Packages is an interface to your package manager")
      (description "List all available packages in Helm (with installed
packages displayed in their own respective face).  Fuzzy-search, mark and
execute the desired action over any selections of packages: Install,
uninstall, display packages details (in Org Mode) or insert details at point,
find files owned by packages...  And much more, including performing all the
above over the network.")
      (license license:gpl3+))))

(define-public emacs-helm-xref
  (let ((commit "ea0e4ed8a9baf236e4085cbc7178241f109a53fa")
        (revision "0"))
    (package
      (name "emacs-helm-xref")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/brotzeit/helm-xref.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xbz6idr1fnqkqh0fsn9bhwavng6b2s4idc2l302s2vziygcm42d"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/brotzeit/helm-xref")
      (synopsis "Helm interface for @code{xref}")
      (description "This package provides a Helm interface for selecting
@code{xref} results.")
      (license license:gpl3+))))

(define-public emacs-helm-cider
  (let ((commit "fe7e48befdb0b20ea1b0fb3626a8a725e54ae626")
        (revision "0"))
    (package
      (name "emacs-helm-cider")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/clojure-emacs/helm-cider.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0kj3465klq4a1awfp5xzk9rvrz3gv9n6d8b1k1lsmh4vvm4bsb6g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-cider))
      (home-page "https://github.com/clojure-emacs/helm-cider")
      (synopsis "Helm interface to Clojure's CIDER")
      (description "Helm-CIDER adds Helm interfaces to
@command{cider-apropos}, @command{cider-apropos-documentation},
@command{cider-browse-ns} (namespaces).

It also provides original Helm commands: @command{helm-cider-spec},
@command{helm-cider-spec-ns}, @command{helm-cider-repl-history},
@command{helm-cider-cheatsheet}.")
      (license license:gpl3+))))

(define-public emacs-helm-cider-history
  (let ((commit "c391fcb2e162a02001605a0b9449783575a831fd")
        (revision "0"))
    (package
      (name "emacs-helm-cider-history")
      (version "0.0.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Kungi/helm-cider-history.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "18j4ikb3q8ygdq74zqzm83wgb39x7w209n3186mm051n8lfmkaif"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        ))
      (home-page
       "https://github.com/Kungi/helm-cider-history")
      (synopsis "Helm interface for CIDER REPL input history in Emacs")
      (description
       "Helm interface to browse and reuse CIDER REPL input history within
 Emacs.  It displays past REPL inputs in a Helm buffer, allowing users to
search and insert previous expressions efficiently.  The interface supports
multiline entries and integrates seamlessly with CIDER and Helm.")
      (license license:gpl3+))))

(define-public emacs-helm-css-scss
  (let ((commit "2169d83d8fdc661241df208cb3235112735d936e")
        (revision "0"))
    (package
      (name "emacs-helm-css-scss")
      (version (git-version "1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-css-scss.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jjjw7fw2ngrpgvd599vjd291zr8zr1m7xnxfq2dpqc3mf0s397z"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-css-scss")
      (synopsis "Helm interface for navigating CSS/SCSS/LESS selectors in Emacs")
      (description
       "Helm-powered interface for browsing and navigating CSS, SCSS, and LESS
 selectors within Emacs.  It allows users to view all selectors at once, jump
 to their definitions, and insert closing comments after braces.  The tool
 supports multiple buffers, enhancing efficiency in managing stylesheets.")
      (license license:gpl3+))))

(define-public emacs-helm-dictionary
  (let ((commit "725cc0df42ad57a7902c330065d9e8ee1216791c")
        (revision "0"))
    (package
      (name "emacs-helm-dictionary")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-dictionary.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ipia68s5x1ny6w99g56hfcnhphlz7zh7bhmrrjyv3aflr7d3170"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        ;; emacs-helm-easymenu ;; part of emacs-helm
        ;; emacs-helm-net      ;; part of emacs-helm
        ))
      (home-page "https://github.com/emacs-helm/helm-dictionary")
      (synopsis "Dictionary search interface for Emacs using Helm")
      (description
       "Helm-powered dictionary search interface for Emacs with support for
 various dictionary sources and intuitive access of definitions.")
      (license license:gpl3+))))

(define-public emacs-helm-git-grep
  (let ((commit "744cea07dba6e6a5effbdba83f1b786c78fd86d3")
        (revision "0"))
    (package
      (name "emacs-helm-git-grep")
      (version (git-version "0.10.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yasuyk/helm-git-grep.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "172m7wbgx9qnv9n1slbzpd9j24p6blddik49z6bq3zdg1vlnf3dv"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'fix-make-obsolete
              (lambda _
                (invoke
                 "sed" "--in-place" "742s/make-obsolete/make-obsolete-variable/"
                 "helm-git-grep.el"))))))
      (propagated-inputs
       (list
        emacs-helm
        ;; emacs-helm-core  ;; part of emacs-helm
        ;; emacs-helm-files ;; part of emacs-helm
        ))
      (home-page "https://github.com/yasuyk/helm-git-grep")
      (synopsis "Helm interface for an incremental Git grep in Emacs")
      (description
       "This package provides a Helm interface for Git's grep functionality
 within Emacs.  It allows users to perform searches across a Git
 repository,including submodules, and view results in an interactive Helm
 buffer.  Features include opening results in other windows or frames,
 toggling case sensitivity during searches, and saving search results to a
 writable grep buffer for further editing.  Integration with tools like wgrep
 enhances the usability of search results.")
      (license license:gpl3+))))

(define-public emacs-helm-pydoc
  (let ((commit "cac7b8953adcab85e898bc42b699c3afde5d33c6")
        (revision "0"))
    (package
      (name "emacs-helm-pydoc")
      (version (git-version "0.07" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-pydoc.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "11d34283zh1yffrb2ad4h1ib1n00yx5avas0l39hm56m2gvx6d89"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^helm-pydoc\\.py$" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-exec-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((python (search-input-file inputs "bin/python")))
                  (substitute* "helm-pydoc.py"
                    (("/usr/bin/env python") python))
                  (substitute* "helm-pydoc.el"
                    (("/bin/python") python))))))))
      (inputs (list python-wrapper))
      (propagated-inputs
       (list
        emacs-helm
        python-wrapper
        ;; emacs-helm-core  ;; part of emacs-helm
        ))
      (home-page "https://github.com/emacsorphanage/helm-pydoc.git")
      (synopsis "Python documentation lookup with Helm in Emacs")
      (description
       "Helm interface for searching and viewing Python
 documentation.  It enables quick access to Python docstrings, module
documentation, and function descriptions, improving efficiency by integrating
comprehensive documentation lookup directly into the Emacs environment.")
      (license license:gpl3+))))

(define-public emacs-php-mode
  (let ((commit "462b62248f7b3c6550ceea1b44760ddd951ab7ab")
        (revision "0"))
    (package
      (name "emacs-php-mode")
      (version (git-version "1.27.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/php-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1krm4gs0z2n02j64sx9brp98lqxl2ygbwcjm1bssqdw19c8p7kps"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #true
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "../tests/php-mode-test.el"
                               "-f" "ert-run-tests-batch-and-exit")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'prepare-testing-bed
              (lambda _
                ;; This file is necessary for `php-project-root' test.
                (call-with-output-file "tests/project/1/.git"
                  (const #t))))
            (add-after 'prepare-testing-bed 'enter-source-directory
              (lambda _
                (chdir "lisp")))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "php-mode")
                (bst:write-pkg-file "company-php")
                )))))
      (propagated-inputs
       (list
        emacs-projectile
        ))
      (home-page "https://github.com/emacs-php/php-mode")
      (synopsis "Major mode for editing PHP code")
      (description
       "PHP mode is a major mode for editing PHP source code.  It's an extension
of C mode; thus it inherits all C mode's navigation functionality.  But it
colors according to the PHP grammar and indents according to the PEAR coding
guidelines.  It also includes a couple handy IDE-type features such as
documentation search and a source and class browser.")
      (license license:gpl3+))))

(define-public emacs-ac-php
  ;; The latest commit "3d724e518a897343b5ede0b976d6fb46c46bcc01" contains
  ;; changes in the definition/declaration/inclusion-file provided by phpctags
  ;; which is a binary file not included in this package emacs-ac-php-core
  (package
    (name "emacs-ac-php")
    (version "2.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xcwen/ac-php.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1yn5cc6cmj3hwqgmjj44dz847xn5k99kirj36qwc04q7vhl8z8k7"))))
    (build-system emacs-build-system)
    (arguments
     (list
      ;; Leads to
      ;;     native-compiler-error-empty-byte (".../ac-php-comm-tags-data.el" ...)
      ;; guix build -c 24 --with-input=emacs-minimal=emacs -K -L /home/bost/dev/guix-packages/src -e '(@(bost gnu packages emacs-xyz) emacs-ac-php)'
      #:exclude #~(cons* "ac-php-comm-tags-data.el" %default-exclude)
      #:modules '((guix build emacs-build-system)
                  (guix build utils)
                  (guix build emacs-utils)
                  ((bost guix build emacs-utils) #:prefix bst:))
      #:imported-modules `(,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils)
                           (bost guix build emacs-utils))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'ensure-package-description 'add-needed-pkg-descriptions
            (lambda* (#:key outputs #:allow-other-keys)
              (bst:write-pkg-file "ac-php-core")
              (bst:write-pkg-file "company-php")
              )))))
    (inputs
     (list
      emacs-auto-complete
      emacs-company
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-helm
      emacs-php-mode
      emacs-popup
      emacs-s
      emacs-xcscope
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (home-page "https://github.com/xcwen/ac-php")
    (synopsis "Emacs Auto Complete & Company mode for PHP")
    (description
     "This package provides Auto Complete and Company back-ends for PHP.")
    (license license:gpl3+)))

;; Required by <path/to/spacemacs>/layers/+lang/php/packages.el
(define-public emacs-company-php
  (package
    (inherit emacs-ac-php)
    (name "emacs-company-php")))

;; Required from company-php
;; See <path/to/spacemacs>/layers/+lang/php/packages.el
(define-public emacs-ac-php-core
  (package
    (inherit emacs-ac-php)
    (name "emacs-ac-php-core")))

(define-public emacs-php-auto-yasnippets
  (let ((commit "03e1f0899c081813901ac15c2f7a675a37cca9f5")
        (revision "0"))
    (package
      (name "emacs-php-auto-yasnippets")
      (version (git-version "2.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-php/php-auto-yasnippets.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0d7y6njsd1s2r5df2k8wvvwgxpwwyaqkhdd2b3p1php8rrbj3mg8"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-yasnippet
        emacs-php-mode
        ))
      (home-page "https://github.com/emacs-php/php-auto-yasnippets.git")
      (synopsis "Auto-generate Yasnippets for PHP in Emacs")
      (description
       "This package provides functionality to quickly generate Yasnippets for
 PHP code in Emacs.  It allows users to create code snippets on the fly by
 typing a trigger key and template code, making repetitive PHP coding tasks
 faster and more efficient.  The package integrates with YASnippet, enhancing
 productivity for PHP developers.")
      (license license:gpl3+))))

(define-public emacs-php-extras
  (let ((commit "d410c5af663c30c01d461ac476d1cbfbacb49367")
        (revision "0"))
    (package
      (name "emacs-php-extras")
      (version (git-version "2.2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/arnested/php-extras.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0mcgwisnqplav0ga8xqqw72523iv841wp2cyw7d4lkzgpiav51dg"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-php-mode
        ))
      (home-page "https://github.com/arnested/php-extras")
      (synopsis "Extra features for Emacs php-mode")
      (description
       "Additional features for Emacs' php-mode.  It includes a command to
 insert the most recently used variable, support for eldoc-mode to display PHP
function signatures in the minibuffer, and completion backends for
auto-complete and company-mode based on core PHP functions.  The package can
generate a local function signature database by downloading and parsing the
PHP manual.")
      (license license:gpl3+))))

(define-public emacs-helm-org
  (let ((commit "4744ca7f8b35e17bafce9cb0093deb87a232699d")
        (revision "3"))
    (package
      (name "emacs-helm-org")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-org.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1vn9jn8pkrcgi9ayzw0w69a69jygfs6cjxcrd8jcykh907bnq9sp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/emacs-helm/helm-org")
      (synopsis "Helm interface to the Silver Searcher")
      (description
       "This package provides a frontend for grepping tools like ag and ack,
as well as features for editing search results.")
      (license license:gpl3+))))

(define-public emacs-org-project-capture
  (let ((commit "bf1c30b750020ab8dd634dd66b2c7b76c56286c5")
        (revision "0"))
    (package
      (name "emacs-org-project-capture")
      (version (git-version "3.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/colonelpanic8/org-project-capture.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1wvw5y5s37p9j0m2ljp7n1s1casbhiyrcnfpvdghvdd0fk8wcybp"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "org-projectile")
                (bst:write-pkg-file "org-category-capture")

                ;; needed by emacs-org-projectile
                (bst:write-pkg-file "org-project-capture")

                (bst:write-pkg-file "org-project-capture-backend")
                )))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-helm
        emacs-helm-org
        emacs-projectile
        emacs-s
        ))
      (home-page "https://github.com/colonelpanic8/org-project-capture")
      (synopsis "Integrate Org-mode TODOs with project management in Emacs")
      (description
       "This package integrates Org-mode TODOs with project management tools
 like Projectile and project.el in Emacs. It allows maintaining
 project-specific TODO lists, specifying storage locations for these lists,
 and offers customizable capture strategies. Keybindings can be established
 for easy access, enhancing the organization and management of tasks within
 Emacs.")
      (license license:gpl3+))))

;; Required by <path/to/spacemacs>/layers/+emacs/org/packages.el
(define-public emacs-org-projectile
  (package
    (inherit emacs-org-project-capture)
    (name "emacs-org-projectile")))

(define-public emacs-org-category-capture
  (package
    (inherit emacs-org-project-capture)
    (name "emacs-org-category-capture")))

(define-public emacs-helm-comint
  (let ((commit "5f435ede181818b6f8c58ad7b45f47acd2721daf")
        (revision "0"))
    (package
      (name "emacs-helm-comint")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/benedicthw/helm-comint.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0k95q7hdy7sp3l8yifjnc6f7xfplnqy8qff806yfgqiyy7gpx72p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm))
      (home-page "https://github.com/benedicthw/helm-comint.git")
      (synopsis "Helm interface for navigating Comint prompts in Emacs")
      (description
       "Helm interface for accessing prompts in Emacs' Comint buffers, such as
 shell or REPL sessions.  It allows users to quickly navigate to previous
prompts using Helm's incremental search capabilities.  Originally part of Helm
core, it now exists as a standalone user-contributed package.")
      (license license:gpl3+))))

(define-public emacs-helm-purpose
  (let ((commit "9ff4c21c1e9ebc7afb851b738f815df7343bb287")
        (revision "0"))
    (package
      (name "emacs-helm-purpose")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bmag/helm-purpose.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xh6v5xlf1prgk6mrvkc6qa0r0bz74s5f4z3dl7d00chsi7i2m5v"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-window-purpose
        emacs-helm
        ))
      (home-page "https://github.com/bmag/helm-purpose")
      (synopsis "Helm integration for Purpose-based window management in Emacs")
      (description
       "Helm commands and sources tailored for the Purpose window management system
 in Emacs.  It includes commands like
`helm-purpose-switch-buffer-with-purpose`to list buffers by purpose and
`helm-purpose-mini-ignore-purpose` to bypass Purpose constraints.  Users can
enable these features by calling `helm-purpose-setup` in their configuration.")
      (license license:gpl3+))))

(define-public emacs-helm-mu
  (let ((commit "d0bbc46338337d92b58708b906b40d0e12ae8006")
        (revision "1"))
    (package
      (name "emacs-helm-mu")
      (version (git-version  "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-mu.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0l7cysci0cmg0mg64gjxismkwqc3rfwl4ixjz5a0434zc1pg502j"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        mu))
      (home-page "https://github.com/emacs-helm/helm-mu")
      (synopsis "Helm sources for searching emails and contacts")
      (description
       "Helm sources for searching emails and contacts using @code{mu} and
@code{mu4e}.  Mu is an indexer for maildirs and mu4e is a mutt-like MUA for
Emacs build on top of mu.  Mu is highly efficient making it possible to get
instant results even for huge maildirs.  It also provides search operators,
e.g: @code{from:Peter to:Anne flag:attach search term}.")
      (license license:gpl3+))))

(define-public emacs-ace-jump-helm-line
  (let ((commit "1483055255df3f8ae349f7520f05b1e43ea3ed37")
        (revision "0"))
    (package
      (name "emacs-ace-jump-helm-line")
      (version (git-version "0.5.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/cute-jumper/ace-jump-helm-line")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "191a2g1if1jliikbxkpwmvlp4v1sp541j71xrlymili8ygm0idq5"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-avy emacs-helm))
      (home-page "https://github.com/cute-jumper/ace-jump-helm-line")
      (synopsis "Ace-jump to a candidate in Helm window")
      (description
       "This package allows using Ace jump to a candidate in Helm window.")
      (license license:gpl3+))))

(define-public emacs-helm-gtags
  (package
    (name "emacs-helm-gtags")
    (version "1.5.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/syohex/emacs-helm-gtags")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kc1jzk10nfd2v20g8dwnb6a944afrwdwnkzl06w4ba8k4yim7gi"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list emacs-helm))
    (home-page "https://github.com/syohex/emacs-helm-gtags")
    (synopsis "Emacs Helm interface to GNU Global")
    (description
     "@code{emacs-helm-gtags} provides a Emacs Helm interface to GNU Global.")
    (license license:gpl3+)))

(define-public emacs-flymake-easy
  (let ((commit "048482a97294585c4833d0311e9254a81db39b6b")
        (revision "0"))
    (package
      (name "emacs-flymake-easy")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/purcell/flymake-easy.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08ijmbdz0cybh9jicvl0hx8j2kc13rmv11z2igl1psmj472989f1"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/purcell/flymake-easy")
      (synopsis "Helper library for building Flymake checkers in Emacs")
      (description
       "This package provides a helper function, `flymake-easy-load`, to
 simplify the creation of Flymake syntax checkers in Emacs.  It streamlines
 the setup process by handling common boilerplate code, allowing developers to
 define new checkers with minimal effort.  This utility is particularly useful
 for integrating external linting tools into Emacs' on-the-fly syntax checking
 system.")
      (license license:gpl3+))))

(define-public emacs-flymake-phpcs
  (let ((commit "65ef3ff8ac1e1f48c8cbe66f273835c73680b991")
        (revision "0"))
    (package
      (name "emacs-flymake-phpcs")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/flymake/flymake-phpcs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "13w251mgr8lvlwa8nj51gyikaiqjbyggc4dh92phf148135jam3l"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-flymake-easy))
      (home-page "https://github.com/flymake/flymake-phpcs")
      (synopsis "Flymake integration for PHP CodeSniffer in Emacs")
      (description
       "This package integrates PHP CodeSniffer with Emacs' Flymake mode,
 providing on-the-fly syntax checking for PHP code. It highlights coding
 standard violations as you type, enhancing code quality and adherence to
 defined standards. Users can customize the coding standard and specify the
 location of the `phpcs` command. Note: The package requires `flymake-easy`
 and a working installation of PHP CodeSniffer.")
      (license license:gpl3+))))

(define-public emacs-drupal-mode
  (let ((commit "3f91d1d44df11ebd0137a896055fca6a1bb2f554")
        (revision "0"))
    (package
     (name "emacs-drupal-mode")
     (version (git-version "20240816.1236" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arnested/drupal-mode")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0gia6qrzdai0qa903gnxvnfn5mnva577jdf8zccz3i3f2ki02ygb"))))
     (build-system emacs-build-system)
     (arguments
      (list
       #:tests? #f
       #:include #~(cons* "^drupal/.*\\.el$" %default-include)
       #:phases
       #~(modify-phases
          %standard-phases
          (add-after
           'unpack 'move-source-files
           (lambda _
             (substitute*
              "drupal/flymake-phpcs.el"
              (("\\(define-obsolete-variable-alias 'drupal/flymake-phpcs-standard 'drupal/phpcs-standard\\)")
               "(define-obsolete-variable-alias 'drupal/flymake-phpcs-standard 'drupal/phpcs-standard \"28.1\")"
               )
              (("\\(define-obsolete-variable-alias 'drupal/flymake-phpcs-dont-show-trailing-whitespace 'drupal/phpcs-dont-show-trailing-whitespace\\)")
               "(define-obsolete-variable-alias 'drupal/flymake-phpcs-dont-show-trailing-whitespace 'drupal/phpcs-dont-show-trailing-whitespace \"28.1\")"
               )))))))
     (propagated-inputs
      (list
       emacs-flymake-phpcs
       emacs-helm-gtags
       emacs-ggtags
       emacs-flycheck
       emacs-php-mode
       global ;; provides gtags
       ))
     (home-page "https://github.com/arnested/drupal-mode")
     (synopsis "Advanced minor mode for Drupal development")
     (description
      "Drupal mode is an advanced minor mode for developing in Drupal.  Drupal mode is
based on top of PHP mode and defines among other things indentation etc.  to
match Drupal Coding Standards.")
     (license license:gpl3+))))

(define-public emacs-avy-menu
  (let ((commit "621052484b80cb13c12a368aedda1c3a209d2c88")
        (revision "0"))
    (package
      (name "emacs-avy-menu")
      (version (git-version "0.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mrkkrp/avy-menu.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0cap4xbn3irmgjazdjrw3mmw04ljx8wzlhs9f46avx7cj1hdh46i"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-avy))
      (home-page "https://github.com/mrkkrp/avy-menu")
      (synopsis "Library providing avy-powered popup menu")
      (description
       "The library provides an Avy-powered popup menu.  It is used in (at
 least) the following packages: * `ace-popup-menu * `char-menu *
 `hasky-extensions It can also be used directly.")
      (license license:gpl3))))

(define-public emacs-flyspell-correct
  (let ((commit "1e7a5a56362dd875dddf848b9a9e25d1395b9d37")
        (revision "0"))
    (package
      (name "emacs-flyspell-correct")
      (version (git-version "0.6.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/d12frosted/flyspell-correct.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0q6y40mm6z5ifngwzah9ax6z9dlka3rw3q1am08hmia15vk7bx4g"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "flyspell-correct")
                (bst:write-pkg-file "flyspell-correct-avy-menu")
                (bst:write-pkg-file "flyspell-correct-helm")
                (bst:write-pkg-file "flyspell-correct-ido")
                (bst:write-pkg-file "flyspell-correct-ivy")
                (bst:write-pkg-file "flyspell-correct-popup")
                (bst:write-pkg-file "test-flyspell-correct"))))))
      (propagated-inputs
       (list
        emacs-avy-menu
        emacs-helm
        emacs-ivy
        emacs-popup
        ))
      (home-page "https://github.com/d12frosted/flyspell-correct")
      (synopsis "Correcting words with flyspell via custom interfaces")
      (description
       "This package provides functionality for correcting words via custom
interfaces.  Several interfaces are supported beside the classic Ido: Popup,
Helm and Ivy.")
      (license license:gpl3+))))

;; Required by <path/to/spacemacs>/layers/+checkers/spell-checking/packages.el
(define-public emacs-flyspell-correct-helm
  (package
    (inherit emacs-flyspell-correct)
    (name "emacs-flyspell-correct-helm")))

(define-public emacs-helm-fish-completion
  (let ((commit "1e7a5a56362dd875dddf848b9a9e25d1395b9d37")
        (revision "0"))
    (package
      (name "emacs-helm-fish-completion")
      (version (git-version "0.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-helm/helm-fish-completion.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1j2vfngq3512naaayv9kx0d1q2zg1xgs69l8afc7swg72h0l0imw"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        emacs-fish-completion
        ))
      (home-page "https://github.com/emacs-helm/helm-fish-completion")
      (synopsis "Helm interface for Emacs fish-completion")
      (description "Helm Fish Completion is a Helm interface for Emacs
fish-completion.  It can be used in both Eshell and M-x shell.")
      (license license:gpl3+))))

(define-public emacs-helm-themes
  (let ((commit "1fc4a5d6114bc6c8c444c5ca73f22abe141a690d")
        (revision "0"))
    (package
      (name "emacs-helm-themes")
      (version (git-version "0.05" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-themes.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1j74a9ynhfcikl4r0v5lym2ansvgwm643qbmj5hknblpn8g6016c"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-themes")
      (synopsis "Emacs theme selection with Helm interface")
      (description
       "Helm Themes provide an Emacs theme selection with Helm interface.")
      (license license:gpl3+))))

(define-public emacs-helm-swoop
  (let ((commit "df90efd4476dec61186d80cace69276a95b834d2")
        (revision "0"))
    (package
      (name "emacs-helm-swoop")
      (version (git-version "3.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsorphanage/helm-swoop.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "01nrak72inmic9n30dval6608cfzsbv5izwzykbim46ifjhcipag"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/emacsorphanage/helm-swoop")
      (synopsis "Filter and jump to lines in an Emacs buffer using Helm")
      (description
       "This package builds on the Helm interface to provide several commands
for search-based navigation of buffers.")
      (license license:gpl2+))))

(define-public emacs-helm-ag
  (let ((commit "a7b43d9622ea5dcff3e3e0bb0b7dcc342b272171")
       (revision "0"))
    (package
      (name "emacs-helm-ag")
      (version (git-version "0.64" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/syohex/emacs-helm-ag.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1g2clyz5289wpahalvpdafz1d3cyqsm0g7ska0j2rlhqrcy9k2vc"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list emacs-helm))
      (home-page "https://github.com/syohex/emacs-helm-ag")
      (synopsis "Helm interface to the Silver Searcher")
      (description
       "This package provides a frontend for grepping tools like ag and ack,
as well as features for editing search results.")
      (license license:gpl3+))))

(define-public emacs-helm-projectile
  (let ((commit "041076e35a6663302a91a0fa672f847c7d64bf29")
        (revision "0"))
    (package
      (name "emacs-helm-projectile")
      (version (git-version "1.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bbatsov/helm-projectile.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1yhdc6h72crnlp46hbvs20c0fc9r1x7896z7rbp1z0i0hphsrs86"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-projectile))
      (home-page "https://github.com/bbatsov/helm-projectile")
      (synopsis "Helm integration for Projectile")
      (description
       "This Emacs library provides a Helm interface for Projectile.")
      (license license:gpl3+))))

(define-public emacs-helm-make
  (let ((commit "ebd71e85046d59b37f6a96535e01993b6962c559")
        (revision "0"))
    (package
      (name "emacs-helm-make")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/abo-abo/helm-make.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "14jvhhw4chl94dgfwbyy7yirwchvcz5zrsgr9w6qy4z0fhqba41a"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-helm
        emacs-ivy
        emacs-projectile
        ))
      (home-page "https://github.com/abo-abo/helm-make")
      (synopsis "Select a Makefile target with helm")
      (description "@code{helm-make} or @code{helm-make-projectile} will give
you a @code{helm} selection of directory Makefile's targets.  Selecting a
target will call @code{compile} on it.")
      (license license:gpl3+))))

(define-public emacs-helm-c-yasnippet
  (let ((commit "65ca732b510bfc31636708aebcfe4d2d845b59b0")
        (revision "1"))
    (package
      (name "emacs-helm-c-yasnippet")
      (version (git-version "0.6.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-jp/helm-c-yasnippet.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cbafjqlzxbg19xfdqsinsh7afq58gkf44rsg1qxfgm8g6zhr7f8"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-helm emacs-yasnippet))
      (home-page "https://github.com/emacs-jp/helm-c-yasnippet")
      (synopsis "Helm integration for Yasnippet")
      (description "This Emacs library provides Helm interface for
Yasnippet.")
      (license license:gpl2+))))

(define-public emacs-avy-jump-helm-line
  (let ((commit "93a8c0039743a6fcf1f6a4eabe9736ed658b8da1")
        (revision "0"))
    (package
      (name "emacs-avy-jump-helm-line")
      (version (git-version "0.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sunlin7/avy-jump-helm-line.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256 (base32 "1d4dfjaxdp49xa50fhq4nm3q7iwpz9xsvp5qnqvicdk8dysdkr2p"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-helm emacs-avy))
      (home-page "https://github.com/sunlin7/avy-jump-helm-line")
      (synopsis "Helm interface for avy line-jumping in Emacs")
      (description
       "Interface combining Helm with avy for jumping to lines in Emacs.  It displays
line candidates in a Helm buffer and allows efficient navigation by selecting
a target line with avy-style key prompts.  The integration enhances movement
speed and accuracy within large buffers.")
      (license license:gpl3+))))

(define-public emacs-ellama
  (let ((commit "8281a9847b1a35df5433d93a8e7569bbe7ef1215")
        (revision "0"))
    (package
      (name "emacs-ellama")
      (version (git-version "1.8.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/s-kostyaev/ellama.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1abvrxa3np8aqkhfq8g7k7flavc5p70q2za1q9lsp5my1amnjy6p"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'disable-failing-tests
              (lambda _
                (substitute* (find-files "tests/" "\\.el$")
                  (((string-append
                     "\\(ert-deftest "
                     "test-ellama-context-element-extract-info-node .*") all)
                   (string-append all "(skip-unless nil)\n")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "ellama")
                (bst:write-pkg-file "ellama-blueprint")
                (bst:write-pkg-file "ellama-community-prompts")
                (bst:write-pkg-file "ellama-context")
                (bst:write-pkg-file "ellama-manual")
                (bst:write-pkg-file "ellama-transient")
                )))
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "ellama.el"
                               "-l" "tests/test-ellama.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (propagated-inputs (list emacs-compat emacs-llm emacs-plz))
      (home-page "https://github.com/s-kostyaev/ellama")
      (synopsis "Tool for interacting with LLMs")
      (description
       "Ellama is a tool for interacting with large language models from Emacs.
It allows you to ask questions and receive responses from the LLMs.  Ellama
can perform various tasks such as translation, code review, summarization,
enhancing grammar/spelling or wording and more through the Emacs interface.
Ellama natively supports streaming output, making it effortless to use with
your preferred text editor.")
      (license license:gpl3+))))

(define-public emacs-gptel
  (let ((commit "73ee1f0f61187b7dd2640bd8192955e43922bf4f")
        (revision "0"))
    (package
      (name "emacs-gptel")
      (version (git-version "0.9.8.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/karthink/gptel.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0dn1qm18l4w4hrh8vdgpmxiyddym5mi08x9459lakyv7a6nimbv3"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'use-appropriate-curl
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "gptel.el"
                  ("gptel-use-curl" (search-input-file inputs "/bin/curl")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "gptel")
                )))))
      (inputs (list curl))
      (propagated-inputs (list emacs-compat emacs-transient))
      (home-page "https://github.com/karthink/gptel")
      (synopsis "GPTel is a simple ChatGPT client for Emacs")
      (description
       "GPTel is a simple ChatGPT asynchronous client for Emacs with no external
dependencies.  It can interact with ChatGPT from any Emacs buffer with ChatGPT
responses encoded in Markdown or Org markup.  It supports conversations, not
just one-off queries and multiple independent sessions.  It requires an OpenAI
API key.")
      (license license:gpl3+))))

(define-public emacs-llm
  (let ((commit "6d6c88c20a2b485ade7bac53bdfb44ed8f91c279")
        (revision "0"))
    (package
      (name "emacs-llm")
      (version (git-version "0.27.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/ahyatt/llm.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0nxff3k43ccq7m75dd5d0lq47qi2wlbqpdvjkdnq1671xggaay1v"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; there are no tests
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "llm")
                (bst:write-pkg-file "llm-azure")
                (bst:write-pkg-file "llm-claude")
                (bst:write-pkg-file "llm-deepseek")
                (bst:write-pkg-file "llm-fake")
                (bst:write-pkg-file "llm-gemini")
                (bst:write-pkg-file "llm-github")
                (bst:write-pkg-file "llm-gpt4all")
                ;; (bst:write-pkg-file "llm-integration-test")
                (bst:write-pkg-file "llm-llamacpp")
                (bst:write-pkg-file "llm-models")
                (bst:write-pkg-file "llm-ollama")
                (bst:write-pkg-file "llm-openai")
                ;; (bst:write-pkg-file "llm-prompt-test")
                (bst:write-pkg-file "llm-prompt")
                ;; (bst:write-pkg-file "llm-provider-utils-test")
                (bst:write-pkg-file "llm-provider-utils")
                (bst:write-pkg-file "llm-request-plz")
                ;; (bst:write-pkg-file "llm-test")
                ;; (bst:write-pkg-file "llm-tester")
                (bst:write-pkg-file "llm-vertex")
                )))))
      (propagated-inputs (list emacs-plz emacs-plz-event-source
                               emacs-plz-media-type))
      (home-page "https://github.com/ahyatt/llm")
      (synopsis "Emacs library abstracting Large Language Model capabilities")
      (description
       "This package provides interfaces to abstract various @acronym{LLM, large
language model}s out in the world.  To respect user freedom, it will warn you
before interacting with non-free LLMs.")
      (license license:gpl3+))))

(define-public emacs-transient
  (let ((commit "e9a636d3c7cbb9ac43ea4a08a1c252a02c7c3460")
        (revision "0"))
    (package
      (name "emacs-transient")
      (version (git-version "0.9.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/magit/transient.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1jadjjia70v9fk0wplhqmlfaqgfk6rm6ilxg7aq1xs3382yy5bv8"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f ;no test suite
        #:lisp-directory "lisp"
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'build-info-manual
              (lambda _
                (invoke "make" "--directory=.." "info")
                ;; Move the info file to lisp so that it gets
                ;; installed by the emacs-build-system.
                (rename-file "../docs/transient.info" "transient.info")))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "transient")
                )))))
      (native-inputs (list texinfo))
      (propagated-inputs (list emacs-compat))
      (home-page "https://magit.vc/manual/transient")
      (synopsis "Transient commands in Emacs")
      (description
       "Taking inspiration from prefix keys and prefix arguments
in Emacs, Transient implements a similar abstraction involving a prefix
command, infix arguments and suffix commands.  We could call this abstraction
a \"transient command\", but because it always involves at least two
commands (a prefix and a suffix) we prefer to call it just a \"transient\".")
      (license license:gpl3+))))

(define-public emacs-plz
  (let ((commit "e2d07838e3b64ee5ebe59d4c3c9011adefb7b58e")
        (revision "0"))
    (package
      (name "emacs-plz")
      (version (git-version "0.9.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/alphapapa/plz.el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "120q1443spcj153lns8ydwnpyrq6i5slpmsnm992anaxlf7drsdd"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f                       ;require internet access
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'substitute-curl-path
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "plz.el"
                  ("plz-curl-program" (search-input-file inputs "/bin/curl")))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "plz")
                )))))
      (inputs (list curl))
      (home-page "https://github.com/alphapapa/plz.el")
      (synopsis "HTTP library for Emacs")
      (description
       "This package provides HTTP library for Emacs.  It uses Curl as a backend,
which avoids some of the issues with using Emacs’s built-in Url library.")
      (license license:gpl3+))))

(define-public emacs-plz-media-type
  (let ((commit "b1127982d53affff082447030cda6e8ead3899cb")
        (revision "0"))
      (package
        (name "emacs-plz-media-type")
        (version (git-version "0.2.4" revision commit))
        (source
         (origin
           (method git-fetch)
           (uri (git-reference
                  (url "https://github.com/r0man/plz-media-type.git")
                  (commit commit)))
           (file-name (git-file-name name version))
           (sha256
            (base32 "0k1c2z0minbaxdgfjxng8spivnnq8kqw6za4p46r7xlzx7m365qj"))))
        (build-system emacs-build-system)
        (arguments
         (list
          #:tests? #f
          #:modules '((guix build emacs-build-system)
                      (guix build utils)
                      (guix build emacs-utils)
                      ((bost guix build emacs-utils) #:prefix bst:))
          #:imported-modules `(,@%default-gnu-imported-modules
                               (guix build emacs-build-system)
                               (guix build emacs-utils)
                               (bost guix build emacs-utils))
          #:phases
          #~(modify-phases %standard-phases
              (add-after 'ensure-package-description 'add-needed-pkg-descriptions
                (lambda* (#:key outputs #:allow-other-keys)
                  (bst:write-pkg-file "plz-media-type")
                  )))))
        (propagated-inputs (list emacs-plz))
        (home-page "https://github.com/r0man/plz-media-type")
        (synopsis "HTTP media type extension for plz.el")
        (description
         "The @code{plz-media-type} library enhances MIME type handling for HTTP
requests within Emacs.  It leverages the Plz HTTP library for networking calls
and introduces a mechanism to process responses based on the content type
header.  This library defines various classes and methods for parsing and
processing standard MIME types, including JSON, XML, HTML, and binary data, in
a streaming and non-streaming way.")
        (license license:gpl3+))))

(define-public emacs-plz-event-source
  (let ((commit "de89214ce14e2b82cbfdc30e1adcf3e77b1f250a")
        (revision "0"))
    (package
      (name "emacs-plz-event-source")
      (version (git-version "0.1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/r0man/plz-event-source.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fh3pvksbyv16ml617wgwga2wjymvx0l6xyf7f4fyhffg5wkzbdl"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "plz-event-source")
                )))))
      (propagated-inputs (list emacs-plz-media-type))
      (home-page "https://github.com/r0man/plz-event-source")
      (synopsis "Server Sent Events extension for Plz")
      (description
       "The @code{plz-event-source} library provides a @code{plz-media-type},
a parser, and an event source implementation for the @acronym{SSE, Server Sent
Event} protocol.")
      (license license:gpl3+))))

(define-public emacs-org-rich-yank
  (let ((commit "8f73e833eac9c0eb686416962d5bdd369d80c1e8")
        (revision "0"))
    (package
      (name "emacs-org-rich-yank")
      (version (git-version "0.2.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/unhammer/org-rich-yank.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "09v5z7h2db5jllh3jy3wyprq9vs2xfv89zlxr74r3lsss0x0xnb5"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:tests? #f
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "org-rich-yank")
                )))))
      (home-page "https://github.com/unhammer/org-rich-yank")
      (synopsis "Surround source code pasted into Org with @code{#+BEGIN_SRC}
blocks")
      (description
       "This package provides a utility function for Org buffers that makes a
@code{_SRC} block with the appropriate language annotation for code that has
been copied from an Emacs major mode.")
      (license license:gpl2+))))

(define-public emacs-helpful
  (package
    (name "emacs-helpful")
    (version "0.21")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/helpful")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03afgdbs5nmhw833svrqky7fmfs1zlvqzcj7j5g29sakivs60xqc"))
       (patches (search-patches
                 "emacs-helpful-fix-signature.patch"
                 "emacs-helpful-fix-tests.patch"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-elisp-refs
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-s
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (home-page "https://github.com/Wilfred/helpful")
    (synopsis "More contextual information in Emacs help")
    (description "@code{helpful} is an alternative to the built-in Emacs help
that provides much more contextual information.

@itemize
@item Show the source code for interactively defined functions (unlike the
built-in Help).
@item Fall back to the raw sexp if no source is available.
@item Show where a function is being called.
@item Docstrings will Highlight the summary (the first sentence), include
cross-references, hide superfluous puncuation.
@item Show you the properties that have been applied to the current
symbol.  This provides visibility of features like edebug or byte-code
optimisation.
@item Provide a separate @code{helpful-command} function to view interactive
functions.
@item Display any keybindings that apply to interactive functions.
@item Trace, disassemble functions from inside Helpful.  This is discoverable
and doesn't require memorisation of commands.
@end itemize\n")
    (license license:gpl3+)))

(define-public emacs-mu4e-alert
  (let ((commit "d36eb0c1842dea51ee0465bb3751948c8886617c")
        (revision "1"))
    (package
      (name "emacs-mu4e-alert")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/xzz53/mu4e-alert")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "039kfpwgw0vi6fv2p4ixdh9qx9hdsahl48yl1niq00zmsp7rgg07"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ;no tests
      (propagated-inputs
       (list emacs-alert emacs-ht emacs-s mu))
      (home-page "https://github.com/xzz53/mu4e-alert")
      (synopsis "Desktop notifications and mode line display for mu4e")
      (description
       "This package provides desktop notifications for mu4e.
Additionally it can display the number of unread emails in the mode line.")
      (license license:gpl3+))))

(define-public emacs-magit-popup
  (package
    (name "emacs-magit-popup")
    (version "2.13.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magit/magit-popup")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0znp6gx6vpcsybg774ab06mdgxb7sfk3gki1yp2qhkanav13i6q1"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f    ; no tests
       #:phases
       (modify-phases %standard-phases
         (add-before 'install 'make-info
           (lambda _
             (invoke "make" "info"))))))
    (native-inputs
     (list
      texinfo
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/magit/magit-popup")
    (synopsis "Define prefix-infix-suffix command combos")
    (description
     "This library implements a generic interface for toggling switches and
setting options and then invoking an Emacs command which does something with
these arguments.  The prototypical use is for the command to call an external
process, passing on the arguments as command line arguments.")
    (license license:gpl3+)))

(define-public emacs-popup
  (let ((commit "24dd22186403a6566c26ce4996cdb1eedb1cc5cd")
        (revision "0"))
    (package
      (name "emacs-popup")
      (version (git-version "0.5.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/auto-complete/popup-el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1a4drkmkimk4kc6dqpl5h9p3r44ngz1xg7q87vqvn4gdbmhk984p"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "ert-runner" "tests")
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "popup")
                )))))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (home-page "https://github.com/auto-complete/popup-el")
      (synopsis "Visual Popup User Interface for Emacs")
      (description
       "Popup.el is a visual popup user interface library for Emacs.
This provides a basic API and common UI widgets such as popup tooltips
and popup menus.")
      (license license:gpl3+))))

(define-public emacs-meyvn
  (let ((commit "8d00ada6daa5617fa60f76e0be2cf2f5d1babcf9")) ;version bump
    (package
      (name "emacs-meyvn")
      (version "1.7")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/danielsz/meyvn-el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ncilsn0ih01w6hjdn529jkapiv4nnkway07j2b5fndkrlgk2ry4"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-cider
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-geiser
        emacs-parseclj
        emacs-parseedn
        emacs-projectile
        emacs-s
        ))
      (home-page "https://github.com/danielsz/meyvn-el")
      (synopsis "Emacs client for the Meyvn build tool")
      (description
       "This package provides an Emacs client for the @url{https://meyvn.org, Meyvn} build tool.")
      (license license:gpl3+))))

(define-public emacs-minions
  (package
    (name "emacs-minions")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tarsius/minions")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rinshdxln1wvzf7by8gq9wiqgcqy406k5jl1f86jd17b3wv5bxx"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command
           #~(list "make" "check-declare")))
    (propagated-inputs
     (list emacs-compat (@(bost gnu packages emacs-build) emacs-dash)))
    (home-page "https://github.com/tarsius/minions")
    (synopsis "Minor-mode menu for the mode line")
    (description
     "This package implements a menu that lists enabled minor-modes, as well
as commonly but not currently enabled minor-modes.  It can be used to toggle
local and global minor-modes, to access mode-specific menus, and to get help
about modes.

This menu is intended as a replacement for the incomplete yet wide list of
enabled minor-modes that is displayed in the mode line by default.  To use the
menu like this, enable Minions mode.

Alternatively the menu can be bound globally, for example:
@code{(global-set-key [S-down-mouse-3] 'minions-minor-modes-menu)}.")
    (license license:gpl3+)))

(define-public emacs-speed-type
  (package
    (name "emacs-speed-type")
    (version "1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dakra/speed-type")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1rw3lgm65jxcs7vbj0055ays4wv23mk2kj3xivnqmhnm030vk868"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command
      #~(list "emacs" "-Q" "--batch" "-L" "."
              "-l" "test-speed-type.el"
              "-f" "ert-run-tests-batch-and-exit")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'skip-failing-test
            ;; This test requires an internet connection.
            (lambda _
              (substitute* "test-speed-type.el"
                (("\\(ert-deftest speed-type--retrieve-test .*" all)
                 (string-append all " (skip-unless nil)"))))))))
    (native-inputs (list (@(bost gnu packages emacs-build) emacs-dash)))
    (propagated-inputs (list emacs-compat))
    (home-page "https://github.com/dakra/speed-type")
    (synopsis "Practice touch/speed typing in GNU Emacs")
    (description
     "Speed Type allows you to practice your touch typing skills.  You can
test yourself by typing snippets from online books or use any piece of text or
code you have in Emacs.  Speed Type keeps track of your stats (WPM, CPM,
accuracy) while you are typing.")
    (license license:gpl3+)))

(define-public emacs-ghq
  (package
    (name "emacs-ghq")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rcoedo/emacs-ghq")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10a7rxmijwmdkfb5rgavd8inc3a45q0m57dxdf6v62bcy00kmw4l"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'set-ghq-location
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((ghq (search-input-file inputs "/bin/ghq")))
                (substitute* "ghq.el"
                  (("\"ghq") (string-append "\"" ghq)))))))))
    (inputs
     (list
      ghq
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      ))
    (home-page "https://github.com/rcoedo/emacs-ghq")
    (synopsis "Emacs interface for @code{ghq} tool")
    (description
     "This package provides a set of functions wrapping @code{ghq}, a tool for
organizing remote Go repository clones.")
    (license license:gpl3+)))

(define-public emacs-typit
  (package
    (name "emacs-typit")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mrkkrp/typit")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0djxmni5mfc9wzm0zg7fsd7138ic5qznbmqd5jyrk4mpf0li8nhy"))))
    (build-system emacs-build-system)
    (arguments
     '(#:include (cons "^dict/" %default-include)))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-mmt
      ))
    (home-page "https://github.com/mrkkrp/typit")
    (synopsis "Typing game for Emacs with two difficulties")
    (description "Emacs Typit is a typing game for Emacs.  Words that are
picked randomly from the most frequent words in language you're practicing,
until time is up.")
    (license license:gpl3+)))

(define-public emacs-shroud
  (package
    (name "emacs-shroud")
    (version "1.105")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.savannah.gnu.org/git/emacs-shroud.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q2pb3w8s833fjhkzicciw2php4lsnismad1dnwgp2lcway757ra"))))
    (build-system gnu-build-system)
    (arguments
     `(#:modules ((guix build gnu-build-system)
                  ((guix build emacs-build-system) #:prefix emacs:)
                  (guix build utils))
       #:imported-modules (,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils))
       #:configure-flags (list (string-append "--with-lispdir="
                                              (emacs:elpa-directory %output)))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'expand-load-path
           (assoc-ref emacs:%standard-phases 'expand-load-path)))))
    (native-inputs
     (list autoconf automake texinfo perl emacs-minimal))
    (propagated-inputs
     (list emacs-bui
           (@(bost gnu packages emacs-build) emacs-dash)
           (@(bost gnu packages emacs-build) emacs-f)
           emacs-s
           gnupg
           shroud))
    (home-page "https://www.nongnu.org/emacs-shroud")
    (synopsis "Emacs interface to the Shroud password manager")
    (description
     "This package provides an Emacs interface to the Shroud password manager,
using the Buffers User Interface library.  You can view, copy, and edit secrets
from within Emacs.")
    (license license:gpl3+)))

(define-public emacs-unpackaged
  (let ((commit "0c1f447dab29697d4e30806022f28657c1489375")
        (revision "4"))
    (package
      (name "emacs-unpackaged")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/unpackaged.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "042vcffg1scq6zq8rhv3f2hsl4ychr1gx6hlp23b8hfmz268fima"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-esxml
        emacs-org
        emacs-s
        emacs-hydra
        ;; emacs-use-package
        emacs-ts
        ))
      (home-page "https://github.com/alphapapa/unpackaged.el")
      (synopsis "Useful snippets of Emacs Lisp code")
      (description
       "This package provides Emacs Lisp utilities for a variety
of tasks, including version control, task management, and regex-based
replacement.")
      (license license:gpl3+))))

(define-public emacs-haskell-mode
  (let ((commit "e9c356739310332afe59b10ffa2e6c3e76f124e3")
        (revision "0"))
    (package
    (name "emacs-haskell-mode")
    (version (git-version "17.5" revision commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/haskell/haskell-mode")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mkp9b31ai1z6sccx8cff40viryamw7dm85acig3q82dwlbmxx98"))))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)))
    (native-inputs
     (list emacs-minimal emacs-el-search emacs-stream texinfo))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags #~(list
                      (string-append "EMACS=" #$emacs-minimal "/bin/emacs"))
      #:modules `((ice-9 match)
                  (srfi srfi-26)
                  ((guix build emacs-build-system) #:prefix emacs:)
                  ,@%default-gnu-imported-modules)
      #:imported-modules `(,@%default-gnu-imported-modules
                           (guix build emacs-build-system)
                           (guix build emacs-utils))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-before 'build 'pre-build
            (lambda* (#:key inputs #:allow-other-keys)
              (define (el-dir store-dir)
                (match (find-files store-dir "\\.el$")
                  ((f1 f2 ...) (dirname f1))
                  (_ "")))

              (let ((sh (search-input-file inputs "/bin/sh")))
                (define emacs-prefix? (cut string-prefix? "emacs-" <>))

                (setenv "SHELL" "sh")
                (setenv "EMACSLOADPATH"
                        (string-concatenate
                         (map (match-lambda
                                (((? emacs-prefix? name) . dir)
                                 (string-append (el-dir dir) ":"))
                                (_ ""))
                              inputs)))
                (substitute* (find-files "." "\\.el") (("/bin/sh") sh)))))
          (add-before 'check 'delete-failing-tests
            ;; XXX: these tests require GHC executable, which would be a big
            ;; native input.
            (lambda _
              (with-directory-excursion "tests"
                ;; File `haskell-indent-tests.el' fails with
                ;; `haskell-indent-put-region-in-literate-2'
                ;; on Emacs 27.1+
                ;; XXX: https://github.com/haskell/haskell-mode/issues/1714
                (for-each delete-file
                          '("haskell-indent-tests.el"
                            "haskell-customize-tests.el"
                            "inferior-haskell-tests.el"))

                ;; requires many external tools (e.g. git, hasktags)
                (substitute* "haskell-mode-tests.el"
                  (("\\(ert-deftest haskell-generate-tags.*" all)
                   (string-append all " (skip-unless nil)"))))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (el-dir (emacs:elpa-directory out))
                     (doc (string-append
                           out "/share/doc/haskell-mode-" #$version))
                     (info (string-append out "/share/info")))
                (define (copy-to-dir dir files)
                  (for-each (lambda (f)
                              (install-file f dir))
                            files))

                (with-directory-excursion "doc"
                  (invoke "makeinfo" "haskell-mode.texi")
                  (install-file "haskell-mode.info" info))
                (copy-to-dir doc '("CONTRIBUTING.md" "NEWS" "README.md"))
                (copy-to-dir el-dir (find-files "." "\\.elc?"))))))))
    (home-page "https://github.com/haskell/haskell-mode")
    (synopsis "Haskell mode for Emacs")
    (description
     "This is an Emacs mode for editing, debugging and developing Haskell
programs.")
    (license license:gpl3+))))

(define-public emacs-dante
  (package
    (name "emacs-dante")
    (version "1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jyp/dante")
                    (commit version)))
              (sha256
               (base32
                "0q7hackvaplh1f645ngd76f2ls5mvg93xicr3rkxr07hd36yihag"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-company
           (@(bost gnu packages emacs-build) emacs-dash)
           (@(bost gnu packages emacs-build) emacs-f)
           emacs-flycheck
           emacs-haskell-mode
           emacs-lcr
           emacs-s))
    (home-page "https://github.com/jyp/dante")
    (synopsis "Minor mode for interactive Haskell")
    (description
     "This package provides a minor mode for Haskell development that
supports type hints, definition-jumping, completion, and more.")
    (license license:gpl3+)))

(define-public emacs-flycheck
  (let ((commit "a4d782e7af12e20037c0cecf0d4386cd2676c085")
        (revision "0"))
    (package
      (name "emacs-flycheck")
      (version (git-version "35.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/flycheck/flycheck.git")
                (commit commit)))
         (sha256
          (base32 "0vhilah2gnmifv9hk7whcdcbcfzw0yxhfhwa8xka1fdlr0g23hws"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (native-inputs
       (list
        emacs-shut-up
        ))
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'change-flycheck-version
              (lambda _
                (substitute* "flycheck.el"
                  (("\\(pkg-info-version-info 'flycheck\\)")
                   (string-append "\"" #$version "\""))))))
        ;; TODO: many failing tests
        #:tests? #f
        #:test-command
        #~(list "emacs" "-Q" "--batch"
                "-L" "."
                "--load" "test/flycheck-test"
                "--load" "test/run.el"
                "-f" "flycheck-run-tests-main")))
      (home-page "https://www.flycheck.org")
      (synopsis "On-the-fly syntax checking")
      (description
       "This package provides on-the-fly syntax checking for GNU Emacs.  It is a
replacement for the older Flymake extension which is part of GNU Emacs, with
many improvements and additional features.

Flycheck provides fully-automatic, fail-safe, on-the-fly background syntax
checking for over 30 programming and markup languages with more than 70
different tools.  It highlights errors and warnings inline in the buffer, and
provides an optional IDE-like error list.")
      (license license:gpl3+))))                     ;+GFDLv1.3+ for the manual

(define-public emacs-fb2-reader
  (let ((commit "9836db284749e0cef4c43c2cb5358c82ae9b8589")) ; version bump
    (package
      (name "emacs-fb2-reader")
      (version "0.1.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jumper047/fb2-reader")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vx4b9wnmx1bng8wak5r7yryyvgib4m46l6b877xzkdhsjr3rbsi"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command
        #~(list "buttercup" "-L" ".")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'qualify-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((unzip (search-input-file inputs "/bin/unzip")))
                  (substitute* "fb2-reader.el"
                    (("unzip") unzip)))))
            (add-after 'unpack 'fix-tests
              (lambda _
                ;; Lexical binding is required for compatibility with recent
                ;; Buttercup.
                (emacs-batch-edit-file "tests/test-fb2-reader.el"
                  '(progn
                    (insert ";;; -*-lexical-binding:t -*-\n")
                    (basic-save-buffer)))
                ;; Fix bogus function name.
                (substitute* "tests/test-fb2-reader.el"
                  (("fb2-reader-render") "fb2-reader-render-xml")))))))
      (inputs
       (list
        unzip
        ))
      (native-inputs
       (list
        emacs-async
        emacs-buttercup
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-visual-fill-column
        ))
      (home-page "https://github.com/jumper047/fb2-reader")
      (synopsis "Emacs plugin to read FictionBook2 ebooks")
      (description "FB2 Reader provides a major mode for reading
FictionBook2 (@file{.fb2} and @file{.fb2.zip} files) ebooks.")
      (license license:gpl3+))))

(define-public emacs-alarm-clock
  (package
    (name "emacs-alarm-clock")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wlemuel/alarm-clock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0vdwvrbj79ylaz5ffa2bpfy4kzi1s6hf6bxijvyw7h8y6bd196av"))))
    (build-system emacs-build-system)
    (arguments
     (list #:include #~(cons "alarm.mp3" %default-include)
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'configure
                 (lambda* (#:key inputs #:allow-other-keys)
                   (substitute* "alarm-clock.el"
                     (("\"mpg123\"")
                      (string-append
                       "\"" (search-input-file inputs "bin/mpg123") "\""))
                     (("notify-send")
                      (search-input-file inputs "bin/notify-send"))))))))
    (inputs
     (list
      libnotify
      mpg123
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      ))
    (home-page "https://github.com/wlemuel/alarm-clock")
    (synopsis "Alarm clock for Emacs")
    (description "Alarm Clock provides an alarm clock for Emacs.")
    (license license:gpl3+)))

(define-public emacs-relative-buffers
  (let ((release "0.0.1")
        (revision "0")
        (commit "9762fe268e9ff150dcec2e2e45d862d82d5c4008"))
    (package
      (name "emacs-relative-buffers")
      (version (git-version release revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacsattic/relative-buffers")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0fzhwbpyndwrmxip9zlcwkrr675l5pzwcygi45hv7w1hn39w0hxp"))
         (snippet
          '(begin
             ;; Delete the Cask test runners.
             (for-each delete-file '("Cask" "test/test-helper.el"))))))
      (build-system emacs-build-system)
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-s
        ))
      (home-page "https://github.com/emacsattic/relative-buffers")
      (synopsis "Minor mode to rename buffers by project structure")
      (description
       "This package provides a minor mode for renaming buffers according to
project structure.  For Python buffers, that will be the whole module name.
For temporary files and directories, that will be the relative path from the
project root.")
      (license license:gpl3+))))

(define-public emacs-alchemist
  (package
    (name "emacs-alchemist")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://stable.melpa.org/packages/"
                           "alchemist-" version ".tar"))
       (sha256
        (base32 "0ygwf9d739zqc8dcckw0j0bqkipw7cmxbrx3l281x237a3d384yw"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-elixir-mode
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-company
      emacs-pkg-info
      ))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-server
            (lambda _
              (let ((server (string-append (elpa-directory #$output)
                                           "/alchemist-server")))
                (mkdir-p server)
                (copy-recursively "alchemist-server" server)
                (delete-file-recursively (string-append server "/test"))))))))
    (home-page "https://www.github.com/tonini/alchemist.el")
    (synopsis "Elixir tooling integration into Emacs")
    (description
     "This package brings you all the Elixir tooling and power inside your Emacs
editor.  It comes with commands to compile, execute and test your code, spawn
an interactive shell, and look up definitions and documentation as well as
code completion and project management support.")
    (license license:gpl3+)))

(define-public emacs-auto-sudoedit
  (package
    (name "emacs-auto-sudoedit")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ncaq/auto-sudoedit")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rhdvrj2rjbvl7vkb0wcp6krqxcaigl7jk9z8yvhx6s4cm2qli6q"))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f
       )))
    (build-system emacs-build-system)
    (home-page "https://github.com/ncaq/auto-sudoedit")
    (synopsis "Automatically re-open read-only files with sudo")
    (description
     "This package automatically reopens a file or directory with
@command{sudo} if it cannot write to it.")
    (license license:expat)))

(define-public emacs-bluetooth
  (package
    (name "emacs-bluetooth")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://elpa.gnu.org/packages/"
                           "bluetooth-" version ".tar"))
       (sha256
        (base32 "1chi9xjg5zcg6qycn2n442adhhmip1vpvg12szf1raq3zhg7lr01"))))
    (build-system emacs-build-system)
    (inputs
     (list
      bluez
      dbus
      ))
    (propagated-inputs
     (list
      emacs-compat
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-transient
      ))
    (home-page "https://gitlab.com/rstocker/emacs-bluetooth")
    (synopsis "Manage Bluetooth devices using Emacs")
    (description
     "This package implements basic Bluetooth management functionality, such
as connecting and disconnecting devices, setting properties and aliases,
putting the adapter in discovery mode and controlling its power supply.  It
also includes a pairing agent.")
    (license license:gpl3+)))

(define-public emacs-ag
  (package
    (name "emacs-ag")
    (version "0.48")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/ag.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1p918y24vcn2pdliaymd210xp9fvhd4a1srqbv2lfiqrh59yjidx"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'substitute-ag-path
            (lambda* (#:key inputs #:allow-other-keys)
              (make-file-writable "ag.el")
              (emacs-substitute-variables "ag.el"
                ("ag-executable" (search-input-file inputs "/bin/ag")))))
          (add-before 'install 'make-info
            (lambda _
              (with-directory-excursion "docs"
                (invoke "make" "info"))))
          (add-after 'install 'install-info
            (lambda _
              (install-file "docs/_build/texinfo/agel.info"
                            (string-append #$output "/share/info")))))))
    (inputs (list the-silver-searcher))     ; 'ag' executable
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      python-sphinx
      texinfo
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      ))
    (home-page "https://github.com/Wilfred/ag.el")
    (synopsis "Front-end for ag (the-silver-searcher) for Emacs")
    (description "This package provides the ability to use the silver
searcher, a code searching tool, sometimes abbreviated to @code{ag}.  Features
include version control system awareness, use of Perl compatible regular
expressions, editing the search results directly and searching file names
rather than the contents of files.")
    (license license:gpl3+)))

(define-public emacs-xenops
  (package
    (name "emacs-xenops")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dandavison/xenops/archive/"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1gaym5bl6fhdp4pa283qcx5qf77wz2g7xl9n1gyvvl9yl0kvrb48"))))
    (propagated-inputs
     (list
      emacs-aio
      emacs-auctex
      emacs-avy
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-s
      ))
    (build-system emacs-build-system)
    (arguments
     (list
      #:lisp-directory "lisp"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'set-home
            (lambda _
              (setenv "HOME" "/tmp"))))))
    (synopsis "WYSIWYG LaTeX environment")
    (description "This package provides a WYSIWYG LaTeX environment.
It uses @command{dvisvgm}, @command{xclip}, @command{pngpaste} and
@command{latex}.")
    (home-page "https://github.com/dandavison/xenops")
    (license license:expat)))

(define-public emacs-autothemer
  (let ((commit "0d3ed8d74cdf9be90492999217db1bc7ba866607")
        (revision "0"))
    (package
      (name "emacs-autothemer")
      (version (git-version "0.2.18" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sebastiansturm/autothemer.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "06xsj7yvcwgl8pxi3cr17fprpbi12csbk9r6nmm75wqys8yywld5"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "tests/autothemer-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/sebastiansturm/autothemer")
      (synopsis "Conveniently create Emacs themes")
      (description
       "Autothemer provides a thin layer on top of @code{deftheme} and
@code{custom-theme-set-faces} that creates a new custom color theme, based on
a set of simplified face specifications and a user-supplied color palette.")
      (license license:gpl3+))))

(define-public emacs-campus
  (let ((commit "0a475cd7704001d8dc8280acb91a317db797933b")
        (revision "0"))
    (package
      (name "emacs-campus")
      (version (git-version "0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/eshrh/campus-emacs")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "13vych4kk6adn15scl1s4znnbmfjvihfglxglrqqp2llzh0wsnlm"))))
      (arguments (list #:tests? #f)) ; There are no tests.
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (build-system emacs-build-system)
      (home-page "https://github.com/eshrh/campus-emacs")
      (synopsis "Simple and sane approach to repl programming")
      (description
       "Campus is a simple but effective improvement to the
inferior-process repl development experience in Emacs.")
      (license license:gpl3+))))

(define-public emacs-chronometrist
  (package
    (name "emacs-chronometrist")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://tildegit.org/contrapunctus/chronometrist")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qpkpkipmac24m3ng4ahsml3vi15qcvmid3g02pbpgbpc113zfpl"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:lisp-directory "elisp"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-doc
            ;; Documentation consists of several Markdown files.
            (lambda _
              (let ((doc (string-append #$output
                                        "/share/doc/emacs-chronometrist-"
                                        #$version)))
                (with-directory-excursion "../doc"
                  (for-each (lambda (f) (install-file f doc))
                            (cons* "../UNLICENSE"
                                   "../WTFPL"
                                   (find-files "." "\\.md$"))))))))))
    (propagated-inputs
     (list
      emacs-alert
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      emacs-spark
      emacs-ts
      ))
    (home-page "https://github.com/contrapunctus-1/chronometrist")
    (synopsis "Time tracker for Emacs")
    (description "Chronometrist is a time tracker in Emacs, largely modelled
after the Android application, @emph{A Time Tracker}.

Its features are:
@itemize
@item Simple and efficient to use,
@item Displays useful information about your time usage,
@item Support for both mouse and keyboard,
@item Human errors in tracking are easily fixed by editing a plain text file,
@item Hooks to let you perform arbitrary actions when starting/stopping tasks.
@end itemize")
    ;; Software is dual-licensed.
    (license (list license:unlicense license:wtfpl2))))

(define-public emacs-citeproc
  (package
    (name "emacs-citeproc")
    (version "0.9.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/andras-simonyi/citeproc-el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1l74c2f2xjzsp3i331sw3db4fhbvdbwyd856j1ygldwrh4rli9ml"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:emacs emacs ;need libxml support
      #:tests? #f)) ;tests require missing data
    (propagated-inputs
     (list
      emacs-compat
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-parsebib
      emacs-queue
      emacs-s
      emacs-string-inflection
      ))
    (home-page "https://github.com/andras-simonyi/citeproc-el")
    (synopsis "Citation Style Language (CSL) processor for Emacs")
    (description
     "Citeproc-el is an Emacs Lisp library for rendering citations
and bibliographies in styles described in the Citation Style
Language (CSL), an XML-based, open format to describe the formatting
of bibliographic references.")
    (license license:gpl3+)))

(define-deprecated/public emacs-citeproc-el emacs-citeproc
  (deprecated-package "emacs-citeproc-el" emacs-citeproc))

(define-public emacs-direnv
  (package
    (name "emacs-direnv")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wbolster/emacs-direnv")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cf5npgksl9a03mnfdhfdhlf46gr9qz9adjxz3dbckq9b1vl0dfc"))))
    (build-system emacs-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-in-direnv
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((direnv (search-input-file inputs "/bin/direnv")))
               (substitute* "direnv.el"
                 (("\"direnv\"") (string-append "\"" direnv "\"")))))))))
    (inputs
     (list direnv))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-with-editor
      ))
    (home-page "https://github.com/wbolster/emacs-direnv")
    (synopsis "Direnv integration for Emacs")
    (description
     "This package provides support for invoking direnv to get the environment
for the current file and updating the environment within Emacs to match.

Direnv can be invoked manually, and a global minor mode is included that will
update the environment when the active buffer changes.

Using emacs-direnv means that programs started from Emacs will use the
environment set through Direnv.")
    (license license:gpl3+)))

(define-public emacs-noman
  (package
    (name "emacs-noman")
    (version "0.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/andykuszyk/noman.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rh1p9nlhkmhfqmp507rz8hwfgwrdvxx0zba41lxsd2admai90wv"))
       (snippet #~(begin
                    (for-each delete-file
                              '("makem.sh" "Makefile" "screencast.gif"))))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command
           #~(list #$(file-append (this-package-native-input "makem")
                                  "/bin/makem.sh") "test")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-test
                 (lambda _
                   (substitute* "tests/noman-tests.el"
                     (("#!/bin/bash")
                      (string-append "#!" (which "bash")))))))))
    (native-inputs
     (list
      bash
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-f)
      makem-minimal
      ))
    (synopsis "Emacs package for browsing CLI command docs without man pages")
    (description
     "Noman is an Emacs package that parses command line help from flags like
@code{--help}, and presents it in an easy-to-navigate Emacs buffer.")
    (home-page "https://github.com/andykuszyk/noman.el")
    (license license:gpl3+)))

(define-public emacs-bui
  (package
    (name "emacs-bui")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://notabug.org/alezost/emacs-bui.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0sszdl4kvqbihdh8d7mybpp0d8yw2p3gyiipjcxz9xhvvmw3ww4x"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://notabug.org/alezost/emacs-bui")
    (synopsis "Buffer interface library for Emacs")
    (description
     "BUI (Buffer User Interface) is a library for making @code{list} and
@code{info} interfaces to display an arbitrary data of the same
type, for example: packages, buffers, files, etc.")
    (license license:gpl3+)))

(define-public emacs-guix
  (let ((commit "66b935020d93cdbbff0b0ed3b1d2195724a46821")
        (revision "8"))
    (package
      (name "emacs-guix")
      (version (git-version "0.5.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://codeberg.org/guix/emacs-guix/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1pm1nyy1r704wjg4hfdrrxlf1mn327wk0vkghwy8wsp4f84j5j7d"))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:modules '((guix build gnu-build-system)
                    ((guix build emacs-build-system) #:prefix emacs:)
                    (guix build utils))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils))
        #:tests? #f    ; no tests
        #:configure-flags
        #~(list (string-append "--with-lispdir="
                               (emacs:elpa-directory #$output)))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'expand-load-path
              (lambda _
                ((assoc-ref emacs:%standard-phases 'expand-load-path)
                 #:prepend-source? #f))))))
      (native-inputs
       (list autoconf automake emacs-minimal pkg-config texinfo))
      (inputs
       (list (lookup-package-input guix "guile")
             guix))
      (propagated-inputs
       (list
        emacs-bui
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-edit-indirect
        emacs-geiser
        emacs-geiser-guile
        emacs-magit-popup
        guile-gcrypt
        ))
      (home-page "https://guix.gnu.org")
      (synopsis "Emacs interface for GNU Guix")
      (description
       "Emacs-Guix provides a visual interface, tools and features for the GNU
Guix package manager.  Particularly, it allows you to do various package
management tasks from Emacs.  To begin with, run @code{M-x guix-about} or
@code{M-x guix-help} command.")
      (license license:gpl3+))))

(define-public emacs-minitest
  (package
    (name "emacs-minitest")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arthurnn/minitest-emacs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0d8kg68yy5x1y3ivj43vzcakb3gii6bh8jm40g4sah5f53bbrs16"))))
    (build-system emacs-build-system)
    (arguments
     '(#:include (cons "^snippets\\/minitest-mode\\/" %default-include)
       #:exclude (delete "^[^/]*tests?\\.el$" %default-exclude)))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      ))
    (home-page "https://github.com/arthurnn/minitest-emacs")
    (synopsis "Emacs minitest mode")
    (description
     "The minitest mode provides commands to run the tests for the current
file or line, as well as rerunning the previous tests, or all the tests for a
project.

This package also includes relevant snippets for yasnippet.")
    (license license:expat)))

(define-public emacs-es-mode
  (package
    (name "emacs-es-mode")
    (version "4.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dakrone/es-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qhfnd5anp5qrmravv7ks5ix763xnki2f5jwcyj70qyxwr0l60cg"))))
    (build-system emacs-build-system)
    (propagated-inputs
     ;; The version of org in Emacs 24.5 is not sufficient, and causes tables
     ;; to be rendered incorrectly
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-org
      emacs-spark
      ))
    (home-page "https://github.com/dakrone/es-mode")
    (synopsis "Major mode for editing Elasticsearch queries")
    (description "@code{es-mode} includes highlighting, completion and
indentation support for Elasticsearch queries.  Also supported are
@code{es-mode} blocks in @code{org-mode}, for which the results of queries can
be processed through @code{jq}, or in the case of aggregations, can be
rendered in to a table.  In addition, there is an @code{es-command-center}
mode, which displays information about Elasticsearch clusters.")
    (license license:gpl3+)))

(define-public emacs-litable
  (let ((commit "b0278f3f8dcff424bfbdfdefb545b1fbff33206f"))
    (package
      (name "emacs-litable")
      (version (git-version "0.1" "0" commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Fuco1/litable")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0bny40hv9a024n01clxns351cs4j4ifhgcc7m4743xncqf612p7g"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/Fuco1/litable/")
      (synopsis "Dynamic evaluation replacement with Emacs")
      (description "This package provides dynamic evaluation in Emacs.")
      (license license:gpl3+))))

(define-public emacs-calc-currency
  (let ((commit "7021d892ef38b01b875082aba4bae2517ce47ae6")
        (revision "0"))
    (package
      (name "emacs-calc-currency")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jws85/calc-currency")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0y4m0hasg4ji6zfis3088hq90pm9998lnnh8yg9g8yqqaqpfizp8"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "--batch"
                               "-L" "."
                               "-l" "test/calc-currency-init.el"
                               "-l" "test/calc-currency-ecb-test.el"
                               "-l" "test/calc-currency-oxr-test.el"
                               ;; test/calc-currency-utils-test.el fails
                               "-f" "ert-run-tests-batch-and-exit")))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        ))
      (home-page "https://github.com/jws85/calc-currency")
      (synopsis "Add currency units to Emacs Calc")
      (description "This package adds custom units to the units table in Emacs
Calc by fetching exchange rates backends.")
      (license license:gpl3+))))

(define-public emacs-standard-dirs
  (package
    (name "emacs-standard-dirs")
    (version "2.0.0")
    (home-page "https://github.com/lafrenierejm/standard-dirs.el")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r814qcrhvx4qlx4sdzwdmrhiryslqclx0bnpp0qcrbx6g8qfl25"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-s
      ))
    (synopsis "Platform-specific paths for config, cache, and other data")
    (description
     "This package provides platform-specific paths for reading and writing
configuration, cache, and other data.")
    (license license:gpl3+)))

(define-public emacs-org-now
  (let ((commit "8f6b277a73f1c66e58ccb4b7f40d406851befc91"))
    (package
      (name "emacs-org-now")
      (version (git-version "0.1-pre" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/org-now")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "117zzkryznznk6h4i1jqzdn888nl019xrgxm2gza0lndx8dxsg2c"))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (build-system emacs-build-system)
      (home-page "https://github.com/alphapapa/org-now")
      (synopsis "Show current Org tasks in a sidebar")
      (description
       "This package provides commands to show Org headings in a sidebar
window while working on them.  After defining one heading as the \"now\"
heading, other headings can be refiled to it with one command, and back to
their original location with another.")
      (license license:gpl3+))))

(define-public emacs-orgmdb
  (package
    (name "emacs-orgmdb")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/isamert/orgmdb.el")
             (commit "66c13abdb84e0f0a31bae6cfda27478771d58d8e")))
       (sha256
        (base32
         "1hvxha0ih9jhvwj07l6jnpf2vzhgvb6ii73g49c8saxld61l0frf"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'configure
                 (lambda* (#:key inputs #:allow-other-keys)
                   (substitute* "orgmdb.el"
                     (("\"fd ")
                      (string-append "\""
                                     (search-input-file inputs "/bin/fd")
                                     " "))))))))
    (inputs
     (list fd))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-org
      emacs-s
      ))
    (home-page "https://github.com/isamert/orgmdb.el")
    (synopsis "Emacs' Org mode watchlist manager and OMDb API client")
    (description "This package adds tools for managing your watchlist in Emacs'
Org mode and some functions for interacting with the OMDb API.")
    (license license:gpl3+)))
(define-public emacs-flycheck-rust
  (package
    (name "emacs-flycheck-rust")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/flycheck/flycheck-rust")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fh6j5w2387nh2fwwjphkhq17cgj5m2q5k0fhidvgc2w65lzbr1r"))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-flycheck
      emacs-let-alist
      ))
    (native-inputs
     (list
      emacs-buttercup
      rust-bootstrap
      `(,rust-bootstrap "cargo")
      ))
    (build-system emacs-build-system)
    (home-page "https://github.com/flycheck/flycheck-rust")
    (synopsis "Rust/Cargo support for Flycheck")
    (description
     "This Flycheck extension configures Flycheck automatically for
the current Cargo project.")
    (license license:gpl3+)))

(define-public emacs-elastic-modes
  (let ((commit "ea49bb03b78cb9fd17655990223e3095f137a3ce")
        (revision "1"))
    (package
      (name "emacs-elastic-modes")
      (version "1.0.0")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jyp/elastic-modes")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1dkigkjw4i9nz5rl0dnic16ljdnp5cyz2xic3hc2myqnjlqnc6z6"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #false)) ;no tests
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/jyp/elastic-modes")
      (synopsis "Text and code alignment for variable-width fonts")
      (description
       "This is an Emacs package for text and code alignment for
variable-width (i.e., proportional, or variable pitch) fonts.")
      (license license:gpl3+))))

(define-public emacs-docker-compose-mode
  (package
    (name "emacs-docker-compose-mode")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/meqif/docker-compose-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1fbcxwfvm33xcdj3cs26d9i1zyrryyjjkv7sc3mfxd45nq8d3ivj"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-yaml-mode
      ))
    (home-page "https://github.com/meqif/docker-compose-mode/")
    (synopsis "Major mode for editing @file{docker-compose} files")
    (description
     "This is a major mode for @file{docker-compose} files that provides
completion of relevant keywords.")
    (license license:expat)))

(define-public emacs-ob-ipython
  (package
    (name "emacs-ob-ipython")
    (version "20180224")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (commit "7147455230841744fb5b95dcbe03320313a77124")
                    (url "https://github.com/gregsexton/ob-ipython")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1a10fc2jk37ni5sjjvf87s5nyaz2a6h2mlj5dxh4dhv5sd3bb85p"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f
       )))
    (home-page "http://www.gregsexton.org")
    (synopsis "Org-Babel functions for IPython evaluation")
    (description "This package adds support to Org-Babel for evaluating Python
source code using IPython.")
    (license license:gpl3+)))

(define-public emacs-ob-async
  (package
    (name "emacs-ob-async")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/astahlman/ob-async")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10x4hxrjm4pr6vg42a961h9ilqzyd0l0fv7fsbq9clxi439f1nd6"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; ~1/2 tests fail.
           #:test-command
           #~(list "ert-runner" "--verbose" "--debug" "-l" "ob-async.el")))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (propagated-inputs
     (list
      emacs-async
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/astahlman/ob-async")
    (synopsis "Asynchronous src_block execution for org-babel")
    (description "@code{ob-async} enables asynchronous execution of org-babel
src blocks.")
    (license license:gpl3+)))

(define-public emacs-company-box
  ;; There is no release yet.  Version is extracted from the main
  ;; file.
  (let ((version "0.0.1")
        (revision "0")
        (commit "be37a9a30dc112ab172af21af694e2cb04a74f85"))
    (package
      (name "emacs-company-box")
      (version (git-version version revision commit))
      (source
       (origin
         (method (@@ (guix packages) computed-origin-method))
         (file-name (string-append name "-" version ".tar.gz"))
         (sha256 #f)
         (uri
          (delay
            (with-imported-modules '((guix build emacs-utils)
                                     (guix build utils))
              #~(begin
                  (use-modules (guix build utils)
                               (guix build emacs-utils))
                  (let* ((dir (string-append "emacs-company-box-" #$version)))

                    (set-path-environment-variable
                     "PATH" '("bin")
                     (list #+emacs-minimal
                           #+(canonical-package bash)
                           #+(canonical-package coreutils)
                           #+(canonical-package gzip)
                           #+(canonical-package tar)))

                    ;; Copy the upstream source
                    (copy-recursively
                     #+(%emacs-lsp-treemacs-upstream-source
                        #:commit commit #:version version
                        #:hash
                        (content-hash
                         "13fgmdy51gqdwijqfvb784pirx4lgva0y7ysi0c3fcx8f82cdj59"))
                     dir)

                    (with-directory-excursion dir
                      ;; The icons are unclearly licensed and possibly non-free,
                      ;; see <https://github.com/emacs-lsp/lsp-treemacs/issues/123>
                      (with-directory-excursion "images"
                        (for-each delete-file-recursively
                                  '("eclipse" "idea" "netbeans")))

                      ;; Also remove any mentions in the source code.
                      (make-file-writable "company-box-icons.el")
                      (emacs-batch-edit-file "company-box-icons.el"
                        '(progn
                          (while (search-forward-regexp
                                  "(defvar company-box-icons-\\([a-z-]*\\)"
                                  nil t)
                            (pcase (match-string 1)
                                   ((or "images"
                                        "all-the-icons"
                                        "icons-in-terminal") nil)
                                   (_ (beginning-of-line)
                                      (kill-sexp)))
                            (basic-save-buffer))))

                      ;; Also patch source to not show broken icons as configuration
                      ;; option.
                      (substitute* "company-box-icons.el"
                        (("- .*, from.*editor.*") "")
                        (("\\(const :tag \"([a-z]*)\".*\\)" all tag)
                         (if (member tag
                                     '("images" "all-the-icons" "icons-in-terminal"))
                             all
                             ""))))

                    (invoke "tar" "cvfa" #$output
                            "--mtime=@0"
                            "--owner=root:0"
                            "--group=root:0"
                            "--sort=name"
                            "--hard-dereference"
                            dir))))))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-company
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-frame-local
        ))
      (home-page "https://github.com/sebastiencs/company-box")
      (synopsis "Company front-end with icons")
      (description
       "Company box is a Company front-end.  It supports different
colors for different backends, associates icons to functions,
variables... and their backends, and displays candidate's
documentation.  It is not limited by the current window size or
buffer's text properties.

This package is not compatible with a TTY.")
      (license license:gpl3+))))
(define-public emacs-math-preview
  (package
    (name "emacs-math-preview")
    (version "5.1.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://gitlab.com/matsievskiysv/math-preview")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0ni08900p0pbajw143iw0b7a62qiqcm9b6jy7pqgpn437vydjx1z"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      ))
    (home-page "https://gitlab.com/matsievskiysv/math-preview")
    (synopsis "Preview TeX math equations inline using MathJax")
    (description
     "Emacs math-preview uses MathJax for displaying TeX, MathML and AsciiMath
  math inline in Emacs buffers.")
    (license license:gpl3+)))

(define-public emacs-company-coq
  (package
    (name "emacs-company-coq")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/cpitclaudel/company-coq")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dxi4h8xqq5647k7h89s4pi8nwyj3brlhsckrv3p3b1g4dr6mk3b"))))
    (inputs
     (list
      emacs-company
      emacs-company-math
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-yasnippet
      ))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; no tests
    (home-page "https://github.com/cpitclaudel/company-coq")
    (synopsis "Emacs extensions for Proof General's Coq mode")
    (description "This package includes a collection of Company mode backends
for Proof-General's Coq mode, and many useful extensions to Proof-General.  It
features:

@itemize
@item Prettification of operators, types, and subscripts,
@item Auto-completion,
@item Insertion of cases,
@item Fully explicit intros,
@item Outlines, code folding, and jumping to definition,
@item Help with errors,
@item and more.
@end itemize")
    (license license:gpl3+)))

(define-public emacs-multifiles
  ;; There is no tag and no "Version:" keyword.  Using the latest release
  ;; instead.
  (let ((commit "dddfe64b8e1c1cd1f9ccc1f03405477fc0d53897")
        (revision "1"))
    (package
      (name "emacs-multifiles")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magnars/multifiles.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "065l04ylplng1vgykkbn2vnkcs3sn1k2cikx1ha2q8wmgx6bkvai"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))      ; no tests
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/magnars/multifiles.el")
      (synopsis "Edit multiple files in a single Emacs buffer")
      (description
       "This package allows one to view and edit parts of multiple files in
one Emacs buffer.")
      (license license:gpl3+))))

(define-public emacs-company-lsp
  (package
    (name "emacs-company-lsp")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tigersoldier/company-lsp")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1hy1x2w0yp5brm7714d1hziz3rpkywb5jp3yj78ibmi9ifny9vri"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-lsp-mode
      emacs-company
      emacs-s
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (native-inputs
     (list emacs-buttercup))
    (arguments
     `(#:test-command '("buttercup" "-L" ".")))
    (home-page "https://github.com/tigersoldier/company-lsp")
    (synopsis "Completion for @code{lsp-mode}")
    (description
     "This package provides completion features that are not possible with
@code{lsp-mode} and @code{company-capf} alone, including support for trigger
characters and asynchronous fetching of completion candidates.")
    (license license:gpl3+)))

(define-public emacs-tagedit
  (package
    (name "emacs-tagedit")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magnars/tagedit")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kq40g46s8kgiafrhdq99h79rz9h5fvgz59k7ralmf86bl4sdmdb"))))
    (build-system emacs-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'remove-spurious-require
                 (lambda _
                   (substitute* "tagedit.el"
                     (("\\(require 'assoc\\)") "")))))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      ))
    (home-page "https://github.com/magnars/tagedit")
    (synopsis "Some Paredit-like features for HTML mode")
    (description
     "This package provides a collection of Paredit-like functions for editing
in HTML mode.")
    (license license:gpl3+)))

(define-public emacs-anki-editor
  ;; Last release was in 2018.
  (let ((commit "546774a453ef4617b1bcb0d1626e415c67cc88df")
        (revision "0")
        (version "0.3.3"))
    (package
      (name "emacs-anki-editor")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/louietan/anki-editor")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1if610hq5j8rbjh1caw5bwbgnsn231awwxqbpwvrh966kdxzl4qf"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-request
        ))
      (home-page "https://github.com/louietan/anki-editor")
      (synopsis "Minor mode for making Anki cards with Org mode")
      (description
       "This package is for people who use Anki as a spaced repetition system
(SRS) but would like to make cards in Org mode.")
      (license license:gpl3+))))
(define-public emacs-org-sidebar
  (package
    (name "emacs-org-sidebar")
    (version "0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alphapapa/org-sidebar")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gccih9wgi31m59flljw4cphfyhlfcqbjih91gkcnldq5z7n83nj"))
       (modules '((guix build utils)))
       (snippet #~(begin
                    (delete-file-recursively "images")
                    ;; Contents of makem package, but no tests.
                    (for-each delete-file
                              '("makem.sh" "Makefile"))))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-org
      emacs-org-ql
      emacs-org-super-agenda
      emacs-s
      ))
    (home-page "https://github.com/alphapapa/org-sidebar")
    (synopsis "Helpful sidebar for Org buffers")
    (description "This package provides a sidebar for Org buffers.  At the
top is a chronological list of scheduled and deadlined tasks in the current
buffer (similar to the Org agenda ,but without all its features), and below
that is a list of all other non-done to-do items.  If the buffer is narrowed,
the sidebar only shows items in the narrowed portion; this allows seeing an
overview of tasks in a subtree.")
    (license license:gpl3+)))

(define-public emacs-org-trello
  (package
    (name "emacs-org-trello")
    (version "0.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/org-trello/org-trello")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "18y5zdjc7zh4jlwz6k1nl13i721rknqm0vp4mxfnmq0sc5a0qva0"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; Old incompatible version of dash is used.
           #:test-command #~(list "ert-runner")))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-deferred
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-helm
      emacs-request
      emacs-s
      ))
    (home-page "https://org-trello.github.io")
    (synopsis "Emacs minor mode for interacting with Trello")
    (description "This package provides an Emacs minor mode to extend
@code{org-mode} with Trello abilities.  Trello is an online project
organizer.")
    (license license:gpl3+)))

(define-public emacs-company-flow
  (let ((commit "76ef585c70d2a3206c2eadf24ba61e59124c3a16")
        (revision "1"))
    (package
      (name "emacs-company-flow")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/aaronjensen/company-flow/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0zs9cblnbkxa0dxw4lyllmybqizxcdx96gv8jlhx20nrjpi78piw"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-company
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/aaronjensen/company-flow/")
      (synopsis "Flow backend for @code{company-mode}")
      (description
       "This package provides completion for JavaScript files utilizing Flow.")
      (license license:gpl3+))))

(define-public emacs-solarized-theme
  (package
    (name "emacs-solarized-theme")
    (version "2.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bbatsov/solarized-emacs/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nwyax9dikpw4fcplnk0az9k1pk02wnhkadvfp325s7rl2j8y23b"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; Tests require a standard tty.
           #:test-command #~(list "make" "run" "CASK=")))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/bbatsov/solarized-emacs")
    (synopsis "Port of the Solarized theme for Emacs")
    (description
     "Solarized for Emacs is a port of the Solarized theme for Vim.  This
package provides a light and a dark variant.")
    (license license:gpl3+)))

(define-public emacs-consult-notes
  (let ((commit "7c9cd970c75fae9a6140ca1beefed9532d8e1b96")
        (revision "0"))
    (package
      (name "emacs-consult-notes")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/mclear-tools/consult-notes/")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1lccpnqqaai6vsjn9v65xhpzs0bmhrsyflaxg3n3iszigmsxrfaz"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))      ;no tests
      (propagated-inputs
       (list
        emacs-consult
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (home-page "https://github.com/mclear-tools/consult-notes/")
      (synopsis "Management of personal notes with @code{emacs-consult}")
      (description
       "This package allows selecting notes easily.  Its most basic use is to
integrate directories of files (notes) and to provide easy narrowing via
@code{emacs-consult}.  @code{consult-notes} can be used with any directory (or
directories) of note files.  It easily integrates with note systems like
@code{emacs-zk}, @code{emacs-denote} or @code{emacs-org-roam}.  Additionally, it
may also search org headings in a set of specified files.")
      (license license:gpl3+))))

(define-public emacs-smartparens
  (let ((commit "b629b4e893ba21ba5a381f6c0054bb72f8e96df2")
        (revision "1"))
    (package
      (name "emacs-smartparens")
      (version (git-version "1.11.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Fuco1/smartparens")
               (commit commit)))
         (file-name (git-file-name name version))
         (modules '((guix build utils)
                    (ice-9 ftw)
                    (srfi srfi-26)))
         (snippet
          '(begin
             ;; Taken from nextpnr package.
             (define (delete-all-but directory . preserve)
               (with-directory-excursion directory
                 (let* ((pred
                         (negate (cut member <> (append '("." "..") preserve))))
                        (items (scandir "." pred)))
                   (for-each delete-file items))))
             ;; Only activate basic tests.
             (delete-all-but "test"
                             "test-helper.el"
                             "smartparens-advice-test.el"
                             "smartparens-delete-pair-test.el"
                             "smartparens-elisp-test.el"
                             "smartparens-framework-test.el"
                             "smartparens-get-comment-bounds-test.el"
                             "smartparens-get-paired-expression-elisp-test.el"
                             "smartparens-get-prefix-test.el"
                             "smartparens-get-stringlike-expression-elisp-test.el"
                             "smartparens-get-stringlike-expression-python-test.el"
                             "smartparens-get-stringlike-expression-test.el"
                             "smartparens-get-suffix-test.el"
                             "smartparens-insertion-specification-parser-test.el"
                             "smartparens-markdown-test.el"
                             "smartparens-movement-test.el"
                             "smartparens-org-test.el"
                             "smartparens-region-ok-test.el"
                             "smartparens-rst-test.el"
                             "smartparens-search-fn-test.el"
                             "smartparens-settings-sp-pair-test.el"
                             "smartparens-skip-closing-pair-test.el")))
         (sha256
          (base32 "1nfd10kxd1l8bmxhaghhxphl424yg5qn6xcqaligwc3b406b566w"))))
      (build-system emacs-build-system)
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        emacs-yasnippet
        ))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-markdown-mode
        ))
      (home-page "https://github.com/Fuco1/smartparens")
      (synopsis "Paredit-like insertion, wrapping and navigation with user
defined pairs")
      (description
       "Smartparens is a minor mode for Emacs that deals with parens pairs
and tries to be smart about it.  It started as a unification effort to
combine functionality of several existing packages in a single,
compatible and extensible way to deal with parentheses, delimiters, tags
and the like.  Some of these packages include autopair, textmate,
wrap-region, electric-pair-mode, paredit and others.  With the basic
features found in other packages it also brings many improvements as
well as completely new features.")
      (license license:gpl3+))))

(define-public emacs-eyebrowse
  ;; XXX: Upstream has no tagged release.  Version is extracted from keyword
  ;; in main file.
  (let ((commit "88c7b59aa7c5c93bc23812217213adfa238f977b")
        (revision "0"))
    (package
      (name "emacs-eyebrowse")
      (version (git-version "0.7.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://depp.brause.cc/eyebrowse.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "09s07mvg5bz3dm9sxgn40c7z6d6ry1sdjzsxwgmy825f3xm66avs"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://depp.brause.cc/eyebrowse/")
    (synopsis "Simple-minded way to manage window configs in Emacs")
    (description
     "Eyebrowse is a global minor mode for Emacs that allows you to manage
your window configurations in a simple manner, just like tiling window
managers like i3wm with their workspaces do.  It displays their current state
in the modeline by default.")
    (license license:gpl3+))))

(define-public emacs-pretty-hydra
  (package
    (name "emacs-pretty-hydra")
    (version "0.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jerrypnz/major-mode-hydra.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "08a15knkdq35pzjq82imff016fbfdib5q4glg2xmdy2b5fnk7jqa"))
       (modules '((guix build utils)))
       (snippet #~(begin (substitute* "test/pretty-hydra-test.el"
                           (("\\(c1 \\(quote foo\\)\\)") "(c1 'foo)"))))))
    (build-system emacs-build-system)
    (arguments
     (list #:exclude #~(cons "^major-mode-hydra\\.el" %default-exclude)))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-hydra
      emacs-s
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (home-page "https://github.com/jerrypnz/major-mode-hydra.el")
    (synopsis "Major mode keybindings managed by Hydra")
    (description
     "This package offers an hydra-based method of managing major
mode-specific key bindings.  It is intended for use as a library only; see
package @code{emacs-major-mode-hydra} for a user-friendly interface.")
    (license license:gpl3+)))

(define-public emacs-major-mode-hydra
  (package
    (inherit emacs-pretty-hydra)
    (name "emacs-major-mode-hydra")
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-pretty-hydra
      ))
    (arguments
     `(#:exclude (cons "^pretty-hydra\\.el" %default-exclude)))
    (synopsis "Create nice-looking hydras")
    (description
     "This package provides the macro @code{pretty-hydra-define} to define
hydras with one column per group of heads.")))

(define-public emacs-clojure-mode
  (package
    (name "emacs-clojure-mode")
    (version "5.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clojure-emacs/clojure-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kv7jw1cg145zcy0pffjk9n2kkcgdn46nb2ny06ynadbivk2l4ds"))))
    (build-system emacs-build-system)
    (native-inputs
     (list
      emacs-buttercup
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-paredit
      emacs-s
      ))
    (arguments
     `(#:test-command '("buttercup")))
    (home-page "https://github.com/clojure-emacs/clojure-mode")
    (synopsis "Major mode for Clojure code")
    (description
     "This Emacs package provides font-lock, indentation, navigation and basic
refactoring for the @uref{http://clojure.org, Clojure programming language}.
It is recommended to use @code{clojure-mode} with Paredit or Smartparens.")
    (license license:gpl3+)))

(define-public emacs-sphinx-doc
  (let ((commit "1eda612a44ef027e5229895daa77db99a21b8801")
        (revision "1"))
    (package
      (name "emacs-sphinx-doc")
      (version (git-version "0.3.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/naiquevin/sphinx-doc.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0q72i95yx3xa57jlgr7dik6prf20hi8bp8xf3f5c6ificv7i5378"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "sphinx-doc-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (home-page "https://github.com/naiquevin/sphinx-doc.el")
      (synopsis
       "Generate Sphinx friendly docstrings for Python functions in Emacs")
      (description
       "Sphinx Doc is an Emacs minor mode for inserting docstring skeletons
for Python functions and methods.  The structure of the docstring is as per
the equirement of the Sphinx documentation generator.")
      (license license:expat))))

(define-public emacs-julia-snail
  (package
    (name "emacs-julia-snail")
    (version "1.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gcv/julia-snail")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1jphpyhg52c2gm8dkz42s3nsyb4b1bg9n4vx8qncn1flclczkgcz"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include
      #~(cons* "^JuliaSnail\\.jl" "extensions" %default-include)))
    (inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      emacs-spinner
      emacs-xref
      ))
    (propagated-inputs
     (list
      libvterm
      emacs-julia-mode             ;required by parser
      emacs-parsec                 ;required by parser
      emacs-popup
      emacs-vterm
      julia-tokenize
      julia-cstparser
      ))
    (home-page "https://github.com/gcv/julia-snail")
    (synopsis "Development environment and REPL interaction package for Julia")
    (description "This package provides a development environment and REPL
interaction package for Julia in the spirit of Common Lisp’s SLIME and
Clojure’s CIDER.  It enables convenient and dynamic REPL-driven development.")
    (license license:gpl3)))

(define-public emacs-tide
  (package
    (name "emacs-tide")
    (version "5.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ananthakumaran/tide")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "01chyr71b8893jxgf4wncpskfmg9iwfpcaxq0vfc6yaij46yfhky"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command
                     #~(list "emacs" "--batch" "-l" "tide-tests.el"
                             "-f" "ert-run-tests-batch-and-exit")
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-before 'check 'set-home
                           (lambda _
                             (setenv "HOME" (getenv "TMPDIR"))))
                         (add-before 'check 'skip-package-refresh
                           (lambda _
                             (emacs-batch-edit-file "tide-tests.el"
                               '(progn (search-forward "dolist (p")
                                       (beginning-of-line)
                                       (kill-sexp)
                                       (basic-save-buffer)))))
                         (add-before 'check 'skip-failing-tests
                           (lambda _
                             (substitute* "tide-tests.el"
                               (("tide-list-servers/.*" all)
                                (string-append all " (skip-unless nil)"))))))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-flycheck
      emacs-s
      emacs-typescript-mode
      ))
    (native-inputs (list node))
    (home-page "https://github.com/ananthakumaran/tide")
    (synopsis "Typescript IDE for Emacs")
    (description
     "Tide is an Interactive Development Environment (IDE) for Emacs which
provides the following features:

@itemize
@item ElDoc
@item Auto complete
@item Flycheck
@item Jump to definition, Jump to type definition
@item Find occurrences
@item Rename symbol
@item Imenu
@item Compile On Save
@item Highlight Identifiers
@item Code Fixes
@item Code Refactor
@item Organize Imports
@end itemize")
    (license license:gpl3+)))

(define-public emacs-projectile
  (package
    (name "emacs-projectile")
    (version "2.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bbatsov/projectile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "15wc2ivmac0kgbdgsaaxngmcffgd3227zsb4n7inhn14cqwr6qxd"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "buttercup" "-L" ".")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'fix-failing-test
            (lambda _
              (substitute* "test/projectile-test.el"
                (("user-emacs-directory") "\".\"")))))))
    (native-inputs
     (list emacs-buttercup))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-pkg-info
      ))
    (home-page "https://github.com/bbatsov/projectile")
    (synopsis "Manage and navigate projects in Emacs easily")
    (description
     "This library provides easy project management and navigation.  The
concept of a project is pretty basic: just a folder containing special file.
Currently Git, Mercurial and Bazaar repositories are considered projects by
default.  If you want to mark a folder manually as a project just create an
empty @file{.projectile} file in it.")
    (license license:gpl3+)))

(define-public emacs-skeletor
  (let ((commit "47c5b761aee8452716c97a69949ac2f675affe13")
        (revision "1"))
    (package
      (name "emacs-skeletor")
      (version (git-version "1.6.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/chrisbarrett/skeletor.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "12bdgykfh4mwsqdazxjdvha62h3q3v33159ypy91f6x59y01fi0n"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^project-skeletons\\/" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            ;; XXX: one failing test involving initializing a git repo.
            (add-before 'check 'remove-git-test
              (lambda _
                (emacs-batch-edit-file "test/skeletor-test.el"
                  `(progn
                    (goto-char (point-min))
                    (re-search-forward "ert-deftest initialises-git-repo")
                    (beginning-of-line)
                    (kill-sexp)
                    (basic-save-buffer))))))))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-let-alist
        emacs-s
        ))
      (home-page "https://github.com/chrisbarrett/skeletor.el")
      (synopsis "Project skeletons for Emacs")
      (description "This package provides project templates and automates the
mundane parts of setting up a new project, such as version control, licenses,
and tooling.")
      (license license:gpl3+))))

(define-public emacs-elfeed
  (package
    (name "emacs-elfeed")
    (version "3.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/skeeto/elfeed")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yq93abyadzrmcd40pi06wcr4jg9ddhlz2phg0wjypprqvv4q49z"))))
    (build-system emacs-build-system)
    (arguments
     `(#:test-command '("make" "test")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-program-calls
           (lambda* (#:key inputs #:allow-other-keys)
             (emacs-substitute-variables "elfeed-curl.el"
               ("elfeed-curl-program-name"
                (search-input-file inputs "/bin/curl"))))))))
    (inputs
     (list curl))
    (home-page "https://github.com/skeeto/elfeed")
    (synopsis "Atom/RSS feed reader for Emacs")
    (description
     "Elfeed is an extensible web feed reader for Emacs, supporting both Atom
and RSS, with a user interface inspired by notmuch.")
    (license license:gpl3+)))

(define-public emacs-elfeed-goodies
  (let ((commit "544ef42ead011d960a0ad1c1d34df5d222461a6b"))
    (package
      (name "emacs-elfeed-goodies")
      (version commit)
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jeetelongname/elfeed-goodies")
               (commit version)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "147pwqx2maf430qhigzfd6lqk7a5sbrydf9a4c5bvsw8jv7wzb6l"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-elfeed
        emacs-popwin
        emacs-powerline
        emacs-link-hint
        ))
      (home-page "https://github.com/jeetelongname/elfeed-goodies")
      (synopsis
       "Various bits and pieces to enhance the Elfeed user experience")
      (description
       "This package enhances the vanilla Elfeed user experience with:
@itemize @bullet
@item
An adaptive, powerline-based header for the @code{*elfeed-search*} and
@code{*elfeed-entry*} buffers, with a matching entry format.

@item
Split pane setup.

@item
A function to toggle the @code{*elfeed-log*} buffer in a popup window.
@end itemize")
      (license license:gpl3+))))

(define-public emacs-elfeed-org
  (let ((commit "1197cf29f6604e572ec604874a8f50b58081176a")
        (version "20250104.0")
        (revision "0"))
    (package
      (name "emacs-elfeed-org")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/remyhonig/elfeed-org")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0giwnzlqk2s5hb6fs8a0l4dxcmn2fvkngpj1fayzwj0qnvds1kri"))))
      (build-system emacs-build-system)
      (arguments
       `(#:test-command '("ert-runner" "-L" "org-mode/lisp")))
      (propagated-inputs
       (list
        emacs-elfeed
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        emacs-xtest
        ))
      (home-page "https://github.com/remyhonig/elfeed-org")
      (synopsis "Configure Elfeed with an Org-mode file")
      (description
       "@code{elfeed-org} lets you manage your Elfeed subscriptions
in Org-mode.  Maintaining tags for all RSS feeds is cumbersome using
the regular flat list, where there is no hierarchy and tag names are
duplicated a lot.  Org-mode makes the book keeping of tags and feeds
much easier.")
      (license license:gpl3+))))

(define-public emacs-elfeed-protocol
  (package
    (name "emacs-elfeed-protocol")
    (version "0.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fasheng/elfeed-protocol")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n5bns7181j6n603a626jsv26v06s3wm86ml7vixlp234p0frypp"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-elfeed
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (home-page "https://github.com/fasheng/elfeed-protocol")
    (synopsis "Fever/NewsBlur/ownCloud/tt-RSS protocols for Elfeed")
    (description
     "Elfeed-protocol provides extra protocols to make self-hosting RSS
readers like Fever, NewsBlur, ownCloud News and Tiny TIny RSS work
with Elfeed.")
    (license license:gpl3+)))

(define-public emacs-elfeed-score
  (package
    (name "emacs-elfeed-score")
    (version "1.2.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sp1ff/elfeed-score")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16dsv9nqc71hpdxcy8xspy6ji32q8j38ikq57kxrvkysv2zsjzy6"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #false                   ;FIXME: How to run tests properly?
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'make-info
            (lambda _
              (with-directory-excursion "doc"
                (invoke "makeinfo" "--no-split"
                        "-o" "elfeed-score.info" "elfeed-score.texi")))))))
    (native-inputs
     (list texinfo))
    (propagated-inputs
     (list emacs-elfeed))
    (home-page "https://github.com/sp1ff/elfeed-score")
    (synopsis "Gnus-style scoring for Elfeed")
    (description
     "Elfeed-score is an add-on for Elfeed, an RSS reader for Emacs.  It
brings Gnus-style scoring to your RSS feeds.  Elfeed, by default, displays
feed entries by date.  This package allows you to setup rules for assigning
numeric scores to entries, and sorting entries with higher scores ahead of
those with lower, regardless of date.  The idea is to prioritize content
important to you.")
    (license license:gpl3+)))

(define-public emacs-elfeed-tube
  (package
    (name "emacs-elfeed-tube")
    (version "0.15")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/karthink/elfeed-tube")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vsrsnvz0ysd36a99zk7n2giv0gxznlnls8zq6lcc0hwqw78i5cq"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-elfeed emacs-aio emacs-mpv))
    (home-page "https://github.com/karthink/elfeed-tube/")
    (synopsis "YouTube integration for Elfeed")
    (description
     "@code{elfeed-tube} is an extension for Elfeed that enhances Youtube RSS
feed subscriptions.")
    (license license:unlicense)))

(define-public emacs-el-x
  (package
    (name "emacs-el-x")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sigma/el-x")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1i6j44ssxm1xdg0mf91nh1lnprwsaxsx8vsrf720nan7mfr283h5"))))
    (build-system emacs-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         ;; Move the source files to the top level, which is included in
         ;; the EMACSLOADPATH.
         (add-after 'unpack 'move-source-files
           (lambda _
             (let ((el-files (find-files "./lisp" ".*\\.el$")))
               (for-each (lambda (f)
                           (rename-file f (basename f)))
                         el-files))
             #t)))))
    (home-page "https://github.com/sigma/el-x")
    (synopsis "Emacs Lisp extensions")
    (description "@command{emacs-el-x} defines the @code{dflet} macro to
provide the historic behavior of @code{flet}, as well as
@code{declare-function} stub for older Emacs.")
    (license license:gpl2+)))

(define-public emacs-epithet
  ;; No tags.
  (let ((commit "cc42338376c2c58da561214c554be8e8856f6a2b"))
    (package
      (name "emacs-epithet")
      (version "0.1")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/oantolin/epithet")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "06irgshgcgmm09nswrny8mam6l660ai71rgn0l3rmyp9li8n97j0"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/oantolin/epithet")
      (synopsis "Rename Emacs buffers with descriptive names")
      (description
       "This package provides a function---@code{epithet-rename-buffer}---to
rename the current buffer with a descriptive name.  The name suggestion is
governed by the @code{epithet-suggesters} hook variable: each hook should
return either a name suggestion or @code{nil}, they are called in turn and the
first non-nil suggestion is taken.")
      (license license:gpl3+))))

(define-public emacs-eterm-256color
  (package
    (name "emacs-eterm-256color")
    (version "0.3.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dieggsy/eterm-256color")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ysxblc90kjcz84siprnyxwh94scflivqbxylzkvjm7hbx93rsh1"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-xterm-color
      ))
    (home-page "https://github.com/dieggsy/eterm-256color")
    (synopsis
     "Customizable 256 colors for Emacs @code{term} and @code{ansi-term}")
    (description "This package uses @code{emacs-xterm-color} to add
customizable 256 color support to @code{term} and @code{ansi-term}.")
    (license license:gpl3+)))

(define-public emacs-elpy
  ;; Using the latest commit fixes outstanding bugs such as the following:
  ;; https://github.com/jorgenschaefer/elpy/issues/1824
  ;; https://github.com/jorgenschaefer/elpy/pull/1951
  ;; https://github.com/jorgenschaefer/elpy/issues/1940.
  (let ((commit "7ff8ffa918411887d165764f7a5a12bc46646e73")
        (revision "2"))
    (package
      (name "emacs-elpy")
      (version (git-version "1.35.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/jorgenschaefer/elpy")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0lh8w5a1abxaa7lf1c4yzgr0sh9szcwdnwd8w2004hv6mrcmyqc6"))
                (patches (search-patches "emacs-elpy-dup-test-name.patch"))))
      (build-system emacs-build-system)
      (arguments
       `(#:include (cons* "^elpy/[^/]+\\.py$" "^snippets\\/" %default-include)
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'disable-broken-tests
             ;; Some tests are known to have problems with Python 3.9; disable
             ;; them (see:
             ;; https://github.com/jorgenschaefer/elpy/issues/1856).
             ;; Aggressively remove the modules where failing tests were
             ;; discovered, as they are similar and fail in a nondeterministic
             ;; way.
             (lambda _
               (with-directory-excursion "test"
                 (for-each delete-file
                           (append (find-files "." "elpy-refactor")
                                   (find-files "." "elpy-multiedit")
                                   (find-files "." "elpy-pdb")
                                   (find-files "." "elpy-promise")))
                 ;; These test fail since upgrading Emacs from version 27 to
                 ;; 28.1 (see:
                 ;; https://github.com/jorgenschaefer/elpy/issues/1982).
                 (delete-file "elpy-project-find-git-root-test.el")
                 (substitute* "elpy-company-backend-test.el"
                   (("elpy-company-backend-should-add-shell-candidates.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-eldoc-documentation-test.el"
                   (("elpy-eldoc-documentation-should-show-object-onelinedoc.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-shell-send-file-test.el"
                   (("elpy-shell-send-file-should-accept-large-strings.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-shell-echo-inputs-and-outputs-test.el"
                   (("elpy-shell-should-echo-outputs.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 ;; This test started failing with Emacs 29 (see:
                 ;; https://github.com/jorgenschaefer/elpy/issues/2032).
                 (substitute* "elpy-folding-fold-blocks-test.el"
                   (("elpy-fold-at-point-should-NOT-fold-and-unfold-functions\
-from-after.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 ;; These tests started failing with Emacs 30.
                 ;; (TODO: report upstream)
                 (substitute* "elpy-company-backend-test.el"
                   (("elpy-company-backend-should-find-.*-prefix-string.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-shell-get-or-create-process-test.el"
                   (("elpy-shell-get-or-create-process-should-add-project-root\
-to-path.*" all)
                    (string-append all "  :expected-result :failed\n")))
                 (substitute* "elpy-format-code-test.el"
                   (("elpy-should-format-code-with-default-formatter.*" all)
                    (string-append all "  :expected-result :failed\n"))))))
           ;; The default environment of the RPC uses Virtualenv to install
           ;; Python dependencies from PyPI.  We don't want/need this in Guix.
           (add-before 'check 'do-not-use-virtualenv
             (lambda _
               (setenv "ELPY_TEST_DONT_USE_VIRTUALENV" "1")
               (substitute* "elpy-rpc.el"
                 (("defcustom elpy-rpc-virtualenv-path 'default")
                  "defcustom elpy-rpc-virtualenv-path 'system"))))
           (add-before 'check 'build-doc
             (lambda _
               (with-directory-excursion "docs"
                 (invoke "make" "info" "man"))
               ;; Move .info file at the root so that it can installed by the
               ;; 'move-doc phase.
               (rename-file "docs/_build/texinfo/Elpy.info" "Elpy.info")))
           (add-after 'build-doc 'install-manpage
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out  (assoc-ref outputs "out"))
                      (man1 (string-append out "/share/man/man1")))
                 (mkdir-p man1)
                 (copy-file "docs/_build/man/elpy.1"
                            (string-append man1 "/elpy.1"))))))))
      (propagated-inputs
       (list
        emacs-company
        emacs-find-file-in-project
        emacs-highlight-indentation
        emacs-yasnippet
        emacs-pyvenv
        emacs-s
        ;; The following are recommended Python dependencies that make
        ;; Elpy much more useful.  Installing these avoids Elpy prompting
        ;; to install them from PyPI using pip.
        python-autopep8
        python-black
        python-flake8
        python-jedi
        python-yapf
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        (@(bost gnu packages emacs-build) emacs-f)
        python-wrapper
        ;; For documentation.
        python-sphinx
        texinfo
        ))
      (home-page "https://github.com/jorgenschaefer/elpy")
      (synopsis "Python development environment for Emacs")
      (description "Elpy brings powerful Python editing to Emacs.  It combines
and configures a number of other packages written in Emacs Lisp as well as
Python, together offering features such as navigation, documentation,
completion, interactive development and more.")
      (license license:gpl3+))))

(define-public emacs-gitlab-snip-helm
  (package
    (name "emacs-gitlab-snip-helm")
    (version "0.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/sasanidas/gitlab-snip-helm.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1c5js19zyb1z61hapvbfcl5jhrjqij46cxldgqij6al0scw44dga"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-helm
      ))
    (home-page "https://gitlab.com/sasanidas/gitlab-snip-helm/")
    (synopsis "GitLab snippet API interaction for Emacs")
    (description "This package provides GitLab snippet API interaction for
Emacs.")
    (license license:gpl3+)))

(define-public emacs-wgrep
  (package
    (name "emacs-wgrep")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mhayashi1120/Emacs-wgrep")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "16qg5dpg7hms5dmh92ksnjahf6010pw97ggi7sb0mfafd6iwps0a"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "emacs" "--batch" "-Q"
                             "-l" "wgrep-test.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      ))
    (home-page "https://github.com/mhayashi1120/Emacs-wgrep")
    (synopsis "Edit a grep buffer and apply those changes to the files")
    (description
     "Emacs wgrep allows you to edit a grep buffer and apply those changes
to the file buffer.  Several backends are supported beside the classic grep:
ack, ag, helm and pt.")
    (license license:gpl3+)))

(define-public emacs-hexrgb
  (let ((commit "90e5f07f14bdb9966648977965094c75072691d4"))
    (package
      (name "emacs-hexrgb")
      (version "0")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/emacsmirror/hexrgb")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0y5l6hrzm5j2jfrm5jp5zrxhxgvf930m2k4nyvk0rllpx0i1271z"))))
      (build-system emacs-build-system)
      (home-page "https://www.emacswiki.org/emacs/hexrgb.el")
      (synopsis "Emacs functions to convert color formats")
      (description
       "HexRGB provides functions for converting between RGB (red, green, blue)
color components and HSV (hue, saturation, value) color components.  More
accurately, it converts Emacs color components (whole numbers from 0 through
65535), RGB and HSV floating-point components (0.0 through 1.0), Emacs
color-name strings (such as \"blue\") and hex RGB color strings (such as
\"#FC43A7912\").")
      (license license:gpl2+))))

(define-public emacs-taskrunner
  (let ((commit "3afd4a546d42339543d3d4e51b175fc3e82b3358")
        (revision "1"))
    (package
      (name "emacs-taskrunner")
      (version (git-version "0.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-taskrunner/emacs-taskrunner")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1lkdvmjn3alhqxq2i64sdr977sbw3g0b2670d9bwyzi67qh0jxrv"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-async emacs-projectile))
      (home-page "https://github.com/emacs-taskrunner/emacs-taskrunner")
      (synopsis "Retrieve tasks from various build systems and task-runners")
      (description "This package parses Makefiles and build-system files for
multiple project types.")
      (license license:gpl3+))))

(define-public emacs-tp
  (package
    (name "emacs-tp")
    (version "0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/martianh/tp.el")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1hv0j4dzwamhm2gp5123j415mq13347v5lsbxlrksha5nw9h7kds"))))
    (build-system emacs-build-system)
    (home-page "https://codeberg.org/martianh/tp.el")
    (synopsis "Utilities to create transient menus for POSTing to an API")
    (description
     "This package provides functions, classes and methods to make it easier
to create transient menus that send complex POST, PUT, or PATCH requests to
JSON APIs.")
    (license license:gpl3+)))


(define-public emacs-ivy-taskrunner
  (let ((commit "75d8d67cfe3c29663fe0f5508a887adf40ed5162")
        (revision "1"))
    (package
      (name "emacs-ivy-taskrunner")
      (version (git-version "0.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-taskrunner/ivy-taskrunner")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1wf4s4k0ap21f7g5w6128an8nsvbja7f5n889vcml5b6gjz058db"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-ivy emacs-taskrunner emacs-projectile))
      (home-page "https://github.com/emacs-taskrunner/ivy-taskrunner")
      (synopsis "Retrieve build-system tasks using Ivy")
      (description "This package provides an Ivy interface for selecting
Makefile targets.")
      (license license:gpl3+))))

(define-public emacs-helm-taskrunner
  (let ((commit "1910dac19cbc7bd4fd08b0faf9affd455339fbea")
        (revision "1"))
    (package
      (name "emacs-helm-taskrunner")
      (version (git-version "0.9" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-taskrunner/helm-taskrunner")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "182lmr858fx6rdhp1fy7kv8dvrhzcnxzwfck1q22s6xs8x85d5q7"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        emacs-taskrunner
        emacs-projectile
        ))
      (home-page "https://github.com/emacs-taskrunner/helm-taskrunner")
      (synopsis "Retrieve build-system tasks using Helm")
      (description "This package provides a Helm interface for selecting
Makefile targets.")
      (license license:gpl3+))))

;; (define-public emacs-helm-make
;;   (let ((commit "ebd71e85046d59b37f6a96535e01993b6962c559")
;;         (revision "0"))
;;     (package
;;       (name "emacs-helm-make")
;;       (version (git-version "0.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/abo-abo/helm-make")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "14jvhhw4chl94dgfwbyy7yirwchvcz5zrsgr9w6qy4z0fhqba41a"))))
;;       (build-system emacs-build-system)
;;       (arguments (list #:tests? #f))    ; no tests
;;       (propagated-inputs
;;        (list emacs-helm emacs-ivy emacs-projectile))
;;       (home-page "https://github.com/abo-abo/helm-make")
;;       (synopsis "Select a Makefile target with helm")
;;       (description "@code{helm-make} or @code{helm-make-projectile} will give
;; you a @code{helm} selection of directory Makefile's targets.  Selecting a
;; target will call @code{compile} on it.")
;;       (license license:gpl3+))))

(define-public emacs-islisp-mode
  (package
    (name "emacs-islisp-mode")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/sasanidas/islisp-mode")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1s6alrv1hfi1plj5lh826j0h71xvm2v092kglj3yvy34g73dgrna"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include #~(cons "\\.lsp$" %default-include)
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the extensions source files to the top level, which is
          ;; included in the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (for-each (lambda (dir)
                          (let ((files (find-files dir "\\.(lsp|el)$")))
                            (for-each (lambda (f)
                                        (rename-file f (basename f)))
                                      files)))
                        '("advance" "implementations/easy-islisp"))))
          (add-after 'move-source-files 'patch-eisl-variables
            (lambda* (#:key inputs #:allow-other-keys)
              (emacs-substitute-variables "easy-islisp.el"
                ("easy-islisp-executable"
                 (search-input-file inputs "/bin/eisl"))
                ("easy-islisp-library-directory"
                 `(or (getenv "EASY_ISLISP")
                      ,(search-input-directory inputs "share/eisl/library")))))))))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (inputs
     (list
      eisl
      ))
    (home-page "https://gitlab.com/sasanidas/islisp-mode")
    (synopsis "ISLisp support for Emacs")
    (description
     "This package provides support for programming with ISLisp in Emacs.  It
features a major mode with syntax highlighting, symbol autocompletion and
documentation search, among other features.  It also includes an inferior mode
with REPL integration.  Currently it only supports the Easy ISLisp (eisl)
implementation.")
    (license license:gpl3+)))

(define-public emacs-cider
  (let ((commit "b5a6ffc97e3c76957721f71280ea5f49fd29d7a3")
        (revision "0"))
    (package
      (name "emacs-cider")
      (version (git-version "1.19.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/clojure-emacs/cider")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0limw27arkc8bn0zzj0jzhdsax78qm1lz5jfgy8zgf971llhf5qc"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons* "^lein\\.sh$" "^clojure\\.sh$" %default-include)
        #:exclude                        ;don't exclude 'cider-test.el'
        #~(list "^\\.dir-locals\\.el$" "^test/")
        #:test-command
        #~(list "eldev" "--use-emacsloadpath" "-dtT" "-p" "test")
        #:phases
        ;; XXX: file "test/cider-tests.el" contains a bogus "/bin/command"
        ;; string, and `patch-el-files' phase chokes on it (even though the
        ;; file is excluded from installation).  Remove the phase altogether
        ;; since there is no "/bin/executable" to replace in the code base
        ;; anyway.
        #~(modify-phases %standard-phases
            (delete 'patch-el-files)
            (add-before 'check 'skip-failing-tests
              (lambda _ ;; Require network.
                (delete-file "test/cider-jar-tests.el"))))))
      (native-inputs (list emacs-buttercup emacs-eldev))
      (propagated-inputs
       (list
        emacs-clojure-mode
        emacs-parseedn
        emacs-pkg-info
        emacs-queue
        emacs-sesman
        emacs-spinner
        ))
      (home-page "https://cider.mx/")
      (synopsis "Clojure development environment for Emacs")
      (description
       "CIDER (Clojure Interactive Development Environment that Rocks) aims to
provide an interactive development experience similar to the one you'd get
when programming in Emacs Lisp, Common Lisp (with SLIME or Sly), Scheme (with
Geiser) and Smalltalk.

CIDER is the successor to the now deprecated combination of using SLIME +
swank-clojure for Clojure development.

There are plenty of differences between CIDER and SLIME, but the core ideas
are pretty much the same (and SLIME served as the principle inspiration for
CIDER).")
      (license license:gpl3+))))

(define-public emacs-cider-eval-sexp-fu
  (let ((commit "7fd229f1441356866aedba611fd0cf4e89b50921")) ;version bump
    (package
      (name "emacs-cider-eval-sexp-fu")
      (version "1.2")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/clojure-emacs/cider-eval-sexp-fu")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "01gky548v3758fyr317lkwsc9aacab6m9d9vk1mrr3qyvmciwd51"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-eval-sexp-fu))
      (home-page "https://github.com/clojure-emacs/cider-eval-sexp-fu")
      (synopsis "Eval Sexp-fu extensions for CIDER")
      (description
       "This package provides tiny improvements to expression evaluation,
e.g., the expression you've just evaluated would briefly flash and so on.")
      (license license:gpl3+))))

(define-public emacs-sly
  ;; Update together with sbcl-slynk.
  (let ((commit "9c43bf65b967e12cef1996f1af5f0671d8aecbf4")
        (revision "9"))
    ;; Versions are not always tagged.  Besides, latest master contains
    ;; important fixes.
    (package
      (name "emacs-sly")
      (version (git-version "1.0.43" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/joaotavora/sly")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "15nyr02ykkws4q79jcmxcawddg8sgq9v5l8k7jv7gg3hnpzxjlb2"))))
      (build-system emacs-build-system)
      (native-inputs
       (list sbcl texinfo))
      (arguments
       (list
        #:include #~(cons* "^contrib\\/" "^lib\\/" "^slynk\\/" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (delete 'make-autoloads) ; The package provides autoloads.
            (add-before 'install 'install-doc
              (lambda _
                (let* ((info-dir (string-append #$output "/share/info"))
                       (doc-dir (string-append #$output "/share/doc/"
                                               #$name "-" #$version))
                       (doc-files '( ;; "doc/sly-refcard.pdf" ; See sly-refcard.pdf below.
                                    "README.md" "NEWS.md" "PROBLEMS.md"
                                    "CONTRIBUTING.md")))
                  (with-directory-excursion "doc"
                    (substitute* "Makefile"
                      (("infodir=/usr/local/info")
                       (string-append "infodir=" info-dir))
                      ;; Don't rebuild contributors.texi since we are not in
                      ;; the git repo.
                      (("contributors.texi: Makefile texinfo-tabulate.awk")
                       "contributors.texi:"))
                    (invoke "make" "html/index.html")
                    (invoke "make" "sly.info")
                    ;; TODO: We need minimal texlive with "preprint" package
                    ;; (for fullpage.sty).  (invoke "make" "sly-refcard.pdf")
                    (install-file "sly.info" info-dir)
                    (copy-recursively "html" (string-append doc-dir "/html")))
                  (for-each (lambda (f)
                              (install-file f doc-dir)
                              (delete-file f))
                            doc-files)
                  (delete-file-recursively "doc"))))
            (add-before 'check 'patch-tests
              (lambda _
                (setenv "HOME" (dirname (getcwd)))
                (substitute* "test/sly-stickers-tests.el"
                  (("\
\\(define-sly-ert-test stickers-when-invalid-dont-stick .*" all)
                   (string-append all "  (skip-unless nil)\n"))))))))
      (home-page "https://github.com/joaotavora/sly")
      (synopsis "Sylvester the Cat's Common Lisp IDE")
      (description
       "SLY is Sylvester the Cat's Common Lisp IDE.  SLY is a fork of SLIME, and
contains the following improvements over it:

@enumerate
@item A full-featured REPL based on Emacs's @code{comint.el}.  Everything
can be copied to the REPL;
@item Stickers, or live code annotations that record values as code traverses them.
@item Flex-style completion out-of-the-box, using Emacs's completion API.
Company, Helm, and other supported natively, no plugin required;
@item An interactive Trace Dialog;
@item Multiple inspectors and multiple REPLs, with independent history.
@item Regexp-capable @code{M-x sly-apropos}.
@item Cleanly ASDF-loaded by default, including contribs, enabled out-of-the-box;
@item \"Presentations\" replaced by interactive backreferences, which
highlight the object and remain stable throughout the REPL session;
@end enumerate

SLY tracks SLIME's bugfixes and all its familiar features (debugger, inspector,
xref, etc.) are still available, but with better integration.")
      (license license:gpl3+))))

(define-public emacs-sly-quicklisp
  (let ((commit "01ebe3976a244309f2e277c09206831135a0b66c")
        (revision "1"))
    (package
      (name "emacs-sly-quicklisp")
      (version (git-version "0.0.0" revision commit))
      (home-page "https://github.com/joaotavora/sly-quicklisp")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1vfqmvayf35g6y3ljsm3rlzv5jm50qikhh4lv2zkkswj6gkkb1cv"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-sly))
      (arguments
       `(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)
         #:phases
         ;; The package provides autoloads.
         (modify-phases %standard-phases
           (delete 'make-autoloads)
           (delete 'enable-autoloads-compilation))))
      (synopsis "Quicklisp support for SLY")
      (description
       "@command{sly-quicklisp} is an external contrib for SLY that provides a
sly-quickload command that prompts the user for a package to install.")
      (license license:gpl3+))))

(define-public emacs-sly-asdf
  (package
    (name "emacs-sly-asdf")
    (version "0.2.0")
    (home-page "https://github.com/mmgeorge/sly-asdf")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0gncp8xv33s4wx594bgd35vr1455bcggv1bg28qv75mhv41nzw97"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-sly emacs-popup))
    (arguments
     '(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)))
    (synopsis "ASDF contrib for SLY")
    (description
     "@command{sly-asdf} is an external contrib for SLY that provides
additional support for working with ASDF projects.")
    (license license:gpl3+)))

(define-public emacs-sly-named-readtables
  (let ((commit "a5a42674ccffa97ccd5e4e9742beaf3ea719931f")
        (revision "1"))
    (package
      (name "emacs-sly-named-readtables")
      (version (git-version "0.1" revision commit))
      (home-page "https://github.com/joaotavora/sly-named-readtables")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "16asd119rzqrlclps2q6yrkis8jy5an5xgzzqvb7jdyq39zxg54q"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-sly))
      (arguments
       '(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)
         #:phases
         ;; The package provides autoloads.
         (modify-phases %standard-phases
           (delete 'make-autoloads)
           (delete 'enable-autoloads-compilation))))
      (synopsis "Named-readtables support for SLY")
      (description
       "@command{sly-named-readtables} is an external contrib for SLY that
enables different readtables to be active in different parts of the same
file.")
      (license license:gpl3+))))

(define-public emacs-sly-macrostep
  (let ((commit "5113e4e926cd752b1d0bcc1508b3ebad5def5fad")
        (revision "2"))
    (package
      (name "emacs-sly-macrostep")
      (version (git-version "0.1" revision commit))
      (home-page "https://github.com/joaotavora/sly-macrostep")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1nxf28gn4f3n0wnv7nb5sgl36fz175y470zs9hig4kq8cp0yal0r"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-sly emacs-macrostep))
      (arguments
       '(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)
         #:phases
         ;; The package provides autoloads.
         (modify-phases %standard-phases
           (delete 'make-autoloads)
           (delete 'enable-autoloads-compilation))))
      (synopsis "Expand Common Lisp macros inside source files with SLY")
      (description
       "@command{sly-macrostep} is a SLY contrib for expanding CL macros right
inside the source file.")
      (license license:gpl3+))))

(define-public emacs-sly-stepper
  (let ((commit "da84e3bba8466c2290c2dc7c27d7f4c48c27b39e"))
    (package
      (name "emacs-sly-stepper")
      (version (git-version "0.0.0" "2" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/joaotavora/sly-stepper")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07p0k797fagn1qha191p6g2b55hsqqkcj59mh0ms9id0ildydil0"))
         (modules '((guix build utils)))
         (snippet #~(for-each delete-file
                              (find-files "." ".*-autoloads\\.elc?$")))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include
        #~(cons* "\\.lisp$" "\\.asd$" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'expand-load-path 'expand-sly-contrib
              (lambda _
                (setenv "EMACSLOADPATH"
                        (string-append (elpa-directory
                                        #$(this-package-input "emacs-sly"))
                                       "/contrib:" (getenv "EMACSLOADPATH")))))
            (add-after 'install 'find-agnostic-lizard
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((file (string-append (elpa-directory #$output)
                                           "/slynk-stepper.lisp")))
                  ;; agnostic-lizard is found at runtime.
                  (emacs-substitute-sexps file
                    ("(require :asdf)"
                     `(funcall (read-from-string "asdf:load-asd")
                               ,(search-input-file inputs "\
share/common-lisp/systems/agnostic-lizard.asd"))))))))))
      (inputs (list cl-agnostic-lizard))
      (propagated-inputs (list emacs-sly))
      (home-page "https://github.com/joaotavora/sly-stepper")
      (synopsis "Portable Common Lisp stepper interface for Emacs")
      (description
       "This package features a new, portable, visual stepping facility for
Common Lisp, realized as an extension to SLY.")
      (license license:gpl3+))))

(define-public emacs-sly-package-inferred
  (let ((commit "800e71e2be631422277e2ec77e6d6f6ea20e95ef")
        (revision "1"))
    (package
      (name "emacs-sly-package-inferred")
      (version (git-version "0.1" revision commit))
      (home-page "https://github.com/40ants/sly-package-inferred")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1216idyp034nkqddhw4p53jkhhdxa6xnjjmsvijpf4rxqnfqvapg"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-sly))
      (arguments
       '(#:include (cons* "\\.lisp$" "\\.asd$" %default-include)
         #:phases
         ;; The package provides autoloads.
         (modify-phases %standard-phases
           (delete 'make-autoloads))))
      (synopsis "Improved package inferred systems support for SLY")
      (description
       "@command{sly-package-inferred} is an external contrib for SLY that
replaces its completion with a function which is better suited for systems
using package inferred style.")
      (license license:gpl3+))))

(define-public emacs-lua-mode
  (let ((commit "d074e4134b1beae9ed4c9b512af741ca0d852ba3")
        (revision "1"))
    (package
      (name "emacs-lua-mode")
      (version (git-version "20221027" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/immerrr/lua-mode/")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00gvrmw8pll0cl7srygh2kmbf0g44sk9asj5sm77qvhr8jz4xkkq"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "buttercup" "-l" "lua-mode.el")
        #:phases
        #~(modify-phases %standard-phases
            ;; XXX: These tests are not compatible with Buttercup, and cause
            ;; build to fail.  Remove them until they are fixed by upstream.
            (add-after 'unpack 'remove-faulty-tests
              (lambda _
                (delete-file "test/test-indentation.el")
                (delete-file "test/test-fill.el"))))))
      (native-inputs
       (list emacs-buttercup lua))
      (home-page "https://github.com/immerrr/lua-mode/")
      (synopsis "Major mode for Lua")
      (description
       "This Emacs package provides a mode for @uref{https://www.lua.org/,
Lua programming language}.")
      (license license:gpl2+))))

(define-public emacs-ebuild-mode
  (package
    (name "emacs-ebuild-mode")
    (version "1.78")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dev.gentoo.org/~ulm/emacs/"
             "ebuild-mode-" version ".tar.xz"))
       (file-name (string-append name "-" version ".tar.xz"))
       (sha256
        (base32 "0yxn6b87paa0ln2mj1w0ay748j05a80y825im6z6n75yk3b8wm06"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-doc
            (lambda _
              (invoke "make" "ebuild-mode.info")
              (install-file "ebuild-mode.info"
                            (string-append #$output "/share/info")))))))
    (native-inputs
     (list texinfo))
    (home-page "https://devmanual.gentoo.org")
    (synopsis "Major modes for Gentoo package files")
    (description
     "This Emacs package provides modes for ebuild, eclass, eblit, GLEP42
news items, openrc and runscripts.")
    (license license:gpl2+)))

(define-public emacs-ebuku
  ;; Upstream has no tagged release.
  (let ((revision "1")
        (commit "0c6cf404a49bd68800221446df186fffa0139325"))
    (package
      (name "emacs-ebuku")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/flexibeast/ebuku")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "09fkzmcvzdbdjaa167wiybj0kir7y12pcq2varjywshvq2l7niz4"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/flexibeast/ebuku")
      (synopsis "Emacs interface to the buku Web bookmark manager")
      (description
       "Ebuku provides a basic interface to the @code{buku} Web bookmark
manager.")
      (license license:gpl3+))))

(define-public emacs-evil
  ;; Commit message claims this is 1.15.0, but there's no tag for it, so we
  ;; use full git-version instead
  (let ((commit "682e87fce99f39ea3155f11f87ee56b6e4593304")
        (revision "0"))
    (package
      (name "emacs-evil")
      (version (git-version "1.15.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-evil/evil.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "17djjfpxnl7a3wmyh0c708w07y05b4d87ii17rnkk9p4w4zimvay"))))
      (arguments
       (list
        #:tests? #f
        ;; Test are run using Eask; eask-cli isn't available in Guix
        ;; #:test-command #~(list "make" "test")
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'fix-test-helpers
              (lambda _
                (substitute* "evil-test-helpers.el"
                  (("\\(undo-tree-mode 1\\)") ""))
                #t))
            (add-before 'install 'make-info
              (lambda _
                (with-directory-excursion "doc/build/texinfo"
                  (invoke "makeinfo" "--no-split"
                          "-o" "evil.info" "evil.texi"))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "evil")
                (bst:write-pkg-file "evil-command-window")
                (bst:write-pkg-file "evil-commands")
                (bst:write-pkg-file "evil-common")
                (bst:write-pkg-file "evil-core")
                (bst:write-pkg-file "evil-development")
                (bst:write-pkg-file "evil-digraphs")
                (bst:write-pkg-file "evil-ex")
                (bst:write-pkg-file "evil-integration")
                (bst:write-pkg-file "evil-jumps")
                (bst:write-pkg-file "evil-keybindings")
                (bst:write-pkg-file "evil-macros")
                (bst:write-pkg-file "evil-maps")
                (bst:write-pkg-file "evil-repeat")
                (bst:write-pkg-file "evil-search")
                (bst:write-pkg-file "evil-states")
                (bst:write-pkg-file "evil-test-helpers")
                (bst:write-pkg-file "evil-tests")
                (bst:write-pkg-file "evil-types")
                (bst:write-pkg-file "evil-vars")
                )))))
      (build-system emacs-build-system)
      (native-inputs
       (list
        texinfo
        ))
      (home-page "https://github.com/emacs-evil/evil")
      (synopsis "Extensible Vi layer for Emacs")
      (description
       "Evil is an extensible vi layer for Emacs.  It emulates the
main features of Vim, and provides facilities for writing custom
extensions.")
      (license license:gpl3+))))

(define-public emacs-evil-goggles
  (let ((commit "08a22058fd6a167f9f1b684c649008caef571459")
        (version "0.0.1")
        (revision "0"))
    (package
      (name "emacs-evil-goggles")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/edkolev/evil-goggles")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1p3vjrij63v9nrcyj3b5jsqzv9y7dgv9i1inx1q7x3s90vndavac"))))
      (build-system emacs-build-system)
      (arguments
       (list #:test-command #~(list "ert-runner" "test")
             #:phases
             #~(modify-phases %standard-phases
                 (add-before 'check 'skip-failing-test
                   (lambda _
                     (substitute* "test/evil-goggles-test.el"
                       (("\\(ert-deftest evil-test-last-insert-register.*" all)
                        (string-append all " (skip-unless nil)"))))))))
      (propagated-inputs
       (list
        emacs-evil
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (home-page "https://github.com/edkolev/evil-goggles")
      (synopsis "Displays visual hints when editing with evil")
      (description "Creates a visual pulse to indicate the region that is
being deleted, changed, yanked, or pasted when using evil commands")
      (license license:gpl3+))))

(define-public emacs-goggles
  (package
    (name "emacs-goggles")
    (version "0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/minad/goggles")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fczxygg1blfmlwswck49rllww77rc7qn91wqw1kvjwfz31sk8z4"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command #~(list "ert-runner" ".")))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (home-page "https://github.com/minad/goggles")
    (synopsis "Pulse modified region")
    (description "Goggles highlights the modified region using Pulse.
Currently the commands undo, yank, kill and delete are supported.")
    (license license:gpl3+)))

(define-public emacs-goto-chg
  (let ((commit "72f556524b88e9d30dc7fc5b0dc32078c166fda7")
        (revision "0"))
    (package
      (name "emacs-goto-chg")
      (version (git-version "1.7.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-evil/goto-chg.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0dv92vhski35g7wdnr4nvjm51bsa7pn8xbq9svp30y28mq8v9gni"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "goto-chg")
                )))))
      (home-page "https://github.com/emacs-evil/goto-chg")
      (synopsis "Go to the last change in the Emacs buffer")
      (description
       "This package provides @code{M-x goto-last-change} command that goes to
the point of the most recent edit in the current Emacs buffer.  When repeated,
go to the second most recent edit, etc.  Negative argument, @kbd{C-u -}, is
used for reverse direction.")
      (license license:gpl2+))))

(define-public emacs-evil-owl
  (let ((commit "24c5f43df375194386344e69bc720ea3986c9510")
        (revision "3"))
    (package
      (name "emacs-evil-owl")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mamapanda/evil-owl")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0bqzch14whlmrcasakah3psrzswvkzd7mmi8hx5s64kfp29wbdhi"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "make" "test")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'skip-failing-test
              (lambda _
                (substitute* "test/evil-owl-test.el"
                  (("\\(ert-deftest evil-owl-test-mark-string.*" all)
                   (string-append all " (skip-unless nil)"))))))))
      (propagated-inputs
       (list emacs-evil))
      (home-page "https://github.com/mamapanda/evil-owl")
      (synopsis "Preview candidates when using Evil registers and marks")
      (description
       "This package supplements Evil's register- and mark-based commands with
a popup window for previewing candidates.")
      (license license:gpl3+))))

(define-public emacs-evil-paredit
  (let ((commit "e058fbdcf9dbf7ad6cc77f0172d7517ef233d55f"))
    (package
      (name "emacs-evil-paredit")
      (version "0.0.2")                 ; says 0.0.2 in evil-paredit.el
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/roman/evil-paredit")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0b08y4spapl4g2292j3l4cr84gjlvm3rpma3gqld4yb1sxd7v78p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        emacs-paredit
        ))
      (home-page "https://github.com/roman/evil-paredit")
      (synopsis "Evil extension to integrate nicely with Paredit")
      (description
       "This package helps you to not screw up your Paredit setup when using
Evil mode.  Whenever you try to use a modifier command like @kbd{d}, @kbd{c},
@kbd{y} to modify the Paredit buffer, it will stop you to do so in the case
you break the parity of parenthesis.")
      (license license:expat))))

(define-public emacs-evil-args
  (let ((commit "758ad5ae54ad34202064fec192c88151c08cb387")
        (revision "1"))
    (package
      (name "emacs-evil-args")
      (version (git-version "1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/wcsmith/evil-args")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0k35glgsirc3cph8v5hhjrqfh4ndwh8a28qbr03y3jl8s453xcj7"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/wcsmith/evil-args")
      (synopsis "Motions and text objects for delimited arguments in Evil")
      (description
       "This package provides motions and text objects for delimited
arguments, such as arguments separated by commas and semicolons.")
      (license license:expat))))

(define-public emacs-evil-escape
  (package
    (name "emacs-evil-escape")
    (version "3.16")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/emacsorphanage/evil-escape")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1z30v59igndqzxg9gcx4bsbf5jkh11wp936il8azkrz3qdryaj4a"))))
    (propagated-inputs
     (list emacs-evil))
    (build-system emacs-build-system)
    (home-page "https://github.com/emacsorphanage/evil-escape")
    (synopsis "Escape from insert state and everything else in Emacs")
    (description
     "Evil escape provides a customizable key sequence to escape from insert
state and everything else in Emacs.")
    (license license:gpl3+)))

(define-public emacs-evil-exchange
  (let ((commit "47691537815150715e64e6f6ec79be7746c96120")
        (version "0.41")
        (revision "1"))
    (package
      (name "emacs-evil-exchange")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Dewdrops/evil-exchange")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0bjpn4yqig17ddym6wqq5fm1b294q74hzcbj9a6gs97fqiwf88xa"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'check 'fix-makefile
             (lambda _
               (substitute* "Makefile"
                 (("cask exec ") ""))
               #t)))
         #:test-command '("make" "test")))
      (home-page "https://github.com/Dewdrops/evil-exchange")
      (synopsis "Exchange text easily within Evil")
      (description
       "This package, a port of @code{vim-exchange}, provides an Evil operator
for exchanging text.")
      (license license:gpl3+))))

(define-public emacs-evil-replace-with-register
  (let ((commit "91cc7bf21a94703c441cc9212214075b226b7f67")
        (version "0.1")
        (revision "1"))
    (package
      (name "emacs-evil-replace-with-register")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Dewdrops/evil-ReplaceWithRegister")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "14rpn76qrf287s3y2agmddcxi27r226i53ixjvd694ss039g0r11"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/Dewdrops/evil-ReplaceWithRegister")
      (synopsis "Quickly replace text with the contents of a register")
      (description
       "This package provides an Evil operator for replacing text with the
contents of a register.")
      (license license:gpl3+))))

(define-public emacs-evil-indent-plus
  (let ((commit "0c7501e6efed661242c3a20e0a6c79a6455c2c40")
        (version "1.0.0")
        (revision "1"))
    (package
      (name "emacs-evil-indent-plus")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/TheBB/evil-indent-plus")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1g6r1ydscwjvmhh1zg4q3nap4avk8lb9msdqrh7dff6pla0r2qs6"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/TheBB/evil-indent-plus")
      (synopsis "Text objects based on indentation")
      (description
       "This package adds new text objects for @code{evil-mode} based on
blocks having the same or higher indentation, including or excluding
surrounding lines.")
      (license license:gpl2+))))

(define-public emacs-evil-text-object-python
  (let ((commit "9a064fe6475429145cbcc3b270fcc963b67adb15")
        (version "1.0.1")
        (revision "1"))
    (package
      (name "emacs-evil-text-object-python")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/wbolster/evil-text-object-python")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "074zpm6mmr1wfl6d5xdf8jk1fs4ccpbzf4ahhkwga9g71xiplszv"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/wbolster/evil-text-object-python")
      (synopsis "Text objects for Python")
      (description
       "This package provides @code{evil-mode} text objects for Python.")
      (license license:gpl3+))))

(define-public emacs-evil-lion
  (let ((commit "6b03593f5dd6e7c9ca02207f9a73615cf94c93ab")
        (revision "1"))
    (package
      (name "emacs-evil-lion")
      (version (git-version "0.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/edkolev/evil-lion")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1a162hynp0jcsn50c1w5a02mrw9w3q05c7lkqzqd25px3d0p772q"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (arguments
       `(#:test-command '("make" "test")))
      (home-page "https://github.com/edkolev/evil-lion")
      (synopsis "Align operator for @code{evil-mode}")
      (description
       "This package, a port of @code{vim-lion}, provides an operator for
aligning text objects based on separators.")
      (license license:gpl3+))))

(define-public emacs-evil-expat
  (let ((commit "f4fcd0aa3edc359adb5c986b5dd9188d220d84e2")
        (revision "1"))
    (package
      (name "emacs-evil-expat")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/edkolev/evil-expat")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0872ix682hkdz0k8pn6sb54rqkx00rz5fxpd5j2snx406yagpaxz"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (arguments
       `(#:test-command '("make" "test")))
      (home-page "https://github.com/edkolev/evil-expat")
      (synopsis "Extra @code{ex} commands for @code{evil-mode}")
      (description
       "This package provides additional commands for the @code{ex} command
line, including functions for version control with Git and for copying and
pasting into and from @code{tmux} paste buffers.")
      (license license:gpl3+))))

(define-public emacs-evil-visual-replace
  (package
    (name "emacs-evil-visual-replace")
    (version "0.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/troyp/evil-visual-replace")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1gfyrq7xfzmzh3x8k5f08n027dlbwi0pkkxf9c39fkxp4jngibsz"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil))
    (home-page "https://github.com/troyp/evil-visual-replace")
    (synopsis "Replacement commands for @code{evil-mode} visual blocks")
    (description
     "This package provides versions of @code{query-replace} and
@code{replace-regexp} that work for @code{evil-mode} visual blocks.")
    (license license:gpl2+)))

(define-public emacs-evil-visualstar
  (let ((commit "06c053d8f7381f91c53311b1234872ca96ced752")
        (version "0.2.0")
        (revision "1"))
    (package
      (name "emacs-evil-visualstar")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bling/evil-visualstar")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0mkbzw12fav945icibc2293m5haxqr3hzkyli2cf4ssk6yvn0x4c"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/bling/evil-visualstar")
      (synopsis "Instantly search using the visual selection")
      (description
       "This package provides @code{evil-mode} functions for using selected text
to search.")
      (license license:gpl3+))))

(define-public emacs-monky
  (package
    (name "emacs-monky")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ananthakumaran/monky")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1fgn7al4zwz2k5wb5dy3byqg9lsrjk9fra341mxh5ma2pfwxjgps"))))
    (build-system emacs-build-system)
    (home-page "https://ananthakumaran.in/monky/index.html")
    (arguments
     `(#:test-command '("emacs" "--batch"
                        "-l" "test/monky-unit-test.el"
                        "-f" "ert-run-tests-batch-and-exit")))
    (synopsis "Interactive interface for the Mercurial version control system")
    (description
     "Monky provides an Emacs interface for Mercurial (Hg).  Using Monky, you
can selectively commit files, view the diffs, and other things.")
    (license license:gpl3+)))

(define-public emacs-monroe
  (package
    (name "emacs-monroe")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sanel/monroe")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "101lfrykdbv37spkbw7zihhx26bc1lhjyxbanrcp9880bxj04jiy"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/sanel/monroe")
    (synopsis "Clojure nREPL client for Emacs")
    (description
     "Monroe is a nREPL client for Emacs, focused on simplicity and easy
distribution, primarily targeting Clojure users")
    (license license:gpl3+)))

(define-public emacs-rail
  (package
    (name "emacs-rail")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Sasanidas/Rail")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i07zv0z6r46jpg22x99a1izyfp6536xf951ibyr9kis5bql5jz9"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; tests require networking
    (home-page "https://github.com/Sasanidas/Rail")
    (synopsis "Generic nREPL client for Emacs")
    (description
     "Rail is a nREPL client based on monroe with similar features, but aims
to be a more complete implementation.")
    (license license:gpl3+)))

(define-public emacs-orgalist
  (package
    (name "emacs-orgalist")
    (version "1.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://elpa.gnu.org/packages/"
                           "orgalist-" version ".tar"))
       (sha256
        (base32 "0j78g12q66piclraa2nvd1h4ri8d6cnw5jahw6k5zi4xfjag6yx3"))))
    (build-system emacs-build-system)
    (home-page "https://elpa.gnu.org/packages/orgalist.html")
    (synopsis "Manage Org-like lists in non-Org buffers")
    (description "Orgalist writes and manages Org mode's plain lists in
non-Org buffers.  More specifically, it supports the syntax of Org mode for
numbered, unnumbered, description items, checkboxes, and counter cookies.

The library also implements radio lists, i.e., lists written in Org syntax
later translated into the host format, e.g., LaTeX or HTML.")
    (license license:gpl3+)))

(define-public emacs-writegood-mode
  (package
    (name "emacs-writegood-mode")
    (version "2.2.0")
    (home-page "https://github.com/bnbeckwith/writegood-mode")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url home-page)
                    (commit (string-append "v" version))))
              (sha256
               (base32
                "1a3gmaaa344kigr209b6wnjiw9ikkmw1j5jda04h3g8f9817njyv"))
              (file-name (string-append name "-checkout"))))
    (build-system emacs-build-system)
    (synopsis "Polish up poor writing on the fly")
    (description
     "This minor mode tries to find and highlight problems with your writing
in English as you type.  It primarily detects \"weasel words\" and abuse of
passive voice.")
    (license license:gpl3+)))

(define-public emacs-writefreely
  (let ((commit "cfbba9c3a34f580f39c0796966ea76b0cf98a23e")
        (revision "0"))
    (package
      (name "emacs-writefreely")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/dangom/writefreely.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "02gy3kg28igqcg7ai8n2p19q8m4xpgp5wn34n2fwz2bjymgf9g4s"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-ox-hugo emacs-request))
      (home-page "https://github.com/dangom/writefreely.el")
      (synopsis "Emacs interface to the WriteFreely API")
      (description
       "This library publishes Org mode files as posts to any instance of the
federated blogging platform WriteFreely.")
      (license license:gpl3+))))

(define-public emacs-neotree
  (package
    (name "emacs-neotree")
    (version "0.6.0")
    (home-page "https://github.com/jaypei/emacs-neotree")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url home-page)
                     (commit version)))
              (sha256
               (base32
                "1rwm8j48ks9fa5q3g8crpfzbikxfjj5m13w9ylimg34xniycrlq2"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command #~(list "make" "test-batch")))
    (synopsis "Folder tree view for Emacs")
    (description "This Emacs package provides a folder tree view.")
    (license license:gpl3+)))

(define-public emacs-org
  (package
    (name "emacs-org")
    (version "9.7.25")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.savannah.gnu.org/git/emacs/org-mode")
             (commit (string-append "release_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wi8kj0vhlnzslarjfbi1ljqh71jlsbi4krsx6cr1ch5cm9v78y9"))))
    (build-system emacs-build-system)
    (outputs (list "out" "test"))
    (arguments
     (list
      #:test-command #~(list "make" "test-dirty")
      #:phases
      #~(modify-phases %standard-phases
          (replace 'expand-load-path
            ;; Make sure `load-path' includes "lisp" directory, otherwise
            ;; byte-compilation fails.
            (lambda args
              (with-directory-excursion "lisp"
                (apply (assoc-ref %standard-phases 'expand-load-path) args))))
          (add-after 'expand-load-path 'bootstrap
            ;; XXX: Generate "org-loaddefs.el".
            (lambda _
              (invoke "make" "autoloads")))
          (add-before 'check 'fix-tests
            (lambda* (#:key inputs #:allow-other-keys)
              ;; XXX: Running tests updates ID locations.  The process expects
              ;; a file to be writeable in "~/.emacs.d/".
              (setenv "HOME" (getcwd))
              (mkdir-p ".emacs.d")
              ;; These files are modified during testing.
              (with-directory-excursion "testing/examples"
                (for-each make-file-writable
                          '("babel.org"
                            "ob-awk-test.org"
                            "ob-sed-test.org"))
                ;; Specify where sh executable is.
                (let ((sh (search-input-file inputs "/bin/sh")))
                  (substitute* "babel.org"
                    (("/bin/sh") sh))))
              ;; XXX: Fix failure in ob-tangle/collect-blocks.  The test
              ;; assumes that ~/../.. corresponds to /.  This isn't true in
              ;; our case.
              (substitute* "testing/lisp/test-ob-tangle.el"
                ((" ~/\\.\\./\\.\\./")
                 (string-append " ~"
                                ;; relative path from ${HOME} to / during
                                ;; build
                                (string-join
                                 (map-in-order
                                  (lambda (x)
                                    (if (equal? x "") "" ".."))
                                  (string-split (getcwd) #\/)) "/")
                                "/")))
              ;; XXX: Skip failing tests.
              (substitute* "testing/lisp/test-ob-shell.el"
                (("ob-shell/remote-with-stdin-or-cmdline .*" all)
                 (string-append all "  (skip-unless nil)\n")))
              (substitute* "testing/lisp/test-org.el"
                (("test-org/org-(encode-time|time-string-to-time) .*" all)
                 (string-append all "  (skip-unless nil)\n")))))
          (replace 'build
            (lambda args
              (with-directory-excursion "lisp"
                (apply (assoc-ref %standard-phases 'build) args))))
          (replace 'install
            (lambda _
              (let ((elpa (elpa-directory #$output))
                    (info (string-append #$output "/share/info")))
                (substitute* "local.mk"
                  (("^lispdir.*") (string-append "lispdir = " elpa))
                  (("^datadir.*") (string-append "datadir = " elpa "/etc"))
                  (("^infodir.*") (string-append "infodir = " info))))
              (invoke "make" "install" (string-append "ORGVERSION=" #$version))))
          (add-after 'install 'install-org-test
            (lambda _
              (with-directory-excursion "testing"
                (copy-recursively "."
                                  (string-append (elpa-directory #$output:test))))))
          (add-after 'install 'install-org-news
            ;; Install ORG-NEWS files in doc directory.
            (lambda _
              (install-file "etc/ORG-NEWS"
                            (string-append #$output "/share/doc/"
                                           #$name "-" #$version)))))))
    (native-inputs
     (list texinfo))
    (home-page "https://orgmode.org/")
    (synopsis "Outline-based notes management and organizer")
    (description "Org is an Emacs mode for keeping notes, maintaining TODO
lists, and project planning with a fast and effective lightweight markup
language.  It also is an authoring system with unique support for literate
programming and reproducible research.  If you work with the LaTeX output
capabilities of Org-mode, you may want to install the
@code{emacs-org-texlive-collection} meta-package, which propagates the TexLive
components required by the produced @file{.tex} file.")
    (license license:gpl3+)))

(define-public emacs-org-contrib
  (package
    (name "emacs-org-contrib")
    (version "0.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.sr.ht/~bzg/org-contrib")
             (commit (string-append "release_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08m3aa8vsrlkacbvindjwqzviv5r8i9a0vzsrl8rx01xq5b0zd42"))))
    (build-system emacs-build-system)
    (arguments
     (list #:lisp-directory "lisp"))
    (propagated-inputs
     (list emacs-org))
    (home-page "https://git.sr.ht/~bzg/org-contrib")
    (synopsis "Unmaintained add-ons for Org mode")
    (description
     "This package contains add-ons to Org.  Be warned that these libraries
receive little if no maintenance and there is no guaranty that they are
compatible with the Org stable version.")
    (license license:gpl3+)))

(define-public emacs-org-count-words
  ;; No releases.
  (let ((commit "df4f06905e3020106d6ceaada854ebd7f9a231d2")
        (revision "0"))
    (package
      (name "emacs-org-count-words")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Elilif/org-count-words.git")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "12yxgkqv33i8hcgc5z033fhrar5l937kpsi36v4jffw6lr3wrlbv"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/Elilif/org-count-words")
      (synopsis "Word count in org-mode")
      (description "This package calculates a precise word count in org-mode
by excluding unwanted elements such as code blocks, options, and drawers.  The
results are displayed on the modeline.")
      (license license:gpl3+))))

(define-public emacs-org-texlive-collection
  (package
    (name "emacs-org-texlive-collection")
    (source #f)
    (version (package-version emacs-org))
    (build-system trivial-build-system)
    (arguments (list #:builder #~(mkdir #$output)))
    (native-inputs '())
    (inputs '())
    (propagated-inputs
     (list texlive-capt-of
           ;; The latexrecommended collection provides fontspec, amsmath,
           ;; hyperref, graphicx, tools, etc.
           texlive-collection-latexrecommended
           texlive-soul
           texlive-standalone
           texlive-ulem
           texlive-wrapfig))
    (home-page (package-home-page emacs-org))
    (synopsis "Basic TeX Live packages for Org mode LaTeX export")
    (description "This meta-package propagates the TeX Live packages minimally
required by the LaTeX output produced by Org mode.")
    (license (license:fsf-free "https://www.tug.org/texlive/copying.html"))))

(define-public emacs-org-contacts
  ;; XXX: Upstream does not tag version bumps. Commit below matches latest
  ;; version bump.
  (let ((commit "217ba04c9d638067a6ccb0829cf1885f54c1d568"))
    (package
      (name "emacs-org-contacts")
      (version "1.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://repo.or.cz/org-contacts")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0f0vjdvx0hffj2xvyrya8yfl77djmzmpxdxsx58ym4lmdvwyb6x3"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-org))
      (home-page "https://repo.or.cz/org-contacts")
      (synopsis "Contacts management system for Org mode")
      (description "Manage your contacts from Org mode.  You can auto
complete email addresses, export contacts to a vCard file, put birthdays
in your Org Agenda, and more.")
      (license license:gpl3+))))

(define-public emacs-org-vcard
  (package
    (name "emacs-org-vcard")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/flexibeast/org-vcard")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14l3xqahqmnfl3sskqcr33xpcsic8dm9cr9wmbv5la3xv14n10k7"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/flexibeast/org-vcard")
    (synopsis "Org mode support for vCard export and import")
    (description
     "This package exports and imports vCard files from within GNU Emacs' Org
mode.")
    (license license:gpl3+)))

(define-public emacs-org-pretty-table
  ;; There is no release yet.
  (let ((commit "1331c600b83d95b28730b1bfcb48369ac1cf12ef")
        (revision "0"))
    (package
      (name "emacs-org-pretty-table")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Fuco1/org-pretty-table")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0yvqxh66y400n2n5ykmb1zrzd80bakffpwn6nmf37728x4cj8krh"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/Fuco1/org-pretty-table")
      (synopsis "Make tables in Org mode and OrgTbl mode prettier")
      (description
       "This package displays tables in Org mode and OrgTbl mode using Unicode
characters.")
      (license license:gpl3+))))

(define-public emacs-ob-sclang
  (let ((commit "cd3f3c847d8149cd4ce4a775942dac88ba92c772")
        (revision "1"))
    (package
      (name "emacs-ob-sclang")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://repo.or.cz/ob-sclang")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0dr8va2v0262plqxd63yxymqiffkql9klci7wsp5i7xgpka8925q"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-org emacs-scel))
      (home-page "https://repo.or.cz/ob-sclang")
      (synopsis "Org Babel support for SuperCollider")
      (description "This package adds support for evaluating @code{sclang} Org
mode source blocks.")
      (license license:gpl3+))))

(define-public emacs-org-edna
  (package
    (name "emacs-org-edna")
    (version "1.1.2")
    (source (origin
              (method bzr-fetch)
              (uri (bzr-reference
                    (url "bzr://bzr.savannah.nongnu.org/org-edna-el")
                    (revision version)))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "01dblddgx0yid5hrgl4swbr4grhv057kfbdy122wihzqpsrgq86n"))))
    (build-system emacs-build-system)
    (home-page "https://savannah.nongnu.org/projects/org-edna-el/")
    (synopsis "Manage Org task dependencies")
    (description "This package provides an extensible means of specifying
conditions which must be fulfilled before a task can be completed and actions
to take once it is.  Org Edna runs when either the BLOCKER or TRIGGER
properties are set on a heading, and when it is changing from a TODO state to
a DONE state.")
    (license license:gpl3+)))

(define-public emacs-toodoo
  ;; Package has no release.  Version is extracted from "Version:" keyword in
  ;; main file, and commit below matches version bump.
  (package
    (name "emacs-toodoo")
    (version "0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ChanderG/toodoo.el")
             (commit "149a563863c2f728c5f903475dbce50547c51000")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "00q7aym0kl03j9m66pivgy0snxcjjg402049b2wdy18kgyypfvx8"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil))
    (home-page "https://github.com/ChanderG/toodoo.el")
    (synopsis "Magit-like interface for a Todo workflow built on top of Org")
    (description "This package provides a minor mode for fast and easy management of Todos
using Org mode and transients.")
    (license license:asl2.0)))

(define-public emacs-afternoon-theme
  (let ((commit "89b1d778a1f8b385775c122f2bd1c62f0fbf931a")
        (revision "0"))
    (package
      (name "emacs-afternoon-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "http://github.com/osener/emacs-afternoon-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "19d5d6qs5nwmpf26rsb86ranb5p4236qp7p2b4i88cimcmzspylb"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/osener/emacs-afternoon-theme")
      (synopsis "Dark color theme with a deep blue background")
      (description
       "Afternoon theme is a dark color theme with a deep blue background.")
      (license license:gpl3+))))

(define-public emacs-cyberpunk-theme
  (package
    (name "emacs-cyberpunk-theme")
    (version "1.22")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/n3mo/cyberpunk-theme.el/")
              (commit version)))
       (sha256
        (base32
         "06nff38pcy5rgz13svkajsg0jjk73qy4a8m7p9f76yxcywxlgxlc"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (home-page "https://github.com/n3mo/cyberpunk-theme.el")
    (synopsis "Cyberpunk theme for Emacs built-in color theme support")
    (description
     "Cyberpunk color theme for the Emacs 24+ built-in color theme support
known loosely as deftheme.  Many mode-specific customizations are included.")
    (license license:gpl3+)))

(define-public emacs-dart-mode
  (package
    (name "emacs-dart-mode")
    (version "1.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bradyt/dart-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vql8m4nj0brmv58b6lkbhykik8n6j4i7d3nylcls78y7ihc2cz8"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command
                     ;; XXX: test-font-lock has one unexpected failure.
                     #~(list "emacs" "--batch" "-l" "dart-mode"
                             ;; "-l" "test/test-font-lock.el"
                             "-l" "test/test-indentation.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-flycheck
      emacs-s
      ))
    (home-page "https://github.com/bradyt/dart-mode")
    (synopsis "Emacs mode for the Dart programming language")
    (description
     "Dart mode is an Emacs major mode for editing Dart files.  It provides
basic syntax highlighting and indentation.")
    (license license:gpl3+)))

(define-public emacs-denote-explore
  (package
    (name "emacs-denote-explore")
    (version "4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pprevos/denote-explore")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04lc5fw11wixbjdkzbl63g03rdybv6q4mh1dc6c9y322g8qq3r0k"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-denote
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (arguments
     (list
      #:tests? #f ;no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'build-info-manual
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "emacs"
                      "--batch"
                      "--eval=(require 'ox-texinfo)"
                      "--eval=(find-file \"denote-explore.org\")"
                      "--eval=(org-texinfo-export-to-info)"))))))
    (native-inputs (list texinfo))
    (home-page "https://github.com/pprevos/denote-explore")
    (synopsis "Analyse and visualise a collection of Denote notes")
    (description
     "The Denote Explore package provides auxiliary functions to
maintain and explore your collection of Denote files.  Denote Explore provides
four groups of Emacs commands:
@enumerate
@item Summary statistics: Count and visualize notes, attachments and keywords.
@item Random walks: Generate new ideas using Serendipity.
@item Janitor: Manage your Denote collection.
@item Visualisations: Visualise your Denote network as a network
graph.  (Optional dependencies GraphViz, D3js, to be acquired separately!)
@end enumerate")
    (license license:gpl3+)))

(define-public emacs-pippel
  (let ((commit "cb194952ee150e77601d3233dabdb521b976ee79")
        (revision "0"))
    (package
      (name "emacs-pippel")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/arifer612/pippel")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "17606l24yyrjxa4rc0p2zj50lfbayqldw4phhi59yqf61289d520"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons "^pippel\\.py$" %default-include)
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'substitute-pippel-package-path
              (lambda _
                (emacs-substitute-variables "pippel.el"
                  ("pippel-package-path" (elpa-directory #$output)))))
            (add-after 'unpack 'substitute-python-path
              (lambda* (#:key inputs #:allow-other-keys)
                (emacs-substitute-variables "pippel.el"
                  ("pippel-python-command"
                   (search-input-file inputs "/bin/python"))))))))
      (inputs
       (list
        python-wrapper
        ))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (home-page "https://github.com/arifer612/pippel")
      (synopsis "Emacs frontend to Python package manager Pip")
      (description
       "Pippel is an Emacs frontend for the Python package manager Pip.  As
Pippel also uses Tabulated List mode, it provides a similar package menu like
@code{package-list-packages}.")
      (license license:gpl3+))))

(define-public emacs-mini-echo
  (package
    (name "emacs-mini-echo")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/liuyinz/mini-echo.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fgh93xzf4y3fhi7nby0h1vnay78sc2hv06ai5x3j972qz5b0v5v"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-hide-mode-line
      ))
    (home-page "https://github.com/liuyinz/mini-echo.el")
    (synopsis "Echo buffer status in minibuffer window")
    (description "This package lets you show buffer status in the echo area,
so you can get rid of the mode-line.")
    (license license:gpl3+)))

(define-public emacs-jsonnet-mode
  (package
    (name "emacs-jsonnet-mode")
    (version "0.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tminor/jsonnet-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "14nxfa91yg2243v4d5kvynp2645x3811ispmhmpgil3x9qbl9jg9"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/tminor/jsonnet-mode")
    (synopsis "Major mode for editing jsonnet files")
    (description "This package provides syntax highlighting, indenting,
formatting, and utility methods for jsonnet files.")
    (license license:gpl3+)))

(define-public emacs-dired-hacks
  (let ((commit "d1a2bda6aa8f890cb367297ed93aee6d3b5ba388")
        (revision "3"))
    (package
      (name "emacs-dired-hacks")
      (version (git-version "0.0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Fuco1/dired-hacks")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "12m81a9kjhs4cyq3lym0vp5nx6z3sfnypyzrnia76x6rjvixjf6y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-eimp
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-s
        ))
      (home-page "https://github.com/Fuco1/dired-hacks")
      (synopsis
       "Collection of useful dired additions")
      (description
       "This package provides the following collection of Emacs dired mode
additions:

@itemize
@item dired-avfs
@item dired-columns
@item dired-filter
@item dired-hacks-utils
@item dired-images
@item dired-list
@item dired-narrow
@item dired-open
@item dired-rainbow
@item dired-ranger
@item dired-subtree
@item dired-tagsistant
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-lcr
  (package
    (name "emacs-lcr")
    (version "1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jyp/lcr")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hhn0gqkwki0dfk6j759hmbj1ijn4bs550jh3kgy9jfmnb7cd81l"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/jyp/lcr")
    (synopsis "Lightweight coroutines in Emacs Lisp")
    (description "This package provides macros that can translate code into
equivalent continuation-passing code, as well as miscellaneous utility
functions written in continuation-passing style.")
    (license license:gpl3+)))

(define-public emacs-attrap
  (package
    (name "emacs-attrap")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jyp/attrap")
             (commit version)))
       (sha256
        (base32 "0wqc7bqx9rvk8r7fd3x84h8p01v97s6w2jf29nnjb59xakwp22i7"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-flycheck
      emacs-s
      ))
    (home-page "https://github.com/jyp/attrap")
    (synopsis "Fix coding error at point")
    (description "This package provides a command to fix the Flycheck error
at point.")
    (license license:gpl3+)))

(define-public emacs-browse-at-remote
  (package
    (name "emacs-browse-at-remote")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rmuslimov/browse-at-remote")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bx4ns0jb0sqrjk1nsspvl3mhz3n12925azf7brlwb1vcgnji09v"))))
    (build-system emacs-build-system)
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-s
      ))
    (home-page "https://github.com/rmuslimov/browse-at-remote")
    (synopsis "Open github/gitlab/bitbucket/stash page from Emacs")
    (description
     "This Emacs package allows you to open a target page on
github/gitlab (or bitbucket) by calling @code{browse-at-remote} command.
It supports dired buffers and opens them in tree mode at destination.")
    (license license:gpl3+)))

(define-public emacs-ansible
  (package
    (name "emacs-ansible")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/emacs-ansible/emacs-ansible")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "189mqb5sayhll5dr005b675rcswdb6jy4k6bjspx3cxgfbakk6h8"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-s
      ))
    (home-page "https://gitlab.com/emacs-ansible/emacs-ansible")
    (synopsis "Emacs minor mode for Ansible files")
    (description
     "This is an Emacs minor mode for editing Ansible files.")
    (license license:gpl2+)))

(define-public emacs-terraform-mode
  (package
    (name "emacs-terraform-mode")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/syohex/emacs-terraform-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10wndnlsv7f2yn83n1wamnhiwyhxkdlmwld9yk0m2kkxx4pwfgfj"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command #~(list "emacs" "--batch"
                                  "-l" "test/test-helper.el"
                                  "-l" "test/test-highlighting.el"
                                  "-l" "test/test-indentation.el"
                                  "-l" "test/test-command.el"
                                  "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-hcl-mode
      ))
    (home-page "https://github.com/syohex/emacs-terraform-mode")
    (synopsis "Major mode for Terraform")
    (description
     "@code{emacs-terraform-mode} provides a major mode for working with
@uref{https://www.terraform.io/, Terraform} configuration files.  Most of the
functionality is inherited from @code{hcl-mode}.")
    (license license:gpl3+)))

(define-public emacs-frog-jump-buffer
  (let ((commit "2d7b342785ae27d45f5d252272df6eb773c78e20")
        (revision "1"))
    (package
      (name "emacs-frog-jump-buffer")
      (version (git-version "0.1.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/waymondo/frog-jump-buffer")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1z00by8hiss1r2lwmzrl8pnz6jykia2849dqqm4l3z5rf6lwvc0f"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-frog-menu
        emacs-avy
        ))
      (home-page "https://github.com/waymondo/frog-jump-buffer")
      (synopsis "Jump to any Emacs buffer with minimal keystrokes")
      (description
       "This package provides a preview window of buffers that can be switched
to with quicklink-style selections.")
      (license license:gpl3+))))

(define-public emacs-pass
  (package
    (name "emacs-pass")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/NicolasPetton/pass")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jc8j421mlflspg24jvrqc2n3y5n3cpk3hjy560il8g36xi1049p"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; Tests require a tty.
           #:test-command
           #~(apply list "emacs"
                    (append
                     (apply append
                            (map (lambda (file) (list "-l" file))
                                 (find-files "." "\\.el")))
                     (list "-f" "ert-run-tests-batch-and-exit")))))
    (propagated-inputs
     (list
      emacs-password-store
      (@(bost gnu packages emacs-build) emacs-f)
      ))
    (home-page "https://github.com/NicolasPetton/pass")
    (synopsis "Major mode for @file{password-store.el}")
    (description "This is a major mode for managing password-store (pass)
keychains.  The keychain entries are displayed in a directory-like structure
and can be consulted and modified.")
    (license license:gpl3+)))

(define-public emacs-passage
  (let ((commit "5f1ad815464b1e4ce7880b835f9e805a8b9b15a4")
        (revision "0"))
    (package
      (name "emacs-passage")
      (version (git-version "2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/anticomputer/passage.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "12sxaig36n3qrmnyq2znar74hgbgfh3sgghki4n7aq2bzxwfbn8h"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-age
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-s
        emacs-with-editor
        ))
      (home-page "https://github.com/anticomputer/passage.el")
      (synopsis "Pass-Age Encryption support for Emacs")
      (description
       "This package provides transparent Age file encryption and decryption
in Emacs for Pass-Age, a port of Pass, the standard Unix password manager.")
      (license license:gpl3+))))

(define-public emacs-psc-ide
  ;; There is no proper release.  The base version is extracted from the
  ;; "Version" keyword in the main file.
  (let ((commit "ce97d719458ea099b40c02f05b6609601c727e66")
        (revision "2"))
    (package
      (name "emacs-psc-ide")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/purescript-emacs/psc-ide-emacs")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0xfw93pdf744h2yswc53qwyawfzkc31rv8dmha3irq7k1nklhq6y"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-company
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-flycheck
        emacs-let-alist
        emacs-s
        ))
      (home-page "https://github.com/purescript-emacs/psc-ide-emacs")
      (synopsis "Emacs integration for PureScript's psc-ide tool")
      (description
       "This package provides Emacs integration for @code{psc-ide}, an IDE
protocol for PureScript programming language.  It features:

@itemize
@item Completions
@item Type at point
@item Go to definition
@item Automatic imports
@item Case split
@item Build system integration, and
@item Flycheck support
@end itemize")
      (license license:gpl3+))))

(define-public emacs-epkg
  (package
    (name "emacs-epkg")
    (version "4.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacscollective/epkg")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a6zw1z318ip4vnqfgv99b2knbm3qq6ji7spqq9g5w3lls40aqvx"))))
    (build-system emacs-build-system)
    (arguments
     `(#:lisp-directory "lisp"
       #:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         (add-before 'install 'make-info
           ;; Documentation is located in "docs/".
           (lambda* (#:key outputs #:allow-other-keys)
             (with-directory-excursion "../docs"
               (invoke "makeinfo" "-o" "epkg.info" "epkg.texi")
               (let ((info (string-append (assoc-ref outputs "out")
                                          "/share/info")))
                 (install-file "epkg.info" info))))))))
    (native-inputs
     (list texinfo))
    (propagated-inputs
     (list
      emacs-closql
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-llama
      ))
    (home-page "https://emacsmirror.net")
    (synopsis "Browse the Emacsmirror package database")
    (description "This package provides access to a local copy of the
Emacsmirror package database.  It provides low-level functions for querying
the database and a @file{package.el} user interface for browsing the database.
Epkg itself is not a package manager.")
    (license license:gpl3+)))

(define-public emacs-frecency
  (package
    (name "emacs-frecency")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alphapapa/frecency.el")
                    (commit (string-append "v" version))))
              (sha256
               (base32
                "1n1ghl3jr4wmzc4f5xhkx5mfg3vfqs0kjzbra6k5drcnyh2iixkc"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-a
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/alphapapa/frecency.el")
    (synopsis "Sort items by frequency and recency of access")
    (description "This package provides a way of sorting items via
a heuristic based on frequency and recency.")
    (license license:gpl3+)))

(define-public emacs-org-recent-headings
  (let ((commit "97418d581ea030f0718794e50b005e9bae44582e")
        (revision "0"))
    (package
      (name "emacs-org-recent-headings")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/org-recent-headings")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1y11rlnhi36lzhc1cagninv6hlcwbvj88xfr0g0xzpbzy7hys021"))
         ;; Contents of makem package, but no tests.
         (snippet #~(for-each delete-file '("makem.sh" "Makefile")))))
      (build-system emacs-build-system)
      (arguments
       (list #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'inject-makem
                   (lambda* (#:key inputs #:allow-other-keys)
                     (symlink (search-input-file inputs "/bin/makem.sh")
                              "makem.sh"))))))
      (native-inputs
       (list makem-minimal))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-frecency
        emacs-helm
        emacs-org
        emacs-s
        ))
      (home-page "https://github.com/alphapapa/org-recent-headings")
      (synopsis "Navigate to recently used Org headings and lists")
      (description
       "This package maintains a list of recently used Org headings,
as well as functions for navigating between these headings.")
      (license license:gpl3+))))

(define-public emacs-org-recur
  (package
    (name "emacs-org-recur")
    (version "1.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/m-cat/org-recur")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0s2n62y3qc72ldzpaq2jz9335h532s566499n346nx21l4qsqdz6"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "emacs" "--batch" "-l" "org-recur-test.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list (@(bost gnu packages emacs-build) emacs-dash)
           ))
    (home-page "https://github.com/m-cat/org-recur")
    (synopsis "Simple recurring Org mode tasks")
    (description "This package extends Org mode and Org Agenda with support
for defining recurring tasks and easily scheduling them.")
    (license license:gpl3+)))

(define-public emacs-org-super-agenda
  (package
    (name "emacs-org-super-agenda")
    (version "1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alphapapa/org-super-agenda")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07fv4zgmfc8ppppbr7ylhx89wcw6r6vmz4a6pg0iy4v7sn5pp1wa"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "test/run" "--debug")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'prepare-for-tests.el
            (lambda _
              (make-file-writable "test/test.el")
              (emacs-substitute-variables "test/test.el"
                ("org-super-agenda-test-results-file"
                 (string-append (getcwd) "/test/results.el")))
              ;; The following tests fail.
              (substitute* "test/test.el"
                ;; TODO: Broken on emacs-org-super-agenda@1.3 and
                ;; emacs-org@9.7.4.  Verify when updating.
                ((".* org-super-agenda-test--auto-parent .*" all)
                 (string-append all "  (skip-unless nil)\n"))
                ;; Some tests are using an obsolete variable; fix its use.
                (("\\(org-super-agenda-retain-sorting ")
                 "(org-super-agenda-keep-order ")
                ;; however, they still fail ...
                ;; TODO: Broken on emacs-org-super-agenda@1.3 since before
                ;; emacs-org@9.7.4.  Verify when updating.
                ((".* org-super-agenda-test--with-retained-sorting .*" all)
                 (string-append all "  (skip-unless nil)\n"))
                ;; TODO: Broken on emacs-org-super-agenda@1.3 and
                ;; emacs-org@9.7.4.  Verify when updating.
                ((".* org-super-agenda-test--without-retained-sorting .*" all)
                 (string-append all "  (skip-unless nil)\n"))))))))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      util-linux
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-ht
      emacs-org
      emacs-s
      emacs-ts
      ))
    (home-page "https://github.com/alphapapa/org-super-agenda")
    (synopsis "Supercharged Org agenda")
    (description "This package allows items in the Org agenda to be grouped
into sections while preserving the structure imposed by any timestamps.")
    (license license:gpl3+)))

(define-public emacs-org-make-toc
  (package
    (name "emacs-org-make-toc")
    (version "0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alphapapa/org-make-toc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0b3ixh8cqp9id1q1h2l6pl05n7vzk7ffp3ms5kxg8bvbn1l3c77l"))
              (snippet #~(delete-file "makem.sh"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f                  ; tests exist but cannot be run…
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'inject-makem
                 (lambda* (#:key inputs #:allow-other-keys)
                   (symlink (search-input-file inputs "/bin/makem.sh")
                            "makem.sh"))))))
    (propagated-inputs
     (list
      emacs-compat
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-org
      emacs-s
      ))
    (native-inputs
     (list
      makem-minimal
      util-linux
      ))
    (home-page "https://github.com/alphapapa/org-make-toc")
    (synopsis "Maintain a table of contents for an Org file")
    (description "This package facilitates the creation and maintenance of
tables of contents.")
    (license license:gpl3+)))

(define-public emacs-ts
  ;; XXX: Upstream did not tag last release.  Use commit matching version
  ;; bump.
  (let ((commit "552936017cfdec89f7fc20c254ae6b37c3f22c5b"))
    (package
      (name "emacs-ts")
      (version "0.3")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alphapapa/ts.el")
               (commit commit)))
         (sha256
          (base32 "18lif159zndl19ddz9rfq12l90770858yasfns21ryl1yrq3aifr"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (arguments
       ;; XXX: Three tests are failing because of a timezone-related issue
       ;; with how they're written.  On my machine, all the failing test
       ;; results are 18000 seconds (5 hours) off.

       ;; The ts-parse-org function accepts a string without any timezone
       ;; info, not assumed to be in Unix time, and converts it to a so-called
       ;; ts struct.  The ts-unix function (accessor) accepts a ts struct,
       ;; then seems to assume the struct's corresponding time is in terms of
       ;; the user's current time zone, before returning a Unix time in
       ;; seconds.

       ;; The failing tests all have similar problems, but nothing else about
       ;; the library seems particularly off.
       (list
        #:test-command #~(list "emacs" "--batch"
                               "-l" "test/test.el"
                               "-f" "ert-run-tests-batch-and-exit")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'make-tests-writable
              (lambda _
                (make-file-writable "test/test.el")))
            (add-before 'check 'delete-failing-tests
              (lambda _
                (emacs-batch-edit-file "test/test.el"
                  `(progn
                    (goto-char (point-min))
                    (dolist (test-regexp
                             '("ert-deftest ts-fill"
                               "ert-deftest ts-format"
                               "ert-deftest ts-parse-org\\_>"
                               "ert-deftest ts-parse-org-element"))
                            (re-search-forward test-regexp)
                            (beginning-of-line)
                            (kill-sexp)
                            (goto-char (point-min)))
                    (basic-save-buffer))))))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (home-page "https://github.com/alphapapa/ts.el")
      (synopsis "Timestamp and date/time library")
      (description "This package facilitates manipulating dates, times, and
timestamps by providing a @code{ts} struct.")
      (license license:gpl3+))))

(define-public emacs-org-ql
  (package
    (name "emacs-org-ql")
    (version "0.8.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alphapapa/org-ql")
                    (commit (string-append "v" version))))
              (sha256
               (base32
                "043m90flbmmcaiv1n5lfw6pd5hr978r9kqbhy34rgyzm0k34sk72"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #f                       ;FIXME: check phase freezes
      #:test-command #~(list "buttercup" "-L" ".")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'remove-helm-org-ql
            (lambda _
              (delete-file "helm-org-ql.el"))))))
    (native-inputs
     (list emacs-buttercup emacs-with-simulated-input emacs-xr))
    (propagated-inputs
     (list
      emacs-compat
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-org
      emacs-org-super-agenda
      emacs-ov
      emacs-peg
      emacs-s
      emacs-ts
      ))
    (home-page "https://github.com/alphapapa/org-ql/")
    (synopsis "Query language for Org buffers")
    (description "This package provides a Lispy query language for Org
files, allowing for actions to be performed based on search criteria.")
    (license license:gpl3+)))

(define-public emacs-helm-org-ql
  (package
    (inherit emacs-org-ql)
    (name "emacs-helm-org-ql")
    (arguments
     (list
      #:tests? #f                       ;no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'remove-emacs-org-ql
            (lambda _
              (install-file "helm-org-ql.el" "..")
              (let ((cwd (getcwd)))
                (with-directory-excursion ".."
                  (delete-file-recursively cwd)
                  (mkdir cwd)
                  (install-file "helm-org-ql.el" cwd))))))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-helm
      emacs-helm-org
      emacs-org-ql
      emacs-s
      ))
    (synopsis "Helm commands for @code{emacs-org-ql}")
    (description "This package provides @code{emacs-helm} commands for
@code{emacs-org-ql}, a Lispy query language for Org files, allowing for actions to
be performed based on search criteria.")))

(define-public emacs-org-auto-expand
  (let ((commit "4938d5f6460e2f8f051ba9ac000b291bfa43ef62")
        (revision "1"))
    (package
      (name "emacs-org-auto-expand")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/alphapapa/org-auto-expand")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1my0c6xmkh37lwi6l472lz9d86lf20h6xcllzlxm1lxa24rhva6v"))
                (snippet #~(begin
                             (for-each delete-file
                                       '("makem.sh" "Makefile"))))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))  ; No tests.
      (propagated-inputs
       (list
        emacs-org
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/alphapapa/org-auto-expand")
      (synopsis "Automatically expand certain Org headings")
      (description "This package allows a customizable set of headings in Org
files to be expanded upon opening them.")
      (license license:gpl3+))))

(define-public emacs-biblio
  (package
    (name "emacs-biblio")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cpitclaudel/biblio.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0iya5ybc54kia5vnb3bfr8yilykhbn2xvp157vya06cw4af2cw65"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; XXX: too many broken tests
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-let-alist
      ))
    (home-page "https://github.com/cpitclaudel/biblio.el")
    (synopsis "Browse and import bibliographic references")
    (description "This package provides an extensible Emacs package for
browsing and fetching references.

@file{biblio.el} makes it easy to browse and gather bibliographic references
and publications from various sources, by keywords or by DOI.  References are
automatically fetched from well-curated sources, and formatted as BibTeX.")
    (license license:gpl3+)))

(define-public emacs-helm-bibtex
  (let ((commit "6064e8625b2958f34d6d40312903a85c173b5261")
        (revision "2"))
    (package
      (name "emacs-helm-bibtex")
      (version (git-version "2.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tmalsburg/helm-bibtex")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1q8dm14wdxx14rnlgmz88j6gskvrrsc0f2z2639jwmfhyibw7d77"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-biblio
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-helm
        emacs-ivy
        emacs-parsebib
        emacs-s
        ))
      (home-page "https://github.com/tmalsburg/helm-bibtex")
      (synopsis "Bibliography manager based on Helm")
      (description
       "This package provides bibliography manager for Emacs,
based on Helm and the BibTeX completion backend.

Key features:

@itemize
@item Quick access to your bibliography from within Emacs
@item Powerful search capabilities
@item Provides instant search results as you type
@item Tightly integrated with LaTeX authoring, emails, Org mode, etc.
@item Open the PDFs, URLs, or DOIs associated with an entry
@item Insert LaTeX cite commands, Ebib links, or Pandoc citations,
BibTeX entries, or plain text references at point, attach PDFs to emails
@item Support for note taking
@item Quick access to online bibliographic databases such as Pubmed,
arXiv, Google Scholar, Library of Congress, etc.
@item Imports BibTeX entries from CrossRef and other sources.
@end itemize")
      (license license:gpl3+))))

(define-public emacs-md4rd
  (package
    (name "emacs-md4rd")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ahungry/md4rd")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1n6g6k4adzkkn1g7z4j27s35xy12c1fg2r08gv345ddr3wplq4ri"))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-request
      emacs-s
      emacs-tree-mode
      ))
    (build-system emacs-build-system)
    (home-page "https://github.com/ahungry/md4rd")
    (synopsis "Emacs Mode for Reddit")
    (description
     "This package allows reading Reddit from within Emacs interactively.")
    (license license:gpl3+)))

(define-public emacs-org-mind-map
  ;; XXX: Upstream does not provide any tag.  The commit below corresponds to
  ;; an exact version bump from the main file.
  (let ((commit "477701b15cb0c8ed7f021ca76a4cb1a7d9ad6aa5"))
    (package
      (name "emacs-org-mind-map")
      (version "0.4")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/theodorewiles/org-mind-map")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08sj43py6aid4vpqgsm0v5n94mcmcil0047qjk033492glz6q55c"))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (build-system emacs-build-system)
      (home-page "https://github.com/theodorewiles/org-mind-map")
      (synopsis "Create Graphviz directed graphs from Org files")
      (description
       "This package creates Graphviz directed graphs from Org files.")
      (license license:gpl3+))))

(define-public emacs-esup
  (let ((commit "0de8af8233d9ce1b67f05a50f25c481c4f1118d8")
        (revision "1"))
    (package
      (name "emacs-esup")
      (version (git-version "0.7.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jschaf/esup")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "01khb3xyj0ylwib6ryzzvqmkh5wvzxiq2n3l0s3h9zv7wx849bzv"))))
      (build-system emacs-build-system)
      (native-inputs
       (list
        emacs-noflet
        (@(bost gnu packages emacs-build) emacs-undercover)
        emacs-buttercup
        ))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (arguments
     `(#:test-command '("buttercup" "-L" ".")))
      (home-page "https://github.com/jschaf/esup")
      (synopsis "Emacs start up profiler")
      (description "Benchmark Emacs Startup time without ever leaving
your Emacs.")
      (license license:gpl2+))))

(define-public emacs-company-lua
  (let ((commit "29f6819de4d691e5fd0b62893a9f4fbc1c6fcb52")
        (revision "2"))
    (package
      (name "emacs-company-lua")
      (version (git-version "0.1" "2" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ptrv/company-lua")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ny2dcc7c585p7v3j6q0rpkbj1qmf2ismy8a5020jpr585xvz0hh"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-company
        emacs-s
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-lua-mode
        ))
      (arguments
       `(#:include (cons* "^lua\\/" %default-include)))
      (home-page "https://github.com/ptrv/company-lua")
      (synopsis "Company backend for Lua")
      (description
       "This package provides Company backend for Lua programming language.")
      (license license:gpl3+))))

(define-public emacs-elm-mode
  (package
    (name "emacs-elm-mode")
    (version "0.22.0")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/jcollard/elm-mode")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gnr61ibzcznfqy5f8capmbz75rcfikwy106rjdmp45qz2jwp4di"))))
    (arguments (list #:tests? #f))      ; no tests
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-reformatter
      emacs-s
      ))
    (build-system emacs-build-system)
    (home-page "https://github.com/jcollard/elm-mode")
    (synopsis "Emacs major mode for editing Elm source code")
    (description
     "This package provides a major mode for editing Elm source code, and
working with common core and third-party Elm tools.  Its features are:

@itemize
@item Syntax highlighting
@item Intelligent indentation
@item Integration with elm-make
@item Integration with elm-repl
@item Integration with elm-reactor
@item Integration with elm-package
@item Integration with elm-oracle
@item Integration with elm-format
@item Integration with elm-test
@end itemize")
    (license license:gpl3+)))

(define-public emacs-hy-mode
  (package
    (name "emacs-hy-mode")
    (version "1.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hylang/hy-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gihxlmfminadaqdr8d2zccd7wwygl3m0gfzxsk5izi7f8hl4w7f"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      ))
    (home-page "https://github.com/hylang/hy-mode")
    (synopsis "Major mode for Hylang")
    (description "This package provides a major mode for Hylang.")
    (license license:gpl3+)))

(define-public emacs-web-beautify
  (package
    (name "emacs-web-beautify")
    (version "0.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yasuyk/web-beautify")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vms7zz3ym53wf1zdrkbf2ky2xjr1v134ngsd0jr8azyi8siw84d"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command #~(list "ert-runner")))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (home-page "https://github.com/yasuyk/web-beautify")
    (synopsis "Format HTML, CSS and JavaScript, JSON")
    (description "This package provides an Emacs functions to format HTML,
CSS, JavaScript, JSON.")
    (license license:gpl3+)))

(define-public emacs-helm-shell-history
  (let ((commit "110d3c35c52fe4b89b29e79ea4c8626bce7266a1"))
    (package
      (name "emacs-helm-shell-history")
      (version (git-version "0.1" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yuutayamada/helm-shell-history")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "18fkjcz69g4dyaxhf9j8svr5x6dhsdnglddwisis8hdn504scpfj"))))
      (build-system emacs-build-system)
      (arguments
       '(#:phases
         (modify-phases %standard-phases
           (add-before 'check 'patch-helm-shell-history-file
             (lambda _
               (let ((file "helm-shell-history.el"))
                 (chmod file #o644)
                 (emacs-substitute-sexps file
                   ("(defvar helm-shell-history-file"
                    `(expand-file-name "~/.bash_history"))))
               #t)))))
      (propagated-inputs
       (list
        emacs-helm
        ))
      (home-page "https://github.com/yuutayamada/helm-shell-history")
      (synopsis "Find shell history with Emacs Helm")
      (description "This package provides an Emacs Helm interface to search
throw a shell history.")
      (license license:gpl3+))))

(define-public emacs-discover-my-major
  (package
    (name "emacs-discover-my-major")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://framagit.org/steckerhalter/discover-my-major.git/")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1wlqyl03hhnflbyay3qlvdzqzvv5rbybcjpfddggda7ias9h0pr4"))))
    (build-system emacs-build-system)
    (arguments (list #:tests? #f))      ; no tests
    (propagated-inputs
     (list emacs-makey))
    (home-page "https://framagit.org/steckerhalter/discover-my-major/")
    (synopsis "Discover key bindings for the current Emacs major mode")
    (description "This package discovers key bindings and
their meaning for the current Emacs major-mode.")
    (license license:gpl3+)))

(define-public emacs-org-ref
  (let ((commit "732a20bd236fd02db4a651da29f87f87f458a54a")
        (revision "0"))
    (package
      (name "emacs-org-ref")
      (version (git-version "3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jkitchin/org-ref")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1kbjxz56fvln6drd2wqdxrpgwjshzpdbyaq7dz0gn285z93y1knk"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:include #~(cons* "org-ref.org" "org-ref.bib" %default-include)
        #:exclude #~(list
                     ;; author doesn't recommend using it
                     "org-ref-pdf.el")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'skip-failing-test
              (lambda _
                (substitute* "test/all-org-test.el"
                  (("\\(ert-deftest preprocess .*" all)
                   (string-append all
                                  " (skip-unless (libxml-available-p))"))))))))
      (propagated-inputs
       (list
        emacs-avy
        emacs-citeproc
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-helm-bibtex
        emacs-htmlize
        emacs-hydra
        emacs-ox-pandoc
        emacs-parsebib
        emacs-request
        emacs-s
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (home-page "https://github.com/jkitchin/org-ref")
      (synopsis "Citations, cross-references and bibliographies in Org mode")
      (description
       "Org Ref is an Emacs library that provides rich support for citations,
labels and cross-references in Org mode.

The basic idea of Org Ref is that it defines a convenient interface to insert
citations from a reference database (e.g., from BibTeX files), and a set of
functional Org links for citations, cross-references and labels that export
properly to LaTeX, and that provide clickable functionality to the user.  Org
Ref interfaces with Helm BibTeX to facilitate citation entry, and it can also
use RefTeX.

It also provides a fairly large number of utilities for finding bad citations,
extracting BibTeX entries from citations in an Org file, and functions to
create and modify BibTeX entries from a variety of sources, most notably from
a DOI.

Org Ref is especially suitable for Org documents destined for LaTeX export and
scientific publication.  Org Ref is also useful for research documents and
notes.")
      (license license:gpl3+))))

(define-public emacs-academic-phrases
  (let ((commit "0823ed8c24b26c32f909b896a469833ec4d7b656"))
    (package
      (name "emacs-academic-phrases")
      (version (git-version "0.1" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nashamri/academic-phrases")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0qfzsq8jh05w4zkr0cvq3i1hdn97bq344vcqjg46sib26x3wpz6r"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        emacs-ht
        ))
      (home-page "https://github.com/nashamri/academic-phrases")
      (synopsis "Bypass that mental block when writing your papers")
      (description
       "When writing your academic paper, you might get stuck trying to find
the right phrase that captures your intention.  This package tries to
alleviate that problem by presenting you with a list of phrases organized by
the topic or by the paper section that you are writing.  This package has
around 600 phrases so far.

Using this package is easy, just call @code{academic-phrases} to get a list of
phrases organized by topic, or call @code{academic-phrases-by-section} to
browse the phrases by the paper section and fill-in the blanks if required.")
      (license license:gpl3+))))

(define-public emacs-grep-context
  (let ((commit "5a4e3efdf775755c1bbefcfe4b461c1166d81d7d")
        (revision "1"))
    (package
      (name "emacs-grep-context")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mkcms/grep-context")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "00q7l4a3c0ay6g5ff9bfa2qgkiswsyh4s6pqnpg0zpzhvv5710f5"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/mkcms/grep-context")
      (synopsis "Increase context in compilation and grep buffers")
      (description
       "This package provides an Emacs package for more context in
compilation/grep buffers.  Works with @code{wgrep}, @code{ack}, @code{ag},
@code{ivy}.")
      (license license:gpl3+))))

(define-public emacs-parinfer-mode
  (package
    (name "emacs-parinfer-mode")
    (version "0.4.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DogLooksGood/parinfer-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0v97ncb0w1slb0x8861l3yr1kqz6fgw1fwl1z9lz6hh8p2ih34sk"))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-rainbow-delimiters
      emacs-company
      ))
    (build-system emacs-build-system)
    (home-page "https://github.com/DogLooksGood/parinfer-mode/")
    (synopsis "Lisp structure editing mode")
    (description "@code{parinfer-mode} is a proof-of-concept editor
mode for Lisp programming languages.  It will infer some changes to
keep Parens and Indentation inline with one another.")
    (license license:gpl3+)))

(define-public emacs-noflet
  (let ((version "20170629")
        (revision "1")
        (commit "7ae84dc3257637af7334101456dafe1759c6b68a"))
    (package
      (name "emacs-noflet")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nicferrier/emacs-noflet")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0g70gnmfi8n24jzfci9nrj0n9bn1qig7b8f9f325rin8h7x32ypf"))))
      (build-system emacs-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'require-dash
             ;; noflet.el uses -map from dash, but (require 'dash) is
             ;; missing. So, add it.
             (lambda _
               (substitute* "noflet.el"
                 ((";;; Code:") ";;; Code:\n(require 'dash)"))
               #t)))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/nicferrier/emacs-noflet")
      (synopsis "Locally override functions")
      (description "@code{emacs-noflet} lets you locally override functions,
in the manner of @command{flet}, but with access to the original function
through the symbol: @command{this-fn}.")
      (license license:gpl3+))))

(define-public emacs-helm-flycheck
  (let ((commit "3cf7d3bb194acacc6395f88360588013d92675d6"))
    (package
      (name "emacs-helm-flycheck")
      (version (git-version "0.4" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/yasuyk/helm-flycheck")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1a2yfxhz04klwhcandqvfzysxp6b7bxyxx1xk1x3kds5hif5fkl4"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ; no tests
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-flycheck
        emacs-helm
        ))
      (home-page "https://github.com/yasuyk/helm-flycheck")
      (synopsis "Show Flycheck errors with Helm")
      (description
       "This integrates Flycheck with Helm.")
      (license license:gpl3+))))

(define-public emacs-sxiv
  (package
    (name "emacs-sxiv")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://tildegit.org/contrapunctus/sxiv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0gimq172pp143jckfhhyw319n3vpjvlkadm0vhypycas9i89mcg0"))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-sxiv-path
           (lambda* (#:key inputs #:allow-other-keys)
             (emacs-substitute-sexps "sxiv.el"
               (":command
                  (append"
                `(list ,(search-input-file inputs "bin/sxiv")))))))))
    (inputs (list sxiv))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (build-system emacs-build-system)
    (home-page "https://tildegit.org/contrapunctus/sxiv")
    (synopsis "Launch sxiv from Emacs with Dired integration")
    (description "This package integrates sxiv into Dired.  It adds a command
to start sxiv from a Dired buffer, allowing you to mark or unmark image files
in said buffer using sxiv.")
    (license license:unlicense)))

(define-public emacs-github-review
  (let ((commit "a13a3b4f1b6114a32af843971a145ab880f51232")
        (revision "2"))
    (package
      (name "emacs-github-review")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/charignon/github-review")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0injfpxzgfhmqalba845j5l5cdcxxqz43knhxwinf36g52nfabl0"))))
      (build-system emacs-build-system)
      (inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        emacs-ghub
        ))
      (native-inputs
       (list
        emacs-buttercup
        (@(bost gnu packages emacs-build) emacs-undercover)
        ))
      (arguments
       (list
        #:test-command #~(list "buttercup" "-L" "test/github-review-test.el")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'compatibility-with-recent-buttercup
              (lambda _
                (emacs-batch-edit-file "test/github-review-test.el"
                  '(progn
                    (insert ";;; -*-lexical-binding:t-*-")
                    (basic-save-buffer))))))))
      (home-page "https://github.com/charignon/github-review")
      (synopsis "Review GitHub pull requests within Emacs")
      (description "This package provides commands to pull in, comment on, and
accept and reject GitHub pull requests.")
      (license license:gpl3+))))

(define-public emacs-deadgrep
  (package
    (name "emacs-deadgrep")
    (version "0.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/deadgrep")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1ry9qvvxwhh3gkb0kkwiwpx37jpdzgky1h2zkwpzjpkv5jm022dr"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'configure
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((ripgrep (search-input-file inputs "/bin/rg")))
                ;; Specify the absolute file name of rg so that everything
                ;; works out-of-the-box.
                (emacs-substitute-variables "deadgrep.el"
                  ("deadgrep-executable" ripgrep))))))))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (inputs
     (list
      ripgrep
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      emacs-spinner
      ))
    (home-page "https://github.com/Wilfred/deadgrep")
    (synopsis "Frontend for @code{ripgrep}")
    (description "This package provides an Emacs interface for performing
searches with @code{ripgrep}.")
    (license license:gpl3+)))

(define-public emacs-pandoc-mode
  (package
    (name "emacs-pandoc-mode")
    (version "2.34.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/joostkremers/pandoc-mode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1kraah7663cr9lsymqff25ad80nlih94y871byd925nhyl908kfl"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-hydra
      ))
    (home-page "https://github.com/joostkremers/pandoc-mode")
    (synopsis "Minor mode for interacting with Pandoc")
    (description "This package provides a Hydra menu for interacting with the
Pandoc, the document-conversion tool.")
    (license license:bsd-3)))

(define-public emacs-ccls
  (let ((commit "675a5704c14a27931e835a431beea3631d92e8e6")
        (revision "5"))
    (package
      (name "emacs-ccls")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/MaskRay/emacs-ccls")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0l4bhyr9d8ljz1f0cfg1s2cjcmh6fiwbk5mdlvc7rrwz5hxc21is"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        ccls
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-lsp-mode
        ))
      (home-page "https://github.com/MaskRay/emacs-ccls")
      (synopsis "Emacs support for the @code{ccls} language server")
      (description "This package extends @code{lsp-mode} to work with @code{C}
and @code{C++} files through the @code{ccls} language server.")
      (license license:expat))))

(define-public emacs-racer
  (let ((commit "1e63e98626737ea9b662d4a9b1ffd6842b1c648c")
        (revision "0"))
    (package
      (name "emacs-racer")
      (version (git-version "1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/racer-rust/emacs-racer")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "12a429lajk09qp1jxgig54p8z6wndfgr4jwdmgkc9s2df9sw02d3"))))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        (@(bost gnu packages emacs-build) emacs-undercover)
        ))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-pos-tip
        emacs-rust-mode
        emacs-s
        ))
      (build-system emacs-build-system)
      (home-page "https://github.com/racer-rust/emacs-racer")
      (synopsis "Racer support for Emacs")
      (description
       "This is the official Emacs package for Racer.  It supports code
completion of variables, functions and modules.  It can also jump to
definition of functions and types, and show a help buffer based on the
docstring of the thing at point.")
      (license license:expat))))

(define-public emacs-rustic
  (package
    (name "emacs-rustic")
    (version "3.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-rustic/rustic")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kbhad1lc7jy7frp3lk14ch8g53zh28rwy8v7nb8fixlxbla0jml"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-flycheck
      emacs-lsp-mode
      emacs-markdown-mode
      emacs-project
      emacs-rust-mode
      emacs-s
      emacs-spinner
      emacs-xterm-color
      ))
    (arguments
     ;; Tests require rust, cargo, rustfmt, and various crates to be
     ;; vendored.
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'set-without-cask
           (lambda _
             (setenv "WITHOUT_CASK" "1"))))))
    (home-page "https://github.com/emacs-rustic/rustic")
    (synopsis "Rust development environment for Emacs")
    (description "Rustic is a fork of Rust mode.
In addition to its predecessor, it offers the following features:
@itemize
@item Flycheck integration,
@item Cargo popup,
@item multiline error parsing,
@item translation of ANSI control sequences through XTerm color,
@item asynchronous Org Babel,
@item custom compilation process,
@item @command{rustfmt} errors in a Rust compilation mode,
@item automatic LSP configuration with Eglot or LSP mode,
@item optional Rust inline documentation,
@item etc.
@end itemize")
    (license (list license:expat
                   license:asl2.0))))

(define-public emacs-helm-org-contacts
  (let ((commit "741eca6239684950219c9a12802386a132491b8c")
        (revision "2"))
    (package
      (name "emacs-helm-org-contacts")
      (version (git-version "20201202" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tmalsburg/helm-org-contacts")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1xy51hc3az8bc9sj71sjzy03xpkfa4v3cdcv3gpq3cj2zhk9gr8h"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-helm
        emacs-s
        ))
      (home-page "https://github.com/tmalsburg/helm-org-contacts")
      (synopsis "Helm source for org-contacts")
      (description "This Helm source can be used to search contacts stored in
org-contacts format.  There are actions for inserting postal addresses, email
addresses, and phone numbers in the buffer where @command{helm-org-contacts}
was called.")
      (license license:gpl3))))

(define-public emacs-dired-rsync
  (package
    (name "emacs-dired-rsync")
    (version "0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stsquad/dired-rsync")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1zvsmpvham670i807rs8f2f0h73yk4fpaavj0hzksqcl5ykh4fgr"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-s
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/stsquad/dired-rsync/")
    (synopsis "Support for rsync from Emacs dired buffers")
    (description "This package adds a single command @code{dired-rsync} which
allows the user to copy marked files in a Dired buffer via @code{rsync}.  This
is useful, especially for large files, because the copy happens in the
background and doesn’t lock up Emacs.  It is also more efficient than using
Tramp's own encoding methods for moving data between systems.")
    (license license:gpl3+)))

(define-public emacs-ytdl
  (let ((commit "2ea3daf2f6aa9d18b71fe3e15f05c30a56fca228")
        (revision "0"))
    (package
      (name "emacs-ytdl")
      (version (git-version "1.3.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/tuedachu/ytdl")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0y62lkgsg19j05dpd6sp6zify8vq8xvpc8caqiy4rwi7p4ahacsf"))))
      (build-system emacs-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'configure
             (lambda* (#:key inputs #:allow-other-keys)
               ;; .el is read-only in git.
               (make-file-writable "ytdl.el")
               ;; Specify the absolute file names of the various programs so
               ;; that everything works out-of-the-box.
               (emacs-substitute-variables "ytdl.el"
                 ("ytdl-command"
                  (search-input-file inputs "/bin/youtube-dl"))))))))
      (inputs
       (list youtube-dl))
      (propagated-inputs
       (list
        emacs-async
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://gitlab.com/tuedachu/ytdl")
      (synopsis "Emacs interface for youtube-dl")
      (description
       "This package manages a video download queue for @command{youtube-dl},
which serves as the back end.  New videos can be queued at any time.  All
youtube-dl backends are supported.  It is possible to create download profiles
depending on the downloaded URL.")
      (license license:gpl3+))))

(define-public emacs-org-web-tools
  (package
    (name "emacs-org-web-tools")
    (version "1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alphapapa/org-web-tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0x1j1y2pl6a8f97cw04nm0w6g4jh449cjfsr2aryn316ms4nj1a0"))
       ;; Contents of makem package, but no tests.
       (snippet #~(for-each delete-file '("Makefile" "makem.sh")))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-compat
           (@(bost gnu packages emacs-build) emacs-dash)
           emacs-esxml
           emacs-plz
           emacs-request
           emacs-s))
    (inputs
     (list pandoc))
    (arguments
     (list
      #:tests? #f                       ; no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-exec-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((pandoc (search-input-file inputs "/bin/pandoc")))
                (substitute* "org-web-tools.el"
                  (("\"pandoc\"") (string-append "\"" pandoc "\"")))))))))
    (home-page "https://github.com/alphapapa/org-web-tools")
    (synopsis "Display/Process web page as Org mode content")
    (description
     "This package contains library functions and commands useful
for retrieving web page content and processing it into Org mode content.

For example, you can copy a URL to the clipboard or kill-ring, then run
a command that downloads the page, isolates the ``readable'' content with
@command{eww-readable}, converts it to Org mode content with Pandoc, and
displays it in an Org mode buffer.  Another command does all of that but
inserts it as an Org entry instead of displaying it in a new buffer.")
    (license license:gpl3+)))

(define-public emacs-all-the-icons
  (package
    (name "emacs-all-the-icons")
    (version "5.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/domtronn/all-the-icons.el")
             (commit version)))
       (file-name (git-file-name name version))
       (patches
        (search-patches "emacs-all-the-icons-remove-duplicate-rs.patch"))
       (sha256
        (base32 "0lwgvgnqf7vihglm0c5bwsxbl4x7f641289cji5s7jwy2dbsqk7g"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:include '(list "\\.el$" "^data/")
      #:exclude '(list "^test/")
      #:tests? #f                      ; XXX: duplicate tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-fonts
            (lambda _
              (let ((fonts (string-append #$output "/share/fonts")))
                (mkdir-p fonts)
                (with-directory-excursion "fonts"
                  (install-file "all-the-icons.ttf" fonts)
                  ;; TODO: Unbundle.
                  (install-file "file-icons.ttf" fonts)
                  (install-file "octicons.ttf" fonts)
                  (install-file "weathericons.ttf" fonts)))))
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (if tests?
                  (apply invoke "ert-runner" "-l"
                         (append (find-files "data" "\\.el")
                                 '("all-the-icons-faces.el")))
                  (format #t "test suite not run~%")))))))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-memoize
      font-awesome
      font-google-material-design-icons
      ))
    (home-page "https://github.com/domtronn/all-the-icons.el")
    (synopsis "Collect icon fonts and propertize them within Emacs")
    (description
     "All-the-icons is a utility package to collect various icon fonts and
propertize them within Emacs.  Icon fonts allow you to propertize and format
icons the same way you would normal text.  This enables things such as better
scaling of and anti aliasing of the icons.")
    ;; Package is released under Expat license.  Elisp files are licensed
    ;; under GPL3+.  Fonts come with various licenses: Expat for
    ;; "all-the-icons.ttf" and "file-icons.ttf", Apache License 2.0 for
    ;; "material-design-icons.ttf", and SIL OFL 1.1 for "fontawesome.ttf",
    ;; "ocitcons.ttf" and "weathericons.ttf".
    (license
     (list license:expat license:gpl3+ license:silofl1.1 license:asl2.0))))

(define-public emacs-frame-purpose
  (package
    (name "emacs-frame-purpose")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alphapapa/frame-purpose.el")
                    (commit version)))
              (sha256
               (base32
                "0jq2aam1yvccw887ighd1wm2xkvk5bv53ffiz3crcl16a255aj4q"))
              (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (synopsis "Purpose-specific frames for Emacs")
    (description "@code{frame-purpose} makes it easy to open purpose-specific
frames that only show certain buffers, e.g. by buffers’ major mode, their
filename or directory, etc, with custom frame/X-window titles, icons, and
other frame parameters.")
    (home-page "https://github.com/alphapapa/frame-purpose.el")
    (license license:gpl3+)))

(define-public emacs-kodi-remote
  (let ((commit "f5e932036c16e2b61a63020e006fc601e38d181e")
        (revision "0"))
    (package
      (name "emacs-kodi-remote")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/spiderbit/kodi-remote.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1gck7lvqxcr9ikrzlpvcf4408cq6i4s8ijgb0kdsbkfzv0w86934"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ; tests require networking
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-json-mode
        emacs-let-alist
        emacs-request
        ))
      (home-page "https://github.com/spiderbit/kodi-remote.el")
      (synopsis "Remote control for Kodi")
      (description
       "This package provides a major mode to control Kodi
instances (play/pause, volume control, media selection, etc.) remotely.")
      (license license:gpl3+))))

(define-public emacs-docker
  (package
    (name "emacs-docker")
    (version "2.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Silex/docker.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13927ns3393q40gxrfzyqh6ajxzfjg14d0srfxi6ild3pmaz0460"))))
    (inputs
     (list
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (propagated-inputs
     (list
      emacs-aio
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-json-mode
      emacs-s
      emacs-tablist
      ))
    (arguments `(#:tests? #false))      ;no tests
    (build-system emacs-build-system)
    (home-page "https://github.com/Silex/docker.el")
    (synopsis "Manage docker from Emacs")
    (description "This package provides an Emacs interface for Docker.")
    (license license:gpl3+)))

(define-public emacs-lsp-ivy
  (package
    (name "emacs-lsp-ivy")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emacs-lsp/lsp-ivy")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nb9ypa8hyx7i38rbywh8hn2i5f9l2l567hvdr9767fk279yr97n"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-ivy
      emacs-lsp-mode
      ))
    (home-page "https://github.com/emacs-lsp/lsp-ivy")
    (synopsis "Provide LSP-enhanced completion for symbols")
    (description
     "This package enhances @code{ivy} with completion for symbols from
workspaces with a LSP-compliant server running.")
    (license license:gpl3+)))

(define-public emacs-elmacro
  (package
    (name "emacs-elmacro")
    (version "1.1.1")
    (home-page "https://github.com/Silex/elmacro")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url home-page)
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1x4wnsshf9h10mp51x92vs5rxw5had4gmw6zz4f53czx1ymcv16a"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-s
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (synopsis "Convert keyboard macros to Emacs Lisp")
    (description
     "This package displays keyboard macros or latest interactive commands
as Emacs Lisp.")
    (license license:gpl3+)))

(define-public emacs-flycheck-haskell
  (let ((commit "32ddff87165a7d3a35e7318bee997b5b4bd41278")
        (revision "2"))
    (package
      (name "emacs-flycheck-haskell")
      (version (git-version "0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/flycheck/flycheck-haskell")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "10pgsbagq6qj4mshq5sypv0q0khck92b30sc793b4g1pfpsxvgjn"))))
      (build-system emacs-build-system)
      (arguments
       (list #:include #~(list "\\.el$" "\\.hs$")
             #:test-command #~(list "make" "test" "CASK=")
             #:tests? #f))  ; Several tests are failing on the haskell side.
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-flycheck
        emacs-haskell-mode
        emacs-let-alist
        ))
      (native-inputs
       (list
        ghc
        ))
      (home-page "https://github.com/flycheck/flycheck-haskell")
      (synopsis "Flycheck for Haskell")
      (description "This package configures syntax-checking for Haskell
buffers.")
      (license license:gpl3+))))

(define-public emacs-js2-refactor
  (let ((commit "d4c40b5fc86d3edd7c6a7d83ac86483ee1cb7a28")
        (revision "2"))
    (package
      (name "emacs-js2-refactor")
      (version (git-version "0.9.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/magnars/js2-refactor.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "08b25y3raz0p98zxk9xdd8nj9shqd6mzrqhbq1gg4cwsmi7h7ly1"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'enable-lexical-binding
              (lambda _
                (emacs-batch-edit-file
                    "test/js2r-local-name-node-at-point-test.el"
                  '(progn
                    (add-file-local-variable-prop-line 'lexical-binding t)
                    (basic-save-buffer))))))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        emacs-js2-mode
        emacs-yasnippet
        emacs-multiple-cursors
        ))
      (native-inputs
       (list
        emacs-buttercup
        emacs-espuds
        ))
      (home-page "https://github.com/magnars/js2-refactor.el")
      (synopsis "JavaScript refactoring in Emacs")
      (description "This package provides various refactoring functions for
JavaScript.")
      (license license:gpl3+))))

(define-deprecated/public emacs-js2-refactor-el emacs-js2-refactor
  (deprecated-package "emacs-js2-refactor-el" emacs-js2-refactor))

(define-public emacs-jsdoc
  (package
    (name "emacs-jsdoc")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/isamert/jsdoc.el")
             (commit (string-append "v" version))))
       (sha256
        (base32 "0j99rax3n905ya0ya42093pl8q7kcb8xx2qz6b918f7d8q0mr44n"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      tree-sitter-javascript
      ))
    (home-page "https://github.com/isamert/jsdoc.el")
    (synopsis "Inserts JSDoc function comments/typedefs easily")
    (description "This package provides an easy way to insert JSDoc function
comments and typedefs using Emacs' builtin tree-sitter.")
    (license license:gpl3+)))

(define-public emacs-tco
  (let ((commit "482db5313f090b17ed22ccd856f0e141dc75afe6")
        (revision "1"))
    (package
      (name "emacs-tco")
      (version (git-version "0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Wilfred/tco.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1z7xkbrqznk6ni687qqknp8labcyhl8y6576hjfri89fn21385y9"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        (@(bost gnu packages emacs-build) emacs-undercover)
        ))
      (home-page "https://github.com/Wilfred/tco.el")
      (synopsis "Tail-call optimization for Emacs Lisp")
      (description "This package provides tail-call optimization for Emacs
Lisp functions that call themselves in tail position.")
      (license license:gpl3+))))

(define-deprecated/public emacs-tco-el emacs-tco
  (deprecated-package "emacs-tco-el" emacs-tco))

(define-public emacs-equake
  ;; Upstream provides no tagged releases, but the commit below matches an
  ;; exact release.
  (let ((commit "4d6ef75a4d91ded22caad220909518ccb67b7b87"))
    (package
      (name "emacs-equake")
      (version "0.985")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/emacsomancer/equake")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "11xfr71y78idcn461p4pz7b0k01nhz15cyl97bjqq6ii5xhbhvdx"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://gitlab.com/emacsomancer/equake/")
      (synopsis "Drop-down console for @code{Eshell} and terminal emulators")
      (description "This package provides a Quake-style drop-down console
compatible with Emacs' shell modes.")
      (license license:gpl3+))))

(define-public emacs-prodigy
  (package
    (name "emacs-prodigy")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rejeep/prodigy.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "04xspdj67nas1ivv0ldlmmkr6v7zd7y3k346pnfgvq8wzqi6x4vz"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f  ; XXX: Missing coffescript requirement.
           #:test-command #~(list "make" "test-ert")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'inject-makel
                 (lambda* (#:key inputs #:allow-other-keys)
                   (symlink (search-input-file inputs "include/makel.mk")
                            "makel.mk"))))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      emacs-s
      ))
    (native-inputs
     (list
      emacs-ecukes
      (@(bost gnu packages emacs-build) emacs-el-mock)
      emacs-ert-async
      emacs-shut-up makel
      ))
    (home-page "https://github.com/rejeep/prodigy.el")
    (synopsis "Manage external services from within Emacs")
    (description "This package provides a GUI for defining and monitoring services.")
    (license license:gpl3+)))

(define-public emacs-prodigy-el
  (deprecated-package "emacs-prodigy-el" emacs-prodigy))

(define-public emacs-origami
  (let ((commit "1f38085c8f9af7842765ed63f7d6dfe4dab59366")
        (version "1.0")
        (revision "1"))
    (package
      (name "emacs-origami")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/gregsexton/origami.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ha1qsz2p36pqa0sa2sp83lspbgx5lr7930qxnwd585liajzdd9x"))
         (modules '((guix build utils)))
         (snippet #~(substitute* (find-files "." "\\.el$")
                      (("\\(require 'cl\\)")
                       "(require 'cl-lib)")
                      (("(destructuring-bind|remove-if)" all)
                       (string-append "cl-" all))
                      (("\\(face-attribute 'highlight :background\\)") "\
(let ((color (face-attribute 'highlight :background)))
  (and color (not (eq color 'unspecified)) color))")))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (home-page "https://github.com/gregsexton/origami.el")
      (synopsis "Flexible text-folding")
      (description
       "This package provides a minor mode for collapsing and
expanding regions of text without modifying the actual contents.")
      (license license:expat))))

(define-deprecated/public emacs-origami-el emacs-origami
  (deprecated-package "emacs-origami-el" emacs-origami))

(define-public emacs-ivy-clipmenu
  (let ((commit "d2071f2c5043a05d610cd1952e84176ca78c31dc"))
    (package
      (name "emacs-ivy-clipmenu")
      (version (git-version "0.0.1" "1" commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/wpcarro/ivy-clipmenu.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0npd8glzk5z4n7y9mzbsbzi0cf3by19fqcki052jr3dga363lds7"))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-ivy
        ))
      (build-system emacs-build-system)
      (home-page "https://github.com/wpcarro/ivy-clipmenu.el")
      (synopsis "Ivy integration with clipmenu")
      (description "Ivy integration with the clipboard manager, clipmenu.")
      (license license:expat))))

(define-public emacs-org-drill-table
  ;; No releases or tags.
  (let ((commit "096387d929bcf3eb479e0a9d5da9cf32c756a759")
        (revision "0"))
    (package
      (name "emacs-org-drill-table")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/chrisbarrett/org-drill-table.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1a8ygrcag8i9hdpy2vsn0sh8lwhl9b56rv91j3rddy1jv5qx1ipb"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command
        #~(list "emacs" "--batch"
                "-l" "org-drill-table.el"
                "-l" "test/org-drill-table-tests.el"
                "-f" "ert-run-tests-batch-and-exit")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'skip-failing-tests
              (lambda _
                (substitute* "test/org-drill-table-tests.el"
                  (("ert-deftest org-drill-table--tracks-.*-separately .*" all)
                   (string-append all " (skip-unless nil)"))))))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-org
        emacs-s
        ))
      (home-page "https://github.com/chrisbarrett/org-drill-table")
      (synopsis "Generate Org drill cards using Org mode tables")
      (description
       "This package generates drill cards based on an Org mode table in the
current subtree.  The cards are inserted under a new ``Cards'' heading in the
current tree.")
      (license license:gpl3+))))

(define-public emacs-dash-docs
  (let ((commit "dafc8fc9f1ddb2e4e39e0b8d066c42d5d7ce8d06")
        (revision "2"))
    (package
      (name "emacs-dash-docs")
      (version (git-version "1.4.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/dash-docs-el/dash-docs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0n6d3mm43gj16v8kjjradcfik93wb89dsqnfcbskb28bvcamafid"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list emacs-async))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-undercover)
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (arguments
       `(#:phases
         ;; this test requires network access, so remove it
         (modify-phases %standard-phases
           (add-before 'check 'make-tests-writable
             (lambda _
               (make-file-writable "test/dash-docs-test.el")
               #t))
           (add-before 'check 'delete-test
             (lambda _
               (emacs-batch-edit-file "test/dash-docs-test.el"
                 `(progn (progn
                          (goto-char (point-min))
                          (re-search-forward "ert-deftest dash-docs-official-docsets-test")
                          (beginning-of-line)
                          (kill-sexp))
                         (basic-save-buffer)))
               #t)))))
      (home-page "https://github.com/dash-docs-el/dash-docs")
      (synopsis "Offline documentation browser for APIs using Dash docsets")
      (description "This package exposes functionality to work with Dash docsets.")
      (license license:gpl3+))))

(define-public emacs-helm-dash
  (let ((commit "7f853bd34da666f0e9a883011c80f451b06f6c59")
        (revision "2"))
    (package
      (name "emacs-helm-dash")
      (version (git-version "1.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/areina/helm-dash")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0r192vzry1212ihabg9pgw9xar8zdgnbgy0vsgvfm8s5wj6ny7jp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-helm
        emacs-dash-docs
        ))
      (home-page "https://github.com/areina/helm-dash")
      (synopsis "Offline documentation browser for APIs using Dash docsets")
      (description "This package uses Helm to install and navigate through
Dash docsets.")
      (license license:gpl3+))))

(define-public emacs-counsel-dash
  (let ((commit "370d5f6f14b5294d0eb717f7b2a6a8e93df1ed24")
        (revision "4"))
    (package
      (name "emacs-counsel-dash")
      (version (git-version "0.1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/dash-docs-el/counsel-dash")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1fn38vbz46ijarjvhgw7iy7dj9s2a2miy95fyy9f8b5sj8nrdfvz"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-counsel
        emacs-dash-docs
        ))
      (home-page "https://github.com/dash-docs-el/counsel-dash")
      (synopsis "Offline documentation browser for APIs using Dash docsets")
      (description "This package uses @code{ivy-mode} to install and navigate
through Dash docsets.")
      (license license:expat))))

(define-public emacs-calibredb
  (package
    (name "emacs-calibredb")
    (version "2.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chenyanming/calibredb.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a4gyc3gcq18j29pw2i296d70nvx5fbzlw9fdmqwzncciqz5as6m"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (make-file-writable "calibredb-core.el")
              (let ((calibredb (search-input-file inputs "/bin/calibredb"))
                    (fetch-ebook-metadata
                     (search-input-file inputs "/bin/fetch-ebook-metadata")))
                (emacs-substitute-variables "calibredb-core.el"
                  ("calibredb-fetch-metadata-program" fetch-ebook-metadata)
                  ("calibredb-program" calibredb))))))))
    (inputs
     (list calibre))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-esxml
      emacs-s
      ))
    (home-page "https://github.com/chenyanming/calibredb.el")
    (synopsis "Yet another calibre client for Emacs")
    (description "This package integrates calibre into Emacs.
@enumerate
@item Powerful ebook dashboard.
@item Manage ebooks, actually not only ebooks!
@item Manage Ebook libraries.
@item Another bookmarks solution, by setting the tags and comments.
@item Quick search, filter, make actions on items with ivy and helm.
@item Org-ref support.
@end enumerate")
    (license license:gpl3)))

(define-public emacs-eval-in-repl
  (package
    (name "emacs-eval-in-repl")
    (version "0.9.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kaz-yos/eval-in-repl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mrssbl0wyc6iij8zk1y3h9bd3rv53nnrxsij7fn67l1m4z0clyn"))))
    (build-system emacs-build-system)
    (arguments
     (list #:include
           #~(list "eval-in-repl\\.el" "eval-in-repl-test\\.el" "README\\.md")))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-paredit
      emacs-ace-window
      ))
    (home-page "https://github.com/kaz-yos/eval-in-repl")
    (synopsis "One keybinding to communicate with REPLs")
    (description
     "@code{eval-in-repl} provides a consistent ESS-like evaluation interface
for various REPLs.  In particular, it mimics ESS' C-RET binding, which sends a
line or region to an appropriately configured shell.  This package provides
just the core of @code{eval-in-repl}---for the languages themselves, see their
respective packages.")
    (license license:expat)))

(define* (make-emacs-eval-in-repl repl #:key
                                  (eval-in-repl-package emacs-eval-in-repl)
                                  (language (string-capitalize repl))
                                  (inputs '()))
  "Construct an emacs-eval-in-repl package for REPL, which interprets LANGUAGE.
Optionally propagate INPUTS or use a different EVAL-IN-REPL-PACKAGE."
  (package
    (inherit eval-in-repl-package)
    (name (string-append "emacs-eval-in-repl-" repl))
    (arguments
     (list #:include
           #~(list #$(string-append "eval-in-repl-" repl "\\.el"))))
    (propagated-inputs (cons* eval-in-repl-package
                              (cond
                               ((procedure? inputs) (inputs))
                               ((promise? inputs) (force inputs))
                               (else inputs))))
    (description
     (format #f (G_ "This package provides an ESS-like binding to send lines
or regions to a REPL from ~a buffers.") language))))

(define-public emacs-eval-in-repl-cider
  (make-emacs-eval-in-repl "cider" #:language "Clojure"
                           #:inputs (list emacs-cider)))

(define-public emacs-eval-in-repl-elm
  (make-emacs-eval-in-repl "elm" #:inputs (list emacs-elm-mode)))

(define-public emacs-eval-in-repl-erlang
  (make-emacs-eval-in-repl "erlang" #:inputs (delay (list emacs-erlang))))

(define-public emacs-eval-in-repl-geiser
  (make-emacs-eval-in-repl "geiser" #:language "Scheme"
                           #:inputs (list emacs-geiser)))

(define-public emacs-eval-in-repl-hy
  (make-emacs-eval-in-repl "hy" #:inputs (list emacs-hy-mode)))

(define-public emacs-eval-in-repl-ielm
  (make-emacs-eval-in-repl "ielm" #:language "Emacs Lisp"))

(define-public emacs-eval-in-repl-iex
  (make-emacs-eval-in-repl
   "iex" #:language "Elixir"
   #:inputs (delay
              (list emacs-elixir-mode emacs-alchemist))))

(define-public emacs-eval-in-repl-javascript
  (make-emacs-eval-in-repl "javascript"
                           #:inputs (list emacs-js2-mode emacs-js-comint)))

(define-public emacs-eval-in-repl-lua
  (make-emacs-eval-in-repl "lua" #:inputs (list emacs-lua-mode)))

(define-public emacs-eval-in-repl-ocaml
  (make-emacs-eval-in-repl "ocaml" #:language "OCaml"
                           #:inputs (delay (list emacs-tuareg))))

(define-public emacs-eval-in-repl-prolog
  (make-emacs-eval-in-repl "prolog"))

(define-public emacs-eval-in-repl-python
  (make-emacs-eval-in-repl "python"))

(define-public emacs-eval-in-repl-racket
  (make-emacs-eval-in-repl "racket" #:inputs (list emacs-racket-mode)))

(define-public emacs-eval-in-repl-ruby
  (make-emacs-eval-in-repl "ruby" #:inputs (list emacs-inf-ruby)))

(define-public emacs-eval-in-repl-scheme
  (make-emacs-eval-in-repl "scheme"))

(define-public emacs-eval-in-repl-shell
  (make-emacs-eval-in-repl "shell"))

(define-public emacs-eval-in-repl-slime
  (make-emacs-eval-in-repl "slime" #:language "Common Lisp"
                           #:inputs (list emacs-slime)))

(define-public emacs-eval-in-repl-sly
  (make-emacs-eval-in-repl "sly" #:language "Common Lisp"
                           #:inputs (list emacs-sly)))

(define-public emacs-eval-in-repl-sml
  (make-emacs-eval-in-repl "sml" #:language "Standard ML"
                           #:inputs (list emacs-sml-mode)))

(define-public emacs-ox-pandoc
  (package
    (name "emacs-ox-pandoc")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emacsorphanage/ox-pandoc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0sh8l18lc2hngbmb1vv99xb8cp4sfy90j9cbf7b09l82jmnlqmk1"))))
    (build-system emacs-build-system)
    (inputs
     (list pandoc))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-ht
      ))
    (home-page "https://github.com/emacsorphanage/ox-pandoc")
    (synopsis "Org exporter for Pandoc")
    (description "@code{ox-pandoc} is an exporter for converting Org-mode
files to numerous other formats via Pandoc.")
    (license license:gpl3+)))

(define-public emacs-refactor
  (package
    (name "emacs-refactor")
    (version "0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wilfred/emacs-refactor")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1yky7vlv91501xb43xk19rr8mxlvrsxhawsc98jivf64nad5dqay"))))
    (build-system emacs-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-before 'check 'delete-failing-tests
                 (lambda _
                   (delete-file "test/emr-elisp-test.el"))))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-s
      emacs-popup
      emacs-list-utils
      emacs-iedit
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      (@(bost gnu packages emacs-build) emacs-undercover)
      ))
    (home-page "https://github.com/Wilfred/emacs-refactor/")
    (synopsis "Language-specific refactoring in Emacs")
    (description "Emacs Refactor (EMR) is a framework for providing
language-specific refactoring in Emacs.  It includes refactoring commands for
a variety of languages, including elisp itself.")
    (license license:gpl3+)))

(define-public emacs-org-jira
  (package
    (name "emacs-org-jira")
    (version "4.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ahungry/org-jira")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1mg7p9y4d4m6b6qkjvdz6lqby3kvvdb7qcjqgkrf75rzv0rsn1h2"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "emacs" "-Q" "--batch"
                             "-l" "jiralib.el"
                             "-l" "org-jira-sdk.el"
                             "-l" "org-jira.el"
                             "-l" "t/org-jira-t.el"
                             "-l" "t/jiralib-t.el"
                             "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-org
      emacs-request
      ))
    (home-page "https://github.com/ahungry/org-jira")
    (synopsis "Syncing between Jira and Org mode")
    (description
     "This package provides an extension to Org mode for syncing issues with
JIRA issue servers.")
    (license license:gpl3+)))

(define-public emacs-ssh-agency
  (package
    (name "emacs-ssh-agency")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/magit/ssh-agency")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1i3zmsn0w2k7p2hlzssibckm32kf05l56mkhg96x4sf06g3pwq1d"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/magit/ssh-agency")
    (synopsis "Manage @code{ssh-agent} from Emacs")
    (description
     "This package provides functions to startup @code{ssh-agent}, set the
needed environment variables in Emacs, and prompt for passphrases from within
Emacs so that pushes and pulls from @code{magit} will not require entering any
passphrase.

It can also be useful on Unix-like platforms to delay having to enter your
passphrase until the first time you push to a remote.")
    (license license:gpl3+)))

(define-public emacs-eshell-git-prompt
  (package
    (name "emacs-eshell-git-prompt")
    (version "0.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xuchunyang/eshell-git-prompt")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13b7nr0819pgzyvh0szi0zjyazgpxmsbqcz65cccyhh2pq48zb7j"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/xuchunyang/eshell-git-prompt")
    (synopsis "Themes for Emacs Shell (Eshell) prompt")
    (description
     "This package provides a variety of themes for Emacs Shell (Eshell)
prompt.")
    (license license:gpl3+)))

(define-public emacs-frames-only-mode
  ;; Latest release is from 8 years ago.
  (let ((commit "3c7d7d89398b999bac2d848c8c26d742572e8109")
        (revision "0"))
    (package
      (name "emacs-frames-only-mode")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/davidshepherd7/frames-only-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1rs01wiahqnz33x66mm4i7147jfjz75mx1q4mwjpds6yvir4mdkn"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'check 'fix-makefile
              (lambda _
                (substitute* "Makefile"
                  (("cask") "")))))
        #:test-command #~(list "make" "test-unit")))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (native-inputs
       (list
        emacs-flycheck
        emacs-magit
        emacs-validate
        ))
      (home-page "https://github.com/davidshepherd7/frames-only-mode")
      (synopsis "Use frames instead of Emacs windows")
      (description
       "This is an Emacs global minor mode to use Emacs frames instead of Emacs'
internal windowing system.  This combines particularly well with tiling window
managers such as XMonad.")
      (license license:gpl3+))))

(define-public emacs-shrink-path
  (package
    (name "emacs-shrink-path")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/bennya/shrink-path.el.git")
             (commit (string-append "v" version))))
       (sha256
        (base32
         "0kx0c4syd7k6ff9j463bib32pz4wq0rzjlg6b0yqnymlzfr1mbki"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-s
      (@(bost gnu packages emacs-build) emacs-dash)
      (@(bost gnu packages emacs-build) emacs-f)
      ))
    (native-inputs
     (list
      emacs-buttercup
      ))
    (home-page "https://gitlab.com/bennya/shrink-path.el")
    (synopsis "Fish-style path truncation in emacs-lisp")
    (description "This package provides utility functions that allow for
Fish-style truncated directories in eshell and various modelines.")
    (license license:gpl3+)))

(define-public emacs-eshell-toggle
  (let ((commit "ddfbe0a693497c4d4bc5494a19970ba4f6ab9033")
        (revision "1"))
    (package
      (name "emacs-eshell-toggle")
      (version (git-version "0.10.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/4DA/eshell-toggle")
               (commit commit)))
         (sha256
          (base32
           "0xqrp8pwbmfxjdqipgpw5nw633mvhjjjm3k3j9sh9xdpmw05hhws"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/4DA/eshell-toggle")
      (synopsis "Show and hide an @code{eshell} instance")
      (description "This package toggles an @code{eshell} instance for the
current buffer.")
      (license license:gpl3+))))

(define-public emacs-rime
  (package
    (name "emacs-rime")
    (version "1.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DogLooksGood/emacs-rime")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z0iwsqr92g8ykxb51gkawwxwzx0faw0027zgdi7c38ngjqld237"))))
    (build-system emacs-build-system)
    (arguments
     '(#:include (cons "\\.so$" %default-include)
       #:test-command (list "emacs" "--batch" "-l" "test.el")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-rime-data-path
           (lambda* (#:key inputs #:allow-other-keys)
             (make-file-writable "rime.el")
             (emacs-substitute-variables "rime.el"
               ("rime-share-data-dir"
                (search-input-directory inputs
                                        "share/rime-data")))))
         (add-before 'install 'build-emacs-module
           (lambda _
             (invoke "make" "lib")))
         (add-before 'check 'pre-check
           (lambda _
             (setenv "HOME" (getenv "TMPDIR"))
             (mkdir-p (string-append (getenv "HOME")
                                     "/.emacs.d/rime")))))))
    (inputs
     (list librime rime-data))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-popup
      emacs-posframe
      ))
    (home-page "https://github.com/DogLooksGood/emacs-rime")
    (synopsis "Rime input method in Emacs")
    (description
     "Rime is an Emacs input method built upon Rime input method engine.")
    (license license:gpl3+)))

(define-public emacs-ivy-omni-org
  (let ((commit "5460a9fc061a4a5ae8372dc8df966ced94abab58")
        (revision "1"))
    (package
      (name "emacs-ivy-omni-org")
      (version (git-version "0.2.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/akirak/ivy-omni-org")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1np1f51hc3phkl5w02a9a79gl38ra2d535i784fn4pqaasvm0rq8"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))
      (propagated-inputs
       (list
        emacs-ivy
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (synopsis "Browse anything in Org mode")
      (description "This package allows Org items to be accessed via the Ivy
interface.")
      (home-page "https://github.com/akirak/ivy-omni-org")
      (license license:gpl3+))))

(define-public emacs-esh-help
  (let ((commit "417673ed18a983930a66a6692dbfb288a995cb80")
        (revision "1"))
    (package
      (name "emacs-esh-help")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tom-tan/esh-help")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0x7d51a6ljl014zy7mi27vzcqqbcwg9z4drq29fr2ajk82mqhlgd"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (synopsis "Help functions for Eshell")
      (description "This package provides a @code{run-help} function inspired
by @code{zsh} as well as @code{eldoc} support.")
      (home-page "https://github.com/tom-tan/esh-help")
      (license license:gpl3+))))

(define-public emacs-metal-mercury-mode
  (let ((commit "99e2d8fb7177cae3bfa2dec2910fc28216d5f5a8")
        (revision "1")
        (version "0.0.0"))
    (package
      (name "emacs-metal-mercury-mode")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ahungry/metal-mercury-mode")
               (commit commit)))
         (sha256
          (base32
           "0iil5k3rgifz2vqwsy12rbv5rzyvidq4sgwazsb2hzys8xynmfn5"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (synopsis "Major mode for editing Mercury files")
      (description
       "Major mode for editing Mercury files.  This is a rewrite of the original
mercury-mode provided by Emacs as a wrapper around prolog-mode.")
      (home-page "https://github.com/ahungry/metal-mercury-mode")
      (license license:gpl3+))))

(define-public emacs-org-roam
  (package
    (name "emacs-org-roam")
    (version "2.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/org-roam/org-roam")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00ijpvsghak5d9p703gnyaksfbniwj062qids0m8xkvvxbzqsdda"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "ert-runner" "tests")
      #:phases
      #~(modify-phases %standard-phases
          ;; Move the extensions source files to the top level, which
          ;; is included in the EMACSLOADPATH.
          (add-after 'unpack 'move-source-files
            (lambda _
              (let ((el-files (find-files "./extensions" ".*\\.el$")))
                (for-each (lambda (f)
                            (rename-file f (basename f)))
                          el-files))))
          (add-after 'move-source-files 'patch-exec-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (make-file-writable "org-roam-graph.el")
              (emacs-substitute-variables "org-roam-graph.el"
                ("org-roam-graph-executable"
                 (search-input-file inputs "/bin/dot")))))
          (add-after 'install 'install-image
            (lambda _
              (install-file "doc/images/org-ref-citelink.png"
                            (string-append #$output "/share/info/images"))))
          (add-after 'unpack 'make-info
            (lambda _
              (invoke "make" "-C" "doc" "info")
              (copy-file "doc/org-roam.info" "org-roam.info"))))))
    (inputs
     (list
      graphviz
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      texinfo
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-emacsql
      emacs-magit
      ))
    (home-page "https://github.com/org-roam/org-roam/")
    (synopsis "Non-hierarchical note-taking with Org mode")
    (description "Emacs Org Roam is a solution for taking non-hierarchical
notes with Org mode.  Notes are captured without hierarchy and are connected
by tags.  Notes can be found and created quickly.  Org Roam should also work
as a plug-and-play solution for anyone already using Org mode for their
personal wiki.")
    (license license:gpl3+)))

(define-public emacs-org-node
  (package
    (name "emacs-org-node")
    (version "2.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meedstrom/org-node/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "03600cxy8dr2sd49d07v61izxpvdxgfyiangjzkbma4qdpbkmjgh"))))
    (build-system emacs-build-system)
    (arguments
     '(#:tests? #f ; fails
       #:test-command '("./makem.sh" "tests")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'dont-git
           (lambda _
             (substitute* "makem.sh"
               (("^cd.*\"")
                "")))))))
    (propagated-inputs
     (list
      emacs-el-job
      emacs-llama
      emacs-magit
      ))
    ;; tests
    (native-inputs
     (list
      emacs-buttercup
      (@(bost gnu packages emacs-build) emacs-dash)
      util-linux
      grep
      sed
      ))
    (home-page "https://github.com/meedstrom/org-node/")
    (synopsis "Non-hierarchical note-taking with Org-mode, faster than
org-roam")
    (description "This package provides a notetaking system like Roam,
using org mode; faster than org-roam.")
    (license license:gpl3+)))

(define-public emacs-org-node-3
  (package
    (name "emacs-org-node")
    (version "3.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meedstrom/org-node/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1cxzdyiqan4881m7fpzxym1gkplqlyagl3bj1pwa7a5bswhld40y"))))
    (build-system emacs-build-system)
    (arguments
     '(#:tests? #f ; fails
       #:test-command '("./makem.sh" "tests")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'dont-git
           (lambda _
             (substitute* "makem.sh"
               (("^cd.*\"")
                "")))))))
    (propagated-inputs
     (list
      emacs-llama
      emacs-magit
      emacs-org-mem
      ))
    ;; tests
    (native-inputs
     (list
      emacs-buttercup
      (@(bost gnu packages emacs-build) emacs-dash)
      util-linux
      grep
      sed
      ))
    (home-page "https://github.com/meedstrom/org-node/")
    (synopsis "Non-hierarchical note-taking with Org-mode, faster than
org-roam")
    (description "This package provides a notetaking system like Roam,
using org mode; faster than org-roam.  This version of org-node has
different configuration options to org-node 2 so you DO have to set
it up again.")
    (license license:gpl3+)))

(define-public emacs-plantuml-mode
  (package
    (name "emacs-plantuml-mode")
    (version "1.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/skuro/plantuml-mode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yp41d2dmf3sx7qnl5x0zdjcr9y71b2wwc9m0q31v22xqn938ipc"))))
    (arguments
     (list
      #:tests? #f  ; Unclear why tests fail.
      #:test-command #~(list "ert-runner")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-local-plantuml
            (lambda* (#:key inputs #:allow-other-keys)
              (symlink (search-input-file inputs "/bin/plantuml")
                       "bin/plantuml")
              (let ((file "plantuml-mode.el"))
                (chmod file #o644)
                (emacs-substitute-variables file
                  ("plantuml-jar-path"
                   (search-input-file inputs "/share/java/plantuml.jar"))
                  ("plantuml-executable-path"
                   (search-input-file inputs "/bin/plantuml"))
                  ("plantuml-server-url" 'nil)
                  ("plantuml-default-exec-mode" ''executable))
                (emacs-batch-edit-file file
                  `(progn (progn
                           (goto-char (point-min))
                           (re-search-forward "(defun plantuml-download-jar")
                           (beginning-of-line)
                           (kill-sexp))
                          (basic-save-buffer)))))))))
    (inputs
     (list
      plantuml
      ))
    (native-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-ert-runner)
      icedtea
      ))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (build-system emacs-build-system)
    (home-page "https://github.com/skuro/plantuml-mode")
    (synopsis "Major mode for editing PlantUML sources")
    (description "This package provides a major mode for editing PlantUML
sources.  It features syntax highlighting, autocompletion, preview of buffer
or region and use of locally installed binaries.")
    (license license:gpl3+)))

(define-public emacs-csound-mode
  ;; XXX: Upstream did not tag last release.  Using the commit matching
  ;; version bump.
  (let ((commit "44c49e5a9262ede4b4477bafb13b42b1ba047b9c"))
    (package
      (name "emacs-csound-mode")
      (version "0.2.3")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/hlolli/csound-mode")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0kfhca1n0iv1400jf4ggjbarg7ry8ccd5bs7cf2brjdiqp74cvwb"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'disable-breaking-compilation
              (lambda _
                (let ((file "csound-font-lock.el"))
                  (make-file-writable file)
                  (emacs-batch-disable-compilation file)))))))
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-highlight
        emacs-multi
        emacs-shut-up
        ))
      (home-page "https://github.com/hlolli/csound-mode")
      (synopsis "Emacs major mode for coding in CSound")
      (description "This package provides both a basic major mode for editing
CSound files, as well as a REPL for fast feedback when composing and
sound-designing using CSound.")
      (license license:gpl3+))))

(define-public emacs-html-to-hiccup
  ;; Package has no release.  Version is extracted from "Version:" keyword in
  ;; main file.
  (let ((commit "50a52e2b0d13d865187acdf775b8203d5003f2f1")
        (revision "0"))
    (package
      (name "emacs-html-to-hiccup")
      (version (git-version "1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/plexus/html-to-hiccup")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1qi092mw2n08v6yr0j6hlpx0pnlcnhxjqbsrlw9pn4yin6zk91yp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-s
        ))
      (home-page "https://github.com/plexus/html-to-hiccup")
      (synopsis "Turn HTML into Hiccup syntax")
      (description
       "This is an Emacs package that turns HTML into Hiccup syntax
which is a popular notation to use when doing Clojure/ClojureScript
web development.")
      ;; There is a conflict between the repository official LICENSE
      ;; file and the header of the main elisp file which indicates
      ;; that it is licensed under the GPL version 3 or later.
      (license (list license:mpl2.0 license:gpl3+)))))

(define-public emacs-spaceleader
  (let ((commit "5d88d120494623d6777d464ec40ff4bb7d6b1d57")
        (revision "1"))
    (package
      (name "emacs-spaceleader")
      (version (git-version "0.0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mohkale/spaceleader")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1prnjf7zs49z5a8qwhn8d0qnp60b3l0xhjkqg6v237acvk2axixr"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-general
        emacs-which-key
        ;; emacs-use-package
        emacs-bind-map
        ))
      (home-page "https://github.com/mohkale/spaceleader")
      (synopsis "Emacs leader key implementation from Spacemacs")
      (description
       "@code{emacs-spaceleader} replicates Spacemacs' leader key features,
without requiring all of Spacemacs.  The @code{<Leader>} key, inspired by Vim,
provides an easy way to bind keys under a configurable prefix key.")
      (license license:gpl3+))))

(define-public emacs-seriestracker
  (package
    (name "emacs-seriestracker")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MaximeWack/seriesTracker")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gfm7ss3bwj3m2y1mb4sdmsv85mjnpkgmzasa3yfj69zbq46glhn"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://github.com/MaximeWack/seriesTracker")
    (synopsis "Keep track of the TV shows you watch from Emacs")
    (description
     "This package provides a major mode for tracking TV shows.
TV shows data (episode list, release dates, etc.) are sourced from
the free database hosted at @url{episodate.com}.  The mode presents an
outlined list of tracked shows, their episodes and release dates, and
enables the user to see when new episodes for their favorite shows get
released, and track their progress in watching a series.")
    (license license:gpl3+)))

(define-public emacs-ein
  ;; XXX: Upstream doesn't make any release, and didn't set any version.
  (let ((commit "998ba22660be2035cd23bed1555e47748c4da8a2"))
    (package
      (name "emacs-ein")
      (version "20230826")
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/millejoh/emacs-ipython-notebook")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "09qbswzz6kbxc74dmdgagrk5wgbm89sabf0bfy76j4qlcg6550mx"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command
        #~(list "emacs" "-Q" "--batch"
                "-L" "test"
                "--load" "test/testein-loader.el")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'move-source-files
              (lambda _
                (let ((el-files (find-files "./lisp" ".*\\.el$")))
                  (for-each (lambda (f)
                              (rename-file f (basename f)))
                            el-files)))))))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-mocker
        ))
      (propagated-inputs
       (list
        emacs-anaphora
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-deferred
        emacs-polymode
        emacs-request
        emacs-websocket
        emacs-with-editor
        ))
      (home-page "https://github.com/millejoh/emacs-ipython-notebook")
      (synopsis "Jupyter client for all languages")
      (description
       "The Emacs IPython Notebook (EIN) package provides a Jupyter Notebook
client and integrated REPL (like SLIME) in Emacs.  EIN improves notebook
editing by allowing you to use Emacs.  It also expose IPython features such as
code evaluation, object inspection and code completion.  These features can be
accessed anywhere in Emacs and improve Python code editing and reading in
general in Emacs.")
      (license license:gpl3+))))

(define-public emacs-global-tags
  (let ((commit "06db25d91cc8bfb5e24e02adc04de1226c7e742d")
        (revision "0"))
    (package
      (name "emacs-global-tags")
      (version (git-version "0.7" revision commit))
      (home-page "https://git.launchpad.net/global-tags.el/")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url home-page)
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1q30cbqq0h1gfwlcbnx9s930li7w7a0y8sx2ivbvvyyc2j5gsk4j"))
                (modules '((guix build utils)))
                (snippet
                 #~(begin
                     (substitute* "global-tags.el"
                       (("\\(require 'cl-lib\\)" all)
                        (string-append all "(require 'eieio)")))))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))    ; XXX: 18/24 test failures
      (propagated-inputs
       (list
        emacs-async
        emacs-ht
        ))
      (native-inputs
       (list
        emacs-buttercup
        (@(bost gnu packages emacs-build) emacs-f)
        ))
      (synopsis "Testeable Emacs Lisp API that wraps around GNU Global")
      (description "This package provides a testeable Emacs Lisp API that
wraps GNU Global calls and integration to editor using this API with
project.el and xref.el.")
      (license license:gpl3+))))

(define-public emacs-pyimport
  (let ((commit "a6f63cf7ed93f0c0f7c207e6595813966f8852b9")
        (revision "0"))
    (package
      (name "emacs-pyimport")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/Wilfred/pyimport")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1q5gqhvh4zq5dy8vns694warcz48j1hdnxg16sjck4gsi9xivbvs"))))
      (build-system emacs-build-system)
      (inputs
        (list
         python-pyflakes
         ))
      (propagated-inputs
        (list
         (@(bost gnu packages emacs-build) emacs-dash)
         emacs-s
         emacs-shut-up
         ))
      (arguments
        (list #:phases
              #~(modify-phases %standard-phases
                  (add-after 'unpack 'patch-pyflakes-executable
                    (lambda* (#:key inputs #:allow-other-keys)
                      (let ((pyflakes (search-input-file inputs "/bin/pyflakes")))
                        (make-file-writable "pyimport.el")
                        (substitute* "pyimport.el"
                          (("\"pyflakes")
                           (string-append "\"" pyflakes)))))))))
      (home-page "https://github.com/Wilfred/pyimport")
      (synopsis "Manage Python imports from Emacs")
      (description
"@code{emacs-pyimport} manages python imports from Emacs via @code{python-pyflakes}.")
      (license license:gpl3+)))) ; License is in pyimport.el

(define-public emacs-consult-lsp
  (package
    (name "emacs-consult-lsp")
    (version "2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gagbo/consult-lsp")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1y0dgpgvw90phqi44dyijnnz3z0rys4bkmbnrkkx2fbd3pyvqs1i"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      emacs-consult
      emacs-lsp-mode
      (@(bost gnu packages emacs-build) emacs-f))
     )
    (home-page "https://github.com/gagbo/consult-lsp/")
    (synopsis "LSP mode and Consult helping each other")
    (description
"@code{emacs-consult-lsp} provides helpers for interactively selecting LSP
workspace diagnostics, symbols, and file symbols from @code{emacs-lsp-mode}
by leveraging @code{emacs-consult} APIs.")
    (license license:expat)))

(define-public emacs-org-wild-notifier
  (package
    (name "emacs-org-wild-notifier")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/akhramov/org-wild-notifier.el")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "00xssqg0mvh5ma2053719bcchbrl7mmj8wzhbrjk34cl4lx9p9fb"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-alert
      emacs-async
      ))
    (license license:gpl3+)
    (home-page "https://github.com/akhramov/org-wild-notifier.el")
    (synopsis "Customizable Org Agenda notifications")
    (description
     "This package provides notification functions for Org Agenda.")))

(define-public emacs-mustache
  (package
    (name "emacs-mustache")
    (version "0.23")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Wilfred/mustache.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n2ymd92qpvsby6ms0l3kjhdzzc47rri2aiscc6bs07hm4mjpr9q"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command
           #~(list "emacs" "-Q" "-batch" "-L" "." "-l" "mustache-tests"
                   "-f" "ert-run-tests-batch-and-exit")))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-ht
      emacs-s
      ))
    (home-page "https://github.com/Wilfred/mustache.el")
    (synopsis "Mustache templating library for Emacs")
    (description "Mustache templating library for Emacs, mustache is
a simple web template system, which is described as a logic-less system
because it lacks any explicit control flow statements, both looping and
conditional evaluation can be achieved using section tags processing lists
and lambdas.")
    (license license:gpl3+)))

(define-public emacs-org2web
  (package
    (name "emacs-org2web")
    (version "0.9.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tumashu/org2web")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "103fzmadgd93x1y0c6xsdjx70z0jkwpvj0xnkybdancxz4ba8p9l"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'fix-byte-compilation
            ;; XXX: The fix below was integrated upstream and can be removed
            ;; in next release.
            (lambda _
              (substitute* "org2web-el2org.el"
                (("(define-obsolete-function-alias .*)\\)" _ lead)
                 (string-append lead " \"0.1\")"))))))))
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-el2org
      emacs-ht
      emacs-mustache
      emacs-simple-httpd
      ))
    (home-page "https://github.com/tumashu/org2web")
    (synopsis "Static site generator based on Org mode")
    (description "Org2web is a static site generator based on Org mode, which
code derived from Kelvin H's Org page.")
    (license license:gpl2+)))

(define-public emacs-emojify
  (package
    (name "emacs-emojify")
    (version "1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/iqbalansari/emacs-emojify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1fqnj5x7ivjkm5y927dqqnm85q5hzczlb0hrfpjalrhasa6ijsrm"))))
    (build-system emacs-build-system)
    (arguments
     `(#:include (cons "^data/" %default-include)))
    (propagated-inputs
     (list
      emacs-ht
      ))
    (home-page "https://github.com/iqbalansari/emacs-emojify")
    (synopsis "Display emojis in Emacs")
    (description "This package displays emojis in Emacs similar to how Github,
Slack, and other websites do.  It can display plain ASCII like @code{:)} as
well as Github-style emojis like @code{:smile:}.  It provides a minor mode
@code{emojify-mode} to enable the display of emojis in a buffer.")
    (license license:gpl3+)))

(define-public emacs-clj-refactor
  (let ((commit "362cb46bf808dc42d2aaf022afe93048439680c4")
        (revision "0"))
    (package
      (name "emacs-clj-refactor")
      (version (git-version "3.12.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/clojure-emacs/clj-refactor.el.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "09s9jav8xsgxqj5lkdl9nkbb0bbgz96qjpp7az197wckxsqrs26x"))))
      (build-system emacs-build-system)
      (arguments
       (list #:test-command #~(list "buttercup" "-L" "." "-L" "test")
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'enable-lexical-binding
                   (lambda _
                     (emacs-batch-edit-file "tests/unit-test.el"
                       '(progn
                         (add-file-local-variable-prop-line 'lexical-binding t)
                         (basic-save-buffer))))))))
      (propagated-inputs
       (list
        emacs-cider
        emacs-clojure-mode
        emacs-hydra
        emacs-inflections
        emacs-multiple-cursors
        emacs-paredit
        emacs-parseedn
        emacs-yasnippet
        ))
      (native-inputs (list emacs-buttercup))
      (home-page "https://github.com/clojure-emacs/clj-refactor.el")
      (synopsis "Powerful refactoring functionality for Clojure projects")
      (description "This Emacs package complements the refactoring functionality
you'd find in Clojure mode and CIDER.")
      (license license:gpl3+))))

(define-public emacs-flycheck-package
  (let ((commit "a52e4e95f3151898b36739dfdb4a98b368626fc0")
        (revision "0"))
    (package
      (name "emacs-flycheck-package")
      (version (git-version "0.14" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/purcell/flycheck-package.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0mhm5l8x3q16vkzmdncibc3axin9r0gpykpq4ibw4r4gldgpq17q"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))      ; no tests
      (propagated-inputs
       (list
        emacs-flycheck
        emacs-package-lint
        ))
      (home-page "https://github.com/purcell/flycheck-package")
      (synopsis "Flycheck checker for elisp package metadata")
      (description
       "This library provides a flycheck checker for the metadata in Emacs Lisp
files which are intended to be packages.")
      (license license:gpl3+))))

(define-public emacs-attrap
  (let ((commit "1ff353ea82beb4a338cc3979b62d69701d6bc877")
        (revision "0"))
    (package
      (name "emacs-attrap")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/jyp/attrap.git")
                (commit commit)))
         (sha256
          (base32 "14ppmy0cd4pwd0q60v6g5b008x4bm1rl6ikrr9llvhjqvwmjpfn6"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        (@(bost gnu packages emacs-build) emacs-f)
        emacs-flycheck
        emacs-s
        ))
      (home-page "https://github.com/jyp/attrap")
      (synopsis "Fix coding error at point")
      (description "This package provides a command to fix the Flycheck error
at point.")
      (license license:gpl3+))))

(define-public emacs-flycheck-clj-kondo
  (let ((commit "e38c67ba9db1ea1cbe1b61ab39b506c05efdcdbf")
        (revision "1"))
    (package
      (name "emacs-flycheck-clj-kondo")
      (version (git-version "0.0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/borkdude/flycheck-clj-kondo.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1pxlb8axgmc8cw4id40z576kd041qb1irq8rkjn6xbda585ix58f"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-flycheck
        ))
      (home-page "https://github.com/borkdude/flycheck-clj-kondo")
      (synopsis "Add Clj-kondo linter to Flycheck")
      (description
       "This package integrates Clj-kondo with Emacs via Flycheck.")
      (license license:gpl3+))))

(define-public emacs-gruvbox-theme
  (let ((commit "6cbf80b6cde3c2390502dc94a911ab7378495249")
        (revision "0"))
    (package
      (name "emacs-gruvbox-theme")
      (version (git-version "1.30.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/greduan/emacs-theme-gruvbox.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0w86zp5hvj7s8irb2y4rcggm8m5znljlv53vqhwzfv87piyqbl61"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-autothemer
        ))
      (home-page "https://github.com/greduan/emacs-theme-gruvbox")
      (synopsis "Gruvbox is a retro groove color scheme ported from Vim")
      (description
       "Gruvbox is heavily inspired by badwolf, jellybeans and solarized.

Designed as a bright theme with pastel 'retro groove' colors and light/dark
mode switching in the way of solarized.  The main focus when developing gruvbox
is to keep colors easily distinguishable, contrast enough and still pleasant
for the eyes.")
      (license license:expat))))

(define-public emacs-chocolate-theme
  (let ((commit "ccc05f7ad96d3d1332727689bf6250443adc7ec0")
        (revision "0"))
    (package
      (name "emacs-chocolate-theme")
      (version (git-version "0.2.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url
                       "https://github.com/SavchenkoValeriy/emacs-chocolate-theme.git")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1d8a9jwv9y0sncw24k840c8yyrig30f2d6q2zqlc09f05yzq9p9p"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-autothemer
        ))
      (home-page "https://github.com/SavchenkoValeriy/emacs-chocolate-theme")
      (synopsis "Dark chocolatey theme for Emacs")
      (description
       "Chocolate theme is a dark, chocolatey, vibrant and subtle theme for
Emacs.")
      (license license:gpl3))))

(define-public emacs-boon
  (let ((commit "b562e2dbcb089e37ff5a1276f6a5663af6dc15e1")
        (revision "0"))
    (package
      (name "emacs-boon")
      (version (git-version "1.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/jyp/boon.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0qyxh8p9nc28gp1r76mazs383cg5mfhyxkcxm0ssfxqv8svvyrcp"))))
      (build-system emacs-build-system)
      (arguments (list #:tests? #f))      ; tests require networking
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-expand-region
        emacs-multiple-cursors
        emacs-powerline
        emacs-spaceline
        ))
      (home-page "https://github.com/jyp/boon")
      (synopsis "Ergonomic command mode for Emacs")
      (description "Boon is a complete package for modal editing with a focus on
ergonomics and modularity.  Spacial allocation of keys comes first, mnemonics
second.  Most common operations are mapped to the home row, common editing
commands are bound to keys reachable with the left hand and movement keys are
reached with the right hand.")
      (license license:gpl3+))))

(define-public emacs-bui
  (package
    (name "emacs-bui")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://notabug.org/alezost/emacs-bui.git")
                     (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0sszdl4kvqbihdh8d7mybpp0d8yw2p3gyiipjcxz9xhvvmw3ww4x"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      ))
    (home-page "https://notabug.org/alezost/emacs-bui")
    (synopsis "Buffer interface library for Emacs")
    (description
     "BUI (Buffer User Interface) is a library for making @code{list} and
@code{info} interfaces to display an arbitrary data of the same
type, for example: packages, buffers, files, etc.")
    (license license:gpl3+)))

(define-public emacs-guix
  (let ((commit "66b935020d93cdbbff0b0ed3b1d2195724a46821")
        (revision "8"))
    (package
      (name "emacs-guix")
      (version (git-version "0.5.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://codeberg.org/guix/emacs-guix.git")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1pm1nyy1r704wjg4hfdrrxlf1mn327wk0vkghwy8wsp4f84j5j7d"))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:modules '((guix build gnu-build-system)
                    ((guix build emacs-build-system) #:prefix emacs:)
                    (guix build utils))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils))
        #:tests? #f    ; no tests
        #:configure-flags
        #~(list (string-append "--with-lispdir="
                               (emacs:elpa-directory #$output)))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'expand-load-path
              (lambda _
                ((assoc-ref emacs:%standard-phases 'expand-load-path)
                 #:prepend-source? #f))))))
      (native-inputs
       (list autoconf automake emacs-minimal pkg-config texinfo))
      (inputs
       (list (lookup-package-input guix "guile")
             guix))
      (propagated-inputs
       (list
        emacs-bui
        (@(bost gnu packages emacs-build) emacs-dash)
        emacs-edit-indirect
        emacs-geiser
        emacs-geiser-guile
        emacs-magit-popup
        guile-gcrypt
        ))
      (home-page "https://guix.gnu.org")
      (synopsis "Emacs interface for GNU Guix")
      (description
       "Emacs-Guix provides a visual interface, tools and features for the GNU
Guix package manager.  Particularly, it allows you to do various package
management tasks from Emacs.  To begin with, run @code{M-x guix-about} or
@code{M-x guix-help} command.")
      (license license:gpl3+))))

(define-public emacs-evil-cleverparens
  (let ((commit "8c45879d49bfa6d4e414b6c1df700a4a51cbb869")
        (revision "1"))
    (package
      (name "emacs-evil-cleverparens")
      (version (git-version "2017-07-17" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/luxbock/evil-cleverparens")
                      (commit commit)))
                (sha256 (base32 "0lhnybpnk4n2yhlcnj9zxn0vi5hpjfaqfhvyfy7ckzz74g8v7iyw"))
                (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        emacs-paredit
        emacs-smartparens
        ))
      (home-page "https://github.com/luxbock/evil-cleverparens")
      (synopsis "Emacs modal editing optimized for editing Lisp")
      (description "@code{evil-cleverparens} remaps Evil keybindings to allow
modal editing with screwing up the structure of Lisp code.  Alternatives for
verb commands which would are normally destructive (such as deletion) are
provided.  Those alternative commands are and bound by default to their
corresponding Evil keys.")
      (license license:expat))))

(define-public emacs-cfrs
  (package
    (name "emacs-cfrs")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Alexander-Miller/cfrs")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vf5zm82sx3m1yvq73km8ajapv6rnz41b1jrsif7kh0ijh9vk3qi"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list
      (@(bost gnu packages emacs-build) emacs-dash)
      emacs-posframe
      emacs-s
      ))
    (home-page "https://github.com/Alexander-Miller/cfrs")
    (synopsis "Child Frame Read String")
    (description
     "CFRS is a simple alternative to @code{read-string} that allows reading
input via a small child-frame spawned at the position of the cursor.")
    (license license:gpl3+)))

(define-public emacs-password-store
  (package
    (name "emacs-password-store")
    ;; The emacs package version does not match the password-store version,
    ;; even though it is part of the same repository.  When updating, look at
    ;; the version declared in password-store.el.
    (version "2.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.zx2c4.com/password-store")
             (commit "b5e965a838bb68c1227caa2cdd874ba496f10149")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0hb5zm7hdp7vmqk39a9s1iyncx4swmwfq30dnnzkjk2y08lnb7ac"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:test-command #~(list "make" "test")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'extract-el-file
            (lambda _
              (copy-file "contrib/emacs/password-store.el"
                         "password-store.el")
              (for-each delete-file-recursively
                        '("contrib" "man" "src" "tests"))))
          (add-after 'extract-el-file 'patch-executables
            (lambda* (#:key inputs #:allow-other-keys)
              (emacs-substitute-variables "password-store.el"
                ("password-store-executable"
                 (search-input-file inputs "/bin/pass"))))))))
    (inputs
     (list
      password-store
      ))
    (propagated-inputs
     (list
      emacs-with-editor
      ))
    (home-page "https://git.zx2c4.com/password-store/tree/contrib/emacs")
    (synopsis "Password store (pass) support for Emacs")
    (description
     "This package provides functions for working with pass (\"the
    standard Unix password manager\").")
    (license license:gpl3+)))

(define-public emacs-color-identifiers-mode
  (let ((commit "a26d00d898e0a3295cb7da9323046397223ea1fe")
        (revision "0"))
    (package
      (name "emacs-color-identifiers-mode")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/ankurdave/color-identifiers-mode")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1kky827f922ziiwasrfnv97vqdf62fp9yml36x1fjsm2h6qw0c8v"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-dash)
        ))
      (home-page "https://github.com/ankurdave/color-identifiers-mode")
      (synopsis "Minor mode for coloring identifiers based on their names")
      (description
       "This package provides an Emacs minor mode to highlight each source
code identifier uniquely based on its name.")
      (license license:gpl3+))))

(define-public emacs-yasnippet
  (let ((commit "c1e6ff23e9af16b856c88dfaab9d3ad7b746ad37")
        (revision "0"))
    (package
      (name "emacs-yasnippet")
      ;; Missing Git tags, version bumped in package file.
      (version (git-version "0.14.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/joaotavora/yasnippet.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "08kmhncvgprha73654p969rr72rhp0d1bn4jj56vpmg6hnw1jy0r"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command
        #~(list
           "emacs" "--batch"
           "-l" "yasnippet-tests.el"
           ;; XXX: one test is broken…
           "--eval"
           "(ert-run-tests-batch-and-exit
             '(not yas-org-native-tab-in-source-block-emacs-lisp))")
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            ;; Set HOME, otherwise test-rebindings fails.
            (add-before 'check 'set-home
              (lambda _
                (setenv "HOME" (getcwd))))
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "yasnippet")
                (bst:write-pkg-file "yasnippet-debug")
                )))))
      (home-page "https://github.com/joaotavora/yasnippet")
      (synopsis "Yet another snippet extension for Emacs")
      (description "YASnippet is a template system for Emacs.  It allows you to
type an abbreviation and automatically expand it into function templates.")
      (license license:gpl3+))))

(define-public emacs-haskell-snippets
  ;; The commit below is 7 commits ahead of release, and includes a build fix.
  ;; And also a fix in one snippet.
  (let ((commit "1c29c4a68ce89848b8d371c6510d1de3b586c8b3"))
    (package
      (name "emacs-haskell-snippets")
      (version (git-version "0.1.0" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/haskell/haskell-snippets")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1lwnggarmavyf164cfzbzzkq9ffahhd3bz7gw644czs49sndcawf"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'install 'install-snippets
              (lambda* (#:key outputs #:allow-other-keys)
                (let ((snippets
                       (string-append
                        (elpa-directory (assoc-ref outputs "out"))
                        "/snippets/haskell-mode")))
                  (mkdir-p snippets)
                  (copy-recursively "snippets/haskell-mode" snippets)))))))
      (propagated-inputs
       (list
        emacs-yasnippet
        ))
      (home-page "https://github.com/haskell/haskell-snippets")
      (synopsis "Official collection of YASnippet Haskell snippets for Emacs")
      (description "Haskell-Snippets is a collection of YASnippet Haskell
snippets for Emacs.")
      (license license:expat))))

(define-public emacs-company-auctex
  (let ((commit "48c42c58ce2f0e693301b0cb2d085055410c1b25")
        (revision "1"))
    (package
      (name "emacs-company-auctex")
      (version (git-version "0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/alexeyr/company-auctex")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "10qn7frn5wcmrlci3v6iliqzj7r9dls87h9zp3xkgrgn4bqprfp8"))))
      (build-system emacs-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'build 'set-home
             (lambda _ (setenv "HOME" "/tmp"))))))
      (propagated-inputs
       (list
        emacs-auctex
        emacs-company
        emacs-yasnippet
        ))
      (home-page "https://github.com/alexeyr/company-auctex/")
      (synopsis "Completion for @code{AUCTeX}")
      (description
       "This package provides a group of backends permitting auto-completion
for @code{AUCTeX}.")
      (license license:gpl3+))))

(define-public emacs-clojure-snippets
  ;; Use latest commit (2018) since latest tagged release is too old and is
  ;; missing important changes.
  (let ((version "1.0.1")
        (revision "0")
        (commit "6068dca90467a0f4ebc2cd39338a173d6f5ddc04"))
    (package
      (name "emacs-clojure-snippets")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mpenet/clojure-snippets")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vvadcydpsz4b17dlm1jd4fbddzfqibh3mlzv3k4gvp67vv10cqy"))))
      (build-system emacs-build-system)
      (arguments
       `(#:include (cons* "^.*\\/" %default-include)))
      (propagated-inputs
       (list
        emacs-yasnippet
        ))
      (home-page "https://github.com/mpenet/clojure-snippets")
      (synopsis "Yasnippets for Clojure")
      (description
       "This package provides Yasnippets snippets for Clojure.")
      (license license:gpl3+))))

(define-public emacs-auto-yasnippet
  (let ((commit "6a9e406d0d7f9dfd6dff7647f358cb05a0b1637e")
        (revision "3"))
    (package
      (name "emacs-auto-yasnippet")
      (version (git-version "0.3.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/abo-abo/auto-yasnippet")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0ifzbwnm2axb8kmfp3jvg05wq02j121iwp2m64pi70c7mza0i886"))))
      (build-system emacs-build-system)
      (arguments
       '(#:test-command '("make" "test")))
      (propagated-inputs
       (list
        emacs-yasnippet
        ))
      (home-page "https://github.com/abo-abo/auto-yasnippet/")
      (synopsis "Quickly create disposable yasnippets")
      (description "This package provides a hybrid of keyboard macros and
yasnippet.  You create the snippet on the go, usually to be used just in the
one place.  It's fast, because you're not leaving the current buffer, and all
you do is enter the code you'd enter anyway, just placing ~ where you'd like
yasnippet fields and mirrors to be.")
      (license license:gpl3+))))

(define-public emacs-evil-tex
  (package
    (name "emacs-evil-tex")
    (version "1.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/iyefrat/evil-tex")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wrx8ihimn1sx3vzzfppcwv0yfh3x95jrkxqvzj0ykckipm3zk0b"))))
    (build-system emacs-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-home
           (lambda _ (setenv "HOME" "/tmp"))))))
    (propagated-inputs
     (list
      emacs-auctex
      emacs-evil
      ))
    (home-page "https://github.com/iyefrat/evil-tex")
    (synopsis "Evil oriented additions for editing LaTeX")
    (description "This package is a toolbox for LaTeX editing with Evil.  It
provides many text objects fully utilizing @code{evil-surround}, some useful
movements, and keymaps for quickly entering environments or
@code{cdlatex}-like accents.")
    (license license:gpl3+)))

(define-public emacs-drag-stuff
  (package
    (name "emacs-drag-stuff")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rejeep/drag-stuff")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jrr59iazih3imkl9ja1lbni9v3xv6b8gmqs015g2mxhlql35jka"))))
    (build-system emacs-build-system)
    (arguments (list #:test-command
                     #~(list "emacs" "-l" "ecukes"
                             "--batch" "--eval"
                             (string-append
                              "(let ((ecukes-exclude-tags"
                              "'(\"only-in-emacs-23\" \"not-in-emacs-24.5\")))"
                              "(ecukes))"))))
    (native-inputs
     (list
      emacs-ecukes
      emacs-evil
      ))
    (home-page "https://github.com/rejeep/drag-stuff")
    (synopsis "Drag stuff around in Emacs")
    (description
"Drag Stuff is a minor mode for Emacs that makes it possible to drag
stuff (words, region, lines) around in Emacs.")
    (license license:gpl3+)))

(define-public emacs-evil-surround
  (let ((commit "da05c60b0621cf33161bb4335153f75ff5c29d91")
        (revision "0"))
    (package
      (name "emacs-evil-surround")
      (version (git-version "1.1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/emacs-evil/evil-surround.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0wgxwvndhfaf0ha4pm392vj6yqyv2431hmvyivp1q16crd5g6bq5"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        ))
      (arguments
       `(#:test-command '("make" "test")))
      (home-page "https://github.com/emacs-evil/evil-surround")
      (synopsis "Easily modify surrounding parentheses and quotes")
      (description "@code{emacs-evil-surround} allows easy deletion, change and
addition of surrounding pairs, such as parentheses and quotes, in evil mode.")
      (license license:gpl3+))))

(define-public emacs-evil-anzu
  ;; No release since January 2015
  (let ((commit "7309650425797420944075c9c1556c7c1ff960b3")
        (revision "0"))
    (package
      (name "emacs-evil-anzu")
      (version (git-version "0.03" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/emacsorphanage/evil-anzu.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1hxxy34ax95xi88gqaj04k2hjph30x0c9dkk2gaw3708zidxykmc"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-evil
        emacs-anzu
        ))
      (home-page "https://github.com/emacsorphanage/evil-anzu")
      (synopsis "Anzu for evil-mode")
      (description
       "@code{anzu} provides a minor mode that displays the current
match and total match information in the mode-line in various search modes.")
      (license license:gpl3+))))

(define-public emacs-evil-mc
  (let ((commit "7e363dd6b0a39751e13eb76f2e9b7b13c7054a43")
        (revision "0"))
    (package
      (name "emacs-evil-mc")
      (version (git-version "0.0.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/gabesoft/evil-mc.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0gzy2mqcdxhkg0hmxqzbjy5ihfal1s21wxd04mrikqri54sck4z5"))))
      (build-system emacs-build-system)
      (arguments
       (list #:test-command
             #~(list "emacs" "--no-init-file" "--batch"
                     "--eval=(require 'ecukes)" "--eval=(ecukes)")))
      (propagated-inputs
       (list
        emacs-evil
        ))
      (native-inputs
       (list
        emacs-ecukes
        emacs-espuds
        emacs-evil-numbers
        emacs-evil-surround
        ))
      (home-page "https://github.com/gabesoft/evil-mc")
      (synopsis "Interactive search compatible with @code{multiple-cursors}")
      (description "This package can be used with @code{multiple-cursors} to
provide an incremental search that moves all fake cursors in sync.")
      (license license:expat))))

(define-public emacs-evil-org
  (let ((commit "b1f309726b1326e1a103742524ec331789f2bf94")
        (revision "0"))
    (package
      (name "emacs-evil-org")
      (version (git-version "1.0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Somelauw/evil-org-mode.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1xjmar7zny1g62881ym2dpp3f0cmwh8y8d14phja8y4w6nhiz3s4"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-evil))
      (home-page
       "https://github.com/Somelauw/evil-org-mode")
      (synopsis "Evil keybindings for Org mode")
      (description
       "This package adds supplemental Evil mode key-bindings to Emacs
Org-mode.  It features:
@itemize
@item normal, visual and insert mode bindings;
@item key bindings organised in key themes;
@item operators like > and < to work on headings;
@item text objects;
@item table support;
@item calendar (date selection) support;
@item agenda support.
@end itemize\n")
      (license license:gpl3+))))

(define-public emacs-annalist
  (let ((commit "e1ef5dad75fa502d761f70d9ddf1aeb1c423f41d")
        (revision "0"))
    (package
      (name "emacs-annalist")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/noctuid/annalist.el.git")
                (commit commit)))
         (sha256
          (base32
           "1di8wknirx3ql9bqp940yy5p07n2x82wgqyvfmdxblagh7pcp8a8"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (native-inputs
       (list emacs-buttercup emacs-lispy emacs-evil))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'check 'fix-makefile
             (lambda _
               (substitute* "Makefile"
                 (("cask exec ") ""))
               #t)))
         #:test-command '("make" "test")))
      (home-page "https://github.com/noctuid/annalist.el")
      (synopsis "Record and display information with Org headings and tables")
      (description "This package allows for keybindings, settings, hooks, and
advice to be recorded and displayed.")
      (license license:gpl3+))))

(define-public emacs-evil-numbers
  ;; XXX: Upstream did not tag latest release.  Use commit matching exact
  ;; version bump.
  (let ((commit "f4bbb729eebeef26966fae17bd414a7b49f82275")
        (revision "0"))
    (package
      (name "emacs-evil-numbers")
      (version (git-version "0.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/juliapath/evil-numbers.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0gqx0cvpi9cjr9f811ry6294bck919zblq6vib8722b2pfj8mani"))))
      (build-system emacs-build-system)
      (arguments
       (list
        #:test-command #~(list "emacs" "--batch"
                               "-l" "evil-numbers.el"
                               "-l" "tests/evil-numbers-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'skip-failing-tests
              (lambda _
                (substitute* "tests/evil-numbers-tests.el"
                  (("\\(ert-deftest simple-negative .*" all)
                   (string-append all " (skip-unless nil)"))))))))
      (native-inputs (list emacs-ert-runner))
      (propagated-inputs (list emacs-evil))
      (home-page "https://github.com/juliapath/evil-numbers")
      (synopsis "Increment and decrement numeric literals")
      (description
       "This package provides functionality to search for a number up to the
end of a line and increment or decrement it.")
      (license license:gpl3+))))

(define-public emacs-bind-map
  (let ((commit "f23cfc13222a39e686d28a83ff83e9901d8908b2")
        (revision "0"))
    (package
      (name "emacs-bind-map")
      (version (git-version "1.1.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/justbur/emacs-bind-map.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1a05nxm0iadvqy3wlz58f7c4g0lvip3n8dwkn1fr14dyl1vssgar"))))
      (build-system emacs-build-system)
      (arguments (list #:test-command
                       #~(list "emacs" "--batch" "-l" "bind-map-tests.el"
                               "-f" "ert-run-tests-batch-and-exit")))
      (native-inputs (list emacs-evil))
      (home-page "https://github.com/justbur/emacs-bind-map")
      (synopsis "Bind personal keymaps in multiple locations")
      (description
       "@code{emacs-bind-map} provides a macro bind-map which can be used to
make a keymap available across different leader keys including ones
tied to evil states.  It is essentially a generalization of the idea
of a leader key as used in Vim or the @code{emacs-evil-leader} package,
and allows for an arbitrary number of leader keys.")
      (license license:gpl3+))))

(define-public emacs-auto-complete
  (let ((commit "e6d39862b2da9986c0af70651388159983a61c6f")
        (revision "0"))
    (package
      (name "emacs-auto-complete")
      (version (git-version "1.5.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/auto-complete/auto-complete.git")
                (commit commit)))
         (sha256
          (base32
           "0affskjcxnrsiknsq3hgxj90w06s8ngshdid5j5ajwzs7gd2cx7j"))
         (file-name (git-file-name name version))))
      (build-system emacs-build-system)
      (arguments (list #:test-command #~(list "ert-runner" "tests")))
      (propagated-inputs
       (list
        emacs-popup
        ))
      (native-inputs
       (list
        (@(bost gnu packages emacs-build) emacs-ert-runner)
        ))
      (home-page "https://github.com/auto-complete/auto-complete")
      (synopsis "Intelligent auto-completion extension for Emacs")
      (description
       "Auto-Complete is an intelligent auto-completion extension for Emacs.
It extends the standard Emacs completion interface and provides an environment
that allows users to concentrate more on their own work.  Its features are:
a visual interface, reduce overhead of completion by using statistic method,
extensibility.")
      (license license:gpl3+))))

(define-public emacs-ac-ispell
  (let ((commit "22bace7387e9012002a6a444922f75f9913077b0")
        (revision "1"))
    (package
      (name "emacs-ac-ispell")
      (version (git-version "0.07" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/emacsorphanage/ac-ispell")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1cq73bdv3lkn8v3nx6aznygqaac9s5i7pvirl8wz9ib31hsgwpbk"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-auto-complete
        ))
      (home-page "https://github.com/emacsorphanage/ac-ispell")
      (synopsis "Ispell and Aspell completion source for Auto Complete")
      (description
       "AC Ispell is an Ispell and Aspell completion source for Auto Complete.")
      (license license:gpl3+))))

(define-public emacs-git-messenger
  (let ((commit "eade986ef529aa2dac6944ad61b18de55cee0b76")
        (revision "0"))
    (package
      (name "emacs-git-messenger")
      (version (git-version "0.18" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/syohex/emacs-git-messenger.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ffy3im4rj9z85mx8ik6r55srhpj4ldgphgzdgf1vj9i3r2d5pcp"))))
      (build-system emacs-build-system)
      (propagated-inputs
       (list
        emacs-popup
        ))
      (arguments
       `(#:test-command '("emacs" "--batch" "-l" "test/test.el"
                          "-f" "ert-run-tests-batch-and-exit")))
      (home-page "https://github.com/syohex/emacs-git-messenger")
      (synopsis "Popup commit message at current line")
      (description "@code{emacs-git-messenger} provides
@code{git-messenger:popup-message}, a function that when called, will popup
the last git commit message for the current line.  This uses git-blame
internally.")
      (license license:gpl3+))))

(define-public emacs-llama
  (let ((commit "0cc2daffded18eea7f00a318cfa3e216977ffe50")
        (revision "0"))
    (package
      (name "emacs-llama")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/tarsius/llama.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0yp1k70pgi45k8gb7xn229g1dzmwnijabvzxgrwacp02n7v1piyh"))))
      (build-system emacs-build-system)
      (arguments
       (list
        ;; #:tests? #t
        #:test-command #~(list "emacs" "-Q" "--batch"
                               "-l" "llama.el"
                               "-f" "ert-run-tests-batch-and-exit")
        #:modules '((guix build emacs-build-system)
                    (guix build utils)
                    (guix build emacs-utils)
                    ((bost guix build emacs-utils) #:prefix bst:))
        #:imported-modules `(,@%default-gnu-imported-modules
                             (guix build emacs-build-system)
                             (guix build emacs-utils)
                             (bost guix build emacs-utils))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'ensure-package-description 'add-needed-pkg-descriptions
              (lambda* (#:key outputs #:allow-other-keys)
                (bst:write-pkg-file "llama")
                )))))
      (propagated-inputs
       (list
        emacs-compat
        ))
      (home-page "https://github.com/tarsius/llama")
      (synopsis "Compact syntax for short lambda")
      (description
       "This package implements the macro @code{##}, which provides compact
syntax for short lambda.")
      (license license:gpl3+))))

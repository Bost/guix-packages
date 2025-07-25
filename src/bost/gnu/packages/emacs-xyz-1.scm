(define-module (bost gnu packages emacs-xyz-1)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
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
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages java)
  #:use-module (gnu packages julia-xyz)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
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
  #:use-module (gnu packages uml)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wget)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (gnu packages emacs-xyz)
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
     (list emacs-dash emacs-powerline emacs-s))
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

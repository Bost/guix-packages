This repo contains:

* Some Guix packages not available (yet) in the main distro.
* Scattered notes. Particularly about the steps involved in running it under
  Windows Subsistem for Linux 2 (WSL2).
* [Operating system](https://guix.gnu.org/manual/en/html_node/Using-the-Configuration-System.html)
  declaration (check under `systems/`).

Use this repo as a [channel](https://guix.gnu.org/manual/en/html_node/Channels.html):

See `info "(guix) Invoking guix import"`
"Add a package to the distribution with as little work as possible"

```fish
set load_path $dev/guix-packages/packages/bost/packages/patches
guix pull                    && guix upgrade --load-path=$load_path
# or eventually
guix pull --allow-downgrades && guix upgrade --load-path=$load_path

# show installed versions
gxI '(emacs-spacemacs|spacemacs-rolling-release)'
```

``` scheme
(cons (channel
        (name 'bost)
        (url
         #; "https://github.com/Bost/guix-packages"
         (format #f "file://~a/guix-packages" (getenv "dev"))))
      %default-channels)
```

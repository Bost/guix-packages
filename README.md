This repo contains:

* Some Guix packages not available (yet) in the main distro.
* Scattered notes. Particularly about the steps involved in running it under
  Windows Subsistem for Linux 2 (WSL2).
* [Operating system](https://guix.gnu.org/manual/en/html_node/Using-the-Configuration-System.html)
  declaration (check under `systems/`).

Use this repo as a [channel](https://guix.gnu.org/manual/en/html_node/Channels.html):

See `info "(guix) Invoking guix import"`
"Add a package to the distribution with as little work as possible"

Install spacemacs with dependencies as specified by `~/.spacemacs-guix.el`:
```shell
guix package --load-path=$dev/guix-packages/packages/bost/packages/patches --manifest=$dev/guix-packages/manifest.scm
```

```shell
guix pull                    && guix upgrade --load-path=$dev/guix-packages/packages/bost/packages/patches
# or eventually
guix pull --allow-downgrades && guix upgrade --load-path=$dev/guix-packages/packages/bost/packages/patches
```

``` scheme
(cons (channel
        (name 'bost)
        (url
         #; "https://github.com/Bost/guix-packages"
         (format #f "file://~a/guix-packages" (getenv "dev"))))
      %default-channels)
```

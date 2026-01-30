This repo contains mostly (updated) Guix packages for Emacs not available
(yet) in the main distro.

Use this repo as a [channel](https://guix.gnu.org/manual/en/html_node/Channels.html):

See `info "(guix) Invoking guix import"`
"Add a package to the distribution with as little work as possible"

```fish
set --local lp $dev/guix-packages/packages/bost/packages/patches
guix pull                    && guix upgrade --load-path=$lp
# or eventually
guix pull --allow-downgrades && guix upgrade --load-path=$lp

# list / show installed versions per profile
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

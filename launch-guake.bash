#!/usr/bin/env bash

set -x

# ATK=$(guix build at-spi2-core)
# GDKPIX=$(guix build gdk-pixbuf)
# GLIB=$(guix build glib)
# GTK3=$(guix build gtk+)
# HB=$(guix build harfbuzz)
# KEYBINDER=$(guix build keybinder)
# LIBNOTIFY=$(guix build libnotify)
# PANGO1=$(guix build pango-old)
# VTE3=$(guix build vte-with-gtk+3)
# WNCK=$(guix build libwnck)
# LIBUTEMPTER=$(guix build libutempter)

ATK=/gnu/store/zws2hq23cq43mnq307h7m0bpcw74xp2n-at-spi2-core-2.52.0
GDKPIX=/gnu/store/fmv8qa81h744hkhyqcaidfjvsvmbxdzc-gdk-pixbuf-2.42.12
GLIB=/gnu/store/bfyhz5cgw6vry5yqmrqag8f13la6mkbr-glib-2.83.3
GTK3=/gnu/store/fp8nk5pi8bbmkgwrk2ykcbs7yq33sh08-gtk+-3.24.49
HB=/gnu/store/095dah7harh3vqfnnf1lnvzvwmri8y54-harfbuzz-8.3.0
KEYBINDER=/gnu/store/92g2wvdbj0ygmxiwpk2dp16w8x9knhxg-keybinder-0.3.2
LIBNOTIFY=/gnu/store/n8iwirarppszngn5h8myhn1cam201iyc-libnotify-0.8.3
PANGO1=/gnu/store/9xnwnznyyllhwg85lc8l9kn58y55kg78-pango-old-1.54.0
VTE3=/gnu/store/4mr7g0mycbbr3wmgahgmb6wbn7pqxykb-vte-with-gtk+3-0.78.2
WNCK=/gnu/store/mrdlhmhdxzy7mfmj3hprpa4aj6xx32sa-libwnck-40.1
LIBUTEMPTER=/gnu/store/21g6g5j1j9y6ifsxxj9d1fhswisrd7p4-libutempter-1.2.3-alt1

GIP=""
GIP="$GIP:$VTE3/lib/girepository-1.0"
GIP="$GIP:$GTK3/lib/girepository-1.0"
GIP="$GIP:$PANGO1/lib/girepository-1.0"
GIP="$GIP:$GLIB/lib/girepository-1.0"
GIP="$GIP:$HB/lib/girepository-1.0"
GIP="$GIP:$GDKPIX/lib/girepository-1.0"
GIP="$GIP:$ATK/lib/girepository-1.0"
GIP="$GIP:$KEYBINDER/lib/girepository-1.0"
GIP="$GIP:$LIBNOTIFY/lib/girepository-1.0"
GIP="$GIP:$WNCK/lib/girepository-1.0"

LIP=""
LIP="$LIP:$VTE3/lib"
LIP="$LIP:$GTK3/lib"
LIP="$LIP:$PANGO1/lib"
LIP="$LIP:$GLIB/lib"
LIP="$LIP:$HB/lib"
LIP="$LIP:$GDKPIX/lib"
LIP="$LIP:$ATK/lib"
LIP="$LIP:$KEYBINDER/lib"
LIP="$LIP:$LIBNOTIFY/lib"
LIP="$LIP:$WNCK/lib"
LIP="$LIP:$LIBUTEMPTER/lib"

export GI_TYPELIB_PATH="$GIP"
export LD_LIBRARY_PATH="$LIP"

# exec /gnu/store/qb256r3m7mzi1ypv09w9hjpn37jxmb0s-guake-3.10/bin/.guake-real
exec /gnu/store/41isnkk3lvnj4k6ggjrji05d9d0028g5-guake-3.10/bin/.guake-real

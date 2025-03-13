#!/bin/sh

# bad: master
# 460a9b88c554b07776460a0ca8a0284d2a6615b9
set -x
guix \
    time-machine \
    --channels=channels-for-git-bisect-of-quake.scm \
    --commit=460a9b88c554b07776460a0ca8a0284d2a6615b9 \
    -- \
    shell \
    --preserve=^DISPLAY \
    --preserve='^XAUTHORITY$' --share=$XAUTHORITY \
    --preserve=^TERM$ \
    --file=$dgxp/src/bost/gnu/packages/guake.scm -- guake

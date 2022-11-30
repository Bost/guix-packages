#!/bin/sh
#
# Reproducible Development Environment

wd=$(pwd) # WD=$(dirname "$0") # i.e. path to this file

# PROFILES=(
#     $HOME/.config/guix/current
#     $HOME/.guix-profile
#     $HOME/.guix-home/profile
# )

# for profile in ${PROFILES[@]}; do
#     # printf "profile: %s\n" $profile
#     set -x  # Print commands and their arguments as they are executed.
#     guix package --profile=$profile --list-installed=emacs-spacemacs
#     { retval="$?"; set +x; } 2>/dev/null
#     unset profile
# done
# unset PROFILES

cmd=guix
# [[ ! $(command -v $cmd) ]] - '[[' is a bashishm
if [ ! "$(command -v $cmd)" ]; then
    printf "ERR: Command not available: %s\n" $cmd
    exit 1;
fi

# --preserve=REGEX
#   preserve environment variables matching REGEX
#
# The $DISPLAY is needed by clojure.inspector, however the
#   --preserve=^DISPLAY
# leads to an error in the REPL:
#   Authorization required, but no authorization protocol specified
# and:
#   error in process filter: cljr--maybe-nses-in-bad-state: \
#   Some namespaces are in a bad state: ...

# No shell is started when the '--search-paths' parameter is used. Only the
# variables making up the environment are displayed.
#   guix shell --search-paths

# Make ./persistent-profile a symlink to the `guix shell ...` result, and
# register it as a garbage collector root, i.e. prevent garbage collection
# during(!) the `guix shell ...` session:
#  --root=./persistent-profile \
#

# Create environment for the package that the '...' EXPR evaluates to.
# --expression='(list (@ (gnu packages bash) bash) "include")' \
#

export GUIX_PACKAGE_PATH=$(pwd)/packages/bost/packages/patches
printf "run.sh: $(env | rg GUIX_PACKAGE_PATH): %s\n" $(env | rg GUIX_PACKAGE_PATH)

set -x
guix shell \
     --manifest=$HOME/dev/guix-packages/manifest.scm \
     --container --network \
     --preserve=^GUIX_PACKAGE_PATH$ \
     --share=/usr/bin \
     --share=$HOME/.bash_history=$HOME/.bash_history \
     --share=$HOME/.config/fish=$HOME/.config/fish \
     --share=$HOME/.gitconfig=$HOME/.gitconfig \
     --share=$HOME/.ssh/=$HOME/.ssh/ \
     --share=$wd/.bash_profile=$HOME/.bash_profile \
     --share=$wd/.bashrc=$HOME/.bashrc \
     --share=$wd/.envrc=$HOME/.envrc \
     --share=$wd \
     -- bash

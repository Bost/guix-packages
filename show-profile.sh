#!/bin/sh
#
# Reproducible Development Environment

PROFILES=(
    $HOME/.config/guix/current
    $HOME/.guix-profile
    $HOME/.guix-home/profile
)

for profile in ${PROFILES[@]}; do
    # printf "profile: %s\n" $profile
    set -x  # Print commands and their arguments as they are executed.
    guix package \
         --list-installed='(emacs-spacemacs|spacemacs-rolling-release)' \
         --profile=$profile
    { retval="$?"; set +x; } 2>/dev/null
    unset profile
done
unset PROFILES

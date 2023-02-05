#!/bin/sh
#
# Reproducible Development Environment

myProfiles=(
    $HOME/.config/guix/current
    $HOME/.guix-profile
    $HOME/.guix-home/profile
)

# declare -p $myProfiles 2> /dev/null | grep -q '^declare \-a'

for profile in ${myProfiles[@]}; do
    # printf "profile: %s\n" $profile

    # set -x  # Print commands and their arguments as they are executed.

    # set -x also causes printing of the 'result=' assignment and the
    # '... | column --table' redirection. That's too much noise

    # echo guix package \
    #      --list-installed='(emacs-spacemacs|spacemacs-rolling-release)' \
    #      --profile=$profile
    result=$(guix package \
                  --list-installed='(emacs-spacemacs|spacemacs-rolling-release)' \
                  --profile=$profile)
    # { retval="$?"; set +x; } 2>/dev/null
    fmtProfile=$(echo $profile | sed $(printf 's#%s#~#g' $HOME))
    printf -- "--profile=%s\n" $fmtProfile
    line0='                         '
    line1='                      '
    if [ ! -z "$result" ]; then
        fmtRes=$(echo $result | sed 's#\s#;#g')
        # echo $fmtRes
        # split a string to an array in bash https://stackoverflow.com/a/10586169
        IFS=';' read -r -a resArr <<< "$fmtRes"
        maxRange=$[(${#resArr[@]} / 4) - 1]
        for idx in $(seq 0 $maxRange); do
            offset=$[$idx * 4]
            pkgName=${resArr[$offset + 0]}
            pkgVer=${resArr[$offset + 1]}
            pkgPath=${resArr[$offset + 3]}
            printf "    %s %s %s %s %s\n" \
                   $pkgName "${line0:${#pkgName}}" $pkgVer "${line1:${#pkgVer}}" \
                   $pkgPath
        done
    fi
done

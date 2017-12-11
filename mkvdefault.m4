#!/bin/bash
# https://github.com/Superdanby/Batch-Edit-Matroska-Defaults

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.5.0
# ARG_OPTIONAL_SINGLE([path], , [Matroska files' directory])
# ARG_OPTIONAL_SINGLE([fa],[],[Current default audio track])
# ARG_OPTIONAL_SINGLE([ta],[],[Target subtitle track])
# ARG_OPTIONAL_SINGLE([fs],[],[Current default subtitle track])
# ARG_OPTIONAL_SINGLE([ts],[],[Target subtitle track])
# ARG_HELP([This script uses mkvpropedit to modify the default track settings of all Matroska files in the specified path.])
# ARGBASH_GO

# [ <-- needed because of Argbash

if [[ $_arg_path == /* ]]; then
    echo "Value of --path: $_arg_path"
else
    echo "Value of --path: `pwd`/$_arg_path"
fi
echo "Value of --fa: a$_arg_fa"
echo "Value of --ta: a$_arg_ta"
echo "Value of --fs: s$_arg_fs"
echo "Value of --ts: s$_arg_ts"

if ! [[ -d "$_arg_path" ]]; then
    echo "Invalid directory!"
    exit 1
fi

printf "Do you wish to proceed?\n"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

for f in "$_arg_path"/*.mkv
do
    if ! [[ $_arg_fa == "" && $_arg_fs == "" ]]; then
        mkvpropedit "$f" --edit track:a$_arg_fa --set flag-default=0 --edit track:a$_arg_ta --set flag-default=1 --edit track:s$_arg_fs --set flag-default=0 --edit track:s$_arg_ts --set flag-default=1
    elif ! [[ $_arg_fa == "" ]]; then
        mkvpropedit "$f" --edit track:a$_arg_fa --set flag-default=0 --edit track:a$_arg_ta --set flag-default=1
    elif ! [[ $_arg_fs == "" ]]; then
        mkvpropedit "$f" --edit track:s$_arg_fs --set flag-default=0 --edit track:s$_arg_ts --set flag-default=1
    fi
done

# ] <-- needed because of Argbash

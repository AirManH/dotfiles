# -*- coding: utf-8; -*-

#!/usr/bin/env bash


cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

config_file=""

if [[ "$(uname -r)" == *Microsoft ]]; then
    # wsl
    config_file="$(find /mnt/c/Users/*/AppData/Local/Packages/*/LocalState/settings.json 2>/dev/null | grep Terminal)"
elif [[ "$(uname -s)" == MINGW* ]]; then
    # mingw
    config_file="find /c/Users/*/AppData/Local/Packages/*/LocalState/settings.json 2>/dev/null | grep Terminal"
elif [[ "$(uname -s)" == MSYS* ]]; then
    # msys
    config_file="find /c/Users/*/AppData/Local/Packages/*/LocalState/settings.json 2>/dev/null| grep Terminal"
else
    exit 1
fi

# if $config_file has zero length, it means windows-terminal is not installed
if [[ -n "${config_file}" ]]; then
    cp "${cur_src_dir}/settings.json" "${config_file}" \
       --backup --suffix=".old"
fi

# -*- coding: utf-8; -*-

#!/usr/bin/env bash


cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


dest_dir="${HOME}/.emacs.d.air"
# url="git@github.com:AirManH/.emacs.d.git"
url="https://github.com/AirManH/.emacs.d.git"
depends=(emacs git)

# Check depends
for exe in "${depends[@]}"; do
    if [ ! -x "$(command -v ${exe})" ]; then
        exit 1;
    fi
done

if [ ! -d "${dest_dir}" ]; then
    git clone "${url}" "${dest_dir}"
    cd "${dest_dir}"
    git submodule init
    git submodule update
fi

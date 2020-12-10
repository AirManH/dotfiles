# -*- coding: utf-8; -*-

#!/usr/bin/env bash


# see also https://pwmt.org/projects/zathura/documentation/

cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# if zathura is not installed, exit 1
if [[ -z "$(command -v zathura)" ]]; then
    exit 1
fi


files=(
    "zathurarc"
)

dest_dir="${HOME}/.config/zathura"
if [[ -n "${XDG_CONFIG_HOME}" ]]; then
    dest_dir="${XDG_CONFIG_HOME}/zathura"
fi


# create dest_dir if not exits
mkdir -p "${dest_dir}"
# do copy
for file in "${files[@]}"; do
    cp "${cur_src_dir}/${file}" "${dest_dir}" \
       --backup --suffix=".old"
done

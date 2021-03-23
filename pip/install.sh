# -*- coding: utf-8; -*-

#!/usr/bin/env bash


cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


files=(
    "pip.conf"
)

dest_dir="${HOME}/.config/pip"


mkdir -p "${dest_dir}"

for file in "${files[@]}"; do
    cp "${cur_src_dir}/${file}" "${dest_dir}" \
       --backup --suffix=".old"
done

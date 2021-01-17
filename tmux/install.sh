# -*- coding: utf-8; -*-

#!/usr/bin/env bash


cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


files=(
    ".tmux.conf"
)

dest_dir="${HOME}"

# Check if `tmux' is installed
if [[ -x "$(command -v tmux)" ]]; then
    for file in "${files[@]}"; do
        cp "${cur_src_dir}/${file}" "${dest_dir}" \
           --backup --suffix=".old"
    done
    exit 0
else
    exit 1
fi

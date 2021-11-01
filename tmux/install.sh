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
else
    exit 1
fi


# {{{ Install Tmux Plugin Manager
# See https://github.com/tmux-plugins/tpm
url="https://github.com/tmux-plugins/tpm.git"
depends=(bash git)
tpm_dest_dir="${HOME}/.tmux/plugins/tpm"


# Check depends
for exe in "${depends[@]}"; do
    if [ ! -x "$(command -v ${exe})" ]; then
        exit 1;
    fi
done

if [ ! -d "${tpm_dest_dir}" ]; then
    mkdir -p ${tpm_dest_dir}
    git clone "${url}" "${tpm_dest_dir}"
fi
# }}}

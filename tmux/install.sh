# -*- coding: utf-8; -*-

#!/usr/bin/env bash


cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# {{{ cp tmux config file
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
# }}}


# {{{ Install Tmux Plugin Manager and plugins
# See https://github.com/tmux-plugins/tpm

git_url_list=(
    "https://github.com/tmux-plugins/tpm.git"
    "https://github.com/tmux-plugins/tmux-sensible.git"
)
git_name_list=(
    "tpm"
    "tmux-sensible"
)
depends=(bash git)
tpm_plugin_dir="${HOME}/.tmux/plugins"


# Check depends
for exe in "${depends[@]}"; do
    if [ ! -x "$(command -v ${exe})" ]; then
        exit 1;
    fi
done

# clone plugins manually
if [ ! -d "${tpm_plugin_dir}" ]; then
    mkdir -p ${tpm_plugin_dir}
fi

for i in "${!git_name_list[@]}"; do
    git_name="${git_name_list[i]}"
    git_url="${git_url_list[i]}"
    dest_dir="${tpm_plugin_dir}/${git_name}"
    echo "${dest_dir}"
    if [ ! -d "${dest_dir}" ]; then
        git clone "${git_url}" "${dest_dir}"
    fi
done
# }}}

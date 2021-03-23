# -*- coding: utf-8; -*-

#!/usr/bin/env bash


# @see https://stackoverflow.com/a/246128
cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


layers=(
    "anaconda"
    "pip"
    "scripts"
    "tmux"
    "windows-terminal"
    "zathura"
    "zsh"
)


for layer in "${layers[@]}"; do
    bash "${cur_src_dir}/${layer}/install.sh"
done

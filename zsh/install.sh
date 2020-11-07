# -*- coding: utf-8; -*-

#!/usr/bin/env bash


cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


files=(
    ".zshrc"
)

dest_dir="${HOME}"

# this .zshrc relies on oh-my-zsh
if [[ -z "$(find ${HOME}/.oh-my-zsh 2>/dev/null)" ]]; then
    exit 1
fi

for file in "${files[@]}"; do
    cp "${cur_src_dir}/${file}" "${dest_dir}" \
       --backup --suffix=".old"
done

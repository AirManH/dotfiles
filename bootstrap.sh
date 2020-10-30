# -*- coding: utf-8; -*-

#!/usr/bin/env bash


# @see https://stackoverflow.com/a/246128
cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# backup if the old one exists
if [ -f ${HOME}/.zshrc ]; then
  mv ${HOME}/.zshrc ${HOME}/.zshrc.old
fi
cp ${cur_src_dir}/zsh/.zshrc ${HOME}/.zshrc

source "${cur_src_dir}/scripts/install.sh"

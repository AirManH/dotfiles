# -*- coding: utf-8; -*-

#!/usr/bin/env bash


# @see https://stackoverflow.com/a/246128
cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


bash "${cur_src_dir}/zsh/install.sh"
bash "${cur_src_dir}/scripts/install.sh"
bash "${cur_src_dir}/windows-terminal/install.sh"
bash "${cur_src_dir}/zathura/install.sh"

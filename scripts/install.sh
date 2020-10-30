# -*- coding: utf-8; -*-

#!/usr/bin/env bash


cur_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


files=(
    "drcom_eth.sh"
    "drcom_wifi.sh"
)

# no error if existing, make parent directories as needed
mkdir -p "${HOME}/scripts"

for file in "${files[@]}"; do
    # backup before copy
    cp "${cur_src_dir}/$file" "${HOME}/scripts/${file}" --backup --suffix=".old"
    chmod +x "${HOME}/scripts/${file}"
done

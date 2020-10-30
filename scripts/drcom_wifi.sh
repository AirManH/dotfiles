# -*- coding: utf-8; -*-

#!/usr/bin/env bash


username=""
passwd=""
drcom_website="https://drcom.szu.edu.cn"

curl \
    -s \
    -d "DDDDD=${username}" \
    -d "upass=${passwd}" \
    -d "0MKKey=123456" \
    -X POST \
    "${drcom_website}" |
    iconv --from-code=GB2312 --to-code=UTF-8 |
    # find the string like that: "<title> string <\title>"
    sed -n "s/^.*<title>\s*\(\S*\)\s*<\/title>.*$/\1/p" |
    if [[ "$(read str; echo $str)" != "认证成功页" ]]; then echo "error"; fi

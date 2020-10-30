# -*- coding: utf-8; -*-

#!/usr/bin/env bash


username=""
passwd=""
drcom_website="http://172.30.255.2/0.htm"

curl \
    -s \
    -d "DDDDD=${username}" \
    -d "upass=${passwd}" \
    -d "0MKKey=%B5%C7%A1%A1%C2%BC" \
    -d "v6ip=" \
    -X POST \
    "${drcom_website}" |
    iconv --from-code=GB2312 --to-code=UTF-8 |
    # find the string like that: "<title> string <\title>"
    sed -n "s/^.*<title>\s*\(\S*\)\s*<\/title>.*$/\1/p" |
    if [[ "$(read str; echo $str)" != "登录成功窗" ]]; then echo "error"; fi

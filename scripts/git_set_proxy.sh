#!/usr/bin/env bash


# @param: (color, msg)
#     color: print with this color.
#            avalible: [green, red]
#            default: green
#     msg: string to print
# @return: none
function air_echo_color
{
    local air_color_no
    air_color_no='\033[0m'
    local air_echo_color_default
    air_echo_color_default="green"

    local msg
    msg="$2"
    local color
    color="$1"
    # set default color
    if [[ -z "$color" ]]; then
        color="${air_echo_color_default}"
    fi
    # WARN: ${color} changed to ANSI escape codes below
    if [[ "${color}" == "green" ]]; then
        color='\033[0;32m'
    elif [[ "${color}" == "red" ]]; then
        color='\033[0;31m'
    else
        echo "[WARN] bad color: ${color}"
        color="${air_color_no}"
    fi

    echo -e "${color}${msg}${air_color_no}"
}

proxy=""

air_echo_color "green" "git config --global http.proxy ${proxy}"
air_echo_color "green" "git config --global https.proxy ${proxy}"

git config --global http.proxy "${proxy}"
git config --global https.proxy "${proxy}"

#!/usr/bin/env bash


echo "[INFO] Online mirror overview: https://www.archlinux.org/mirrors/"
echo "[WARN] Run as sudo, and save to /etc/pacman.d/mirrorlist"

sudo reflector \
        --age 24 \
        --latest 10 \
        --sort rate \
        --protocol http,https \
        --country China \
        --save /etc/pacman.d/mirrorlist

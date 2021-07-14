#!/bin/bash

# change your background from the termianl

ERR=$(fzf --version)
if [[ $? -ne 0 ]]; then
    echo "Install fzf with sudo apt install fzf"
    exit 1
fi

selection=`find /usr/share/backgrounds ~/Pictures -name *.png -o -name *.jpg | fzf`

dconf write /org/gnome/desktop/background/picture-uri "'${selection}'"

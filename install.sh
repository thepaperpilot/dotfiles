#!/usr/bin/env bash

files=(.Xdefaults
.bash_aliases
.bashrc
.gitconfig
.gtkrc-2.0
.profile
.config/compton.conf
.config/gtk-3.0/settings.ini
.config/gtk-3.0/bookmarks
.config/htop/htoprc
.config/i3/config)

DIR=$(dirname "${BASH_SOURCE[0]}")"

for file in "${files[@]}"; do
    [ -e "$file" ] && mv ~/"$file" ~/.backup/"${file##*/}"
    ln -s "$DIR/$file" ~/"$file"
done

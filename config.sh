#!/usr/bin/env bash

DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

echo "$DIR"

# Place config files where they need to go
files=(.Xdefaults
.bash_aliases
.bashrc
.dmenu-i3exit
.gitconfig
.gtkrc-2.0
.profile
.config/compton.conf
.config/gtk-3.0/settings.ini
.config/gtk-3.0/bookmarks
.config/htop/htoprc
.config/i3/config
.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml
.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
.IdeaIC15/config/
bin/telegram
bin/multimc
bin/logout-menu
Pictures/depth.jpg
Pictures/barsl.jpg
Pictures/barsr.jpg
.atom/config.cson
.mozilla/firefox/profiles.ini
.mozilla/firefox/thepaperpilot/stylish.sqlite)

for file in "${files[@]}"; do
    echo mv ~/"$file" ~/.backup/"${file##*/}"
    echo ln -s "$DIR/$file" ~/"$file"
    [ -e "$file" ] && mv ~/"$file" ~/.backup/"${file##*/}"
    ln -s "$DIR/$file" ~/"$file"
done

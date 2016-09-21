#!/usr/bin/env bash

DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

echo "$DIR"

mkdir ~/programs/
mkdir ~/.backup/
mkdir ~/.config/gtk-3.0
mkdir ~/.config/htop
mkdir ~/.config/i3
mkdir ~/.config/lemonbar
mkdir ~/.icons
mkdir ~/.mozilla
mkdir ~/.mozilla/firefox
mkdir ~/.mozilla/firefox/thepaperpilot
mkdir ~/.ssh
mkdir ~/Pictures
mkdir ~/bin

# Place config files where they need to go
files=(.Xdefaults
.bash_aliases
.bashrc
.dmenu-i3exit
.gitconfig
.gtkrc-2.0
.profile
.config/compton.conf
.config/lemonbar/bottom
.config/lemonbar/setup
.config/gtk-3.0/settings.ini
.config/gtk-3.0/bookmarks
.config/htop/htoprc
.config/i3/config
bin/battery.sh
bin/franz
bin/lock
bin/lock.png
bin/logout-menu
bin/multimc
bin/text.png
Pictures/depth.jpg
Pictures/bars.jpg
Pictures/barsl.jpg
Pictures/barsr.jpg
Pictures/void.jpg
Pictures/void.xcf
.mozilla/firefox/profiles.ini
.mozilla/firefox/thepaperpilot/stylish.sqlite
.ssh/config)

for file in "${files[@]}"; do
    echo mv ~/"$file" ~/.backup/"${file##*/}"
    echo ln -s "$DIR/$file" ~/"$file"
    [ -e "$file" ] && mv ~/"$file" ~/.backup/"${file##*/}"
    ln -s "$DIR/$file" ~/"$file"
done

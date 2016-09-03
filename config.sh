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
.config/Google\ Play\ Music\ Desktop\ Player/json_store/.settings.json
.config/gtk-3.0/settings.ini
.config/gtk-3.0/bookmarks
.config/htop/htoprc
.config/i3/config
.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml
.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
.IdeaIC15/config/
bin/franz
bin/lock
bin/lock.png
bin/logout-menu
bin/multimc
bin/text.png
Pictures/depth.jpg
Pictures/barsl.jpg
Pictures/barsr.jpg
.atom/config.cson
.mozilla/firefox/profiles.ini
.mozilla/firefox/thepaperpilot/stylish.sqlite
.ssh/config)

for file in "${files[@]}"; do
    echo mv ~/"$file" ~/.backup/"${file##*/}"
    echo ln -s "$DIR/$file" ~/"$file"
    [ -e "$file" ] && mv ~/"$file" ~/.backup/"${file##*/}"
    ln -s "$DIR/$file" ~/"$file"
done

chmod 600 ~/projects/private/misc/my-key.pem
ssh-keyscan -H ec2-52-43-183-109.us-west-2.compute.amazonaws.com >> ~/.ssh/known_hosts
ssh ec2 mkdir -p .terminfo/r
scp /usr/share/terminfo/r/rxvt-unicode* ec2:.terminfo/r/

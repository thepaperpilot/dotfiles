#!/usr/bin/env bash

# Variables
INTELLIJ_VERSION=15.0.4
# dependent on version, no easy way to not hardcode this
INTELLIJ_DIR=143.2287.1
DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

# Make it so that I don't need to type my password to use sudo (because I like to think I know what I'm doing?)
sudo grep -q -F 'anthony ALL=(ALL) NOPASSWD:ALL' /etc/sudoers || echo 'anthony ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

# PPAs
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:mozillateam/firefox-next
# Manually adding dropbox PPA
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ wily main" >> /etc/apt/sources.list.d/dropbox.list'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# Install packages
cat packages.list | xargs sudo apt-get -y install

# Create folders where they're needed
mkdir ~/programs/
mkdir ~/.backup/

# Download and compile software
git clone https://www.github.com/Airblader/i3 ~/programs/i3-gaps
make -C ~/programs/i3-gaps/
sudo make install -C ~/programs/i3-gaps/

wget -O /tmp/intellij.tar.gz https://download.jetbrains.com/idea/ideaIC-$INTELLIJ_VERSION.tar.gz
tar -xf /tmp/intellij.tar.gz -C /tmp/
rm -r ~/programs/idea
mv /tmp/idea-IC-$INTELLIJ_DIR ~/programs/idea
ln -s ~/programs/idea/bin/idea.sh ~/bin/idea

wget -O /tmp/telegram.tar.xz https://tdesktop.com/linux
tar -xf /tmp/telegram.tar.xz -C /tmp/
mv /tmp/Telegram/Telegram ~/programs/Telegram
mv /tmp/Telegram/Updater ~/programs/Updater

wget -O /tmp/emojione.zip https://github.com/eosrei/emojione-color-font/releases/download/v1.0-beta3/EmojiOneColor-SVGinOT-Linux-1.0-beta3.zip
unzip -o /tmp/emojione.zip -d /tmp/
/tmp/install.sh
fc-cache -f -v

# Place config files where they need to go
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
.config/i3/config
.IdeaIC15/config/
bin/telegram
Pictures/depth.jpg)

for file in "${files[@]}"; do
    [ -e "$file" ] && mv ~/"$file" ~/.backup/"${file##*/}"
    ln -s "$DIR/$file" ~/"$file"
done

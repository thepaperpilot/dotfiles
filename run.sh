#!/usr/bin/env bash

# Make it so that I don't need to type my password to use sudo (because I like to think I know what I'm doing?)
sudo grep -q -F 'anthony ALL=(ALL) NOPASSWD:ALL' /etc/sudoers || echo 'anthony ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

# Create folders where they're needed
mkdir ~/bin
mkdir ~/programs/
mkdir ~/.backup/
mkdir ~/.atom
mkdir ~/.config/Google Play Music Desktop Player
mkdir ~/.config/Google Play Music Desktop Player/json_store
mkdir ~/.config/gtk-3.0
mkdir ~/.config/i3
mkdir ~/.config/xfce4
mkdir ~/.config/xfce4/xfconf
mkdir ~/.config/xfce4/xfconf/xfce-perchannel-xml
mkdir ~/.IdeaIC15
mkdir ~/.IdeaIC15/config
mkdir ~/.icons
mkdir ~/.mozilla
mkdir ~/.mozilla/firefox
mkdir ~/.mozilla/firefox/thepaperpilot/

sudo bash install.sh

sudo bash manual.sh

sudo bash conda.sh

sudo bash config.sh

sudo bash dconf.sh

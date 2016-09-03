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
mkdir ~/.ssh

sudo bash install.sh
install=$?

if [ install -ne 0 ]; then
    echo "install.sh did not complete successfully. Cannot continue."
    return 1;
fi

sudo bash manual.sh
manual=$?

sudo bash conda.sh
conda=$?

sudo bash config.sh
config=$?

sudo bash dconf.sh
dconf=$?

printf "\nFinished running.\n"
printf "manual.sh returned $manual\n"
printf "conda.sh returned $conda\n"
printf "config.sh returned $config\n"
printf "dconf.sh returned $dconf\n"

printf "\nYou should manually set up your vpn using using these instructions: https://support.ipvanish.com/customer/portal/articles/1978292-openvpn-ubuntu-networkmanager\n"

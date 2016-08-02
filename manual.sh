#!/usr/bin/env bash

# Variables
INTELLIJ_VERSION=15.0.4
# dependent on version, no easy way to not hardcode this
INTELLIJ_DIR=143.2287.1

# Download and compile software
git clone --recursive https://github.com/Airblader/xcb-util-xrm.git ~/programs/xcb-util-xrm
sh ~/programs/xcb-util-xrm/autogen.sh
make -C ~/programs/xcb-util-xrm
sudo make install -C ~/programs/xcb-util-xrm

git clone https://www.github.com/Airblader/i3 ~/programs/i3-gaps
make -C ~/programs/i3-gaps/
sudo make install -C ~/programs/i3-gaps/

git clone https://github.com/Arcaena/i3lock-color.git ~/programs/i3lock-color
make -C ~/programs/i3lock-color
sudo make install -C ~/programs/i3lock-color

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
(cd /tmp/ && exec /tmp/install.sh)
fc-cache -f -v

wget -O /tmp/neutral.tar.gz https://dl.opendesktop.org/api/files/download?id=1460735305
tar -xf /tmp/neutral.tar.gz -C ~/.icons/

wget -O /tmp/mmc.tar.gz https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz
tar -xf /tmp/mmc.tar.gz -C ~/programs/

wget -O /tmp/franz.tgz https://github.com/imprecision/franz-app/releases/download/3.1.1/Franz-linux-x64-3.1.1.tgz
tar -xf /tmp/franz.tgz -C ~/programs/

wget -O /tmp/anaconda.sh http://repo.continuum.io/archive/Anaconda2-4.0.0-Linux-x86_64.sh
bash /tmp/anaconda.sh -b -p ~/programs/anaconda
export PATH="/home/anthony/programs/anaconda/bin:$PATH"

sudo echo "[SeatDefaults]
greeter-session=lightdm-webkit-greeter" > /etc/lightdm/lightdm.conf
sudo git clone https://github.com/artur9010/lightdm-webkit-material.git /usr/share/lightdm-webkit/themes/material
sudo echo "#
# background = Background file to use, either an image path or a color (e.g. #772953)
# theme-name = GTK+ theme to use
# font-name = Font to use
# xft-antialias = Whether to antialias Xft fonts (true or false)
# xft-dpi = Resolution for Xft in dots per inch (e.g. 96)
# xft-hintstyle = What degree of hinting to use (hintnone, hintslight, hintmedium, or hintfull)
# xft-rgba = Type of subpixel antialiasing (none, rgb, bgr, vrgb or vbgr)
#
[greeter]
background=/usr/share/backgrounds/warty-final-ubuntu.png
theme-name=Ambiance
webkit-theme=material
font-name=Ubuntu 11
xft-antialias=true
xft-dpi=96
xft-hintstyle=slight
xft-rgba=rgb" > /etc/lightdm/lightdm-webkit-greeter.conf

wget -O /tmp/gpm.deb https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v3.2.5/google-play-music-desktop-player_3.2.5_amd64.deb
sudo gdebi /tmp/gpm.deb --n

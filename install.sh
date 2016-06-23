#!/usr/bin/env bash

# PPAs
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo add-apt-repository -y ppa:numix/ppa
sudo apt-add-repository -y ppa:tista/adapta -y
# Manually adding dropbox PPA
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ wily main" >> /etc/apt/sources.list.d/dropbox.list'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

echo ttf-mscorefonts-installer msttcorefont/accepted-mscorefonts-eula select true | sudo debconf-set-selections
echo steam steam/question select "I AGREE" | sudo debconf-set-selection

# Install packages
cat packages.list | xargs sudo apt-get -y install

# Install atom packages
cat atom.list | xargs sudo apm install

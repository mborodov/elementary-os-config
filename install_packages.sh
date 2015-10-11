#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Author: Romain Catajar <rcatajar@gmail.com>
#
# A post installation script to customize elementary OS Freya (https://elementary.io) to my use.
# Prerequisites (enable in "Softwares And Update"):
#   - trusty-backports updates enabled


#################################
#   ADD PACKAGES REPOSITORIES   #
#################################

# TLP, improved power management
sudo add-apt-repository -y ppa:linrunner/tlp

# Fix resume from suspend issues for some laptops (DELL XPS13, MPB)
# see https://bugs.launchpad.net/ubuntu/+source/bcmwl/+bug/1415880
sudo add-apt-repository -y ppa:inaddy/lp1415880

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Sublime text 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

# Numix icons
sudo add-apt-repository -y ppa:numix/ppa

# Elementary tweaks
curl -sL http://i-hate-farms.github.io/spores/key/deb.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb http://i-hate-farms.github.io/spores trusty main"

# LibreOffice
sudo add-apt-repository -y ppa:libreoffice/ppa

# VLC
sudo add-apt-repository -y ppa:videolan/stable-daily


#################################
#     UPDATE PACKAGES LIST      #
#################################
sudo apt-get update


#################################
#  UPDATE KERNEL TO LATEST LTS  #
#################################
sudo apt-get install -y --install-recommends linux-generic-lts-vivid xserver-xorg-core-lts-vivid xserver-xorg-lts-vivid xserver-xorg-video-all-lts-vivid xserver-xorg-input-all-lts-vivid libwayland-egl1-mesa-lts-vivid xserver-xorg-input-synaptics-lts-vivid linux-signed-generic-lts-vivid


#################################
#       PACKAGES UPGRADE        #
#################################
sudo apt-get dist-upgrade -y


#################################
#       INSTALL PACKAGES        #
#################################

# Fix resume from suspend issues
sudo apt-get install -y bcmwl-kernel-source

# MS Fonts
# accept agreement
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install -y ttf-mscorefonts-installer

# Archive formats support
sudo apt-get install -y unace rar unrar p7zip-rar p7zip zip unzip sharutils uudeview mpack arj cabextract file-roller arj lzip lunzip lame flac

# Some utils packages
sudo apt-get install -y git htop vim zsh linux-tools-common linux-tools-generic dconf-tools gdebi menulibre

# C and C++ dev
sudo apt-get install -y build-essential make cmake g++ clang llvm-dev cpp libqt4-dev libxtst-dev libx11-6 libgeis-dev libclang-dev freeglut3-dev libjpeg-dev libfreetype6-dev libxrandr-dev libglew-dev libsndfile1-dev libopenal-dev  libudev-dev libxcb-icccm4-dev libxcb-image0-dev libsfml-dev cppcheck

# python dev
sudo apt-get install -y python-dev python-pip libblas-dev liblapack-dev libatlas-base-dev gfortran ipython ipython-notebook python-matplotlib
# python libraries
sudo pip install django requests numpy scipy panda pep8 pyflakes virtualenv virtualenvwrapper cpplint

# JS dev
# node
sudo apt-get install -y nodejs npm
sudo npm install -g tern babel-eslint json eslint jshint coffee coffeelint coffee-script underscore backbone mongo-hacker
# meteor
curl https://install.meteor.com/ | sh

# Preload (preload in RAM most used softwares)
sudo apt-get install -y preload

# TLP (power management)
sudo apt-get install -y tlp tlp-rdw smartmontools ethtool thermald

# JAVA VM
sudo apt-get install -y openjdk-7-jdk

# terminator
sudo apt-get install -y terminator

# spotify
sudo apt-get install -y spotify-client
# fix the indicator style
wget --no-check-certificate https://raw.githubusercontent.com/rcatajar/fix-spotify-icon/master/quickstart.sh -O - | sh

# sublime
sudo apt-get install -y sublime-text-installer

# LibreOffice
sudo apt-get install -y libreoffice libreoffice-style-breeze libreoffice-l10n-fr

# VLC
sudo apt-get install -y vlc

# Transmissions
sudo apt-get install -y transmission-gtk

# Numix Circle Icons
sudo apt-get install -y numix-icon-theme-circle
# Modify the icon themes so that it only change the apps icons and keep the default folders/ indicators
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/icon-theme-fix/index.theme
sudo mv index.theme /usr/share/icons/Numix-Circle

# elementary tweaks
sudo apt-get install -y elementary-tweaks

# google chrome
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb
sudo dpkg -i google-chrome-beta_current_amd64.deb
sudo apt-get install -y libappindicator1
sudo apt-get install -f -y

# Dropbox
# Use a custom script because the ubuntu version is outdated and the indicator doesn't work
mkdir -p ~/.config/autostart/   # make sure the autostart directory is here, otherwise the script crash
cd /tmp
wget -O dropbox.zip https://github.com/nathandyer/elementary-dropbox-mods/archive/master.zip
unzip dropbox.zip
cd elementary-dropbox-mods-master/
./dropbox-elementary.sh
sudo ./dropbox-elementary.sh
./dropbox-elementary.sh

# touchegg (enables multitouch gestures)
# Compile it because the ubuntu version does not support gestures on the desktop
cd /tmp
wget -O touchegg.zip https://github.com/JoseExposito/touchegg/archive/master.zip
unzip touchegg.zip
cd touchegg-master/touchegg
qmake
make
sudo make install
# FIXME add to startup

# Gtk-theme-variant-switcher (allow to force dark themes for some apps)
cd /tmp
wget -O switcher.zip https://github.com/theblacklion/gtk-theme-variant-switcher/archive/master.zip
unzip switcher.zip
cd gtk-theme-variant-switcher-master
make install
#FIXME add to startup

# VirtualBox
cd /tmp
sudo apt-get install -y dkms libsdl1.2debian
wget http://download.virtualbox.org/virtualbox/5.0.6/virtualbox-5.0_5.0.6-103037~Ubuntu~trusty_amd64.deb
sudo dpkg -i virtualbox-5.0_5.0.6-103037~Ubuntu~trusty_amd64.deb


#################################
#      REMOVE SOME PACKAGES     #
#################################

# Remove some default elementary apps, the ubuntu software center and the "Report an error" annoying popup
sudo apt-get remove -y midori-granite noise scratch-text-editor software-center software-center-aptdaemon-plugins audience pantheon-terminal geary apport apport-gtk apport-hooks-elementary


#################################
#            CLEANUP            #
#################################
sudo apt-get -y autoremove
sudo apt-get -y autoclean


#################################
#         SYSTEM TWEAKS         #
#################################

# swap less agressivly
sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"

# set terminator as the default terminal
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator

# Improve wifi performance
# Set the wireless regulatory domain to France
sudo iw reg set FR
# Disable  802.11N (fix random disconnections)
sudo bash -c "echo 'options iwlwifi 11n_disable=1' >>/etc/modprobe.d/iwlwifi.conf"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

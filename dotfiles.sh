#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Author: Romain Catajar <rcatajar@gmail.com>
#
# Retrieve and copy my dotfiles

# git
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/gitconfig
mv gitconfig ~/.gitconfig

# Avatar
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/avatar.png
mv avatar.png ~/Pictures/

# terminator
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/terminator
mkdir -p ~/.config/terminator
mv terminator ~/.config/terminator/config

#touchegg
mkdir -p ~/.config/touchegg
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/touchegg.conf
mv touchegg.conf ~/.config/touchegg/

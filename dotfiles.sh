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

# touchegg
mkdir -p ~/.config/touchegg
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/touchegg.conf
mv touchegg.conf ~/.config/touchegg/

# htop
mkdir -p ~/.config/htop
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/htoprc
mv htoprc ~/.config/htop/

# zsh
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/zsh/.zshrc
mv .zshrc ~
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/zsh/cloud.zsh-theme
mkdir -p ~/.oh-my-zsh/custom/themes/
mv cloud.zsh-theme ~/.oh-my-zsh/custom/themes/

# vim
mkdir -p ~/.vim/colors/
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/vim/.vimrc
mv .vimrc ~
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/vim/base16-ocean.vim
mv base16-ocean.vim ~/.vim/colors/

# ssh
mkdir -p ~/.ssh
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/ssh
mv ssh ~/.ssh/config
cd .ssh
echo "name the key id_rsa_git"
ssh-keygen -t rsa -b 4096 -C "rcatajar@gmail.com"
ssh-add ~/.ssh/id_rsa_git
echo "Add the following key to github \n https://github.com/settings/ssh \n"
cat ~/.ssh/id_rsa_git.pub

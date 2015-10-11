#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Author: Romain Catajar <rcatajar@gmail.com>
#
# Retrieve and copy my dotfiles

# GIT
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/gitconfig
mv gitconfig ~/.gitconfig

# AVATAR
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/data/avatar.png
mv avatar.png ~/Pictures/


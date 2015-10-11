# elementary-os-config
My system configuration for elementary OS Freya (https://elementary.io)
![screenshot](https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/screenshot.png)

## Prerequisites:
- [elementary OS Freya](https://elementary.io) (this may or may not work on ubuntu 14.04)
- trusty-backports updates enabled (enable them with the "Softwares And Updates" program)

## Installation:
- Install packages and tweaks:
```
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/install_packages.sh
chmod +x install_packages.sh
./install_packages.sh
```

- Get dotfiles:
```
wget https://raw.githubusercontent.com/rcatajar/elementary-os-config/master/dotfiles.sh
chmod +x dotfiles.sh
./dotfiles.sh
```

- In google chrome, create webapps + shortcuts for Gmail, Google Calendar, WhatsApp, Pocket, Netflix and Skype
- Install latest popcorn time (grab amd64 deb from https://ci.popcorntime.io/job/Popcorn-Desktop/)
- change libreoffice icon style: Tools > Options > LibreOffice > View -> set icon style to Breeze.
- In the system settings:
    - Desktop -> set wallapper, set dock to hide window overlaps it
    - Tweaks > Appearance -> set icon theme to Numix-Circle
    - Tweaks > Fonts -> switch everything to Ubuntu-* fonts
    - Tweaks > Miscellanous -> disable audible bell
    - Tweaks > Files -> disable single click
    - Keyboard -> add keyboard shortcut CMD + T to open terminator, set layout French + English(US)
    - Mouse & touchpad -> Enables Tap to click, disable Natural scrolling
    - User Account -> set avatar
- Disable touchscreen:
    - sudo vi /usr/share/X11/xorg.conf.d/10-evdev.conf
    - add Option "Ignore" "on" in the touchscreen section
- Use menu libre to change ugly icons
- Pin apps to dock
- Configure GTK-theme-variant-switcher: see https://github.com/beachmachine/gtk-theme-variant-switcher#configuration (dark theme for terminator, sublime, spotify, netflix)


## TODOS:
- config sublime (plugins + dotfiles + license key + build SublimeCLang)

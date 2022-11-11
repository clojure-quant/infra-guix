#!/bin/sh

# flatpak is installed in desktop.scm
# guix install flatpak

# for flatpak make sure you have xdg-destkop-portal-gtk installed
# (or just xdg-desktop-portal, but that might not do much)
# that will handle links, as flatpaks are sandboxed and won't have access to open other things by default

# flatpak has .desktop files for the applications it installed, but you'll need to manually
# add a directory to XDG_DATA_DIRS)
# find -type f -iname "*.Desktop"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user

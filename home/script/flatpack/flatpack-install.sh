#!/bin/sh

# for flatpak make sure you have xdg-destkop-portal-gtk installed
# (or just xdg-desktop-portal, but that might not do much)
# that will handle links, as flatpaks are sandboxed and won't have access to open other things by default

# flatpak has .desktop files for the applications it installed, but you'll need to manually
# add a directory to XDG_DATA_DIRS)
# find -type f -iname "*.Desktop"


# echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH


# flatpak is installed in desktop.scm
# guix install flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user

flatpak install flathub us.zoom.Zoom 

flatpak install flathub com.visualstudio.code

flatpak --user install flathub us.zoom.Zoom 
flatpak --user install org.signal.Signal.flatpakref

# exodus wallet

# !/run/current-system/profile/bin/bash 
# flatpak run us.zoom.Zoom
# flatpak run com.visualstudio.code



# ls  ~/.var/app/ -alfg

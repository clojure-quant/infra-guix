# THIS ONLY GETS RUN IF ZSH IS USED TO LOGIN. (SO MAIN OS SHELL)


# idea to load system wide config on login also.
# if [[ -f "/etc/bashrc" ]]; then
#    source /etc/bashrc
# fi


# awb99: this is identical from bash config.

# NIX bin paths
# if [ -f /run/current-system/profile/etc/profile.d/nix.sh ]; then
#   . /run/current-system/profile/etc/profile.d/nix.sh
# fi
export PATH=$PATH:~/.nix-profile/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:~/.nix-profile/share
# TODO: do this, so the XDG_DATA_DIRS var stays clean if flatpak is not installed.
# if [ -d "$HOME/.nix-profile" ]; then
# export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.nix-profile/share/applications"
# fi

# FLATPAK
# Note that the directories 
# '/var/lib/flatpak/exports/share'
# '/home/chris/.local/share/flatpak/exports/share'
# are not in the search path set by the XDG_DATA_DIRS environment variable, so
# applications installed by Flatpak may not appear on your desktop until the
# session is restarted.
if [ -d "$HOME/share/flatpak" ]; then
export PATH=$PATH:~/.local/share/flatpak/exports/bin/
export XDG_DATA_DIRS=$XDG_DATA_DIRS:~/.local/share/flatpak/exports/share/
fi




# CLOJURE BINARY INSTALLATION
export PATH=$PATH:/home/florian/clojure/bin


# user guix profile
GUIX_PROFILE="/home/florian/.guix-profile"
. "$GUIX_PROFILE/etc/profile"

# load all extra guix profiles on startup
GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles
for i in $GUIX_EXTRA_PROFILES/*; do
  profile=$i/$(basename "$i")
  if [ -f "$profile"/etc/profile ]; then
    GUIX_PROFILE="$profile"
    . "$GUIX_PROFILE"/etc/profile
  fi
  unset profile
done

# load fonts from extra-profiles
# if [ -d "$HOME/.guix-extra-profiles/desktop-misc" ]; then
#    export FONTCONFIG_PATH="$HOME/.guix-extra-profiles/desktop-misc/desktop-misc/etc/fonts"
# fi

# guix locales path from extra-profiles
# export GUIX_LOCPATH=$HOME/.guix-extra-profiles/console/console/lib/locale


# todo: NODE NPM path.
# export NPM_CONFIG_USERCONFIG=$HOME/._npmrc
# NPM_PACKAGES="${HOME}/.npm-packages"
# export PATH="$PATH:$NPM_PACKAGES/bin"


# QT vars...
# export QT_QPA_PLATFORMTHEME="qt5ct"
# export QT_AUTO_SCREEN_SCALE_FACTOR=0

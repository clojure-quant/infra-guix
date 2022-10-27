# THIS ONLY GETS RUN IF ZSH IS USED TO LOGIN. (SO MAIN OS SHELL)

# awb99: this is identical from bash config.

# NIX bin paths
export PATH=$PATH:~/.nix-profile/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:~/.nix-profile/share

# FLATPAK
# Note that the directories 
# '/var/lib/flatpak/exports/share'
# '/home/chris/.local/share/flatpak/exports/share'
# are not in the search path set by the XDG_DATA_DIRS environment variable, so
# applications installed by Flatpak may not appear on your desktop until the
# session is restarted.
export XDG_DATA_DIRS=$XDG_DATA_DIRS:~/.local/share/flatpak/exports/share/
export PATH=$PATH:~/.local/share/flatpak/exports/bin/

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
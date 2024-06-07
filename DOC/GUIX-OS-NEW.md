
# new DESKTOP machine workflow

## step 1 - run guix-installer
- guix installer with physical lan cable 
- btfrs encrypted disk

## step 2 - create nonguix config
- from new machine copy /etc/guix.scm config to usb stick
- create new non-guix os setup.
- copy myLinux and infra-guix to stick
- copy repos to /repo/myLinux and /repo/clojure-quant/infra-guix
- ./bootstrap/guix-add-nonguix-key.sh
- ./bootstrap/guix-os-install.sh gram2022
- reboot
- ./bootstrap/file-swap-create.sh

## step 3 - nix
./bootstrap/nix/nix-init.sh
./bootstrap/nix/nix-apps-install.sh

## step 4 - guix home
Here the bin links and paths are not yet setup.

source ./bootstrap/myvault-set.sh
either:   ~/.nix-profile/bin/bb home-configure florian-desktop
or:       ./bootstrap/guix-home-florian.sh

# step 5 - guix profiles
; this adds nonguix channels to user profile
bb channels-install 

bb profile-install desktop
bb profile-install programming
bb profile-install custom

# step 6 - customize

./bootstrap/ohmyzsh-install.sh

/SOFTWARE/chromium.md install plugins



cd repo
mkdir clojure-quant
git clone git@github.com:clojure-quant/infra-guix.git
git clone git@github.com:florian2705/myLinux.git

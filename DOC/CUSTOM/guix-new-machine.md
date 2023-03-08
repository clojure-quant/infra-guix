
# new machine workflow

## step 1 - run guix-installer
- guix installer with physical lan cable 
- btfrs encrypted disk

## step 2 - create nonguix config
- copy /etc/guix.scm config to usb stick
- create new non-guix os setup.
- copy myLinux and infra-guix to stick
- ./bootstrap/guix-add-nonguix-key.sh
- ./bootstrap/guix-os-install.sh gram2022
- reboot
- ./bootstrap/file-swap-create.sh

## step 3 - nix
./bootstrap/nix/nix-init.sh
./bootstrap/nix/nix-apps-install.sh

## step 4 - guix home
Here the bin links and paths are not yet setup.

~/.nix-profile/bin/bb home-configure florian-desktop


# step 5 - guix profiles

bb user-install desktop
bb user-install programming

# step 6 - clone repos


cd repo
mkdir clojure-quant
git clone git@github.com:clojure-quant/infra-guix.git
git clone git@github.com:florian2705/myLinux.git

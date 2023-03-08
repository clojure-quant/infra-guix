
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

## step 3 - nix
./bootstrap/nix/nix-init.sh
./bootstrap/nix/nix-apps-install.sh


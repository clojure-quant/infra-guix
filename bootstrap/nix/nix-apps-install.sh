#!/bin/sh
# without fonts and the config above, vscodium looks weird.
nix-env --install nixpkgs.fira-code

# see: 
# https://stackoverflow.com/questions/57981225/how-to-install-fonts-with-nix-in-ubuntu
# mkdir ~/.config/fontconfig/conf.d/
# cp script/10-nix-fonts.conf ~/.config/fontconfig/conf.d/

nix-env -i babashka
nix-env -i vscodium

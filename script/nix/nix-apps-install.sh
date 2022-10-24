#!/bin/sh

nix-env --install nixpkgs.fira-code
nix-shell -p vscodium


# see: 
# https://stackoverflow.com/questions/57981225/how-to-install-fonts-with-nix-in-ubuntu
mkdir ~/.config/fontconfig/conf.d/
cp script/10-nix-fonts.conf ~/.config/fontconfig/conf.d/


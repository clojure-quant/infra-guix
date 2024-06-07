#!/bin/sh
# without fonts and the config above, vscodium looks weird.
nix-env --install fira-code

# see: 
# https://stackoverflow.com/questions/57981225/how-to-install-fonts-with-nix-in-ubuntu
# mkdir ~/.config/fontconfig/conf.d/
# cp script/10-nix-fonts.conf ~/.config/fontconfig/conf.d/

# clojure-tools is needed by babashka
nix-env -i clojure-tools
nix-env -i babashka
nix-env -i clojure-lsp
nix-env -i vscodium

# wayland screen recorder
# screen recorders dont work.

# nix-env -i vokoscreen-ng
# nix-env -i kooha    


#  ls /nix/store |grep vscode
# ls /nix/store |grep codiu

# ls .nix-profile/share/applications
# /home/florian/.nix-profile/bin/codium

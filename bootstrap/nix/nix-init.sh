#!/bin/sh

## Add a Nix channel and update it.  (https://nixos.org/nix/manual/).

sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable 
sudo nix-channel --update



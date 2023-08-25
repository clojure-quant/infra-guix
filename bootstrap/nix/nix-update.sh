#!/bin/sh

## Add a Nix channel and update it.  (https://nixos.org/nix/manual/).

# list installed channels
echo "installed channels:"
nix-channel --list
# update channels
echo "updating channels .."
nix-channel --update

# list installed packages
echo "installed packages: "
nix-env -q
# update packages
echo "updating packages.."
nix-env -u '*'
nix-env -q
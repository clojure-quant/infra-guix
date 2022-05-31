

## Add a Nix channel and update it.  (https://nixos.org/nix/manual/).

sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable 
sudo nix-channel --update

See what installable packages are currently available in the channel:
nix-env -qaP

To keep up-to-date with the channel:
nix-channel --update nixpkgs
nix-env -u '*'


## install packages
nix-env -iA nixpkgs.hello
nix-env -i vscodium


# Create a symlink to your profile and activate Nix profile:

export PATH=$PATH:~/.nix-profile/bin


  $ ln -s "/nix/var/nix/profiles/per-user/$USER/profile" ~/.nix-profile
  $ source /run/current-system/profile/etc/profile.d/nix.sh

  To use Nix, some environment variables should be set.
   In particular, 
   PATH should contain the directories prefix/bin and ~/.nix-profile/bin. 
   The first directory contains the Nix tools themselves, 
   while ~/.nix-profile is a symbolic link to the current user environment (an automatically generated package consisting of symlinks to installed packages). The simplest way to set the required environment variables is to include the file prefix/etc/profile.d/nix.sh in your ~/.profile (or similar), like this:


source prefix/etc/profile.d/nix.sh



In an ironic twist of fate, I’ve found that certain tools I need to use are more easily available in the Nix package repository, so I use it to install them.

https://nixos.org/channels/nixpkgs-unstable nixpkgs 

The channel needs to be updated before any packages can be installed:

nix-channel --update 
Installing packages:
nix-env -i nodejs dotnet-sdk gh hledger # nix-env -iA nixpkgs.nodejs-12_x # For a specific version


(use-service-modules nix)
(service nix-service-type)








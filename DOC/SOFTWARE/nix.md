


• Add a Nix channel and update it.  See Nix Package Manager
    Guide (https://nixos.org/nix/manual/).

• Create a symlink to your profile and activate Nix profile:

  $ ln -s "/nix/var/nix/profiles/per-user/$USER/profile" ~/.nix-profile
  $ source /run/current-system/profile/etc/profile.d/nix.sh

  To use Nix, some environment variables should be set. In particular, PATH should contain the directories prefix/bin and ~/.nix-profile/bin. The first directory contains the Nix tools themselves, while ~/.nix-profile is a symbolic link to the current user environment (an automatically generated package consisting of symlinks to installed packages). The simplest way to set the required environment variables is to include the file prefix/etc/profile.d/nix.sh in your ~/.profile (or similar), like this:


source prefix/etc/profile.d/nix.sh


sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable 
sudo nix-channel --update


You can then install stuff using sudo nix-env -i <blah> (must use sudo to access the nix-daemon


See what installable packages are currently available in the channel:
nix-env -qaP

Install some packages from the channel:
nix-env -iA nixpkgs.hello


To keep up-to-date with the channel, do:


$ nix-channel --update nixpkgs
$ nix-env -u '*'




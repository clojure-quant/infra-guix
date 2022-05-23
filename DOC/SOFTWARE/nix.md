


• Add a Nix channel and update it.  See Nix Package Manager
    Guide (https://nixos.org/nix/manual/).

• Create a symlink to your profile and activate Nix profile:

  $ ln -s "/nix/var/nix/profiles/per-user/$USER/profile" ~/.nix-profile
  $ source /run/current-system/profile/etc/profile.d/nix.sh
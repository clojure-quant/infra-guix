


sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable\n
sudo nix-channel --update
export NIXPKGS_ALLOW_UNFREE=1 # add this to avoid non-free package error
nix-shell -I nixpkgs=channel:nixos-unstable -p code-cursor
sudo nix-shell -I nixpkgs=channel:nixos-unstable -p code-cursor
sudo export NIXPKGS_ALLOW_UNFREE=1
sudo bash
/nix/store/9yxfil834gl9ymapczdz988vbnl2f4ni-cursor-0.42.4/bin/cursor


nix search vscode
nix --extra-experimental-features search vscode
nix-env -iA nixos.vscode.fhs
nix-env -iA nixos.vscode
sudo nix-env -iA nixos.vscode
nix-shell -p vscode-fhs
sudo nix-shell -p vscode-fhs
whoami
sudo bash
/nix/store/jg73wmp61bf9dlh43x56z0md588r72d0-code/bin/code


this works:
sudo herd restart nix-daemon
export NIXPKGS_ALLOW_UNFREE=1
nix-env -i vscode

nix-env --query --installed

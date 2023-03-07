# nix package manager



##  See what installable packages are currently available in the channel:
```
nix-env -qaP
```

### To keep up-to-date with the channel:
```
nix-channel --update nixpkgs
nix-env -u '*'
```

## install packages
```
nix-env -iA nixpkgs.hello

nix-env -i babashka
nix-env -i vscodium
nix-env -i nodejs dotnet-sdk gh hledger 

# For a specific version
nix-env -iA nixpkgs.nodejs-12_x 
```

## remove packages
```
nix-env --uninstall vscodium
```


# Create a symlink to your profile and activate Nix profile:

~/.nix-profile/share/applications   xdg application links      
~/.nix-profile/share/fonts/         fonts
~/.nix-profile/share/pixmaps        vscode app icon
~/.nix-profile/share/locale         locales

export PATH=$PATH:~/.nix-profile/bin

```
ln -s "/nix/var/nix/profiles/per-user/$USER/profile" ~/.nix-profile
source /run/current-system/profile/etc/profile.d/nix.sh
```

To use Nix PATH should contain the directories prefix/bin and ~/.nix-profile/bin 
- prefix/bin contains the Nix tools themselves, 
- ~ /.nix-profile is a symbolic link to the current user environment  (an automatically generated package consisting of symlinks to installed packages). 

The simplest way to set the required environment variables is to include the file prefix/etc/profile.d/nix.sh in your ~/.profile (or similar), 
```
source prefix/etc/profile.d/nix.sh
```


https://nixos.org/channels/nixpkgs-unstable nixpkgs 



(use-service-modules nix)
(service nix-service-type)

Updating all channels	nix-channel --update



Searching for packages	nix search nixpkgs packagename
Installing a package	nix-env -iA packagename
List installed packages	nix-env -q
Uninstall packages	nix-env -e packagename
Upgrade packages	nix-env -u




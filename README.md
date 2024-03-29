# infra-guix

## requirements

- guix installed (package manager (guix foreign) or guix operating system)
  For GUIX installation see DOCS/guix-foreign.md


## Understanding the Content of this Repository

Although the repo might be used for inspiration, it's not meant to be
generic in any way: it's only my configuration.

The *modules directory* contains guile modules that are used by multiple
systems. They are loaded in the guile PATH along with guix modules during
the call to the guix system command that generates the system.

The *motd and keys directories* contain data files that are meant to be
copied directly to the store, thanks to local-file.

The *machine directory* contain the actual configurations, one file per
system, named after the host-name of the system.

*manifest directory* contains manifests, a manifest is a package list that
get installed toether.

*home directory* contains guix home settings; this is user specific settings
(shell config, ssh config, user specific packages, etc)

*bootstrap directory* contains files that are needed for bootstrapping.

*artefact directory* contains guix build artefacts (virtual machine images, iso images, etc) 
it is excluded from this git repo.

# general administration

`bb tasks` to see available tasks.

## install channels (package sources)

To install my custom channels: `bb channels-install`

To upgrade all installed packages: `bb pull && bb update`

##  user - update guix package definitions

this is needed for both profile and home operations
 bb pull is better than "guix pull" because it keeps my custom channels.
`bb pull`

# user profile  (extra manifest)

use this to install a manifest (a list of packages)
available packages are in manifest directory.
  - desktop  (browser, office, chat, email)
  - emacs
  - programming (clojure)
  - ocean
  - custom (tailscale)
example: `bb profile-install desktop`


this list of packages is then installed as an *extra profile*
use `bb profile-list` to show installed profiles.

`bb profiles-upgrade` to upgrade all packages in all installed profiles

# user home (.dotfiles + packages)

available home configs are in home/config.*profile-name*.scm
  - florian-desktop  (config for: myvault, ssh, rclone, clojure, zsh, emacs, sway settings)
  - ocean (mainly cli paths, etc)

`bb home-configure florian-desktop`






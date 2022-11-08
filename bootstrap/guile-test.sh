#!/bin/sh

source ./bootstrap/guile-cache-clear.sh

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

# guile experiments
 #guix repl -- ./bootstrap/guile-test.scm

# channels
#guile -l ./channels.scm

# custom packages:
# guix build -f ./modules/awb99/package/babashka.scm
# guix build -f ./modules/awb99/package/tailscale.scm

# custom services
# guile -l ./modules/awb99/services/tailscale.scm
#guix repl -- ./modules/awb99/services/tailscale.scm


# configured services
# guile -l ./modules/awb99/config/printer.scm
# guile -l ./modules/awb99/config/iptables.scm
# guile -l ./modules/awb99/config/cron.scm
# guile -l ./modules/awb99/config/users.scm
# guix repl -- ./modules/awb99/config/desktopservices.scm
# guix repl -- ./modules/awb99/config/readymedia.scm

# package lists
# guile -l ./modules/awb99/packages/desktopsystem.scm
# guile -l ./modules/awb99/config/desktoppackages.scm

# OS
#guix repl -- ./os/nuc.scm
guix repl -- ./os/nuc2022.scm
# guix repl -- ./os/rock-min.scm

#image
# guix repl -- ./image/rock-min.scm
# guix repl -- ./image/rock-installer.scm

#guix repl -- ./manifest/bin.scm

# HOME
# guile -l ./home/config-nuc.scm

#!/bin/sh

source ./bootstrap/guile-cache-clear.sh

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

# guile experiments
# guix repl -- ./bootstrap/guiletest.scm

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
#guix repl -- ./machine/nuc.scm
# guix repl -- ./machine/nuc2022.scm
# guix repl -- ./machine/rock-min.scm
guix repl -- ./image/rock-min.scm

#guix repl -- ./manifest/bin.scm

# HOME
# guile -l ./home/config-nuc.scm

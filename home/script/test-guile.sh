#!/bin/bash

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH
# guile -l ./modules/awb99/config/printer.scm
# guile -l ./modules/awb99/config/iptables.scm
# guile -l ./modules/awb99/config/cron.scm
# guile -l ./modules/awb99/config/users.scm
# guile -l ./modules/awb99/config/desktopservices.scm
# guile -l ./modules/awb99/packages/desktopsystem.scm
# guile -l ./modules/awb99/config/desktoppackages.scm
guile -l ./machine/nuc2022.scm

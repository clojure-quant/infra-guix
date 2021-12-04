#!/bin/sh

export GUILE_LOAD_PATH=/home/florian/repo/myLinux/distros/guix/modules:$GUILE_LOAD_PATH

echo "GUILE LOAD PATH: " $GUILE_LOAD_PATH


echo "GUIX VM"
guix system vm \
   /home/florian/repo/myLinux/distros/guix/machine/vm-terminal.scm \
   --verbosity=3 \
   --no-grafts

  


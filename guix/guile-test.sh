#!/bin/sh

export GUILE_LOAD_PATH=/home/florian/repo/myLinux/distros/guix/modules:$GUILE_LOAD_PATH


echo "GUIX GUILE TEST"

guile -l /home/florian/repo/myLinux/distros/guix/modules/awb99/test.scm

#guix repl --load-path=/home/florian/repo/myLinux/distros/guix/modules

   

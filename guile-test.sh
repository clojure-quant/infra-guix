#!/bin/sh

echo "GUIX GUILE TEST"
echo "PWD:" $PWD

export GUILE_LOAD_PATH=$PWD/modules:$GUILE_LOAD_PATH
echo "GUILE LOAD PATH:" $GUILE_LOAD_PATH

guile -l ./modules/awb99/test.scm

#guix repl --load-path=/home/florian/repo/myLinux/distros/guix/modules

   

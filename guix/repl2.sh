#!/bin/sh

# echo "guix: dev environment"
# export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "GUIX REPL"

guix repl \
   ./scm/system/nuc2.scm \
   --load-path=/home/florian/repo/myLinux/distros/guix/modules
   
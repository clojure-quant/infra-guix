#!/bin/sh

# echo "guix: dev environment"
# export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "GUIX REPL"
guix repl \
   ./app/system/vm-terminal.scm \
   --load-path=/home/florian/repo/myLinux/distros/guix/modules
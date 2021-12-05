#!/bin/sh

# echo "guix: dev environment"
# export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "GUIX REPL"

guix repl \
   ./modules/awb99/config/ssh.scm \
   --load-path=./modules
   
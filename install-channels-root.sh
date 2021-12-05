#!/bin/sh

# echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

sudo guix pull --channels=/home/florian/repo/myLinux/distros/guix/app/channels.scm \
          --verbosity=3



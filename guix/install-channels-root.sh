#!/bin/sh

# echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

sudo guix pull --channels=/home/florian/repo/myLinux/distros/guix/app/channels.scm \
          --verbosity=3

# 0 means that no output is produced
# 1 is for quiet output
# 2 is similar to 1 but it additionally displays download URLs
# 3 shows all the build log output on standard error.


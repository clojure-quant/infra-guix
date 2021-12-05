#!/bin/sh


export GUILE_LOAD_PATH=/home/florian/repo/myLinux/distros/guix/modules:$GUILE_LOAD_PATH

echo "GUIX PULL (before updating config)"
# The default location (if you don't pass explicit --channels) is ~/.config/guix/channels.scm.
guix pull --channels=/home/florian/repo/myLinux/distros/guix/app/channels.scm \
          --verbosity=3 






#!/bin/sh

export GUILE_LOAD_PATH=/home/florian/repo/myLinux/distros/guix/modules:$GUILE_LOAD_PATH

echo "GUIX MANIFEST INSTALL"

guix package --manifest=/home/florian/repo/myLinux/distros/guix/app/manifest/desktop.scm \
             --verbosity=0

# verbosity: 0-3

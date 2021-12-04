#!/bin/sh

export GUILE_LOAD_PATH=/home/florian/repo/myLinux/distros/guix/modules:$GUILE_LOAD_PATH


guix environment --ad-hoc "openjdk@11"

# guix environment --ad-hoc --manifest=/home/florian/repo/myLinux/distros/guix/app/manifest/desktop.scm \
                 
                 
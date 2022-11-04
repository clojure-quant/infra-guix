#!/bin/sh
# sh and not bash, as on new guix only sh is known.

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

guix system reconfigure \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
   ./machine/nuc.scm

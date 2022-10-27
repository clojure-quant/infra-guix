#!/bin/bash

export GUILE_LOAD_PATH=./modules

guix system reconfigure \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
   ./machine/nuc.scm

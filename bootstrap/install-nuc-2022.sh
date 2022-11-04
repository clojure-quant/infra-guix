#!/bin/bash

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

# reconfigues nuc2002 system
# on the reconfiguration it will use also nonguix substitutes.
# otherwise nongnu packages will have to be compiled from source.

guix system reconfigure \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
   ./machine/nuc.scm

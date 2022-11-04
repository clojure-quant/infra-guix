#!/bin/sh
# sh and not bash, as on new guix only sh is known.

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

# reconfigures system
# on the reconfiguration it will use also nonguix substitutes.
# otherwise nongnu packages will have to be compiled from source.

guix system reconfigure \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
   ./machine/nuc2022.scm

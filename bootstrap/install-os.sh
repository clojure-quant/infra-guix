#!/bin/sh
# sh and not bash, as on new guix only sh is known.

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

# read profile from first cli parameter
# profile="desktop"
machine=$1
echo "machine (passed as parameter: " $machine

if [ -z $machine ] ; then
  echo "machine is not specified. exiting" 
  exit -4
fi

echo "machine config: ./machine/$machine.scm"

# reconfigures system
# on the reconfiguration it will use also nonguix substitutes.
# otherwise nongnu packages will have to be compiled from source.


guix system reconfigure \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
   ./machine/$machine.scm

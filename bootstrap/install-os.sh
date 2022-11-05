#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# check that MYVAULT environment variable is set.
if [ -z $MYVAULT ] ; then
  echo "MYVAULT environment variable not set. exiting" 
  exit -4
fi
echo "VAULT LOCATION: $MYVAULT"


# read profile from first cli parameter
# profile="desktop"
machine=$1
# check that we got machine parameter
if [ -z $machine ] ; then
  echo "first cli parameter needs to be machine-name. exiting" 
  exit -4
fi
echo "os-install for $machine config-file: ./machine/$machine.scm" 


export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

# reconfigures system
# on the reconfiguration it will use also nonguix substitutes.
# otherwise nongnu packages will have to be compiled from source.

guix system reconfigure \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
   ./machine/$machine.scm

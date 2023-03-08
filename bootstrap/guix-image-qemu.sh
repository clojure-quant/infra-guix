#!/bin/sh
# sh and not bash, as on new guix only sh is known.

source ./bootstrap/guile-cache-clear.sh

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
echo "docker image for $machine config-file: ./os/$machine.scm" 

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

echo "guix is building qemu file for: $machine"

# https://guix.gnu.org/manual/en/html_node/Invoking-guix-system.html

image=$(guix system image --image-type=qcow2 \
        ./os/$machine.scm)

mkdir -p artefact
cp $image artefact/$machine.qcow2
chmod +w artefact/$machine.qcow2


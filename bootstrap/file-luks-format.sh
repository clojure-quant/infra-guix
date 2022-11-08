#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# usage: ./file-luks-format.sh

# see:
# https://www.cyberciti.biz/hardware/cryptsetup-add-enable-luks-disk-encryption-keyfile-linux/

# check that MYVAULT environment variable is set.
if [ -z $MYVAULT ] ; then
  echo "MYVAULT environment variable not set. exiting" 
  exit -4
fi
echo "VAULT LOCATION: $MYVAULT"

DEV_NAME="luksnas"

echo "formatting luks partition with btrfs.."

sudo mkfs.btrfs  /dev/mapper/$DEV_NAME
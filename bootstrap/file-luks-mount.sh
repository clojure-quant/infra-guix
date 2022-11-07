#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# usage: ./file-luks-mount.sh

# see:
# https://www.cyberciti.biz/hardware/cryptsetup-add-enable-luks-disk-encryption-keyfile-linux/

# check that MYVAULT environment variable is set.
if [ -z $MYVAULT ] ; then
  echo "MYVAULT environment variable not set. exiting" 
  exit -4
fi
echo "VAULT LOCATION: $MYVAULT"

DEV_NAME="luksmount"

echo "mounting mapped luks partition in /mnt/lukstest"

sudo mkdir -p /mnt/lukstest
sudo chattr +i /mnt/lukstest

sudo mount /dev/mapper/$DEV_NAME /mnt/lukstest
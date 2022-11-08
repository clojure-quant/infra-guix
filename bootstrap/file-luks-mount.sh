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

DEV_NAME="luksnas"

echo "mounting mapped luks partition in /mnt/lukstest"

sudo mkdir -p /media/nas
#sudo chattr +i /media/nas

sudo mount /dev/mapper/$DEV_NAME /media/nas
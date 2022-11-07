#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# usage: ./file-luks-create-partition.sh /dev/sdbX media2022
# use "lsblk" or "ls /dev/sd*" to find out the disk you want to change

# see:
# https://www.cyberciti.biz/hardware/cryptsetup-add-enable-luks-disk-encryption-keyfile-linux/

# check that MYVAULT environment variable is set.
if [ -z $MYVAULT ] ; then
  echo "MYVAULT environment variable not set. exiting" 
  exit -4
fi
echo "VAULT LOCATION: $MYVAULT"

# read profile from first cli parameter
# profile="desktop"
device=$1
if [ -z $device ] ; then
  echo "device is not specified. exiting" 
  exit -4
fi   
echo "device: " $device

keyname=$2
if [ -z $keyname ] ; then
  echo "keyname is not specified. exiting" 
  exit -4
fi   
echo "keyname: " $keyname
keyfile=$MYVAULT/luks/$keyname.key
echo "keyfile: $keyfile"

sudo cryptsetup luksFormat --type luks2 $device

echo "luks keyslots after format:"
sudo cryptsetup luksDump $device

echo "adding keyfile to the secure volume"
sudo cryptsetup luksAddKey $device $keyfile

echo "luks keyslots after adding keyfile (should be 2 slots)"
sudo cryptsetup luksDump $device
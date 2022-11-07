#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# usage: ./file-luks-mount.sh /dev/sdbX media2022
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

DEV_NAME="luksmount"
cryptsetup luksOpen $device $DEV_NAME --key-file $keyfile

echo "you will now see the opened partition in lsblk:"
lsblk

echo "you can also see the status via cryptsetup:"
cryptsetup -v status luksmount

echo "or also in ls /dev/mapper : "
ls -l /dev/mapper
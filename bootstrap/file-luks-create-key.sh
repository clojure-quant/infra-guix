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
profile=$1
echo "profile (passed as parameter: " $profile

if [ -z $profile ] ; then
  echo "profile is not specified. exiting" 
  exit -4
fi   

keyname=$MYVAULT/luks/$profile.key
echo "creating new luks keyfile: $keyname"

dd if=/dev/urandom of=$keyname bs=1024 count=4

echo "luks-keys in vault in dir: $MYVAULT/luks"
ls $MYVAULT/luks

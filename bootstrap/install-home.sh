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
echo "reconfiguring guix home for profile: $profile"


export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH
extradir="$HOME/.guix-extra-profiles"

guix home reconfigure \
  ./home/config-$profile.scm

 # --verbosity=3
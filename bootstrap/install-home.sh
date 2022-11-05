#!/bin/sh
# sh and not bash, as on new guix only sh is known.

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH
extradir="$HOME/.guix-extra-profiles"

# read profile from first cli parameter
# profile="desktop"
profile=$1
echo "profile (passed as parameter: " $profile

if [ -z $profile ] ; then
  echo "profile is not specified. exiting" 
  exit -4
fi

echo "reconfiguring guix home for profile: $profile"

guix home reconfigure \
  --profile=$pd/pd \
  ./home/config-$profile.scm


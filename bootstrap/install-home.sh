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


pd="$extradir/%profile"
mkdir -p $extradir
mkdir -p $pd

guix package \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
  --profile=$pd/pd \
  --manifest=./manifest/$profile.scm


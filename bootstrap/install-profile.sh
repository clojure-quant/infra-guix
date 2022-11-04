#!/bin/sh
# sh and not bash, as on new guix only sh is known.

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

extradir="$HOME/.guix-extra-profiles"
profile="desktop"
pd="$extradir/%profile"

mkdir -p $extradir
mkdir -p $pd

guix package \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
  --profile=$pd/pd \
  --manifest=./manifest/$profile.scm


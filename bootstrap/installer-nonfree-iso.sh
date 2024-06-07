#!/bin/sh

guix system image \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
  --image-size=16G \
  --cores=6 \
  --no-grafts \
  --image-type=iso9660 \
  ./os/installer-nonfree.scm
#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# usage: ./file-luks-nas-end.sh

echo "unmounting nas"

sudo umount /media/nas
sudo cryptsetup luksClose luksnas
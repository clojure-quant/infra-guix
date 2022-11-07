#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# usage: ./file-luks-nas-end.sh

echo "unmounting nas"

sudo umount /mnt/nas2
sudo cryptsetup luksClose luksnas
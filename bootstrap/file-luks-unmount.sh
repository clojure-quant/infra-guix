#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# usage: ./file-luks-unmount.sh

echo "unmounting test volume"

sudo umount /mnt/lukstest
sudo cryptsetup luksClose luksmount
#!/bin/sh
# sh and not bash, as on new guix only sh is known.

# usage: ./file-luks-nas-start.sh
# see:

sudo cryptsetup luksOpen /dev/sda1 luksnas2 --key-file /home/florian/repo/myLinux/myvault/luks/media2022.key

sudo mkdir -p /mnt/nas2
# sudo chattr +i /mnt/nas

sudo mount /dev/mapper/luksnas2 /mnt/nas2
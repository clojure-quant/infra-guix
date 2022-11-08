#!/bin/sh
# sh and not bash, as on new guix only sh is known.

echo "PATH: $PATH"

# usage: ./file-luks-nas-start.sh
# see:

sudo cryptsetup luksOpen /dev/sda1 luksnas --key-file /home/florian/repo/myLinux/myvault/luks/media2022.key

sudo mkdir -p /media/nas
# sudo chattr +i /mnt/nas

sudo mount /dev/mapper/luksnas /media/nas
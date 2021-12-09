#!/bin/sh

sudo lsblk -a

# our drive is /dev/sda  1.8T 

guix install parted  btrfs-progs

# 1. CREATE A PARTITION

# btfrs guix package:

# sudo mkfs.btrfs -L nas -f /dev/sda

# mkfs.btrfs /dev/tecmint_vg/tecmint_lv1
# sudo mkfs.btrfs -L btrfs /dev/sda1

parted --script /dev/sda mklabel gpt \
  mkpart primary ext2 1M 3M \
  mkpart primary ext2 3M 1800G 
 # \\
 # set 1 boot on \\
 # set 1 bios_grub on



# 2. FORMAT PARTITION

# The -L option is used to specify the volume label.
mkfs.btrfs -L nas /dev/sda2

#;btrfs subvolume create /mnt/home


# 3. MOUNT PARTITION

# sudo mkdir /nas
# sudo mount /dev/sda2 /nas
# sudo umount /dev/sda2



# (file-system
#   (device (file-system-label "nas"))
#   (mount-point "/nas")
#   (type "btrfs"))











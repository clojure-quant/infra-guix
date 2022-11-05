#!/bin/sh

; dont run this by mistake
exit

# why btrfs

# In the Ext4 filesystem, you define the number of inodes the filesystem can 
# supports while you create the filesystem. You can’t change it after the 
# filesystem is created. If you create too many small files, you may have 
# free disk space left on your filesystem, but you won’t be able to create 
# new files/directories unless you have free inodes. This is a big 
# limitation of the Ext4 filesystem.

# In the Btrfs filesystem, the inode allocation is flexible. The filesystem 
# can add as many inodes as needed. So, you will never run out of inodes.
# The Btrfs filesystem supports multiple devices and has built-in RAID support. 
# The Btrfs filesystem has a built-in logical volume manager
# (LVM) that is used to add multiple storage devices or partitions to a 
# single Btrfs filesystem. 
# A single Btrfs filesystem can span over multiple disks and partitions.

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


# raid
# mkfs.btrfs -L btrfs -m raid1 -d raid0 /dev/nvme0n1p2 /dev/sda1









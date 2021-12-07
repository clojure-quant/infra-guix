

 fdisk -c /dev/sdb

sudo cfdisk /dev/sdb


btrfs-progs-static
btrfs-progs


sudo lsblk
# mkfs.btrfs /dev/tecmint_vg/tecmint_lv1

sudo mkfs.btrfs -L btrfs /dev/sdb1
The -L option is used to specify the volume label.
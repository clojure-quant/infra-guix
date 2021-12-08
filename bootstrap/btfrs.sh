
sudo lsblk -a

# our drive is /dev/sda

# fdisk -c /dev/sda

# create a partition - Choose ‘8e‘ for Linux LVM and press Enter to apply
sudo cfdisk /dev/sda


# btfrs guix package: btrfs-progs
# The -L option is used to specify the volume label.
sudo mkfs.btrfs -L nas -f /dev/sda

# mkfs.btrfs /dev/tecmint_vg/tecmint_lv1
# sudo mkfs.btrfs -L btrfs /dev/sda1

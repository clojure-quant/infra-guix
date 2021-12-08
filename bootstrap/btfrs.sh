
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


parted --script /dev/vdb mklabel gpt \\
  mkpart primary ext2 1M 3M \\
  mkpart primary ext2 3M 2G \\
  set 1 boot on \\
  set 1 bios_grub on

mkfs.btrfs -L my-root /dev/vdb2

mount /dev/vdb2 /mnt

;btrfs subvolume create /mnt/home

(file-system
                          (device (file-system-label "my-root"))
                          (mount-point "/")
                          (type "btrfs"))




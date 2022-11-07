
# luks disk encryption

https://libreboot.org/docs/gnulinux/guix_system.html


# auto mount usb disk:
udisks probably


# ext4 with large inodes:
tune2fs -O large_dir /dev/sdd3


# show inodes on ext4:
df -i




;connman ;call connmanctl
                       cryptsetup
                       dosfstools ;mkfs.fat
                       e2fsprogs ;mkfs.ext4
                       lvm2-static ;dmsetup
                       btrfs-progs ; mkfs.btrfs
                       jfsutils ;jfs_mkfs
                       ntfs-3g ;mkfs.ntfs
                       xfsprogs ;mkfs.xfs
                       kbd ;chvt
                       guix ;guix system init call
                       util-linux ;mkwap



# luks disk encryption

https://libreboot.org/docs/gnulinux/guix_system.html


# auto mount usb disk:
udisks probably


# ext4 with large inodes:
tune2fs -O large_dir /dev/sdd3


# show inodes on ext4:
df -i
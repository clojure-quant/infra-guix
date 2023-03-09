
# luks disk encryption

https://libreboot.org/docs/gnulinux/guix_system.html


# auto mount usb disk:
udisks probably


# ext4 with large inodes:
tune2fs -O large_dir /dev/sdd3


# show inodes on ext4:
df -i

# disk
free
free –g   how many GB ram the system has.
free –t total ram including swap memory
df -h.  	disk free –h  (h=human readable)
df –t   	type of file system.
du -cks *|sort -rn|head 	calculate the recursive file usage of sub dirs.
du –h shows all files with size.

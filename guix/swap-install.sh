#!/bin/sh



# This is 10 GiB of swap space.  Adjust "count" to change the size.
dd if=/dev/zero of=/mnt/swapfile bs=1MiB count=10240
# For security, make the file readable and writable only by root.
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
#!/bin/sh



# This is 10 GiB of swap space.  Adjust "count" to change the size.
# dd if=/dev/zero of=/mnt/swapfile bs=1MiB count=10240

sudo dd if=/dev/zero of=/mnt/swapfile bs=1MiB count=5120

# For security, make the file readable and writable only by root.
sudo chmod 600 /mnt/swapfile
sudo mkswap /mnt/swapfile
sudo swapon /mnt/swapfile
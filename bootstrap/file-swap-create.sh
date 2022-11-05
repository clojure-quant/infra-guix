#!/bin/sh

# This is 10 GiB of swap space.  
# sudo dd if=/dev/zero of=/mnt/swapfile bs=1MiB count=5120
sudo dd if=/dev/zero of=/mnt/swapfile bs=1MiB count=10240

# For security, make the file readable and writable only by root.
sudo chmod 600 /mnt/swapfile
sudo mkswap /mnt/swapfile
sudo swapon /mnt/swapfile

echo "run glances to see if swap is working ..."

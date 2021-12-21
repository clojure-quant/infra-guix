#!/bin/bash




# resize partition.
# from: https://stumbles.id.au/getting-started-with-guix-deploy.html
echo "select the /dev/vda2 root partition, select Resize, Write and type yes"
sudo cfdisk

pause

sudo resize2fs /dev/vda2
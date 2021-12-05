#!/bin/sh

# https://stumbles.id.au/getting-started-with-guix-deploy.html

export GUILE_LOAD_PATH=/home/florian/repo/myLinux/distros/guix/modules:$GUILE_LOAD_PATH

# export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "DEPLOYING TO DIGITAL OCEAN .."

guix deploy ./machine/ocean.scm


# "echo 'Hello World!' > /var/www/index.html"


# cfdisk, select the /dev/vda2 root partition, select "Resize", "Write" and type "yes". 
# Then resize the filesystem to match by running resize2fs /dev/vda2.
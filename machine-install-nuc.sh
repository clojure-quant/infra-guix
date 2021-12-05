#!/bin/sh

# It is highly recommended to run guix pull once before you run 
# guix system reconfigure for the first time  Failing to do that 
# you would see an older version of Guix once reconfigure has completed. 
./guix-pull.sh

hash guix
export GUILE_LOAD_PATH=/home/florian/repo/myLinux/distros/guix/modules:$GUILE_LOAD_PATH

echo "GUIX RECONFIGURE"
guix system reconfigure \
   /home/florian/repo/myLinux/distros/guix/machine/nuc.scm 
#   \
#   --load-path=/home/florian/repo/myLinux/distros/guix/modules
  

# show new system
echo "GUIX DESCRIBE"
guix system describe


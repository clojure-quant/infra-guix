#!/bin/sh

echo "reconfiguring os config rock-ssh"
echo "PWD:" $PWD

export GUILE_LOAD_PATH=$PWD/modules:$GUILE_LOAD_PATH
echo "GUILE LOAD PATH:" $GUILE_LOAD_PATH

# sudo 
guix system reconfigure ./machine/rock-ssh.scm 
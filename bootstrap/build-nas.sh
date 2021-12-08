#!/bin/sh

echo "reconfiguring os config rock-nas"
echo "PWD:" $PWD

export GUILE_LOAD_PATH=$PWD/modules:$GUILE_LOAD_PATH
echo "GUILE LOAD PATH:" $GUILE_LOAD_PATH
guix system reconfigure ./machine/rock-nas.scm 
#!/bin/sh

echo "reconfiguring os config rock-ssh"

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH
sudo guix system reconfigure ../machine/rock-ssh.scm
#!/bin/sh

export GUILE_LOAD_PATH=./scm:/home/florian/repo/myLinux/distros/guix/dotfiles/.config/shepherd/init.d:$GUILE_LOAD_PATH

echo "HERD USER SERVICES: " $GUILE_LOAD_PATH

shepherd \
  --config=/home/florian/repo/myLinux/distros/guix/dotfiles/.config/shepherd/init.scm


# this starts shepherd bin as user app.
# to stop user herd:
# herd stop root

# herd detailed-status
# herd status
# herd start syncthing 
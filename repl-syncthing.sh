#!/bin/sh


export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "HERD USER SERVICES"
shepherd \
  --config=./dotfiles/.config/shepherd/init.scm

#!/bin/sh

export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH



cp -r ./dotfiles/.config/. ~/.config
cp -r ./dotfiles/.ssh/. ~/.ssh



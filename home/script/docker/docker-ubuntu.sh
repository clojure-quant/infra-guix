#!/bin/sh

# echo "guix: dev environment"
# export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "RUNNING UBUNTU DOCKER IMAGE"

sudo docker run -p 6080:80 -v /dev/shm:/dev/shm dorowu/ubuntu-desktop-lxde-vnc

echo "Browse http://127.0.0.1:6080/"

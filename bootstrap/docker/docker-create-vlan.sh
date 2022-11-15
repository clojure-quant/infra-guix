#!/bin/sh

docker network create -d macvlan \
       --subnet=192.168.0.0/24 \
       --gateway=192.168.0.1 \
       -o parent=wlo1 macvlan0

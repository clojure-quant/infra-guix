#!/bin/sh

scp -r -i "~/adminsshkey"  root@pinkgorilla.org/home/pinkgorilla/log/* /tmp/pinkgorillalog

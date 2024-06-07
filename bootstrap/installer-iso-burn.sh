#!/bin/sh

sudo dd if=/home/florian/Downloads/guix-system-install-1.4.0.x86_64-linux.iso of=/dev/sdb status=progress oflag=sync
sync

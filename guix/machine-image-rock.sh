#!/bin/sh

# https://othacehe.org/hosting-a-blog-using-only-scheme.html

export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "IMAGE FOR ROCK PRO .."

# guix system disk-image ./app/system/server.scm --image-size=4G
guix system image ./machine/rock1.scm --image-size=4G



# lsblk -a
# dd if=/gnu/store/6jfll8l8xm3rbq7axl8gvy46jdczq509-rock64-barebones-raw-image of=/dev/mmcblk0 bs=4M
# /gnu/store/6jfll8l8xm3rbq7axl8gvy46jdczq509-rock64-barebones-raw-image


# echo "qemu-img convert -c -f raw -O qcow2 /gnu/store/r4kzcncfvr8l7j9rmmigja73jlhsic6b-disk-image  /tmp/server.qcow2"



# https://cloudinit.readthedocs.io/en/stable/
# guix package: cloud-utils    has cloud-init

# FWIW, I wrote Guile AWS[1], which may be useful for doing the same with
# AWS as a backend.

# 178.128.203.133
# cloud.digitalocean.com
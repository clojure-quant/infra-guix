#!/bin/sh

# https://othacehe.org/hosting-a-blog-using-only-scheme.html

export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "IMAGE FOR DIGITAL OCEAN .."

# guix system disk-image ./app/system/server.scm --image-size=5G
guix system image ./modules/awb99/system/server.scm --image-size=5G

echo "qemu-img convert -c -f raw -O qcow2 /gnu/store/r4kzcncfvr8l7j9rmmigja73jlhsic6b-disk-image  /tmp/server.qcow2"



# https://cloudinit.readthedocs.io/en/stable/
# guix package: cloud-utils    has cloud-init

# FWIW, I wrote Guile AWS[1], which may be useful for doing the same with
# AWS as a backend.

# 178.128.203.133
# cloud.digitalocean.com
#!/bin/sh

# ; to check which device is the usb stick:
# lsblk

sudo dd \
  if=/gnu/store/6g1f98fkc56dzpr09v24jcph24lb2l15-image.iso \
  of=/dev/sda \
  status=progress \
  oflag=sync

sync

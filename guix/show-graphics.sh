#!/bin/sh

echo "identifying hardware (might be it is not configured"
# lspci | grep VGA
# Only VGA is not good enough, because Nvidia mobile adapters are 
# shown as 3D and some AMD adapters are shown as Display.
lspci -k | grep -EA3 'VGA|3D|Display'

echo "checking correct X driver is loaded"
# glxinfo is in guix package mesa-utils
glxinfo | grep -i "vendor\|rendering"

echo "X Config:"
ls /etc/X11/xorg.conf

#lsmod | grep "kms\|drm"
#find /dev -group video
#cat /proc/cmdline
#find /etc/modprobe.d/
#cat /etc/modprobe.d/*kms*
#grep LoadModule /var/log/Xorg.0.log

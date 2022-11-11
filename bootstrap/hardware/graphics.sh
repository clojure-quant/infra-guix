#!/bin/sh

ls /sys/class/drm/card*

# You can get all supported resolutions by this command, use the adapter which you are using			
cat /sys/class/drm/card0-HDMI-A-1/modes			

# this is the card nuc/dp big monitor is on.
cat /sys/class/drm/card0-DP-1/modes
# 3840x2160


# guix install edid-decode
# this shows A LOT of info
cat /sys/class/drm/card0-DP-1/edid |edid-decode
# 3840x2160   30.000 Hz  16:9 


#If you want to list all the modes the compositor supports (might not be the same as your monitor), you can run weston-info
# The simplest way is to check the weston log which will give you all supported modes for each connector(VGA,LVDS and HDMI)
# first get my monitor information using this command:
swaymsg -t get_outputs
# Current mode: 3840x2160 @ 60.000 Hz


# set mode..
# swaymsg output DP-3 mode 3440x1440@144Hz position 0 0

lshw -c video

# this shows intel driver:
lspci -k | grep -EA3 'VGA|3D|Display'


# Enlightenment has a new display manager called Entrance,
#  which is provided by the entrance-gitAUR package. Entrance is quite sophisticated and its configurat


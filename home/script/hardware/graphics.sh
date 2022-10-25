#!/bin/sh

ls /sys/class/drm/card*

# You can get all supported resolutions by this command, use the adapter which you are using			
cat /sys/class/drm/card0-HDMI-A-1/modes			

# this is the card nuc/dp big monitor is on.
cat /sys/class/drm/card0-DP-1/modes
# 3840x2160


# guix install edid-decode



#If you want to list all the modes the compositor supports (might not be the same as your monitor), you can run weston-info

The simplest way is to check the weston log which will give you all supported modes for each connector(VGA,LVDS and HDMI)


first get my monitor information using this command:

swaymsg -t get_outputs

swaymsg output DP-3 mode 3440x1440@144Hz position 0 0
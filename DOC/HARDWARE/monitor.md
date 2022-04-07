# control of montor brightness

ddcutil
location: gnu/packages/hardware.scm:243:2
homepage: https://www.ddcutil.com/
synopsis: Control external monitor settings

find out the id of the monitor:
ddcutil detect

get brightness:
sudo ddcutil --bus 5 getvcp 1

set brightness:
sudo ddcutil --bus 5 setvcp 10 100
sudo ddcutil --bus 5 setvcp 10 50

sudo ddcutil detect
Display 1
   I2C bus:  /dev/i2c-5
   EDID synopsis:
      Mfg id:               CEX
      Model:                CX133
      Product code:         4688
      Serial number:
      Binary serial number: 1 (0x00000001)
      Manufacture year:     2020,  Week: 34
   VCP version:         2.1



# sway

## udev rules for brightness:
here is a problem: all the commands we have run require root access, we don’t have access to /dev/i2c-5.
Create group i2c:            groupadd i2c
Add your user to i2c group:  usermod -aG i2c lsanche
Create a udev rule to make the changes permanent:
# echo 'KERNEL=="i2c-[0-9]*", GROUP="i2c"' >> /etc/udev/rules.d/10-local_i2c_g

change the brightness command again as a non-root user

https://lyndeno.ca/posts/setting-up-external-monitor-brightness/


bindsym $mod+F12 exec ddcutil --bus 5 setvcp 10 + 10
bindsym $mod+F11 exec ddcutil --bus 5 setvcp 10 - 10
bindsym ctrl+$mod+F12 exec ddcutil --bus 5 setvcp 10 100
bindsym ctrl+$mod+F11 exec ddcutil --bus 5 setvcp 10 0

# ddcui
ddcui
xwindows ui. does not work on wayland


# CONTROL OF THE LEDS (CAPSLOCK / NUMLOCK)

guix install light
sudo light -S 50

guix install brightnessctl
sudo brightnessctl -l
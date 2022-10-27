#  wmctrl

# list [l] windows including their classname[x]
wmctrl -x -l

# shows desktops available
wmctrl -d

# sets the number of desktops to 4
wmctrl -n 4

# -v verbose logging (shows what it is doing)

# move firefox to terminal (desktop) #3 (0 is the first)
# the name does not have to be complete
wmctrl -r firefox -t 3
wmctrl -r Chromium -t 3

# move a virtualmachine runing win7 (named win7) to terminal 1).
wmctrl -r win7 -t 1

# this is not working: move VirtualBox by classname ot other desktop
# wmctrl -x -r VirtualBox.VirtualBox -t 2

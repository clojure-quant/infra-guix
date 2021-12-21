#!/bin/bash

#xfce4-terminal --title=tbongo &
#sleep 1
#wmctrl -r tbongo -t 4
#wmctrl -r tbongo -e 0,10,10,2000,2000
#wmctrl -r tbongo -b toggle,fullscreen

chromium &
sleep 1
wmctrl -r Chromium -t3
wmctrl -r Chromium -b toggle,fullscreen
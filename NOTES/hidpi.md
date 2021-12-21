


https://wiki.archlinux.org/title/HiDPI#Chromium_/_Google_Chrome
https://wiki.archlinux.org/title/HiDPI#Enlightenment

xrandr --output eDP1 --scale 1.25x1.25

Gnome
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"
$ gsettings set org.gnome.desktop.interface scaling-factor 2
~/.Xresources
Xft.dpi: 192

! These might also be useful depending on your monitor and personal preference:
Xft.autohint: 0
Xft.lcdfilter:  lcddefault
Xft.hintstyle:  hintfull
Xft.hinting: 1
Xft.antialias: 1
Xft.rgba: rgb
For Xft.dpi, using integer multiples of 96 usually works best, e.g. 192 for 200% scaling.

Make sure the settings are loaded properly when X starts, for instance in your ~/.xinitrc with xrdb -merge ~/.Xresources (see Xresources for more information).

For E18, go to the E Setting panel. In Look > Scaling, you can control the UI scaling ratios. A ratio of 1.2 seems to work well

enlightenment-wayland


http://www.pcworld.com/article/2911509/how-to-make-linuxs-desktop-look-good-on-high-resolution-displays.html
https://wiki.archlinux.org/index.php/HiDPI
cinnamon> hidpi - perfect 
Gnome: hidpi

gnome 3.16 still has a few problems: The scrollbars in all Gtk2 apps are too narrow. You can manually tweak this by opening the file: usr/share/themes/Adwaita/gtk-2.0/gtkrc and doubling the ‘slider-width’ from 13 to 26

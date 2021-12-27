


# guix install xrandr gsettings-desktop-schemas

xrandr --dpi 300

# For Xft.dpi, using integer multiples of 96 usually works best, e.g. 192 for 200% scaling.
# by default xorg's dpi is 96 for compatibility with Windows (or something close)
# (it's not persisted)
# invoke xrandr in my .xsession
# mine is in .xinitrc, but that's what runs my session
# and yes, I think you have to relogin to see changes

# fc-
fc-list |more
gsettings list-recursively org.gnome.desktop.interface
gsettings set org.gnome.desktop.interface font-name Iosevka

gsettings set org.gnome.desktop.interface monospace-font-name 'Iosevka 20'
gsettings set org.gnome.desktop.interface document-font-name  'Iosevka 16'
gsettings set org.gnome.desktop.interface font-antialiasing 'none'
gsettings set org.gnome.desktop.interface font-antialiasing 'grayscale'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

gsettings set org.gnome.desktop.interface text-scaling-factor 2.0



;'Cantarell 11
  he type of antialiasing to use when rendering fonts. 
  Possible values are: “none” for no antialiasing, 
  “grayscale” for standard grayscale antialiasing
  , and “rgba” for subpixel antialiasing (LCD screens only).
   


<apteryx> awb99: what I do with ratpoison is use xrandr to set the DPI via --dpi
<apteryx> and then hack the Xft.dpi value accordingly in .Xresources
<apteryx> and then the font sizes in a few places... it's a mess
<civodul> apteryx: that'd only work for old programs like xterm
<civodul> "normal apps" do client-side font rendering via gtk and all that

GTK uses .Xresources (Xft.dpi)
<apteryx> at least some GTK applications (Gimp correctly uses the xorg server's DPI setting)
<apteryx> but others such as Icecat don't
<apteryx> IIRC
<apteryx> when you're done configuring your DPI, you can start e.g. Inkscape,
 and see if an A4 sized document corresponds on your screen to the real thing.


this works for chromium on wayland:
chromium --force-dark-mode --enable-features=WebUIDarkMode
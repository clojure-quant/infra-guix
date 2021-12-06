


# guix install xrandr gsettings-desktop-schemas

xrandr --dpi 300

# (it's not persisted)
# invoke xrandr in my .xsession
# mine is in .xinitrc, but that's what runs my session
# and yes, I think you have to relogin to see changes


<apteryx> awb99: what I do with ratpoison is use xrandr to set the DPI via --dpi
<apteryx> and then hack the Xft.dpi value accordingly in .Xresources
<apteryx> and then the font sizes in a few places... it's a mess
<civodul> apteryx: that'd only work for old programs like xterm
<civodul> "normal apps" do client-side font rendering via gtk and all that
<apteryx> GTK uses .Xresources
<apteryx> (Xft.dpi)
<civodul> oh? nice
<apteryx> at least some GTK applications (Gimp correctly uses the xorg server's DPI setting)
<apteryx> but others such as Icecat don't
<apteryx> IIRC
<civodul> heh, so like you say, it's a mess :-)
<apteryx> when you're done configuring your DPI, you can start e.g. Inkscape,
 and see if an A4 sized document corresponds on your screen to the real thing.
<apteryx> by default xorg's dpi is 96 for compatibility with Windows (or something close)
-*- apteryx laughs
<apteryx> or perhaps s/windows/legacy systems/
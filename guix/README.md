







;; auto mount usb drives ??

udevil


/var/log/messages
they are syslog logs, awb99, and the kernel ‘dmesg’ is one of the things that it logs
--MARK-- ;   That's just syslog logging that it's still alive but there's nothing to say.

wb99: Since the culprit is cpuidle_enter_state, you could try booting with ‘cpuidle.off=1’ first.

Add it to the (kernel-arguments (list "cpuidle.off=1" [stuff you might already have])).

awb99: This cpuidle_enter_state shows up in wildly different random bug reports over the decade (ZFS, …) where it's obviously not the culprit, but yours is interesting in that the call trace is rather short, and the idle subsystem may actually be to blame for once.  This is still just a guess though.  I'm not very familiar with that part of the kernel.  This is not related to Guix, so be sure to ask other channels (maybe #linux, if that's any good) if disablin It's also possible there are more specific error messages in the kernel log before that point.  The kernel logs ‘Linux version …’ every time it boots, everything between that & the stack trace you posted is from the same boot.

uname -srm
Linux 5.14.9-gnu x86_64



https://github.com/wting/autojump
Guix  autojump or fasd

https://github.com/clvv/fasd

guix install xrandr gsettings-desktop-schemas

xrandr --dpi 300
 I put this in my .xsession (it's not persisted)

rather, I invoke xrandr in my .xsession
and yes, I think you have to relogin to see changes
mine is in .xinitrc, but that's what runs my session

gsettings-compile-schema, use glib:bin

<apteryx> awb99: what I do with ratpoison is use xrandr to set the DPI via --dpi
-*- civodul hits ENOSPC, means it's been a busy day
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


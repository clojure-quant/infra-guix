Linux -  LENOVO YOGA 3

Intel HD Graphics 5300
the Intel Core M processor  (Yoga 2 Pro had i5)

change bios
when powered off, press the key with a pen.
F2 (setup) and F12 (boot options)  don’t forget to hit the orange “FN” key so your function keys actually work! 
Secure Boot [Enabled] Boot Mode [Legacy] Fast Boot [Disabled] USB Boot [Enabled]

http://keithcu.com/wordpress/?p=3641 one year arch on yoga 

WLAN DRIVER
uname -v → dann den wlan treiber der version anpassen
pacman -S extra/linux318-broadcom-wl

Improve battery life

TLP is an advanced power management tool for Linux that automatically handles settings and tweaks to enhance the battery live and power saving. It does not have a GUI and just runs in the background.
sudo apt-add-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw smartmontools ethtool powertop
sudo tlp start
Generic Linux kernel tweaks: Modifying Grub boot config
Linux kernel has a power regression problem. See http://www.phoronix.com/scan.php?page=article&item=intel_i915_power
This fix tweaks the Grub bootloader and helps extend battery life. Edit your grub config as follow:
$ sudo vim /etc/default/grub

Replace GRUB_CMDLINE_LINUX_DEFAULT:
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash pcie_aspm i915.lvds_downclock=1 i915.i915_enable_rc6=1 i915.i915_enable_fbc=1
Sync Grub
$ sudo update-grub
$ sudo reboot
11. Now comes the cosmetics:
- get bigger fonts - System->Preference->Display set to 2.5
- set Firefox bigger -> about:config -> search for layout.css.devPixelsPerPx -> set to 2.5
- set Thunderbird bigger -> Pref -> Advanced -> Custom Config -> layout.css.devPixelsPerPx -> set to 2.5
- lightdm logon bigger size -> /etc/lightdm/lightdm-gtk-greeter.conf -> put a line: xft-dpi=384
- apt-get install chromium-browser - which gives you touch based pinch zoom browsing (firefox cannot at this moment)I 
- touch keyboard; I tried the default /usr/bin/onboard in Universal Access, but it doesn't quite display well... so I installed Florence and make it a little manual to pop up that sort
- screen orientation: it does not rotate auto, so:
xrandr -o left
xrandr -o right
https://github.com/longsleep/yoga3pro-linux/blob/master/Yoga%203%20Linux%20HOWTO.md
https://plus.google.com/108110137184055365183/posts/SvFMpaRUChz
http://blog.xopr.net/2015/07/lenovo-yoga-3-linux-mint-17-2-installation/
http://keithcu.com/wordpress/?p=3270

http://askubuntu.com/questions/549392/ubuntu-on-lenovo-yoga-3-pro


I have to 'force' it (Ubuntu: using the xrandr tool 
I made my Dell U2711 work at 2560x1440 over HDMI, by pointing xorg.conf to a custom EDID file someone created.


It uses pacman by default which allows you access to a few repos and such.
 There's also the AUR (Arch User Repo) that lets you install a plethora of new software, but requires a different package manager. 
My personal favorite is packer for this as it ties in nicely with pacman as well. I wrote a couple of aliases to make pkg_update 

https://wiki.archlinux.org/index.php/Window_manager

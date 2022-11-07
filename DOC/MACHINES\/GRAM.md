# LG Gram 17


bios
To enter the BIOS press F2 once the LG logo appears.
Hold F10 for the boot menu
 don’t forget to hit the orange “FN” key so your function keys actually work! 
Secure Boot [Enabled] Boot Mode [Legacy] Fast Boot [Disabled] USB Boot [Enabled]

My BIOS version is W1ZD1180 X64 01/29/2019

you have to disable secure boot in BIOS. In BIOS, select the 'Security' tab, then 'Secure Boot Information' and disable 'Secure Boot Option'. Then you should be able to boot from the USB stick.

Where did you get that BIOS? Can you tell a difference to the old one?
It was updated through Windows 10 update (EFI method). Simply open Settings/Windows Update and check for update. I can't see any difference yet

USB Power Delivery (PD) 3.0 on Type C port
Power profile:
5V @2A(10W),
9V @3A(27W),
15V @3A(45W),
20V @5A(100W)

NVME
M.2 2280 SSD and the interface as SATA3. There are two M.2 slots in gram. One has NVMe x 4 iwhich means 4 PCIe lanes are supported, so it works at 4GB/s. The other one support 2 PCIe lanes, so it works at 2GB/s.
I installed a SAMSUNG 970 Pro and it works great.

RAM
one of the 8GB modules is soldered into motherboard and can't be replaced but the 2nd module is replaceable to a higher capac. The largest compatible SODIMM I could find was 16GB. I purchased a 16GB DDR4-2400 SODIMM from Crucial and installed it. That combined with the soldered on 8GB of ram gives me a total of 24GB RAM which is the maximum that I can tell.
16GB DDR4 2400MHz. They also state max. ram size is 24 GB when it is in fact 40 GB.
Dual Slot DDR4 2133MHz

The first is that the motherboard or processor will not support the faster memory speed. When this happens, the modules are instead clocked at the fastest speed that they can support. For instance, a motherboard and CPU that can support up to 2133MHz memory can use 2400MHz RAM but only run it up to the 2133Mhz.

LINUX

I installed Elementary OS on mine, it was tricky. The bios doesn't have a lot of options and it took a while to get it to boot off the USB in UEFI mode. That said, once installed all the camera, keyboard back light, mic, speakers, webcam all work well. The only thing that I didn't look into was the fingerprint reader.

No, I don't have any special kernel options, this is my /etc/default/grub:

GRUB_CMDLINE_LINUX="rd.md=0 rd.lvm=0 rd.dm=0 vconsole.keymap=us $([ -x /usr/sbin/rhcrashkernel-param ] && /usr/sbin/rhcrashkernel-param || ￼rd.luks=0 vconsole.font=latarcyrheb-sun32 rhgb quiet resume=UUID=a9898dbc-e69c-40d2-a1c2-141b9aa8bfe0"

and I also have no ACPI related kernel error messages in system journal. I have stock fedora 29 kernel (currently 5.0.5-200.fc29.x86_64), lg-laptop module is already compiled in, so I can use majority of LG keys (keyboard backlight etc) under fedora.

Overall a good review, but they really missed pointing out the 16:10 screen.

As far as I can tell, everything works and is stable with pci=nommconf.

I've found Linux support hit and miss. A lot of DE's don't have very good support for fractional scaling, which is really required by this display as 2x is far too large. I've found the best support so far using Deepin DE. GNOME seems to not work correctly with browsers causing them to look like interpolated scaling. Both Chrome and Firefox look sharp and correctly scaled in Deepin. I've only had one app look strange, and it appears to be one that tries to handle scaling on it's own, then Deepin scales it further, looking a little too large. But it's fine in the case of this particular app.


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

Sync Grub
$ sudo update-grub
$ sudo reboot
Fractional scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"


Power management

sudo dnf install tlp tlp-rdw
sudo tlp start
https://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html

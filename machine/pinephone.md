# Pine phone

Multiboot
https://xnux.eu/p-boot-demo/

# OS
Postmarket os Based on alpine linux
Manjaro
Arch
Mobian - Debian for mobile.
Ubports (ubuntu touch) both os and ui.

# Window manager
https://forum.pine64.org/showthread.php?tid=12445
Phosh phone shell by purism for librem phone. Gnome.
Plasma mobile: KDE.
Ubports (ubuntu touch) https://ubuntu-touch.io/ 
Ubports: von ubuntu touch geforkt
lorimi - together with ubports
Sxmo Simple X Mobile interface, a tiling WM based interface  Sxmo https://images.lrdu.org/pinephone/
https://sr.ht/~mil/Sxmo/ https://git.sr.ht/~mil/sxmo-docs/tree/master/USERGUIDE.md
the default username/password combination is: mo/mo

# Apps
Mirage   matrix client
Lollypop. Music player
Discord
https://www.kirsle.net/status-of-mobile-linux-apps-on-pinephone-screenshots

you did in the terminal scale-to-fit telegramdesktop? that spelling and capitalization exactly?

Add a Telegram account in Chatty



# Postmarket os (alpine basd)
https://wiki.postmarketos.org/wiki/PINE64_PinePhone_(pine64-pinephone)
https://images.postmarketos.org/bpo/edge/pine64-pinephone/
https://wiki.postmarketos.org/wiki/PINE64_PinePhone_(pine64-pinephone)#Download_the_right_image
The login is user with password 147147
Postmarket os has installer version that writes to emmc.
Posh https://images.postmarketos.org/bpo/edge/pine64-pinephone/phosh/
Plasma mobile https://images.postmarketos.org/bpo/edge/pine64-pinephone/plasma-mobile/
Sxmo https://images.postmarketos.org/bpo/edge/pine64-pinephone/sxmo/


# manjaro
https://forum.manjaro.org/tag/pinephone

# Posh
https://forum.manjaro.org/t/manjaro-arm-beta5-with-phosh-pinephone/49917
https://osdn.net/projects/manjaro-arm/storage/pinephone/phosh/beta5/
https://github.com/manjaro-pinephone/phosh-dev/releases
Lots of preinstalled apps

# Anbox
The premade users are: User: manjaro Password: 123456 User: root password: root


Plasma mobile: KDE. (manjaro responsible for kde) looks like x windows. I dont like it.
2 beta releases manjaro.
The preconfigured users are: User: kde Password: 123456 User: root password: root


Sxmo (edge only): 
demo/147147

lorimi - together with ubports


Arch

https://github.com/dreemurrs-embedded/Pine64-Arch/releases/tag/20201223https://github.com/dreemurrs-embedded/Pine64-Arch/releases/tag/20201223

Others

Sway
I3 window manager.

Mobian: Debian

Sailfish
Was used on sony x.

Lune os
Was used for palm 3.




# write ISO image to a stick/usb disk

sudo fdisk -l   lists disks and partitions
sudo gparted    remove all partitions from USB drive

write image to disk
sudo dd bs=8M of=/dev/sdb  if=./manjaro-kde-0.8.13.1-x86_64.iso 

# Install to emmc
there’s a bit of a performance hit when you do this, because the data transfer rates for the PinePhone and PineTab microSD card readers aren’t very fast. So you may want to consider flashing a new OS directly to the device’s built-in eMMC storage.

In order to use JumpDrive, just download the latest release, use a tool like balenaEtcher to flash the disk image to a microSD card, turn off your phone or tablet, insert the card, and turn your mobile device back on.

You should see the JumpDrive flash screen almost immediately, and you can either connect your mobile device to a computer using a USB cable to flash an OS to the eMMC storage, or connect wireless via ssh to troubleshoot.

Just keep in mind that flashing the eMMC storage will overwrite anything that’s currently installed, so you may want to make a backup or make sure you know where to download an image of the operating system you had been using in case you want to reinstall it in the future.

https://wiki.pine64.org/wiki/PinePhone#Flashing_eMMC_using_Jumpdrive

https://github.com/dreemurrs-embedded/Jumpdrive/releases/tag/0.6

# Anbox
sudo pacman -S anbox anbox-image
sudo systemctl start anbox-container-manager
export DISPLAY=:0
anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity

try running nmtui in terminal ← to get the wifi working… I havent yet tried myself.

Waydroid .. better than anbox.



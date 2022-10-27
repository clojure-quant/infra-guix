# Intel skull canyon nuc NUC Kit NUC6i7KYK

Intel NUC-Kit i7-6770HQ 2.6GHz Iris Pro Graphics 580 NUC6I7KYK
Bought on Amazon 2016-09
Intel Core Skylake
Support NVVC via PCI; this allows 5 GIG transfer from disk per second!!
Intel® Iris™ Pro Graphics 580

USB 3.1 is capable of data transfer speeds up to 10Gbps
USB3 yellow - charging    USB 3.0 is capable of data transfer speeds up to 5Gbps
USB3 blue - no charging
USB3 usbc - back.

Start the NUC and *push F10 to enter the boot menu*. Select the USB flash drive as a boot option.


# wifi

wifi supported by iwlwifi-firmware

- When a USB Wireless driver is installed, it normally disables the onboard adapter at the OS level, since only one of these devices can operate at a time.

- Make sure that the Onboard Wireless Adapter is enabled in the BIOS of the NUC. The WLAN device can be disabled/enabled in the Advanced options, under Devices.

*show network adapters*
inxi -n

https://community.intel.com/t5/Wireless/Wifi-on-Intel-Skull-Canyon-NUC6i7KYK-not-detected/m-p/297678

# graphic card (supported by nonguix out of the box)
Intel Grafic Card Drivers
Fedora
Ubuntu 16.10 

https://01.org/linuxgraphics/downloads
https://01.org/linuxgraphics/downloads/intel-graphics-update-tool-linux-os-v2.0.4

sudo apt update sudo apt upgrade
wget https://download.01.org/gfx/ubuntu/16.10/main/pool/main/i/intel-graphics-update-tool/intel-graphics-update-tool_2.0.4_amd64.deb

wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-GROUP-KEY-ilg

https://download.01.org/gfx/src/intel-graphics-update-tool_2.0.4.tar.xz

# hard disks

hdparm --security-erase-enhanced
500 gig
Sda 200 gig?
hdparm --security-erase-enhanced

SSD    250G
NVME   500G


# NVME disk automatisch mounten:
/etc/fstab
UUID=9c2072e8-16dc-4343-aa7f-2d52beb5357c /run/media/florian/nvme500  ext4     defaults  0 4

# AUDIO
im terminal: pavucontrol  oder alxamixer



# Multi Monitor Support

The NUC is using a  i7-6770HQ that can support up-to 3 displays

For setting up the multiple display configuration in windows you need to install the latest graphics driver from the Intel website

For setting up the multiple display on the linux platform, you need to download the latest drivers that are delivered through the linux updates and check if the multi monitor set up can be enabled

Please refer to the following link for more information on Setting Up Multiple Displays
http://www.intel.com/content/www/us/en/support/boards-and-kits/000005571.html

First display
HDMI on Intel® NUC connected to HDMI or DVI on monitor/TV
Max resolution: 4096x2160 @ 60 Hz
Second display
Mini-DisplayPort on Intel NUC connected to DisplayPort on monitor/TV
Max resolution: 4096x2304 @ 60 Hz

Or
First display
Type C on Intel NUC connected to Type C, HDMI, or DisplayPort on monitor/TV
Max resolution: 4096x2304 @ 60 Hz
Second display
Mini-DisplayPort on Intel NUC connected to DisplayPort on monitor/TV
Max resolution: 4096x2304 @ 60 Hz

Or
First display
Type C on Intel NUC connected to Type C, HDMI, or DisplayPort on monitor/TV
Max resolution: 4096x2304 @ 60 Hz
Second display
HDMI on Intel NUC connected to HDMI or DVI on monitor/TV
Max resolution: 3840x2160 @ 60 Hz



3 displays:


First display
HDMI on Intel® NUC connected to HDMI or DVI on monitor/TV
Max resolution: 4096x2160 @ 60 Hz
Second display
Mini-DisplayPort on Intel NUC connected to DisplayPort on monitor/TV
Max resolution: 4096x2304 @ 60 Hz
Third display
Type C on Intel NUC connected to Type C, HDMI, or DisplayPort on monitor/TV
Max resolution: 4096x2304 @ 60 Hz

5k monitor on skull canyon: http://www.1hd.biz/2016/05/treats-for-your-skull-canyon-nuc6i7kyk.html?m=1

# How to upgrade the BIOS
https://downloadcenter.intel.com/product/95065/Intel-NUC-Kit-NUC7i7BNH
https://downloadcenter.intel.com/download/26664/NUCs-BIOS-Update-BNKBL357-86A-?product=95065
Download the  .BIO file and write it on a USB stick.
ON Booting enter the USB stick, and press F7 ?

# Intel Support Board
https://communities.intel.com/community/tech/nuc/content?filterID=contentstatus%5Bpublished%5D~objecttype~showall&query=Linux+&start=40

Supported operationg systems: Gentoo, Arch
http://www.intel.com/content/www/us/en/support/boards-and-kits/intel-nuc-boards/000005628.html

https://communities.intel.com/thread/102202




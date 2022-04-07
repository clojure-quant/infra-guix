 WiFi devices known to work:
   - Atheros chips (AR9271 and AR7010) - "ath9k" driver
   - Broadcom/AirForce chips (BCM43xx Wireless-Core Revision 5) - "b43-open" driver. 
   Free firmware exists for both and is available out-of-the-box on Guix System, as part of %base-firmware (see firmware)

guix package: rtl8812au-aircrack-ng-linux-module [this is is my usb wifi card]
location: gnu/packages/linux.scm
https://github.com/aircrack-ng/rtl8812au
The TP-LINK Archer T4U is a dual band 802.11ac USB adapter.
Linux driver for Realtek USB wireless network adapters
This is Realtek's rtl8812au Linux driver for USB 802.11n wireless
network adapters, modified by the aircrack-ng project to support monitor mode
and frame injection.  It provides a @code{88XXau} kernel module that supports
RTL8812AU, RTL8821AU, and RTL8814AU chips.

Alfa Networks AWUS036ACH

openfwwf-firmware
Firmware for BCM43xx devices  
This is firmware from Open FirmWare for WiFi networks (OpenFWWF) for the Broadcom/AirForce chipset BCM43xx with Wireless-Core Revision 5. It is used by the b43-open driver of Linux-libre.

NONGNU:
atheros-firmware


https://www.reddit.com/r/GUIX/comments/kxa4vv/connecting_to_internet_wirelessly/




firmware (default: %base-firmware)

 ; (kernel-loadable-modules (list rtl8812au-aircrack-ng-linux-module))



inxi --usb

Device-3: 1-4:4
    info: Realtek RTL8812AU 802.11a/b/g/n/ac 2T2R DB WLAN Adapter type: WiFi
    rev: 2.0


guix install network-manager
nmcli      ; this will show all network interfaces
nmcli dev wifi con "MYUSERNAME" password "MYPASSWORD"



rfkill [options] command [identifier ...]

Tool for enabling and disabling wireless devices.


guix install lshw
sudo lshw -C network
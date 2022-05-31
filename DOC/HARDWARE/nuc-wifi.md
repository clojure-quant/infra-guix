 
 WiFi devices part of %base-firmware:
   - Atheros chips (AR9271 and AR7010) - "ath9k" driver
   - Broadcom/AirForce chips (BCM43xx Wireless-Core Revision 5) - "b43-open" driver. 

(define %base-firmware
  ;; Firmware usable by default.
  (list ath9k-htc-firmware
        openfwwf-firmware))


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


lsmod
print which kernel modules are loaded.
lsmod |grep 88XXau
sudo modinfo 88XXau


guix install network-manager
nmcli      ; this will show all network interfaces
nmcli dev wifi con "MYUSERNAME" password "MYPASSWORD"


https://fedingo.com/how-to-connect-to-wifi-using-nmcli/
nmcli dev wifi list
wlp0s20f0u4
https://fedingo.com/how-to-connect-to-wifi-using-nmcli/


rfkill [options] command [identifier ...]

Tool for enabling and disabling wireless devices.


guix install lshw
sudo lshw -C network

https://www.blackmoreops.com/2014/09/18/connect-to-wifi-network-from-command-line-in-linux/
https://github.com/ryantking/dotfiles-1/blob/master/Systems.org#setting-up-wifi
ifconfig -a

rfkill unblock all

wpa_supplicant -c home/wifi.conf -i wlp0s20f0u4 -B
sudo wpa_supplicant -c home/wifi.conf -i wlp0s20f0u4 -B

THIS WORKS:
wpa_supplicant -D nl80211 -i wlp0s20f0u4 -c home/wifi.conf

THIS DOES NOT WORK, OR DOES IT?
wpa_supplicant -D wext -i wlp0s20f0u4 -c home/wifi.conf

-B means run wpa_supplicant in the background.
-D specifies the wireless driver. wext is the generic driver.
-c specifies the path for the configuration file.

iw wlp0s20f0u4 link
ip link show wlp0s20f0u4
ip link set wlp0s20f0u4 up
 

sudo dhclient wlp0s20f0u4

ip addr show wlp0s20f0u4
ifconfig wlp0s20f0u4
ip route show

sudo ip route add default via 192.168.1.1 dev wlp0s20f0u4

ping 8.8.8.8




SHOW ALL wifis:
nmcli device wifi
sudo nmcli device wifi connect "Austria Cons" password regenschirm13
https://willschenk.com/articles/2019/installing_guix_on_nuc/s


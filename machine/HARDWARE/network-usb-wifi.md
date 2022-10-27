
# show usb devices

inxi --usb

Device-3: 1-4:4
    info: Realtek RTL8812AU 802.11a/b/g/n/ac 2T2R DB WLAN Adapter type: WiFi
    rev: 2.0

# old guix driver for rtl8812au
guix package: rtl8812au-aircrack-ng-linux-module [this is is my usb wifi card]
location: gnu/packages/linux.scm
https://github.com/aircrack-ng/rtl8812au
The TP-LINK Archer T4U is a dual band 802.11ac USB adapter.
Linux driver for Realtek USB wireless network adapters
This is Realtek's rtl8812au Linux driver for USB 802.11n wireless
network adapters, modified by the aircrack-ng project to support monitor mode
and frame injection.  It provides a @code{88XXau} kernel module that supports
RTL8812AU, RTL8821AU, and RTL8814AU chips.

firmware (default: %base-firmware)
 ; (kernel-loadable-modules (list rtl8812au-aircrack-ng-linux-module))

lsmod
print which kernel modules are loaded.
lsmod |grep 88XXau
sudo modinfo 88XXau


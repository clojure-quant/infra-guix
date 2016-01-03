 GUIX WIFI

https://issues.guix.gnu.org/40568
https://www.reddit.com/r/GUIX/comments/kxa4vv/connecting_to_internet_wirelessly/




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
sudo nmcli dev wifi con "WIFI-FALCON-MARIA" password "internet2021"
sudo nmcli dev wifi con "Austria Cons" password "regenschirm13"


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







nano wpa_supplicant.conf
with the following content:

network={
  ssid="YOUR_WIFI_NAME"
  key_mgmt=WPA-PSK
  psk="YOUR_WIFI_PASSWORD"
}

wpa_supplicant -c wpa_supplicant.conf -i enp2s0 -B

rfkill
ID TYPE      DEVICE                   SOFT      HARD
 0 bluetooth tpacpi_bluetooth_sw unblocked unblocked
 1 bluetooth hci0                unblocked unblocked
 2 wlan      phy0                unblocked unblocked
If the wlan interface is blocked, you can unblock it with sudo rfkill unblock wlan. You should run wpa_supplicant -c ... after you unblock the device.

Now try to get a IP address:

$ dhclient -v INTERFACE_NAME

$ guix lint -c cve
gnu/packages/base.scm:652:2: glibc@2.21: probably vulnerable to CVE-2015-1781, CVE-2015-7547
gnu/packages/gcc.scm:334:2: gcc@4.9.3: probably vulnerable to CVE-2015-5276
gnu/packages/image.scm:312:2: openjpeg@2.1.0: probably vulnerable to CVE-2016-1923, CVE-2016-1924

;; NetworkManager and its applet.
         (service network-manager-service-type)
         (service wpa-supplicant-service-type)    ;needed by NetworkManager
         (simple-service 'network-manager-applet
                         profile-service-type
                         (list network-manager-applet)
First, run the following commands to unblock the wifi card, determine its device name, and connect using the device name you received from ifconfig -a. In my case it’s wlp4s0 so I run the command like so:


rfkill unblock all
ifconfig -a
wpa_supplicant -c wifi.conf -i wlp4s0 -B
NOTE: If for any reason running wpa_supplicant fails, make sure to kill any background instances of it before trying to run it again because the old instances will block new runs from working. This wasted a couple hours of my time the first time I tried installing Guix!

The last step to set up networking is to run dhclient to turn on DNS for your wifi connection:

dhclient -v wlp4s0



rfkill list all
ifconfig -a
lsusb
ip a
lspci -k
 lshw -C network

===step 3. stop my usual networking services:=======
# herd stop networking
Service networking has been stopped.
# herd stop wpa-supplicant
Service wpa-supplicant has been stopped.


====step 4. run wi-fi through wi-fi usb adapter=======

# ifconfig wlp0s29u1u2 up
wlp0s29u1u2Link encap:Ethernet  HWaddr xx:ii:xx:ii:xx:ii
          inet addr:192.168.1.68  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0  TX bytes:0

# wpa_supplicant -B -i wlp0s29u1u2 -c /etc/wpa_supplicant/wpa_supplicant.conf 
Successfully initialized wpa_supplicant

# dhclient -v wlp0s29u1u2

(wpa-supplicant-service-type config =>
                                                           
(wpa-supplicant-configuration
                                                            (interface 
"wlp0s29u1u2")
                                                            (config-file 
"/etc/wpa_supplicant/wpa_supplicant.conf")))

I've added these additions to config.scm, thinking it will give effect:

(define %sudoers-specification
  (plain-file "sudoers" "root ALL=(ALL) ALL
%wheel ALL=(ALL) ALL
ALL ALL=(ALL) NOPASSWD: /wpa"))
....

(operating-system
...
                  (sudoers-file %sudoers-specification)
)

And reconfigured. And it works!

Note that must run it with sudo!

$ sudo /wpa isp
Connecting to ISP provider
Service networking has been stopped.
Service wpa-supplicant has been stopped.
Service wpa-supplicant has been started.
Service networking has been started.

nmcli device wifi
> sudo nmcli d w connect "foo SSID" password "foo password"

Check the output of

        # herd status

"networking" and "wpa-supplicant" should be there.
You can use "nmcli" or "nmtui" to manage your connections

(cons*
>    (network-manager-service)
>    (wpa-supplicant-service)

You need to replace this last line with:

  (service wpa-supplicant-type wpa-supplicant)

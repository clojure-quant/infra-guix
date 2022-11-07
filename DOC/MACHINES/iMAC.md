iMAC

nmci r wifi off

operating system alternatives
OS-X Maverick
Mint 13 64 Bit, UBUNTU 9 mit REFIT
Windows 7

BOOTEN BEI MAC
Options Taste (zweite von links unten), dann kann man von USB HARD DISK Booten
Mit C bootet man von CD / DVD.
 

PROBLEME iMAC and LINUX
AMD HD2600 treiber ist für neue Linuxe nicht verfügbar; daher nur altes Linux Möglich: MINT 13 64 Bit, UBUNTU 9
iMac verwendet EFI, nicht BIOS. Damit booten die meisten Install CDs nicht; entweder REFIT BOOT MANAGER installieren,  oder Unix Distrbibution verwenden, die EFI schon hat.
WLAN treiber wird über den packet manager runtergeladen; d.h. für installation braucht man ein ethernet KABEL.

apt-get  	ubuntu/debian package manager
lspci  		zeigt die geräte an

UBUNTU 9
 	0. Partition splitten, weil ja neue partition gebraucht wird. 
	1. Install REFIT (weil iMac kein BIOS, sonder EFI haben)
	2. C drücken bei Boot, das started von CD.
	3. INSTALL
 		* nicht life mode, das geht nicht
 		* F4 Modes - safe graphics mode

	
Screen Resolution
iSight Webcam
Keyboard
IR Remote
sound

Video Driver AMD/ATI Mobility Radeon HD 2600 XT/2700  ; Aluminum iMacs (ATI Graphics - HD2600)  
 
** CINNAMON DESKTOP IST ZU AUFWENDIG **
 	switch to a simpler/leaner desktop environment: mate/xfce/lxde ...
	Check process manager or "top" in terminal
 	install (via synaptic / software manager): mint-meta-mate package,  mint-meta-xcfe 
 	on login you can chose the shell.

  ** RADEON PROPRIETARY DRIVER - VON INSTALL DISK ***
 	so funktioniert das unter MINT 13	
 	/LINUX/DRIVER-IMAC/AMD RADEON:
	chmod +x amd-driver-installer-12-4-x86.x86_64.run
 	﻿sudo ./amd-driver-installer-12-4-x86.x86_64.run

** TOOLS UM ZU SCHAUEN WAS LÄUFT **

inxi -Gx  (Gallium sollte nicht vorkomen)	
 schlecht:
 Graphics:  Card: Advanced Micro Devices [AMD/ATI] RV630/M76 [Mobility Radeon HD 2600 XT/2700] bus-ID 01:00.0 
X.Org 1.14.3 drivers ati,radeon (unloaded: fbdev,vesa) Resolution 1920x1200@60.2hz 
GLX Renderer Gallium 0.4 on AMD RV630 GLX Version 3.0 Mesa 9.2.1 Direct Rendering Yes

 ok:
 Graphics:  Card: Advanced Micro Devices [AMD] nee ATI RV630 [Mobility Radeon HD 2600 XT] bus-ID: 01:00.0 
 X.Org: 1.11.3 driver: fglrx Resolution: 1920x1200@60.2hz 
 GLX Renderer: ATI Mobility Radeon HD 2600 XT GLX Version: 3.3.11631 - CPC Direct Rendering: Yes

lspci | grep VGA
alsa
glxinfo |grep direct
	sollte YES sein.

grep -i vesa /var/log/Xorg.0.log

** RADEON PROPRIETARY DRIVER **	
 fglrx - Radeon Driver
 fglrx-amdcccle - Radeon amin console
fglrxinfo    (sollte "ATI" sein; nicht gallium )
 	schlecht:
 	display: :0  screen: 0
  	OpenGL vendor string: X.Org
  	OpenGL renderer string: Gallium 0.4 on AMD RV630
  	OpenGL version string: 1.4 (3.0 Mesa 10.1.0)

 	gut:
	display: :0  screen: 0
	OpenGL vendor string: Advanced Micro Devices, Inc.
	OpenGL renderer string: ATI Mobility Radeon HD 2600 XT
	OpenGL version string: 3.3.11631 Compatibility Profile Context

** RADEON OPEN SOURCE DRIVER **
 	sudo apt-get remove fglrx*  		
	sudo apt-get install xserver-xorg-video-ati

WLAN KARTE ERKENNEN

** INSTALLATION VIA PACKET MANAGER **
 	Achtung: System/Preferences/Additional Driver erkennt zwar die karte, kann den treiber aber nicht downloaden:  failed: /var/log/jockey.log for details
	packets:
		Ganz wichtig:
 		broadcom-sta-common
		firmware-b43-installer

 		braucht man eventuell auch noch:
		bcmwl-kernel-soruce		
		b43-fwcutter
		broadcom-kernel-source
		broadcom-sta-source

 	Nachdem die Packets downgeloaded sind, muss man rebooten.
	Nach reboot über System/Preferences/Additional Driver den Treiber aktivieren.
	Danach nochmal reboot - dann gehts.


** ERKENNUNG DER INSTALLIERTEN KARTE  **************************************

lspci -vnn -d 14e4:
 	04:00.0 Network controller [0280]: Broadcom Corporation BCM4321 802.11a/b/g/n [14e4:4328] (rev 03)
 		Subsystem: Apple Inc. AirPort Extreme [106b:0088]
 		Physical Slot: 4
 		Flags: fast devsel, IRQ 16
 		Memory at d0300000 (64-bit, non-prefetchable) [size=16K]
  		Memory at d0000000 (64-bit, prefetchable) [size=1M]
 		Capabilities: <access denied>
 		Kernel modules: ssb

lspci -nn

** BROADCOM SOURCe-CODE TREIBER ******************

http://www.broadcom.com/support/802.11/linux_sta.php
 	der treiber funktioniert vielleicht auch, aber man muss linux im kernel-modus kompilieren, das ist mir zu schwierig.


** NDIS treiber ************
 	schlagen einige als letzte alternative vor; habe ich aber nicht gemacht.

 	Wireless Driver (Broadcom 4328 not supported, use NDISwrapper) 
 		A) NDIS = Windows wireless drivers.
  		sudo aptitude install module-assistant
 		sudo m-a prepare
  		sudo m-a auto-install ndiswrapper

  		Alternative: Grafical install.
  		sudo aptitude install ndisgtk


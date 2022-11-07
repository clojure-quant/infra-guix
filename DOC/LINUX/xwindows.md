RDP CLIENTS FOR LINUX

Remmina
Best RDP client for linux


Connect via ssh and enable X windows forwarding (-X)
ssh -X debian.hoertlehner.com -l root
ssh root@163.172.164.222  -i ./flo5 -X

xclock

Information about physical displays
xdpyinfo

Info about Xvfb display:
xdpyinfo -display :7.2

Will show X7 is Xvfb is running.
ls /tmp/.X11-unix/X7


xvfb virtual display
https://github.com/awb99/mySelenium
Cd /home/cititrip/cititrip/mySelenium
isRunning.sh
systemctl status Xvfb.service

ssh connection from server to client
https://unix.stackexchange.com/questions/132326/initiate-ssh-connection-from-server-to-client



XPRA XWINDOWS VIA WEBBROWSER
https://xpra.org/
https://www.youtube.com/watch?v=Ukqs5M5Fthg&t=5s

# nano /etc/apt/sources.list
# xpra
   deb https://xpra.org/ jessie main

# install PGP key 
curl https://winswitch.org/gpg.asc | apt-key add -
 
apt-get install xpra
 
# install xclock
apt-get install x11-apps
 
xpra start --bind-tcp=0.0.0.0 --html=on --start-child=xterm
xpra stop


copy remote file to local machine.
scp -i ./flo5 root@voip.hoertlehner.com:/home/voip/history.txt .





Windows

Ericom Blaze (faster than RDP)
Netop Remote


Synergy 
Multi Monitor Keyboard/Maus sharing

NX

NoMachine
https://www.nomachine.com/people
any server to any client faster than RDP. free but not open source

FreeNX
https://help.ubuntu.com/community/FreeNX
linux server, win client only

NeatX
Open Source NX server, similar to the commercial NX server from NoMachine. 
https://code.google.com/p/neatx/

RDP Server on linux
sudo apt-get install xrdp
sudo service xrdp stop

Guacamole
http://guac-dev.org/
gateway client is webbrowser, server is rdp or vnc server



Better Commandline for windows
Conemu  http://sourceforge.net/projects/conemu/
power cmd http://www.powercmd.com/
 







#  shows all networkcards and ip adresses
ifconfig

# determine in cli if network is up/down
ifup eth0
ifdown eth0 
true if eth0 up
true if eth0 down

# firewall
iptables -h
iptables --list-rules
iptables -L			// browse firewall settings
iptables -I INPUT 5 -i eth0 -p tcp --dport 8080 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -I INPUT 1 -p tcp --dport 8000 -j ACCEPT



netstat -an | more		// browse open ports (to determine if app is listening)
netstat | more
netstat -anp | grep :22
netstat -tap   

** lsof -i **
find out which tcp ports are connected and/or listening on the machine.
shows open and listening connections

sudo iftop
similar to top
monitors the current bandwith of the processes.

nmap -sn
Port vulnerability security scanner

network sweep (find online hosts in ip range)
nmap -vv -sP 117.194.238.1-100

find open webservers
sudo nmap -sS -vv -n -p80 -PN --max-rtt-timeout 500ms 117.194.238.1-100 -T4 -oG - | grep 'open'


sudo tcpdump -i eth0
Tcpdump prints network packages to the console or to a file, can filter also. 
geographic ip lookup
http://linuxconfig.org/find-by-ip-perl-ip-to-location-example



Check open ports
sudo nmap -O voip.hoertlehner.com

iotop  
iostat 
(like top; but disk access)
(average kb/sec IO access over long time)
http://guichaz.free.fr/iotop/

iotop -botqqqk --iter=60 >> /var/log/iotop
this logs the io usage to a logfile 
-b = batch mode.
-o = only processes that had IO access
nmon
Nigel’s performance Monitor: CPU, Memory, Disk Usage, Network, Top processes, NFS, Kernel and much more. Online Mode and Capture Mode (saves to CSV for later processing)
apt-get install nmon -y
network

nethogs
dnstop eth0
mtr www.google.at
sudo jnettop -i eth0


Bandwidth per process
dns request monitor
my traceroute: ping history monitor; packet loss
network traffic monitor


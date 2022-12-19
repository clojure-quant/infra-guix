
show debian version
cat /proc/sys/kernel/osrelease      
uname --r
Cat /etc/debian_version			8.4
cat /proc/version 		linux kernel 3.16.0
system administration


application start alternatives
su – USERNAME switch to different user account (= login in the shell as different user)
su - raj -c 'ls' Execute a single command from a different account name
sudo app    starts app as root

„kommando &“ startet kommando im hintergrund (wird bei ausloggen aber geschlossen)
„nohup app“   	startet und führt anwendung auch bei schliessen der session aus.
„nohup app &“    startet und führt anwendung auch bei schliessen der session aus, und startet im hintergrund.
screen 	reconnect to a „session“.

uptime   Zeigt wie lange es rennt, und die AVERAGE LOAD.
reboot now
shutdown now

# processes
„ps –ax“ listet alle prozesse auf
ps aux | grep exe
„kill processid“ killt einen prozess 	
ps –a
ps –ef | grep mysql         	-> nur die mysql tasks auflsiten
$ ps -ef | more view current running processes.
$ ps -efH | more  view current running processes in a tree structure. H = hierarchy.

# disk
free
free –g   how many GB ram the system has.
free –t total ram including swap memory
df -h.  	disk free –h  (h=human readable)
df –t   	type of file system.
du -cks *|sort -rn|head 	calculate the recursive file usage of sub dirs.
du –h shows all files with size.


$ uname –a   important info about the system (kernel, host name, processor type,..)

lsof
list open files  (files are: disk files, network sockets, pipes, devices and processes) This is a HUGE printout!
System Monitoring

top
htop
running apps; quit with q
a better top
Glances


vmstat
pip install glances  (python package manager
https://github.com/nicolargo/glances

virtual memory statistics (kernel threads, disks, system processes,I/O blocks, interrupts, CPU activity and much more. (install package sysstat) 
Disk

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



Web Based Monitoring/Administration
http://www.monitorix.org/screenshots.html
http://www.webmin.com/demo.html



# systemctl


systemctl
sudo systemctl status

journalctl --since today 
system admin guide.
http://linux.die.net/sag/
http://www.thegeekstuff.com/2010/11/50-linux-commands/ top 50 linux commands.
http://unix.stackexchange.com/

logfiles

ls /var/log
tail -n 20 logfile 		show last 20 lines of logfile
watch tail logfile 		like above butrefresh every 2 seonds

multitail logfile1 logfile2 	tails multiple logfiles 
multitail /var/logs/

lnav /var/logs/ 		navigate in multiple logs go up/down errors/warnings

journalctl -xb		shows logs managed by systemctl

logwatch 		unusual events in logs
 			nano: /usr/share/logwatch/default.conf/logwatch.conf
 			MailTo= EMAIL
 			Runs as daily cron job.
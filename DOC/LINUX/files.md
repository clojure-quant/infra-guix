Directories
/bin – User Binaries Contains binary executables: Common linux commands you need to use in single-user modes are located under this directory. Commands used by all the users of the system are located here. For example: ps, ls, ping, grep, cp.
/sbin – System Binaries Just like /bin, /sbin also contains binary executables.But, the linux commands located under this directory are used typically by system aministrator, for system maintenance purpose.For example: iptables, reboot, fdisk, ifconfig, swapon
/etc – Configuration Files required by all programs. and startup and shutdown shell scripts used to start/stop individual programs.For example: /etc/resolv.conf, /etc/logrotate.conf
/dev – Device Files: terminal devices, usb, .. Fuseror example: /dev/tty1, /dev/usbmon0
/proc – Process Information Contains information about system process. This is a pseudo filesystem contains information about running process. For example: /proc/{pid} directory contains information about the process with that particular pid. This is a virtual filesystem with text information about system resources. For example: /proc/uptime
/var –  variable files. Content of the files that are expected to grow can be found under this directory: system log files (/var/log); packages and database files (/var/lib); emails (/var/mail); print queues (/var/spool); lock files (/var/lock); temp files needed across reboots (/var/tmp);
tmp – Temporary Files Directory that contains temporary files created by system and users. Files under this directory are deleted when system is rebooted.


/usr – User Programs Contains binaries, libraries, documentation, and source-code for second level programs.
/usr/bin contains binary files for user programs. If you can’t find a user binary under /bin, look under /usr/bin. For example: at, awk, cc, less, scp /usr/sbin contains binary files for system administrators. If you can’t find a system binary under /sbin, look under /usr/sbin. For example: atd, cron, sshd, useradd, userdel. DISTRIBUTION INSTALLED.
/usr/lib contains libraries for /usr/bin and /usr/sbin
/usr/local contains users programs that you install from source. For example, when you install apache from source, it goes under /usr/local/apache2. Everything that is not part of the distribution.

/boot – Boot Loader Files; Kernel initrd, vmlinux, grub files are located under /boot For example: initrd.img-2.6.32-24-generic, vmlinuz-2.6.32-24-generic
/lib – System Libraries Contains library files that supports the binaries located under /bin and /sbin Library filenames are either ld* or lib*.so.* For example: ld-2.11.1.so, libncurses.so.5.7
/opt – Optional add-on Applications opt stands for optional. contains add-on applications from individual vendors. add-on applications should be installed under either /opt/ or /opt/ sub-directory.
/mnt – Mount Directory Temporary mount directory where sysadmins can mount filesystems.
/media – Removable Media Devices Temporary mount directory for removable devices. For examples, /media/cdrom for CD-ROM; /media/floppy for floppy drives; /media/cdrecorder for CD write
/srv – Service Data srv stands for service. Contains server specific services related data. For example, /srv/cvs contains CVS related data.



File Operations
pwd                    	print working directory
cd -                     	toggle between the last 2 current directories.
stat /etc/           	statistics of a file or directory
file 			Determine file type

cp -i file1 file2  copy 1 to 2, ask confirm before overwrite
mv -i file1 file2 move 1-> 2.

tar cvf archive_name.tar dirname/           	create new tar archive
tar xvf archive_name.tar                            	extract tar archive


PERMISSIONS
chown root tmpfile 			change owner of a file
chown :friends tmpfile    	change group of a file
If root owns those files, you'll need to chown them properly, before you can change their permissions:
chown -R yourname:yourname folderName
chmod ug+rwx file.txt    Give full access to user and group
groups
Groupadd groupname
Usermod -aG groupname username     (add user to group) 
cat /etc/group 	   Shows all groups
Groups username    shows which groups a user beongs to
 In Tru64 UNIX, when you create a new file, it is by default given the same group affiliation as the directory that contains it. In Linux (and every other UNIX implementation we're aware of), when you create a new file, its group affiliation is by default set to your primary group. This is intended to increase security: a file will not be shared with a group unless you explicitly make it belong to that group. Whether this precaution is more trouble than it's worth could be debated, but that is how Linux works and we cannot change it.

Take an example from our handbook: user kvelyvis belongs to four groups: sxnet, hospital, prcensus, and palloni. The palloni group is her primary group, since user palloni is her advisor. Under Tru64 UNIX, if she created a file in a directory belonging to the hospital group, the file would be affiliated with the hospital group. If she gave group read or group write permissions, other members of the hospital group could read or modify the file. But under Linux, the new file would belong to the palloni group, not the hospital group, as palloni is her primary group. Members of the hospital group will not be able to read or modify the file even if she gives group read and group write permissions (unless they happen to also be members of the palloni group).

You do have the option of making a particular directory act like it used to in Tru64 UNIX, i.e. new files will be given the group affiliation of the directory. Simply type:
> chmod g+s directory



find:  find files based on various search criterias like permissions, user ownership, modification date/time, size, etc
find -iname "MyCProgram.c"     	            	Find files using file-name ( case in-sensitve find)
find -iname "MyCProgram.c" -exec md5sum {} \; Execute commands on files found
find ~ -empty                                               	Find all empty files in home directory
find . -type f -exec ls -s {} \; | sort -n -r | head -5 find top 5 big files
find / -type f -size +100M   all files bigger than 100MB
find / -mtime 50    modified 50 days back.
find / -atime 50  accessed in the last 50 days.
find / -mtime +50 –mtime -100   modified between 50 to 100 days ago.
# find / -amin -60 Accessed Files in Last 1 Hour
find / -size +50M -size -100M  greater than 50MB and less than 100MB.
find / -name *.jpg -type f -print | xargs tar -cvzf images.tar.gz Search all jpg images in the system and archive it.

locate crontab   global search by filename

cat url-list.txt | xargs wget –c Download all the URLs mentioned in the url-list.txt file
ls *.jpg | xargs -n1 -i cp {} /external-hard-drive/directory Copy all images to external hard-drive


 ls –lh  Display filesize in human readable format (e.g. KB, MB etc.,)
-rw-r----- 1 ramesh team-dev 8.9M Jun 12 15:27 arch-linux.txt.gz




ranger. console based filemanager - super cool http://ranger.nongnu.org/
you can easily navigate back and forth
git clone git://git.savannah.nongnu.org/ranger.git
cd ranger
sudo make install
ranger	 	

ncdu - Ncurses du  (similar to windirstat). Can easily explore the disk usage of the directory tree

pysize - similar to windirstat (command line and gtk)
http://guichaz.free.fr/pysize/
ftp
ftp IP/hostname
ftp> mget *.html             	// connect and download multiple files
sftp host_ip 


backup
dump: operating on whole filesystes, it creates a directory of archives and an access 	interface. It's possible to navigate through this when restoring from backup. Advantages include built-in dump-level specification -- you can create level 0 (full), or 1-9 incremental levels, allowing for fine-grained control of archive generation. At a given dump-level, all files modified since the most recent dump of a lower level are archived. Downside: some filesystem formats aren't supported, you may not be able to access your archives from another system. Filesystem-oriented backup mode may not meet particular needs -- you're sacrificing flexibility for convenience. 	
cpio: greater internal consistency and integrity controls than tar, backward compatibility with tar and other formats. May handle types of files which aren't supported by tar Downside: I have to read the man page and Linux in a Nutshell every 	time I want to use it. If you thought tar was nonintuitive, try cpio. 	
afio: yet another advanced archive manipulation utility. Similar in regards to cpio. 	Downsides: I know even less of afio than cpio. Nonstandard is not good WRT backups. 		

ecryptfs is an encrypted filesystem. You set up the passphrase and the algorithm you want to use and it create an encrypted filesystem that is accessible only when mounted. When not mounted, the data are unreadable.

https://www.aaflalo.me/2014/10/bittorrent-sync-ecryptfs-web-interface/

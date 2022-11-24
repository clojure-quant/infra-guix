Dropbox install
cd /usr/bin
mkdir dropbox
cd dropbox/
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
ls -alfg
 ~/.dropbox-dist/dropboxd
 .dropbox-dist/dropboxd
  nohup .dropbox-dist/dropboxd
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
sh -c ~/.dropbox-dist/dropboxd

Debian.hoertehner.com
runs as newstrading user!!
/newstrading/Dropbox/Trading Services/Logs

dropbox.py status
dropbox.py start
dropbox.py stop
sudo -u newstrading dropbox.py start

Exclude directories from sync
dropbox.py exclude add /root/Dropbox/SOFTWARE/
dropbox.py exclude add /root/Dropbox/Admin/
dropbox.py exclude add /root/Dropbox/CODE-SHARED/
dropbox.py exclude add /root/Dropbox/Admin
dropbox.py exclude add /root/Dropbox/CODE-SMART-ORDERROUTER

remove cache files
 rm /root/Dropbox/.dropbox.cache/ -r
 du /root/Dropbox/ -d 1 -h    (depth 2, otherwise it will print ALL folder statistics) (human-readable)

kill hanging dropbox
ps -aux | grep dropbox
kill xxxx

symbolic link
SYMBOLIC LINK SO THAT DROPBOX SYNCS THE TEST SETTINGS FILES 
ln -s /usr/local/forteco/webGit2/newstradingWeb/data/UniversalFXExport "/root/Dropbox/Trading Services/Deployment/AccountTest"
http://www.dropboxwiki.com/tips-and-tricks/sync-other-folders

sudo newstrading
cd /home/newstrading/Dropbox/Trading Services/Deployment/AccountTest
rm UniversalFXExport/ -r
ln -s /usr/local/newstradingorg/debug/newstradingWeb/data/UniversalFXExport UniversalFXExport

ln -s /usr/local/forteco/Invoices /home/newstrading/Dropbox/Public/Backoffice


DROPBOX Alternatives
sparkleshare 	http://o-o-s.de/linux-sparkleshare-als-dropbox-alternative/3422
bittorrent sync 	http://o-o-s.de/linux-sparkleshare-als-dropbox-alternative/3422

linux tools

rsync: less an archival system of itself than a means of duplicating data across 	directories, filesystems, or networked computers. You'll still want to store data in one of the archival formats listed above, unless you're merely mirroring data. Part of a solution, not a solution of itself

unison 
helps keep dir-trees in sync on two/more systems. is a synchroniser and is capable of recognising updates. It can be used to keep a remote replica of a directory structure up to date with a central repository and is capable of propagating updates in both directions and recognising conflicting updates .It uses the same ``rsync algorithm'' which streamlines updates of small parts of large files by transferring only the parts that have changed.

rclone
https://github.com/ncw/rclone
After installing, the tokens required to access dropbox/google drive/ etc need to be added via:
rclone config

#!/bin/bash
rclone copy ./burgcmd/ flogoogle:rclone/burg
rclone copy ./dataReservations flogoogle:rclone/dataReservations
rclone copy ./dataReviews flogoogle:rclone/dataReviews
rclone copy ./dataReservationDetails flogoogle:rclone/dataReservationDetails

BACKUP
https://www.tarsnap.com/simple-usage.html
Easy copy tool; uses amazon cloud, compresses and diffes before storing.


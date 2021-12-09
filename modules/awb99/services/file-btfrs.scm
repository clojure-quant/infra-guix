




; Make sure to btrfs balance every day to ensure your data are not getting too fragmented,
; which could cause problems with metadata space; I have a crontab entry with
; btrfs balance -dusage=50 -dlimit=2 at midnight 
; on another, non-Guix system (the BTRFS mount is not / there, just some rather important data that needs to be kept alive). 

; Also, make sure to btrfs scrub at least once a week. 

; And never turn on nodatacow or chattr +C unless you are more 
; concerned about performance than reliability (at which point you should switch to XFS anyway

(modify-services %desktop-services
(udev-service-type config =>
                   (udev-configuration
                   (inherit config)
                   (rules (list lvm2 fuse alsa-utils crda btrfs)))))

define fs-root
(file-system
 (mount-point "/")
 (type "btrfs")
 (device (file-system-label "btrfs"))
 (options "defaults,compress=lzo,ssd,noatime")
 (needed-for-boot? #t)))

. I setup the btrfs filesystem with:
>
> mkfs.btrfs -L btrfs -m raid1 -d raid0 /dev/nvme0n1p2 /dev/sda1

btrfs-progs
                gvfs              ;for user mounts

In the Ext4 filesystem, you define the number of inodes the filesystem can supports while you create the filesystem.
 You can’t change it after the filesystem is created. If you create too many small files, you may have free disk space left on your 
filesystem, but you won’t be able to create new files/directories unless you have free inodes. This is a big limitation of the Ext4 filesystem.
In the Btrfs filesystem, the inode allocation is flexible. The filesystem can add as many inodes as needed. So, you will never run out of inodes.
The Btrfs filesystem supports multiple devices and has built-in RAID support. The Btrfs filesystem has a built-in logical volume manager
 (LVM) that is used to add multiple storage devices or partitions to a single Btrfs filesystem. 
A single Btrfs filesystem can span over multiple disks and partitions.

The Ext4 filesystem does not support multiple devices. You can’t span a single Ext4 filesystem over multiple disks or partitions. 
To combine multiple storage devices and partitions in an Ext4 filesystem, you have to use 3rd-party logical volume managers like LVM 2.
 To set up RAID, you have to use 3rd-party tools like DM-RAID or MDADM.

e2fsprogs ist eine Reihe von Software-Dienstprogrammen für das Erstellen, Modifizieren und die Wartung von ext2-, ext3- und ext4-Dateisystemen.


(service sysctl-service-type
(sysctl-configuration
 (settings '(("fs.inotify.max_user_watches" . "100000")
             ("net.core.default_qdisc" . "fq")
             ("net.ipv4.tcp_congestion_control" . "bbr")))))))

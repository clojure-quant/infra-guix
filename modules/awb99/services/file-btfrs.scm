




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



btrfs-progs
                gvfs              ;for user mounts



The Ext4 filesystem does not support multiple devices. You can’t span a single Ext4 filesystem over multiple disks or partitions. 
To combine multiple storage devices and partitions in an Ext4 filesystem, you have to use 3rd-party logical volume managers like LVM 2.
 To set up RAID, you have to use 3rd-party tools like DM-RAID or MDADM.

e2fsprogs ist eine Reihe von Software-Dienstprogrammen für das Erstellen, Modifizieren und die Wartung von ext2-, ext3- und ext4-Dateisystemen.


(service sysctl-service-type
(sysctl-configuration
 (settings '(("fs.inotify.max_user_watches" . "100000")
             ("net.core.default_qdisc" . "fq")
             ("net.ipv4.tcp_congestion_control" . "bbr")))))))

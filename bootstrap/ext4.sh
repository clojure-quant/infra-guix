


(file-system
  (device (file-system-label "my-root"))
  (mount-point "/")
  (type "ext4"))



sudo mkfs.ext4 /dev/sdc1

Labeling partitions or volumes is a file system feature. There two main tools which can do the job of naming or renaming partition labels.
Namely they are tune2fs and e2label. Both tools are part of e2fsprogs and are used to solely on
ext2/ext3/ext4 file systems.

e2label /dev/sda1


# e2label /dev/sda1 Boot
OR
# tune2fs -L Boot /dev/sda1

To list label name for all partitions or volumes you may try to use blkid command:

mkfs.ext4 /dev/sda1 -L ROOT

https://linuxconfig.org/how-to-name-label-a-partition-or-volume-on-linux

fdisk -l 
OR
# parted -l


# https://www.youtube.com/watch?v=ELEVo6SbYl0


sudo cryptsetup luksUUID /dev/sda1
#   0c13e138-f7e4-485a-b7df-20a7e08e4dbf


# UNENCRYPT THE DISK VIA A KEY ****************************************************
ls /dev/disk/by-uuid/0c13e138-f7e4-485a-b7df-20a7e08e4dbf
sudo nano /etc/crypttab
samsung /dev/disk/by-uuid/0c13e138-f7e4-485a-b7df-20a7e08e4dbf /home/florian/Documents/myLinux/data/luks/samsung.key luks

# MOUNT THE DISK **************************************************

mkdir /home/florian/samsung
sudo nano /etc/fstab
/dev/mapper/samsung /home/florian/samsung ext4 defaults,nofail,rw,user,x-systemd.device-timeout=5 0 0
sudo mount -a

#  MAKE SURE NO FILESYSTEM WHEN NOT MOUNTED ***************************
chattr +i .

SHOW MOUNTED DRIVES
cat /proc/mounts


# Update The settings after making changes to crypttab and fstab
sudo mkinitcpio -P
sudo update-grub


sudo mount -a
sudo mount toshiba
sudo umount toshiba


sudo cryptsetup luksUUID /dev/sdc
Luks id

create a mapping for the current session
Check mapping status
Check the mapper
sudo dd if=/dev/zero of=/dev/mapper/red2
sudo mkfs.ext4 /dev/mapper/red2 
sudo fsck -Vt ext4 /dev/mapper/red2         this shows errors!


sudo unmount /dev/sda10
sudo fsck /dev/mapper/red2


CLEAR PARTITION
FORMAT PARTITION
sudo mkdir /home/florian/drives/red2
sudo chown florian:florian /home/florian/drives/red2
sudo chattr +i /home/florian/drives/red2

SHOW MOUNTED DRIVES
cat /proc/mounts
sudo mount /dev/mapper/red2  /home/florian/drives/red2
sudo mount /dev/mapper/red2 /run/media/florian/red2


MAKE SURE NO FILESYSTEM WHEN NOT MOUNTED 
umount /dev/mapper/red2
cryptsetup luksClose red2

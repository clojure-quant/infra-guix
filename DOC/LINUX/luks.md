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


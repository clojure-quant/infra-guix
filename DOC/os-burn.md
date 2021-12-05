# diet-pi
very up to date debian, based on armbian
guix install p7zip
7z x DietPi_ROCKPro64-ARMv8-Bullseye.7z
sudo dd bs=4M if=DietPi_ROCKPro64-ARMv8-Bullseye.img of=/dev/mmcblk0
login: root  password: dietpi

# armbian
Root password is 1234. Y
https://docs.armbian.com/

# manjaro
https://wiki.pine64.org/wiki/ROCKPro64_Software_Release#Manjaro_ARM
xz -d Manjaro-ARM-xfce-rockpro64-20.02.img.xz
lsblk -a
sudo dd if=Manjaro-ARM-xfce-rockpro64-20.02.img of=/dev/mmcblk0 bs=4M
Console and SSH default login:
username: manjaro
password: manjaro


# guix armhf installer
wget https://ftp.gnu.org/gnu/guix/guix-binary-1.3.0.armhf-linux.tar.xz

# guix rock-pro
lsblk -a
sudo dd if=/gnu/store/k5sjmjiv366snxix098lnsf3ljj4yn09-disk-image of=/dev/mmcblk0 bs=4M

# guix pinephone
lsblk -a
sudo dd if=/gnu/store/k5sjmjiv366snxix098lnsf3ljj4yn09-disk-image of=/dev/mmcblk0 bs=4M

# manjaro posh
https://github.com/manjaro-pinephone/phosh/releases/tag/beta19
wget https://github.com/manjaro-pinephone/phosh/releases/download/beta19/Manjaro-ARM-phosh-pinephone-beta19.img.xz
xz -d Manjaro-ARM-phosh-pinephone-beta19.img.xz
lsblk -a
sudo dd if=Manjaro-ARM-phosh-pinephone-beta19.img of=/dev/mmcblk0 bs=4M
password: 123456


# manjaro plasma
wget https://github.com/manjaro-pinephone/plasma-mobile/releases/download/beta8/Manjaro-ARM-plasma-mobile-pinephone-beta8.img.xz
xz -d Manjaro-ARM-plasma-mobile-pinephone-beta8.img.xz
sudo dd if=Manjaro-ARM-plasma-mobile-pinephone-beta8.img of=/dev/mmcblk0 bs=4M


# openmediavault 0.8.3
## this image is working (but many of the plugins dont work)
lsblk -a
xz -d stretch-openmediavault-rockpro64-0.8.3-1141-armhf.img.xz
sudo dd if=stretch-openmediavault-rockpro64-0.8.3-1141-armhf.img of=/dev/mmcblk0 bs=4M
sync
WebGUI Login:
username: admin
password: openmediavault
SSH/Console Login:
username: root

# nextcloudpi (for rockpro)
## this image does not work (it is recent though)
https://docs.nextcloudpi.com/en/how-to-install-nextcloudpi/
https://ownyourbits.com/downloads/
wget https://ownyourbits.com/downloads/NextCloudPi_RockPro64_10-08-21/NextCloudPi_RockPro64_10-08-21.tar.bz2
tar -xvf NextCloudPi_RockPro64_10-08-21.tar.bz2
sudo dd bs=4M if=NextCloudPi_XX-XX-XX.img of=/dev/mmcblk0

# odroid 4gig 
https://www.hardkernel.com/shop/odroid-n2-with-4gbyte-ram-2/

# odroid cluster with 4
https://www.hardkernel.com/shop/odroid-mc1-my-cluster-one-with-32-cpu-cores-and-8gb-dram/
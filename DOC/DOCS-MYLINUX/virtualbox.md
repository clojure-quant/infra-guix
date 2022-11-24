install

http://www.linuxuser.co.uk/tutorials/build-a-headless-virtualisation-server/2

Install virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox.asc
sudo apt-key add oracle_vbox.asc
apt-get install virtualbox
apt-get install virtualbox-dkms

create a virtual machine.
VBoxManage createvm --name win2 --register
VBoxManage modifyvm win2 --memory 1024 --acpi on --boot1 dvd --nic1 bridged --bridgeadapter1 eth0
VBoxManage createhd --filename win2.vdi --size 10000
VBoxManage storagectl win2 --name "IDE Controller" --add ide
VBoxManage storageattach win2 --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium win2.v$
VBoxManage storageattach win2 --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium w$


VBoxManage list vms
VBoxManage showvminfo win2
VBoxHeadless --startvm win2
VBoxHeadless -s win2
VBoxHeadless --startvm win2 --vnc
VBoxManage controlvm win2 poweroff
VBoxManage controlvm win2 pause
VBoxManage controlvm win2 reset


VBoxManage registervm "/root/VirtualBoxVM/win7v2/win7v2.vbox"
VBoxHeadless --startvm {d3d6993d-c741-4a6b-af56-0f503a4313c0}

VBoxManage modifyvm "win2" --vrde on

Port forwarding 3889 RDP

VBoxManage modifyvm win7v2 --vrdeauthtype null

VBoxManage sharedfolder add "win7v2" --name "gateway" --hostpath "/home/newstrading/Dropbox/Gateway"


VBoxHeadless --startvm {d3d6993d-c741-4a6b-af56-0f503a4313c0} --vrde on --vrdeproperty TCP/Ports=5900


RDP from Lenovo YOGA3
Best tool is gnome vinagre, can be accessed via ‘RDP’
NO Scaling; 1600*900 and WIN+ESC=fullscreen



web admin

http://xmodulo.com/how-to-manage-virtualbox-vms-on-remote-headless-server.html
wget http://downloads.sourceforge.net/project/phpvirtualbox/phpvirtualbox-5.0-4.zip?r=http%3A%2F%2Fsourcef$
mv php* vb.zip
 unzip vb.zip
cd phpvirtualbox-5.0-4/
cp config.php-example  config.php

groupadd vboxusers
useradd -g vboxusers vbox
passswd vbox
cp vboxinit /etc/init.d
chmod u+rx /etc/init.d/vboxinit
sudo touch /var/log/vboxwebservice.log
 sudo chown vbox:vboxusers /var/log/vboxwebservice.log
 sudo mkdir /home/vbox/.VirtualBox
sudo netstat -nap | grep vboxwebsrv


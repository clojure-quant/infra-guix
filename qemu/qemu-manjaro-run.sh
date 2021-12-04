#!/bin/sh

echo "RUN QEMU manjaro"

# https://guix.gnu.org/manual/en/html_node/Running-Guix-in-a-VM.html
# qemu-system-x86_64 -nic model=help

# -enable-kvm
# If your system has hardware virtualization extensions, enabling the virtual machine 
# support (KVM) of the Linux kernel will make things run faster. 

# -boot d
# boot first virtual cdrom

qemu-system-x86_64 \
   -netdev user,id=eno0,hostfwd=tcp::1114-:22,smb=/home/florian/Downloads \
   -net nic,netdev=eno0 \
   -virtfs local,path=/home/florian/Downloads,mount_tag=bongo,security_model=none \
   -enable-kvm \
   -m 2048 \
   -device virtio-blk,drive=myhd \
   -drive if=none,file=/home/florian/qemu/manjaro50.img,id=myhd \
   -vga virtio 

#    -vga qxl
# -vga virtio
# SPICE: http://www.linux-kvm.org/page/SPICE

# only network, no sharing of 
# -nic user,model=virtio-net-pci \

# -net nic -net user,smb=shared_folder_path

# MANJARO IN GUEST
# systemctl start cups
# yum install cifs-utils
# yay -S cifs-utils
# 


# MOUNT DIR IN CLIENT:
# yum install cifs-utils
# sudo mount -t 9p -o trans=virtio bongo /mnt/bongo -oversion=9p2000.L
# sudo umount /mnt/temp_mount
# https://wiki.qemu.org/Documentation/9psetup#Starting_the_Guest_directly

# PRINTING
# cups web admin: http://localhost:631

# ifconfig
#eno1 

# -netdev tap,id=mynet0
# -nic user,model=virtio-net-pci \
# -nic tap,mac=02:ca:fe:f0:0d:01
# netdev tap,fd=26,id=hostnet0 -device rtl8139,netdev=hostnet0,id=net0,mac=52:54:00:2b:4f:a8,bus=pci.0,addr=0x3

 # Membership of the kvm group grants access to /dev/kvm, which is necessary to run VMs using KVM. 
 # This is controlled using uaccess now, so the currently-active user on the console gets access automatically

# virtualization environment:
# libvirt/qemu/kvm and docker/lxd?

# For managing VMs, we have gnome-boxes and virt-manager.
#  You can also create VM images using Guix itself, by invoking "guix system vm" and providing a 
# system definition that includes all the packages and servers you want. 
# We also have the ganeti service, which manages clusters of VMs, and the xen hypervisor userspace tools.

# For managing containers, we have the singularity package which can run and manage unmodified OCI
# (open container initiative) compatible images, the most common kind, and can also mount squashfs images as containers.

# To monitor the health of the host, you could use the facter package 
# (maybe familiar to you if you've used Puppet), nagios, zabbix, and collectd.

# To manage multiple hosts, VMs and containers we have Ansible, which you may be familiar with as an RHEL user. 
# You can also manage them using Guix itself, by invoking "guix deploy" and providing a file describing the packages, services, and hosts you desire.

# For monitoring and managing network loads, you can use packages like nload, squid, nginx, and varnish.

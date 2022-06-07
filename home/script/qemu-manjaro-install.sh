#!/bin/sh

echo "QEMU manjaro INSTALL"

# https://guix.gnu.org/manual/en/html_node/Running-Guix-in-a-VM.html
# qemu-system-x86_64 -nic model=help

# -enable-kvm
# If your system has hardware virtualization extensions, enabling the virtual machine 
# support (KVM) of the Linux kernel will make things run faster. 


# -boot d
# boot first virtual cdrom


qemu-img create /home/florian/qemu/manjaro50.img 50G -f qcow2

qemu-system-x86_64 \
   -nic user,model=virtio-net-pci \
   -enable-kvm \
   -m 2048 \
   -device virtio-blk,drive=myhd \
   -drive if=none,file=/home/florian/qemu/manjaro50.img,id=myhd \
   -cdrom /home/florian/Downloads/manjaro-xfce-21.1.6-211017-linux513.iso \
   -boot d
   
   # -hda /home/florian/qemu/manjaro2.img:qcow2 \
# -device virtio-blk,drive=myhd \#
#   -drive if=none,file=/tmp/qemu-image,id=myhd

 # qemu-system-i386 -hda myImage.img -m 256


 # Membership of the kvm group grants access to /dev/kvm, which is necessary to run VMs using KVM. 
 # This is controlled using uaccess now, so the currently-active user on the console gets access automatically



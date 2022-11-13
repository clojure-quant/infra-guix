

# user ids match between host and guest

https://linuxnatives.net/2019/align-user-ids-inside-and-outside-docker-with-subuser-mapping

 one will run into problems 
   if the UID of the host machine user 
   and the Docker image user do not match.

 /etc/docker/daemon.json

sudo adduser -u 2002 pink

# bridged networks

lsmod | grep br_netfilter
lsmod, the tool which allows one to list modules in the Linux Kernel

add to the kernel:
sudo modprobe br_netfilter


modprobe -R br_netfilter 


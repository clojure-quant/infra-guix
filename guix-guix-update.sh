
# https://guix.gnu.org/manual/en/html_node/Upgrading-Guix.html#Upgrading-Guix

#selinux
sudo setenforce 0
sestatus

# On a foreign distro, you can upgrade the build daemon by running:
sudo -i guix pull

# systemctl restart ncsd
sudo systemctl restart guix-daemon
sudo systemctl restart gnu-store.mount 

# On Guix System, upgrading the daemon is achieved by reconfiguring 
# the system (see guix system reconfigure). 
# guix system reconfigure
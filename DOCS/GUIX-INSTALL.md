
# update guix

see:
guix-guix-update

on a foreign install:
´´´
sudo -i guix pull
guix package -i guix
systemctl restart guix-daemon.service
´´´


# Install
Can be installed as a package manager on top of an existing distro, or as an operating system.
https://guix.gnu.org/manual/en/html_node/Binary-Installation.html

 wget 'https://sv.gnu.org/people/viewgpg.php?user_id=15145' -qO - | sudo -i gpg --import -
  985  sudo ./guix-install.sh
  987  systemctl enable ncsd

# Fedora selinux
Selinux by default Blocks guix daemen
 unfortunately I can only suggest: 
"sudo setenforce 0"
systemctl enable --now gnu-store.mount guix-daemon
ausearch -c '(x-daemon)' --raw | audit2allow -M my-xdaemon
 1000  sudo ausearch -c '(x-daemon)' --raw | audit2allow -M my-xdaemon
 1001  semodule -i my-xdaemon.pp
 1002  sudo semodule -i my-xdaemon.pp
 1003  sudo semodule -X 300 -i my-xdaemon.pp
 1004  sudo ausearch -c '(x-daemon)' --raw | audit2allow -M my-xdaemon
 1005  sudo semodule -X 300 -i my-xdaemon.pp
 1006  semodule -i -i etc/guix-daemon.cil
 1007  sudo semodule -i -i etc/guix-daemon.cil
 1008  sudo semodule -i etc/guix-daemon.cil
 1018  sudo setenforce 0
 1019  sestatus

# ui 

xfce
https://guix.gnu.org/en/blog/2019/running-a-guix-xfce-desktop-on-centos-7/

sway
https://www.reddit.com/r/GUIX/comments/epckio/gnu_system_with_wayland_and_sway/?utm_medium=android_app&utm_source=share

dwm
https://www.reddit.com/r/GUIX/comments/l9ncsr/dwm_and_st_on_guix_best_practice/?utm_medium=android_app&utm_source=share


# hardware architecture

https://willschenk.com/articles/2019/installing_guix_on_nuc/

https://guix.gnu.org/cookbook/en/guix-cookbook.html#Running-Guix-on-a-Linode-Server

https://guix.gnu.org/en/blog/2017/porting-guixsd-to-armv7/

https://framagit.org/tyreunom/guix-android

# luks disk encryption

https://libreboot.org/docs/gnulinux/guix_system.html

https://guix.gnu.org/manual/en/html_node/Building-the-Installation-Image.html#Building-the-Installation-Image
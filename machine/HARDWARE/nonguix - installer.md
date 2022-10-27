
# Non free kernel with installer 
https://guix.gnu.org/manual/en/html_node/Building-the-Installation-Image.html#Building-the-Installation-Image

https://github.com/deusmax/guixsd-config-install
https://github.com/SystemCrafters/guix-installer

Has: wine, nvidia, broadcom, clojure.
https://gitlab.com/nonguix/nonguix.git



git clone https://gitlab.com/nonguix/nonguix
cd nonguix
guix system disk-image -t iso9660 nongnu/system/install.scm 
sudo dd if=/gnu/store/2ifap65d6v3f06l5c2xsa2qwyi5yy9x1-image.iso of=/dev/sdb bs=4M status=progress oflag=sync
```


https://lists.nongnu.org/archive/html/help-guix/2018-03/msg00011.html
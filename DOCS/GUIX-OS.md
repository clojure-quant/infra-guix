# os tweaking

(define-module (zeus)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "zeus")
;;; Specific customisations for this system
)

# Non free kernel with installer 
Has: wine, emacs, nvidia, broadcom, clojure.
https://gitlab.com/nonguix/nonguix.git

Nonguix can be installed as a Guix channel.

 To do so, add it to ~/.config/guix/channels.scm:
```
(cons* (channel (name 'nonguix) (url "https://gitlab.com/nonguix/nonguix") ;; Enable signature verification: (introduction (make-channel-introduction "897c1a470da759236cc11798f4e0a5f7d4d59fbc" (openpgp-fingerprint "2A39 3FFF 68F4 EF7A 3D29 12AF 6F51 20A0 22FB B2D5")))) %default-channels)
guix pull
sudo -E guix pull

git clone https://gitlab.com/nonguix/nonguix
cd nonguix
guix system disk-image -t iso9660 nongnu/system/install.scm 
sudo dd if=/gnu/store/2ifap65d6v3f06l5c2xsa2qwyi5yy9x1-image.iso of=/dev/sdb bs=4M status=progress oflag=sync


```


Export ISO image
C2.scm  ->see myLinux/distros/guix

guix system disk-image -t iso9660 /home/andreas/Documents/myguix/c2.scm
/gnu/store/6phpslb8z6zz6npii8qcnsrcvmwqz982-image.iso

sudo dd if=/gnu/store/6phpslb8z6zz6npii8qcnsrcvmwqz982-image.iso of=/dev/sdb status=progress
sync


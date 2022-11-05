
;; pass it to the 'guix system reconfigure' command 

(use-modules 
  (gnu)
  ; GNU
  (gnu system) ; %base-firmware
  ; NONGNU
  (nongnu packages linux)
  (nongnu system linux-initrd)
  ; awb99
  (awb99 config desktoppackages)
  (awb99 config desktopservices)
  (awb99 config users))

(operating-system
  (host-name "nuc2022")
  (issue "awb99 config with guix on nuc2022 \n\n")
  (locale "en_US.utf8")
  (timezone "America/Panama")
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))
  ; awb99 config:
  (groups groups-desktop)
  (users users-desktop)
  (packages packages-desktop)
  (services os-services)
  ; kernel  ************************************
  ; non-gnu kernel
  ; https://gitlab.com/nonguix/nonguix/-/blob/master/nongnu/packages/linux.scm
  (kernel linux)
  ; (kernel linux-libre) ; gnu linux-libre
  ;(kernel linux-lts) ; nongnu linux (with blobs)
  (initrd microcode-initrd); CPU microcode updates are nonfree blobs 
  (kernel-loadable-modules '()) ;A list of objects (usually packages) to collect loadable kernel modules from–e.g. (list ddcci-driver-linux).
  ; awb99: old config, when we had rtl-8812au-aircrack-ng-linux module in gnu guix.
  ;(kernel-loadable-modules 
  ;   (list 
  ;     rtl8812au-aircrack-ng-linux-module ; for usb wifi card
  ;   ))
 (firmware (list 
            linux-firmware
            ; iwlwifi-firmware (linux firmware contains it already)
          ))
  ; default firmware:
  ;(firmware %base-firmware)
  ; firmware with intel wifi driver
  ;(firmware (append (list iwlwifi-firmware) %base-firmware))
  ;(firmware (cons* radeon-RS780-firmware-non-free %base-firmware))

  ; bootloader ************************************
  (bootloader (bootloader-configuration
    (bootloader grub-efi-bootloader)
    (targets (list "/boot/efi"))
    (keyboard-layout keyboard-layout)))
  ; filesystem 
  (mapped-devices (list (mapped-device
                          (source (uuid
                                   "2c520d24-1c53-4129-bfb2-e7ab66fcc9df"))
                          (target "cryptroot")
                          (type luks-device-mapping))))
  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems 
     (cons* (file-system
              (mount-point "/boot/efi")
              (device (uuid "167C-868D" 'fat32))
              (type "vfat"))
            (file-system
              (mount-point "/")
              (device "/dev/mapper/cryptroot")
              (type "btrfs")
              (dependencies mapped-devices))
            %base-file-systems)))

(use-modules 
  (gnu)
  (gnu packages linux) ; wifi aircrack module
  (gnu system) ; %base-firmware
  ; nongnu
  (nongnu packages linux)
  (nongnu system linux-initrd)
  ; awb99
  (awb99 config desktoppackages)
  (awb99 config desktopservices)
  (awb99 config users)
)

(operating-system
  (host-name "nuc27")
  (issue "awb99 config with guix on nuc \n\n")
  ; (locale "de_AT.utf8")
  (locale "en_US.utf8")
  (timezone "Europe/Amsterdam")
  (keyboard-layout (keyboard-layout "at"))
  ; awb99 config
  (groups groups-desktop)
  (users users-desktop)
  (packages packages-desktop)
  (services os-services)
  (setuid-programs os-setuid-programs)
  ; kernel
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

  (bootloader
    (bootloader-configuration
      (bootloader grub-efi-bootloader)
      ;(target "/boot/efi")
      (targets '("/boot/efi"))
      (keyboard-layout keyboard-layout)))

  (mapped-devices
    (list (mapped-device
            (source
              (uuid "968b319a-2e32-476b-ad85-323a4c607c81"))
            (target "cryptroot")
            (type luks-device-mapping))))

  (file-systems
    (cons* (file-system
             (mount-point "/boot/efi")
             (device (uuid "E778-7CA3" 'fat32))
             (type "vfat"))
           (file-system
             (mount-point "/")
             (device "/dev/mapper/cryptroot")
             (type "ext4")
             (dependencies mapped-devices))
           %base-file-systems))
          
  ; create swapfile with bootstrap/file-swap-create
  ; (swap-devices 
  ;  (list "/swapfile"))        
          
          )

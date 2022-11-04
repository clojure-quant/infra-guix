(use-modules 
  (gnu)
  (srfi srfi-1) ; remove

  ; kernel
  ; non-gnu linux kernel, see: https://gitlab.com/nonguix/nonguix
  (gnu packages linux) ; wifi aircrack module
  (nongnu packages linux)
  (nongnu system linux-initrd)
  (gnu system) ; %base-firmware
  
  ;(gnu packages cups)
  ;(gnu packages suckless)
  ;(gnu packages wm)
  ;(gnu packages finance)  ; trezord-udev-rules
  ;(gnu packages shells) ; zsh
  ;(gnu packages docker) ; docker
  ;(gnu packages package-management) ; nix
  ; awb99
  (awb99 config packagesdesktop)
  (awb99 config desktopservices)
  (awb99 config users)

)



  ; 4 OS ***********************************************************

(operating-system
  ; (locale "de_AT.utf8")
  (locale "en_US.utf8")
  (timezone "Europe/Amsterdam")
  (keyboard-layout (keyboard-layout "at"))
  (host-name "nuc27")
  (issue "Guix is Great!  Ave Guix!!  Ave!!!\n\n")
  (groups desktop-groups)
  (users desktop-users)
  (packages my-packages)
  (services os-services)
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

   ; awb99: old config, when we had rtl-8812au-aircrack-ng-linux module in gnu guix.
   ;(kernel-loadable-modules 
   ;   (list 
   ;     rtl8812au-aircrack-ng-linux-module ; for usb wifi card
   ;   ))

  ; non-gnu kernel
  ; https://gitlab.com/nonguix/nonguix/-/blob/master/nongnu/packages/linux.scm
  (kernel linux)
  ;(kernel linux-lts)
  (initrd microcode-initrd); CPU microcode updates are nonfree blobs 
  (kernel-loadable-modules '()) ;A list of objects (usually packages) to collect loadable kernel modules from–e.g. (list ddcci-driver-linux).
  ; (kernel linux-nonfree)
  (firmware (list 
              linux-firmware
              ; iwlwifi-firmware (linux firmware contains it already)
            ))
  ;(firmware (append (list iwlwifi-firmware) %base-firmware))
  ;(firmware %base-firmware)
  ;(firmware (cons* radeon-RS780-firmware-non-free %base-firmware))


  ; swapfile has to be created first.
  ; (swap-devices 
  ;  (list "/swapfile"))

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
           %base-file-systems)))

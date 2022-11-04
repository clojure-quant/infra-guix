
;; pass it to the 'guix system reconfigure' command 

(use-modules 
  (gnu)
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
  (groups desktop-groups)
  (users desktop-users)
  (packages packages-desktop)
  (services os-services)
  ; bootloader
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

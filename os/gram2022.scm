(use-modules 
  ; GNU
  (gnu)
  (gnu system) ; %base-firmware
  (gnu system nss)
  ; NONGNU
  (nongnu packages linux)
  (nongnu system linux-initrd)
  ; awb99
  (awb99 config desktoppackages)
  (awb99 config desktopservices)
  (awb99 config users)
  (awb99 config substitute-url)
  )


; gram2022
; audio driver needs special firmware
; aircrack usb wifi card firmware loaded


(define my-mapped-devices 
  (list (mapped-device
          (source (uuid "a98d36ae-4992-4564-9b7f-c8907247e878"))
          (target "cryptroot")
          (type luks-device-mapping))
        ;(mapped-device 
        ;  (source (uuid "37338969-9461-404f-b67f-491a27b2f8d3")) ; 1tb usb disk
        ;  (target "cryptsamsung")
        ;  (type luks-device-mapping))
        
        ))

(define my-file-systems
  (cons*  ;add multiple items to a list
    (file-system
       (mount-point "/boot/efi")
       (device (uuid  "1A43-776D" 'fat32))
       (type "vfat"))
     (file-system
       (mount-point "/")
       (device "/dev/mapper/cryptroot")
       (type "btrfs")
       (dependencies my-mapped-devices))
   %base-file-systems))


(define os
  (operating-system
    (host-name "gram2022")
    (issue "awb99 config with guix on gram2022 \n\n")
    (locale "en_US.utf8")
    (timezone "America/Panama")
    (keyboard-layout (keyboard-layout "us" "altgr-intl"))
    ; awb99 config:
    (groups groups-desktop)
    (users users-desktop)
    (packages packages-desktop)
    (services (add-nonguix-substitutes (os-services "gram2022")))
    ; kernel  ************************************
    ; non-gnu kernel
    ; https://gitlab.com/nonguix/nonguix/-/blob/master/nongnu/packages/linux.scm
    (kernel linux)
    ; (kernel linux-libre) ; gnu linux-libre
    ;(kernel linux-lts) ; nongnu linux (with blobs)
    (initrd microcode-initrd); CPU microcode updates are nonfree blobs 
    ;(kernel-loadable-modules '()) ;A list of objects (usually packages) to collect loadable kernel modules from–e.g. (list ddcci-driver-linux).
    ; awb99: old config, when we had rtl-8812au-aircrack-ng-linux module in gnu guix.
    (kernel-loadable-modules 
       (list 
         rtl8812au-aircrack-ng-linux-module ; for usb wifi card. from nonguix repo
       ))
   (firmware (list 
              linux-firmware
	      ; iwlwifi-firmware (linux firmware contains it already)
	      sof-firmware
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
    (mapped-devices my-mapped-devices)
    ;; The list of file systems that get "mounted".  The unique
    ;; file system identifiers there ("UUIDs") can be obtained
    ;; by running 'blkid' in a terminal.
    (file-systems my-file-systems)

    ;; Allow resolution of '.local' host names with mDNS.
    ; .local use is reserved for zeroconf/avahi aka bonjour usage, 
    ; which are parallel services for resolving local names/services besides DNS.
    ; in addition to setting the name-service-switch of the operating-system 
    ; declaration, you also need to use avahi-service-type (see avahi-service-type),
    ; or %desktop-services, which includes it (see Desktop Services). Doing this 
    ;makes nss-mdns accessible to the name service cache daemon (see nscd-service).
    (name-service-switch %mdns-host-lookup-nss)
  ; end of os
  ))

; create swapfile with bootstrap/file-swap-create.sh
; https://guix.gnu.org/en/manual/devel/en/html_node/Swap-Space.html
(define os-with-swap
  (operating-system
    (inherit os)
    (mapped-devices my-mapped-devices)
    (file-systems my-file-systems)
    
    (swap-devices
      (list
        (swap-space
          (target "/mnt/swapfile")
          (dependencies (filter (file-system-mount-point-predicate "/")
                                 file-systems)))))))

(if (file-exists? "/mnt/swapfile")
  os-with-swap
  os)


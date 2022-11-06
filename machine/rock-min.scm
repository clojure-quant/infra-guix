(use-modules 
  (gnu)
  (srfi srfi-26)
  (srfi srfi-1)
  ;; rockpro
  (gnu image)
  (gnu system images rock64)
  (gnu bootloader u-boot)
  (gnu platforms arm)
  (gnu system image)

  ;; servuces
  (gnu services networking) ; ntpd
  (gnu services xorg)
  (gnu services desktop)
  (gnu services ssh) ;dropbear ssh

  ;; packages
  (gnu packages linux)
  (gnu packages shells) ; zsh
  (gnu packages screen)
  (gnu packages autotools)

  ; awb99
  (awb99 helper)
  (awb99 config users)
  (awb99 config os-release)
  (awb99 config bootstrap-files)
  (awb99 config mingetty)
  (awb99 config ntp)
  )

;; this is a bootstrap image of guix for rock-pro
;; it can be build on x86.
;; it includes files in /etc/static
;; when this image is booted execute bash /etc/static/boostrap.sh
(display "building rock-pro min image \n")

; https://framagit.org/tyreunom/system-configuration/-/blob/master/systems/ene.scm

(define extra-packages
(->packages-output
(list "nss-certs" ; The nss-certs package provides X.509 certificates, which allow programs to authenticate Web servers accessed over HTTPS
     ; "openssh"
     ; "dropbear"
     ; "openssh-sans-x"
     ; "zlib" ; needed for openssh?
     ; "git"
     ; shells used in user profiles need to be on system
     ; "fish"
     ; "zsh"
)))

(define my-packages
 ;(packages (cons* openssh %base-packages)) ; wpa-supplicant-minimal 
  (append extra-packages
          %base-packages))

(define (remove-services guix-services)
(remove (lambda (service)
(let ((type (service-kind service)))
  (or (memq type
          (list gdm-service-type
                wpa-supplicant-service-type
                cups-pk-helper-service-type
                network-manager-service-type
                modem-manager-service-type
                openssh-service-type
              ))
      (eq? 'network-manager-applet
         (service-type-name type)))))
  guix-services))

(define my-services
(append 
 (list (service dhcp-client-service-type) ; Use the DHCP client service rather than NetworkManager.
        service-bootstrap-files
        service-os-release
        service-ntp
    )
 (patch-mingetty 
   (remove-services %base-services)) ;   %desktop-services
  ))

(define rock64-os
(operating-system
  (host-name "rockit")
  (timezone "Europe/Amsterdam") ; (timezone "Etc/UTC")
  (locale "en_US.utf8")
; (keyboard-layout (keyboard-layout "us" "altgr-intl"))
  (keyboard-layout (keyboard-layout "at"))
  (groups mygroups)
  (users myusers)
  ;; Our /etc/sudoers file.  Since 'guest' initially has an empty password,
  ;; allow for password-less sudo.
  (sudoers-file (plain-file "sudoers" "\
     root ALL=(ALL) ALL
     %wheel ALL=NOPASSWD: ALL\n"))
  (packages my-packages)
  (services my-services)
  (kernel linux-libre-arm64-generic)
  (kernel-arguments 
    '("console=ttyS2,1500000" ; 
    ; "video=HDMI-A-1:1920x1080@60" "video=eDP-1:1920x1080@60"
    ; "vga=current"
    ; "ethaddr=${ethaddr}" "eth1addr=${eth1addr}"
    ; "serial=${serial#}"
    ))     

  ;; microSD: /dev/mmcblk1
  ;;    eMMC: /dev/mmcblk2
  (bootloader 
    (bootloader-configuration
     (bootloader u-boot-rockpro64-rk3399-bootloader)
     (targets '("/dev/mmcblk0" )))) ; p1"/dev/mmcblk0" 
  (file-systems
    (cons ; cons* 
      (file-system
        (mount-point "/")
        (device "/dev/mmcblk0p1") ;p2
        ; (device (file-system-label "Guix_image"))
        (type "ext4")) 
      %base-file-systems))
  ;; This module is required to mount the SD card.
  ; the SD card itself also requires two drivers: sunxi-mmc and sd_mod.
  (initrd-modules '())
  ;(initrd-modules (cons* "sunxi-mmc" 
  ;                       "sd_mod" 
  ;                       "ahci_sunxi" 
  ;                       %base-initrd-modules))
  ;(initrd-modules (cons "omap_hsmmc" %base-initrd-modules))
  ;(initrd-modules
  ;  (cons* "dw_mmc-rockchip"
  ;         "phy-rockchip-emmc"
  ;         "sdhci-of-arasan" ;; I believe this one is for rk3399 only,
  ;         %base-initrd-modules))
 
;;
))



(define rock64-image-type
(image-type
(name 'rock64-raw)
(constructor (cut image-with-os
                 (raw-with-offset-disk-image (expt 2 24))
                 <>))))

(define rock64-raw-image
(image
(inherit
(os+platform->image rock64-os aarch64-linux
                    #:type rock64-image-type))
(name 'rock64-raw-image)))

; rock64-raw-image

rock64-os
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

  ;; services
  (gnu services networking) ; ntpd
  (gnu services desktop)
  (gnu services xorg) ; to exclude gdm
  (gnu services ssh) ; to exclude open-ssh

  ;; packages
  (gnu packages linux)
  (gnu packages shells) ; zsh
  (gnu packages autotools)
  (gnu packages screen)
 
  ; awb99
  (awb99 config helper)
  (awb99 config users)
  (awb99 services os-release)
  (awb99 services bootstrap-files)
  (awb99 services mingetty)
  )

;; this is a bootstrap image of guix for rock-pro
;; it can be build on x86.
;; it includes files in /etc/static
;; when this image is booted execute bash /etc/static/boostrap.sh
(display "building rock-pro min image \n")

(define extra-packages
(->packages-output
  (list  "util-linux" 
         "nano"
        "nss-certs"
  ;"openssh"
    ;   "dropbear"
        ; "openssh-sans-x"
        ; "zlib" ; needed for openssh?
       ;  "git"
       ; "xfce4-screensaver"
       ; "xfce4-systemload-plugin"
       ; "xfce4-mount-plugin"
       ; "xfce4-panel"
       ; "garcon" ; menu manager
       ; "xfce4-places-plugin"
       ; "xdg-desktop-portal" ; xdg-desktop-portal greatly improves the usability of Flatpak-installed apps,
        ; allowing them to open file chooser dialogs, open links, et.c.
        ; xfce4-power-manager       ** add this
        ; xfce4-pulseaudio-plugin   
        ; xfce4-whiskermenu-plugin
        ; xfce4-settings
        ; xfce4-screenshooter
        ; elementary-xfce-icon-theme
      ; shells used in user profiles need to be on system
     ; "fish"
     ; "zsh"
  )))

(define my-packages
  ;(cons* openssh %base-packages) ; wpa-supplicant-minimal 
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
          service-os-release)
    (patch-mingetty 
      (remove-services %base-services)) ;   %desktop-services
  ))


(define rock64-os
  (operating-system
    (host-name "rockmin")
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
       (targets '("/dev/mmcblk1p1"))))
    (file-systems
      (cons ; cons* 
        (file-system
          (mount-point "/")
          (device "/dev/mmcblk1p2") 
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

(display rock64-os)

rock64-os
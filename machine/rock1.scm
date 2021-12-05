(use-modules 
  (gnu)
  ;(gnu packages suckless)
  ;(gnu packages wm)
  ;(gnu packages shells) ; zsh
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

  ;; packages
  (gnu packages linux)
  (gnu packages shells) ; zsh
  (gnu packages screen)
(gnu packages autotools)
 
  ; awb99
  (awb99 config helper)
  (awb99 config users)
  (awb99 config ssh)
  )

           
;  (use-service-modules x y …) is just syntactic sugar for (use-modules (gnu services x) (gnu services y) …)
;(use-service-modules ; desktop 
;     networking ) ;ssh xorg mcron certbot web
; (use-package-modules certs rsync screen ssh)


; https://gitlab.manjaro.org/manjaro-arm/packages/core/linux/-/blob/master/config
; https://guix.gnu.org/de/blog/2019/guix-on-an-arm-board/
; https://github.com/guix-mirror/guix/blob/master/gnu/system/images/rock64.scm

(define extra-packages
(->packages-output
  (list ;"openssh"
    ;   "dropbear"
        ; "openssh-sans-x"
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


(display "extra packages:")
(display extra-packages)

(define my-packages
(append extra-packages
        %base-packages))

(define (auto-login-to-tty config tty user)
  (if (string=? tty (mingetty-configuration-tty config))
        (mingetty-configuration
         (inherit config)
         (auto-login user))
        config))


(define desktop-services
  (remove (lambda (service)
  (let ((type (service-kind service)))
    (or (memq type
            (list gdm-service-type
                  wpa-supplicant-service-type
                  cups-pk-helper-service-type
                  network-manager-service-type
                  modem-manager-service-type))
        (eq? 'network-manager-applet
           (service-type-name type)))))
   (modify-services %desktop-services
      (mingetty-service-type config =>
          (auto-login-to-tty config "tty1" "florian"))
        )))



(define my-services
  (list 
    ; Because the GNOME, Xfce and MATE desktop services pull in so many packages, 
    ; the default %desktop-services variable doesn’t include any of them by default. 
    (service dhcp-client-service-type) ; Use the DHCP client service rather than NetworkManager.
    (service xfce-desktop-service-type)
    ;(set-xorg-configuration
    ;  (xorg-configuration
    ;  (keyboard-layout (keyboard-layout "at"))))
    ;(service openssh-service-type
    ;         awb99-ssh-config
    ;        )

        ;(service dropbear-service-type
        ;(dropbear-configuration
        ; (root-login? #t)
        ; (allow-empty-passwords? #t)))
        ;  (service openssh-service-type
        ;    (openssh-configuration
        ;      (x11-forwarding? #t)
        ;      (extra-content "StreamLocalBindUnlink yes")))

          (service agetty-service-type
            (agetty-configuration
              (extra-options '("-L")) ; no carrier detect
              (baud-rate "115200")
              (term "vt100")
              (tty "ttyS0")))


  ))

(define os-services
(append
   my-services
   ;   %desktop-services
   desktop-services
   ;%base-services
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
    (packages my-packages)
    ;(packages (cons* openssh %base-packages)) ; wpa-supplicant-minimal 
    (services os-services)
    (kernel linux-libre-arm64-generic)
    (kernel-arguments 
      '("console=ttyS2" ; ,1500000
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
       (targets '("/dev/mmcblk1")))) ; "/dev/mmcblk0"
       ; "/dev/sda"   "/dev/mmcblk0p1"  "/dev/mmcblk0"
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

rock64-raw-image
rock64-os
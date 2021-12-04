(use-modules 
(gnu)
(gnu packages suckless)
(gnu packages wm)
(gnu packages shells) ; zsh
(gnu services networking) ; ntpd
(gnu system images rock64)
(gnu bootloader u-boot)
(gnu packages linux)
(gnu image)
(srfi srfi-26)
(gnu platforms arm)
(gnu system image)
(gnu packages shells) ; zsh
(gnu services networking) ; ntpd
)
           
;  (use-service-modules x y …) is just syntactic sugar for (use-modules (gnu services x) (gnu services y) …)
(use-service-modules desktop networking ssh xorg mcron certbot web)
(use-service-modules networking ssh)
(use-package-modules certs rsync screen ssh)
         

; https://gitlab.manjaro.org/manjaro-arm/packages/core/linux/-/blob/master/config
; https://guix.gnu.org/de/blog/2019/guix-on-an-arm-board/
; https://github.com/guix-mirror/guix/blob/master/gnu/system/images/rock64.scm

(define my-services
(list 
  ; Because the GNOME, Xfce and MATE desktop services pull in so many packages, 
  ; the default %desktop-services variable doesn’t include any of them by default. 
  (service xfce-desktop-service-type)
  (set-xorg-configuration
    (xorg-configuration
    (keyboard-layout (keyboard-layout "at"))))
))

(define desktop-services
(cons*
  (modify-services %desktop-services

    ;(mingetty-service-type config =>
    ;   (auto-login-to-tty config "tty1" "florian"))

        )))

(define os-services
(append
   my-services
   ;   %desktop-services
   desktop-services
   ))

  (define my-packages
  (append
      (list (specification->package "nss-certs")
 
            (specification->package "xrandr") ; hidpi x-windows scaling

             ; xfce
            (specification->package "xfce4-screensaver")    
            (specification->package "xfce4-systemload-plugin")  
            (specification->package "xfce4-mount-plugin") 
            (specification->package "xfce4-panel") 
            (specification->package "garcon") ; menu manager
            (specification->package "xfce4-places-plugin")
            (specification->package "xdg-desktop-portal") 
            ; xdg-desktop-portal greatly improves the usability of Flatpak-installed apps,
            ; allowing them to open file chooser dialogs, open links, et.c.
                                
            ; xfce4-power-manager       ** add this
            ; xfce4-pulseaudio-plugin   
            ; xfce4-whiskermenu-plugin
            ; xfce4-settings
            ; xfce4-screenshooter
            ; elementary-xfce-icon-theme
          
           ; shells used in user profiles need to be on system
            (specification->package "fish")
            (specification->package "zsh")

      )
      %base-packages))


(define my-groups
(cons* 
   (user-group 
      (system? #f) 
      (name "bongotrotters"))
    %base-groups))

(define my-users
(cons* 
  (user-account
    (name "florian")
    (comment "Florian")
    (group "users")
    (home-directory "/home/florian")
    ;(shell (file-append fish "/bin/fish"))
   ; (identity "/home/florian/repo/myLinux/data/ssh/coin")
    (supplementary-groups
    '("wheel" 
      "netdev" 
      "audio" 
      "video"
    )))
  (user-account
    (name "bob")
    (comment "Alice's bro")
    (group "users")
    (home-directory "/home/robert")
    (shell (file-append zsh "/bin/zsh")))
  %base-user-accounts))

(define services2 
  (append 
    (list (service dhcp-client-service-type)
         ; (service openssh-service-type
         ;   (openssh-configuration
         ;     (x11-forwarding? #t)
         ;     (extra-content "StreamLocalBindUnlink yes")))
         ; (service agetty-service-type
         ;   (agetty-configuration
         ;     (extra-options '("-L")) ; no carrier detect
         ;     (baud-rate "115200")
         ;     (term "vt100")
         ;     (tty "ttyS0")))
    )
    %base-services))


(define rock64-os
  (operating-system
    (host-name "rockit")
    (timezone "Europe/Amsterdam") ; (timezone "Etc/UTC")
    (locale "en_US.utf8")
  ; (keyboard-layout (keyboard-layout "us" "altgr-intl"))
    (keyboard-layout (keyboard-layout "at"))
    (groups my-groups)
    (users my-users)
   ; (packages my-packages)
    (services services2)
    (kernel linux-libre-arm64-generic)
    (kernel-arguments 
      '("console=ttyS2,1500000"
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
       (targets '("/dev/mmcblk0"))))  ; "/dev/sda"   "/dev/mmcblk0p1" "/dev/mmcblk1" "/dev/mmcblk0"
    (file-systems
      (cons ; cons* 
        (file-system
          (mount-point "/")
          (device "/dev/mmcblk1p1")
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
; rock64-os
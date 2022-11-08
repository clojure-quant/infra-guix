(define-module (awb99 machine rock)
  #:export (os-rock64)
)

 ; https://guix.gnu.org/en/blog/2017/porting-guixsd-to-armv7/
 ; https://framagit.org/tyreunom/guix-android
 ; https://gitlab.manjaro.org/manjaro-arm/packages/core/linux/-/blob/master/config
 ; https://guix.gnu.org/de/blog/2019/guix-on-an-arm-board/
; https://framagit.org/tyreunom/system-configuration/-/blob/master/systems/ene.scm
; https://github.com/guix-mirror/guix/blob/master/gnu/system/images/rock64.scm


(use-modules 
  (gnu) ; operating system
  (gnu bootloader u-boot)
  ;  (gnu platforms arm)   ; has been renamed to guix platforms arm
  (nongnu packages linux)
  (awb99 config users)

; end use-modules
)


(define-public (os-rock64
         dev-bootloader dev-filesystem
         machine-name
         packages services)
(operating-system
  (host-name machine-name)
  (timezone "Europe/Amsterdam") ; (timezone "Etc/UTC")
  (locale "en_US.utf8")
; (keyboard-layout (keyboard-layout "us" "altgr-intl"))
  (keyboard-layout (keyboard-layout "at"))

  (groups groups-desktop)
  (users users-cli)
  (sudoers-file sudoers-file-no-password)

  (packages packages)
  (services services)

  (kernel linux-arm64-generic)
  (kernel-arguments 
    '("console=ttyS2,1500000" ; 
    ; "video=HDMI-A-1:1920x1080@60"
    ; "video=eDP-1:1920x1080@60"
    ; "vga=current"
    ; "ethaddr=${ethaddr}" 
    ; "eth1addr=${eth1addr}"
    ; "serial=${serial#}"
    ))     

  ;; microSD: /dev/mmcblk1
  ;;    eMMC: /dev/mmcblk2
  (bootloader 
    (bootloader-configuration
     (bootloader u-boot-rockpro64-rk3399-bootloader)
     (targets (list dev-bootloader)))) ; p1"/dev/mmcblk0" 
  (file-systems
    (cons ; cons* 
      (file-system
        (mount-point "/")
        (device dev-filesystem) ;p2
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

;; microSD: /dev/mmcblk1
;;    eMMC: /dev/mmcblk2

;; this is a bootstrap image of guix for rock-pro
;; it can be build on x86.
;; it includes files in /etc/static
;; when this image is booted execute bash /etc/static/boostrap.sh

(define-public (os-rock-image machine-name packages services)
  (os-rock64 
    "/dev/mmcblk0"
    "/dev/mmcblk0p1"
    machine-name
    packages 
    services
  ))

; for the loaded os target and filesystem are the same.
;  "/dev/mmcblk1p1"  ; "/dev/disk/by-id/mmc-SC64G_0xb13f1704"
; "/dev/mmcblk1p1"

(define-public (os-rock64-configure machine-name packages services)
  (os-rock64 
    ; for the loaded os target and filesystem are the same.
    "/dev/mmcblk1"  ; "/dev/disk/by-id/mmc-SC64G_0xb13f1704"
    "/dev/mmcblk1p1"
    machine-name
    packages 
    services
  ))
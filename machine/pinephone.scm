; https://github.com/Millak/guix-config/blob/master/pine64.scm

(use-modules (guix packages)
             (gnu packages linux) ; kernel
             (gnu)
             (gnu bootloader u-boot)
             (gnu system locale)
            ;(config guix-daemon)
             (srfi srfi-1)
             (awb99 config users)
             (awb99 services os-release)
            )

(use-service-modules
  linux
  ;mcron
  networking
;  ssh
)
(use-package-modules
  certs
 ; connman

)

(define %extra-options
  (list "--gc-keep-derivations=yes"
        "--gc-keep-outputs=yes"))

(operating-system
  (host-name "pine64")
  (timezone "Europe/Amsterdam")
  (locale "en_US.UTF-8")
  (locale-definitions
    (list (locale-definition (source "en_US")
                             (name "en_US.UTF-8"))
          ))

  (bootloader (bootloader-configuration
                (bootloader u-boot-pine64-plus-bootloader) ; u-boot-pine64-lts
                (targets '("/dev/mmcblk0p1" ))))   ; SD card/eMMC (SD priority) storage  "/dev/mmcblk0" "/dev/mmcblk1"
  (initrd-modules '())
  (kernel linux-libre-arm64-generic) ;; The board fails to boot with stock linux-libre
  ;(swap-devices (list "/swapfile")) ; this syntax is depreciated
  (file-systems (cons* (file-system
                         ;(device (file-system-label "root"))
                         (device "/dev/mmcblk0p2" ) ; "/dev/mmcblk1p2"
                         (mount-point "/")
                         (type "ext4"))
                       %base-file-systems))
  (users myusers)
  ;; This is where we specify system-wide packages.
  (packages (cons* nss-certs         ;for HTTPS access
                   ;btrfs-progs 
                   ;compsize
                   %base-packages))

  (services (cons* ;(service agetty-service-type
                   ;         (agetty-configuration
                   ;           (extra-options '("-L")) ; no carrier detect
                   ;           (baud-rate "115200")
                   ;           (term "vt100")
                   ;           (tty "ttyS0")))


                   ;; Image created with ext4
                   ;(service mcron-service-type
                   ;         (mcron-configuration
                   ;           (jobs (%btrfs-maintenance-jobs "/"))))
                   service-os-release
                   ;(service connman-service-type)
                   ;(service wpa-supplicant-service-type)

                   (modify-services
                     %base-services
                     (guix-service-type
                       config =>
                       (guix-configuration
                         (inherit config)
                        ; (substitute-urls %substitute-urls)
                         ; (authorized-keys %authorized-keys)
                         (extra-options
                           (cons* "--cores=2" %extra-options)))))))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
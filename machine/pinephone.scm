; https://github.com/Millak/guix-config/blob/master/pine64.scm

(use-modules (guix packages)
             (gnu)
             (gnu bootloader u-boot)
             (gnu system locale)
            ;(config guix-daemon)
            ; (config os-release)
             (srfi srfi-1))
(use-service-modules
  linux
  ;mcron
  networking
  ssh)
(use-package-modules
  certs
  connman
  linux)

(define %substitute-urls
(list "https://ci.guix.gnu.org"
      ;"http://bp7o7ckwlewr4slm.onion" ; ci.guix.gnu.org
      "https://bayfront.guix.gnu.org"
      "https://bordeaux.guix.gnu.org"
      "http://guix.genenetwork.org"
      "https://guix.tobias.gr"))


(define %extra-options
  (list "--gc-keep-derivations=yes"
        "--gc-keep-outputs=yes"))


(operating-system
  (host-name "pine64")
  (timezone "Asia/Jerusalem")
  (locale "en_US.UTF-8")
  (locale-definitions
    (list (locale-definition (source "en_US")
                             (name "en_US.UTF-8"))
          (locale-definition (source "he_IL")
                             (name "he_IL.UTF-8"))))

  (bootloader (bootloader-configuration
                (bootloader u-boot-pine64-plus-bootloader)
                (targets '("/dev/mmcblk0"))))   ; SD card/eMMC (SD priority) storage

  (initrd-modules '())
  ;; The board fails to boot with stock linux-libre
  (kernel linux-libre-arm64-generic)

  (swap-devices (list "/swapfile"))

  (file-systems (cons* (file-system
                         (device (file-system-label "root"))
                         (mount-point "/")
                         (type "ext4"))
                      ; %guix-temproots
                       %base-file-systems))

  (users (cons (user-account
                (name "efraim")
                (comment "Efraim")
                (group "users")
                (supplementary-groups '("wheel"
                                        "netdev" "kvm"))
                (home-directory "/home/efraim"))
               %base-user-accounts))

  ;; This is where we specify system-wide packages.
  (packages (cons* nss-certs         ;for HTTPS access
                   btrfs-progs compsize
                   %base-packages))

  (services (cons* ;(service agetty-service-type
                   ;         (agetty-configuration
                   ;           (extra-options '("-L")) ; no carrier detect
                   ;           (baud-rate "115200")
                   ;           (term "vt100")
                   ;           (tty "ttyS0")))

                   ;(simple-service 'os-release etc-service-type
                   ;                `(("os-release" ,%os-release-file)))

                   (service guix-publish-service-type
                            (guix-publish-configuration
                              (host "0.0.0.0")
                              (port 3000)))
                   (service openssh-service-type
                            (openssh-configuration
                              (x11-forwarding? #t)
                              (extra-content "StreamLocalBindUnlink yes")))

                   ;; Image created with ext4
                   ;(service mcron-service-type
                   ;         (mcron-configuration
                   ;           (jobs (%btrfs-maintenance-jobs "/"))))

                   (service openntpd-service-type
                            (openntpd-configuration
                              (listen-on '("127.0.0.1" "::1"))
                              ;; Prevent moving to year 2116.
                              (constraints-from '("https://www.google.com/"))))

                   (service connman-service-type)
                   (service wpa-supplicant-service-type)

                   (modify-services
                     %base-services
                     (guix-service-type
                       config =>
                       (guix-configuration
                         (inherit config)
                         (substitute-urls %substitute-urls)
                         ; (authorized-keys %authorized-keys)
                         (extra-options
                           (cons* "--cores=2" %extra-options)))))))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
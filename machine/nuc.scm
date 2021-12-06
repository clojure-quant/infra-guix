(use-modules 
  (gnu)
  (gnu packages cups)
  (gnu packages suckless)
  (gnu packages wm)
  (gnu packages finance)  ; trezord-udev-rules
  (gnu packages shells) ; zsh
  (gnu packages docker) ; docker
  
  (gnu services base) ; mingetty 
  (gnu services docker) ; docker service
  (gnu services networking) ; ntpd
  (gnu services virtualization) ; qemu
  
  (awb99 services trezord)
  (awb99 services special-files)
  (awb99 config cron)
  (awb99 config iptables))
             
;  (use-service-modules x y …) is just syntactic sugar for (use-modules (gnu services x) (gnu services y) …)
(use-service-modules desktop networking ssh xorg cups mcron certbot web)
(use-service-modules networking ssh)
(use-package-modules certs rsync screen ssh)



(define i3-service
  (simple-service
    'i3-packages
    profile-service-type
    (list dmenu i3-wm i3lock i3status)))
    

(define my-services
  (list 
    ; Because the GNOME, Xfce and MATE desktop services pull in so many packages, 
    ; the default %desktop-services variable doesn’t include any of them by default. 
    (service xfce-desktop-service-type)
    (service gnome-desktop-service-type)
    (service mate-desktop-service-type)
    (service lxqt-desktop-service-type)
    (service enlightenment-desktop-service-type)

    ; Wayland needs sddm-service instead of GDM as the graphical login manager

    ;i3-service
    ;(screen-locker-service i3lock)
    (service cups-service-type
      (cups-configuration
        (default-paper-size "A4")
        (web-interface? #t)
        (extensions
          (list cups-filters hplip splix ))))

    (service certbot-service-type
     (certbot-configuration
      (email "hoertlehner@gmail.com")
      (webroot "/var/www")
       (certificates
        (list
         (certificate-configuration
             (name "wien")
             (domains '("wien.hoertlehner.com" )))
         ))))

    (service iptables-service-type
     (iptables-configuration
      (ipv4-rules (plain-file "iptables.rules" 
       ;iptables-allow-8080 
       iptables-port-redirect
     ))))

    (service mcron-service-type
      (mcron-configuration
        (jobs %guix-maintenance-jobs)))

    (service trezord-service-type
      (trezord-configuration))

    (service qemu-binfmt-service-type ; needed for qemu arm system compile
      (qemu-binfmt-configuration
        (platforms (lookup-qemu-platforms "arm" "aarch64"))))

    service-bin-links

    (service docker-service-type)



    (set-xorg-configuration
      (xorg-configuration
        (keyboard-layout (keyboard-layout "at"))))))

; https://framagit.org/tyreunom/system-configuration/-/blob/master/modules/config/os.scm
(define desktop-services
  (cons*
    (modify-services %desktop-services

      (udev-service-type config =>
        (udev-configuration
          (inherit config)
          (rules (cons* trezord-udev-rules
                        (udev-configuration-rules config)))))
          )))


(define os-services
   (append
      my-services
      ;   %desktop-services
      desktop-services
      ))


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
      (shell (file-append fish "/bin/fish"))
     ; (identity "/home/florian/repo/myLinux/data/ssh/coin")
      (supplementary-groups
      '("wheel" 
        "lp"  ; line printer
        "lpadmin" ; line printer admin
        "netdev" 
        "audio" 
        "video"
        "kvm"  ; run qemu as florian with kvm support.
        ; "libvirt"
        ;;"wireshark"
      )))
    (user-account
      (name "bob")
      (comment "Alice's bro")
      (group "users")
      (home-directory "/home/robert")
      (shell (file-append zsh "/bin/zsh")))
    %base-user-accounts))

(define (->packages-output specs)
  (map specification->package+output specs))

(define (specifications->package specs)
   (map specification->package specs))

(define extra-packages
   (list "nss-certs"
         "xrandr" ; hidpi x-windows scaling
         ; xfce
         "xfce4-screensaver"
         "xfce4-systemload-plugin"
         "xfce4-mount-plugin"
         "xfce4-panel"
         "garcon" ; menu manager
         "xfce4-places-plugin"
         "xdg-desktop-portal" ; xdg-desktop-portal greatly improves the usability of Flatpak-installed apps, allowing them to open file chooser dialogs, open links
         ; xfce4-power-manager       ** add this
         ; xfce4-pulseaudio-plugin   
         ; xfce4-whiskermenu-plugin
         ; xfce4-settings
         ; xfce4-screenshooter
         ; elementary-xfce-icon-theme
         ; lxqt
         "lxqt"
         ; lxqt
         "mate"
         ;enlightenment
         "enlightenment"
         ; gnome
         "gnome"
         ; i3
         "i3-wm"
         "i3status"
         "i3blocks"
         "i3lock"
         "dmenu"
         "rofi"
         ; sway
         "sway"
         "swaybg"
         "swayidle"
         "swaylock"
         "bemenu"
         ; shells used in user profiles need to be on system
         "fish"
         "zsh"
         ; trezor
         "trezord-udev-rules"
         "trezord"
         ; printing
         "cups"
         "cups-filters"
         "foomatic-filters"    ; postscript -> printer driver
         "hplip"
         "system-config-printer"
         "grep"    ;grep errro in foomatic-filters.
         ; docker
         "docker"
         "iptables"))   


 (define my-packages
  (append
    (specifications->package extra-packages)
    %base-packages))


(operating-system
  ; (locale "de_AT.utf8")
  (locale "en_US.utf8")
  (timezone "Europe/Amsterdam")
  (keyboard-layout (keyboard-layout "at"))
  (host-name "nuc27")
  (groups my-groups)
  (users my-users)
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

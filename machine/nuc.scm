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


(define (auto-login-to-tty config tty user)
(if (string=? tty (mingetty-configuration-tty config))
      (mingetty-configuration
       (inherit config)
       (auto-login user))
      config))



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

;    (service trezord-service-type
;      (trezord-configuration))

    (service qemu-binfmt-service-type
      (qemu-binfmt-configuration
        (platforms (lookup-qemu-platforms "arm" "aarch64"))))


    service-bin-links

    (service docker-service-type)

    ; ntp is already in guix desktop services
    ; (service
    ;   openntpd-service-type
    ;     (openntpd-configuration
    ;       (listen-on '("127.0.0.1" "::1"))
    ;       (sensor '("udcf0 correction 70000"))
    ;       (constraint-from '("www.gnu.org"))
    ;       (constraints-from '("https://www.google.com/"))))

    (set-xorg-configuration
      (xorg-configuration
        (keyboard-layout (keyboard-layout "at"))))))

; https://framagit.org/tyreunom/system-configuration/-/blob/master/modules/config/os.scm
(define desktop-services
  (cons*
    (modify-services %desktop-services

      (mingetty-service-type config =>
         (auto-login-to-tty config "tty1" "florian"))

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

            ; lxqt
           (specification->package "lxqt")
          
           ; lxqt
           (specification->package "mate")

           ;enlightenment
           (specification->package "enlightenment")

           ; gnome
          (specification->package "gnome")

             ; i3
            (specification->package "i3-wm")    
            (specification->package "i3status")
            (specification->package "i3blocks")
            (specification->package "i3lock")
            (specification->package "dmenu")
            (specification->package "rofi")

            ; sway
            (specification->package "sway")
            (specification->package "swaybg")
            (specification->package "swayidle")
            (specification->package "swaylock")
            (specification->package "bemenu")

           ; shells used in user profiles need to be on system
            (specification->package "fish")
            (specification->package "zsh")

            ; trezor
            (specification->package "trezord-udev-rules")
            (specification->package "trezord")

            ; printing
            (specification->package "cups")    
            (specification->package "cups-filters")    
            (specification->package "foomatic-filters")    ; postscript -> printer driver
            (specification->package "hplip")    
            (specification->package "system-config-printer")    
            (specification->package "grep")    ;grep errro in foomatic-filters.

            ; docker
            (specification->package "docker")   

            (specification->package "iptables")   

      )
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
      (target "/boot/efi")
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

(use-modules (gnu)
             (gnu packages cups)
             (gnu packages suckless)
             (gnu packages wm)
             (gnu packages finance)  ; trezord-udev-rules
             (gnu packages shells) ; zsh
             (gorilla config cron)
             (awb99 config guix-daemon)
             )
             
;  (use-service-modules x y …) is just syntactic sugar for (use-modules (gnu services x) (gnu services y) …)
(use-service-modules desktop networking ssh xorg cups mcron)

(define i3-service
  (simple-service
    'i3-packages
    profile-service-type
    (list dmenu i3-wm i3lock i3status)))
    

(define my-services
   (list (service xfce-desktop-service-type)
            ;i3-service
            ;(screen-locker-service i3lock)
            (service cups-service-type
                     (cups-configuration
                       (web-interface? #t)
                       (extensions
                        (list cups-filters hplip))))

            (service mcron-service-type
                    (mcron-configuration
                      (jobs %guix-maintenance-jobs)))

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
        (name "plugdev"))
      %base-groups))


(define my-users
  (cons* 
    (user-account
      (name "florian")
      (comment "Florian")
      (group "users")
      (home-directory "/home/florian")
      (supplementary-groups
      '("wheel" "netdev" "audio" "video")))
    (user-account
      (name "bob")
      (comment "Alice's bro")
      (group "users")
      (home-directory "/home/robert")
      (shell (file-append zsh "/bin/zsh")))
    (user-account
      (name "trezord")
      (comment "Trezor")
      (group "plugdev"))
    %base-user-accounts))




(operating-system
  (locale "de_AT.utf8")
  (timezone "Europe/Amsterdam")
  (keyboard-layout (keyboard-layout "at"))
  (host-name "nuc27")
  (groups my-groups)
  (users my-users)
  (packages
    (append
      (list (specification->package "nss-certs")
 
            (specification->package "i3-wm")    
            (specification->package "i3status")
            (specification->package "i3blocks")
            (specification->package "i3lock")
            (specification->package "dmenu")
            (specification->package "rofi")

            ; trezor
            (specification->package "trezord-udev-rules")
            (specification->package "trezord")

            ; printing
            (specification->package "cups")    
            (specification->package "foomatic-filters")    
            (specification->package "hplip")    
            (specification->package "system-config-printer")    

      )
      %base-packages))
  (services os-services)
  (bootloader
    (bootloader-configuration
      (bootloader grub-efi-bootloader)
      (target "/boot/efi")
      (keyboard-layout keyboard-layout)))
  (file-systems %base-file-systems))

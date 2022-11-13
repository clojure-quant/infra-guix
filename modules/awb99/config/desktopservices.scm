(define-module (awb99 config desktopservices)
  #:export (os-services
            os-setuid-programs))

(use-modules 
  (gnu packages wm) ; swaylock
  (ice-9 match)
  (srfi srfi-1)
  (guix) ; plain-file
  (gnu system setuid)
  (gnu system) ;setuid-programs
  (gnu packages nfs) ; setuid nfs
  (gnu packages linux) ; btrfs
  (gnu services) ; service
  (gnu services base) ; mingetty 
  (gnu services docker) ; docker service
  (gnu services networking) ; ntpd
  (gnu services virtualization) ; qemu
  (gnu services sddm) ; sddm login manager
  (gnu services nix) ; nix
  (gnu services desktop) ; udisks
  (gnu services xorg)
  (gnu services ssh)
  (gnu services web)
  (gnu packages certs)
  (gnu packages rsync)
  (gnu packages screen)
 
  ; awb99 services
  (awb99 services trezord)
  (awb99 services tailscale)
  (awb99 services tailscaleup)
  (awb99 services nasmount)

  ;awb99 config
  (awb99 config iptables)
  (awb99 config bin-links)
  (awb99 config ssh)
  (awb99 config cron)
  (awb99 config file-sync)
  (awb99 config samba)
  (awb99 config wayland)
  (awb99 config monitor)
  (awb99 config ddclient)
  (awb99 config printer)
  (awb99 config readymedia)

; end of use-module
)
 
(define my-services
  (list 
    ; Because the GNOME, Xfce and MATE desktop services pull in so many packages, 
    ; the default %desktop-services variable doesn’t include any of them by default. 
    ;(service xfce-desktop-service-type)  
    (service gnome-desktop-service-type)
    ; (service mate-desktop-service-type)
    ; (service lxqt-desktop-service-type)
    ;(service enlightenment-desktop-service-type)
    (screen-locker-service swaylock "swaylock")
    
    ;(set-xorg-configuration
    ;  (xorg-configuration
    ;    (keyboard-layout (keyboard-layout "at"))))

    ; standard default services that are useful in a desktop
    service-cron
    service-iptables  
    service-ssh  

    ; udisksd is runnign WITHOUT udisks-service running. 
    ; adding udisk-service leads to an error on os install.
    ;(udisks-service) ; http://udisks.freedesktop.org/docs/latest/,
    ;  Programs that talk to UDisks include the @command{udisksctl} command, part of UDisks, and GNOME Disks
  
  
  ;service-ddclient-nuc
    service-printer
    service-bin-links
    
    ; virtualization
    (service docker-service-type)
    (service kernel-module-loader-service-type
             '("br_netfilter"
	       ;"ddcci"
	       ;"ddcci_backlight"
	       ))
    (service qemu-binfmt-service-type ; needed for qemu arm system compile
      (qemu-binfmt-configuration
         (platforms (lookup-qemu-platforms "arm" "aarch64" ; "i686" "ppc"
       ))))
    ; other package managers
    (service nix-service-type)

     ; nas file sharing
    service-samba
    service-syncthing

    ; awb99 special services
    (service trezord-service-type
      (trezord-configuration))
    (tailscale-service `(#:config #f   ; this config is not being used.
                         #:phases #t))
    tailscaleup-service
    


    ))

  (define services-nuc6
  (list 
    ))

(define services-nuc12
  (list nasmount-service
    ))

  (define (services-machine-dependent machine-name)
    (append 
       (list (service-readymedia machine-name))
       (cond 
         ((string=? machine-name "nuc6") services-nuc6)
         ((string=? machine-name "nuc12") services-nuc12)
         ((string=? machine-name "rock") (list))
         (#t  (list)))))
  


; https://framagit.org/tyreunom/system-configuration/-/blob/master/modules/config/os.scm

(define (remove-gdm system-services)
  (remove 
    (lambda (service)
       (eq? (service-kind service) gdm-service-type)) ;; Remove GDM.
      system-services))
 

(define (add-custom-udev-rules system-services)
  (modify-services system-services
      (udev-service-type config =>
        (udev-configuration
          (inherit config)
          (rules (append
                  (list 
                     ;bbbbbbtrfslvm2 fuse alsa-utils crda 
                     ;btrfs ; not found.
                    )
                   (list udev-rule-backlight)
                   (udev-configuration-rules config)))))
          ))

(define (add-nongnu-substitute-servers services)
  (modify-services services
      (guix-service-type config => (guix-configuration
        (inherit config)
        (substitute-urls
          (append (list "https://substitutes.nonguix.org")
          %default-substitute-urls))
        (authorized-keys
   (append (list (plain-file "non-guix.pub"
                    "(public-key 
                      (ecc 
                       (curve Ed25519)
                       (q #C1FD53E5D4CE971933EC50C9F307AE2171A2D3B52C804642A7A35F84F3A4EA98#)
                      ))"))
     %default-authorized-guix-keys))))))

(define (os-services machine-name)
   (append
      my-services
      (services-machine-dependent machine-name)
      ; %desktop-services
      (add-nongnu-substitute-servers
        (modify-gdm-wayland 
          (add-custom-udev-rules %desktop-services)))
      ))


; SETUID PROGRAMS
; https://guix.gnu.org/en/manual/devel/en/html_node/Setuid-Programs.html#Setuid-Programs

(define os-setuid-programs
  (append (list 
           (setuid-program (program (file-append nfs-utils "/sbin/mount.nfs"))))
           %setuid-programs)
)

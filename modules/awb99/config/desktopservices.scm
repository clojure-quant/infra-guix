(define-module (awb99 config desktopservices)
  #:export (os-services))

(use-modules 
  (gnu packages wm) ; swaylock
  (ice-9 match)
  (srfi srfi-1)
  (guix) ; plain-file
  (gnu packages finance)  ; trezord-udev-rules

  (gnu services) ; service
  (gnu services base) ; mingetty 
  (gnu services docker) ; docker service
  (gnu services networking) ; ntpd
  (gnu services virtualization) ; qemu
  (gnu services sddm) ; sddm login manager
  (gnu services nix) ; nix
  (gnu services desktop)
  (gnu services xorg)
  (gnu services ssh)

  (gnu services web)
  (gnu packages certs)
  (gnu packages rsync)
  (gnu packages screen)
 
; awb99
  ;(awb99 packages nuc)
  (awb99 services monitor)
  (awb99 services trezord)
  (awb99 services special-files)
  (awb99 services file-sync)
  (awb99 config cron)
  (awb99 config iptables)
  (awb99 config printer)
  ;(awb99 services ddclient)
  (awb99 services wayland)
  (awb99 services tailscale)

)
   
; use "guix system search" to search for available services


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
    ; Wayland needs sddm-service instead of GDM as the graphical login manager
    ;(set-xorg-configuration
    ;  (xorg-configuration
    ;    (keyboard-layout (keyboard-layout "at"))))

    ; standard default services that are useful in a desktop
    service-cron
    service-iptables
    service-printer
    (service docker-service-type)
    (service qemu-binfmt-service-type ; needed for qemu arm system compile
      (qemu-binfmt-configuration
         (platforms (lookup-qemu-platforms "arm" "aarch64" ; "i686" "ppc"
       ))))
    (service nix-service-type)

    ; awb99 special services
    (service trezord-service-type
      (trezord-configuration))
    service-bin-links
    service-syncthing
    ; service-ddclient-nuc
    (tailscale-service `(#:config #f 
                         #:phases #t))


    ))

; https://framagit.org/tyreunom/system-configuration/-/blob/master/modules/config/os.scm

(define (remove-gdm system-services)
  (remove 
    (lambda (service)
       (eq? (service-kind service) gdm-service-type)) ;; Remove GDM.
      system-services))


(define (custom-udev system-services)
  (modify-services system-services
      (udev-service-type config =>
        (udev-configuration
          (inherit config)
          (rules (cons* trezord-udev-rules
                      ;  (list %backlight-udev-rule)
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

(define os-services
   (append
      my-services
      ; %desktop-services
      ;(custom-udev %desktop-services)
      (add-nongnu-substitute-servers
        (modify-gdm-wayland 
          (custom-udev %desktop-services)))
      ))
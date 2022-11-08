(define-module (awb99 machine rock-sp)
  #:export (rock-packages
            rock-services
            rock-packages-ssh
            rock-services-ssh
            rock-packages-nas
            rock-services-nas
          ))

(use-modules 
(gnu)
(srfi srfi-26)
(srfi srfi-1)

 ;; services
(gnu services networking) ; ntpd
(gnu services xorg)
(gnu services desktop)
(gnu services ssh) ;dropbear ssh

;; packages
(gnu packages linux)
(gnu packages shells) ; zsh
(gnu packages screen)
(gnu packages autotools)

  ; awb99
(awb99 helper)
(awb99 config users)
(awb99 config os-release)
(awb99 config bootstrap-files)
(awb99 config mingetty)
(awb99 config ntp)
(awb99 config file-sync)
(awb99 config ssh)
)

(define extra-packages
(->packages-output
(list "nss-certs" ; The nss-certs package provides X.509 certificates, which allow programs to authenticate Web servers accessed over HTTPS
     ; "openssh"
     ; "dropbear"
     ; "openssh-sans-x"
     ; "zlib" ; needed for openssh?
     ; "git"
     ; shells used in user profiles need to be on system
     ; "fish"
     ; "zsh"
)))

(define rock-packages
 ;(packages (cons* openssh %base-packages)) ; wpa-supplicant-minimal 
  (append extra-packages
          %base-packages))

(define (remove-services guix-services)
(remove (lambda (service)
(let ((type (service-kind service)))
  (or (memq type
          (list gdm-service-type
                wpa-supplicant-service-type
                cups-pk-helper-service-type
                network-manager-service-type
                modem-manager-service-type
                openssh-service-type
              ))
      (eq? 'network-manager-applet
         (service-type-name type)))))
  guix-services))

(define rock-services
(append 
 (list (service dhcp-client-service-type) ; Use the DHCP client service rather than NetworkManager.
        service-bootstrap-files
        ;service-os-release
        service-ntp
    )
 (patch-mingetty 
   (remove-services %base-services)) ;   %desktop-services
  ))

; SSH

(define rock-packages-ssh
(append 
   rock-packages
   (->packages-output
     (list "nss-certs"
          "openssh-sans-x"
    ))))

(define rock-services-ssh
(append 
  rock-services
  (list 
    service-ssh
    )))

; NAS


(define rock-packages-nas
(append 
   rock-packages-ssh
   (->packages-output
     (list 
       "syncthing"
       "kodi"
       ;"kodi-wayland"
       "kodi-cli"
       ;"play-to-kodi-chromium"
       "calibre"
       "readymedia" ; DLNA/UPnP-AV media server (formerly known as MiniDLNA)
       ; "pulseaudio-dlna" ; Stream audio to DLNA/UPnP and Chromecast devices
       "ddclient"  ;dynamic dns ddclient to disec.io  
      ))))


(define rock-services-nas
(append 
  rock-services-ssh
  (list 
     service-syncthing
    )))

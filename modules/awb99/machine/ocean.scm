(define-module (awb99 machine ocean)
  #:export (ocean-os
            ))

; https://notabug.org/jbranso/linode-guix-system-configuration/src/master/deploy-locke-lamora-linode-simple.scm

(use-modules 
  (gnu)
  (guix)
  (guix gexp)
  (gnu packages)
  (gnu packages bootloaders)
  (gnu packages ssh)
  (gnu system)
  (gnu services admin) ; unattended upgrades
  (gnu services networking)
  (gnu services ssh)
  (gnu services web)
  ; (awb99 guixutils)
  (awb99 config users)
  (awb99 packages)
  (awb99 services special-files)
  (awb99 services ssh)
  (awb99 services os-release)
  (awb99 services mingetty)
  (awb99 services bootstrap-files)
  )


(define (->packages-output specs)
  (map specification->package+output specs))
    
(define extra-packages
 (->packages-output
   (append 
     (list 
        "nss-certs"
        "openssh-sans-x"
        "mc")
      clojure-packages
      monitor-packages
      archive-packages
      network-packages
      shell-packages
      filesystem-packages

      )))

(define (patch-guix-authorized guix-services)
  (modify-services guix-services
    ;; The server must trust the Guix packages you build. If you add the signing-key
    ;; manually it will be overridden on next `guix deploy` giving
    ;; "error: unauthorized public key". This automatically adds the signing-key.
    (guix-service-type config =>
        (guix-configuration
            (inherit config)
            (authorized-keys
            (append (list (local-file "/etc/guix/signing-key.pub"))
                    %default-authorized-guix-keys))))))

(define my-base-services
  (patch-mingetty 
    (patch-guix-authorized %base-services) ;   %desktop-services
  ))
              
;(define ocean-network-service 
;  (static-networking-service-type "eth0" "XXX.XXX.XXX.XXX"
;    #:netmask "XXX.XXX.XXX.XXX"
;    #:gateway "XXX.XXX.XXX.XXX"
;    #:name-servers '("84.200.69.80" "84.200.70.40")))


(define ocean-os
  (operating-system
    (host-name "oceanic")
    (issue "Guix is Great!  Ave Guix!!  Ave!!!\n\n")
    ;locale
    (timezone "Etc/UTC") ; (timezone "Europe/Paris")
    (locale "en_US.utf8")
    (keyboard-layout (keyboard-layout "at")) ; (keyboard-layout (keyboard-layout "us" "altgr-intl"))
    ; users
    (groups mygroups)
    (users (cons* user-florian
                  user-viktor
                  %base-user-accounts))
    (sudoers-file my-sudoers-file)
    (packages (append extra-packages %base-packages))
    (services
      (append
        (list
          (service unattended-upgrade-service-type) ;; Security updates, yes please!
          (service dhcp-client-service-type)
          ;service-os-release
          service-bootstrap-files; add the trateg git clone script
          service-bin-links
          service-ssh-bitblock
          )
          my-base-services))
    (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/vda"))
                (terminal-outputs '(console))))
    (file-systems (cons (file-system
                          (mount-point "/")
                          ;; Must be vda2 or you won't be able to reboot after `guix deploy`.
                          ;; This is because our base image makes an EFI partition at vda1.
                           (device "/dev/vda2")
                          ;(device "/dev/vda1")
                          (type "ext4"))
                   %base-file-systems))

    
  ))


              




   
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
  (awb99 packages)
  (awb99 services special-files)
  (awb99 services ssh)
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
      )))

(define my-base-services
  (modify-services %base-services
    ;; The server must trust the Guix packages you build. If you add the signing-key
    ;; manually it will be overridden on next `guix deploy` giving
    ;; "error: unauthorized public key". This automatically adds the signing-key.
    (guix-service-type config =>
        (guix-configuration
            (inherit config)
            (authorized-keys
            (append (list (local-file "/etc/guix/signing-key.pub"))
                    %default-authorized-guix-keys))))))
              
              
(define ocean-os
  (operating-system
    (host-name "oceanic")
    (timezone "Etc/UTC") ; (timezone "Europe/Paris")
    (locale "en_US.utf8")
    (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/vda"))
                (terminal-outputs '(console))))
    (file-systems (cons (file-system
                          (mount-point "/")
                          ;; Must be vda2 or you won't be able to reboot after `guix deploy`.
                          ;; This is because our base image makes an EFI partition at vda1.
                          ; (device "/dev/vda2")
                          (device "/dev/vda1")
                          (type "ext4"))
                   %base-file-systems))
    (packages (append extra-packages %base-packages))
    (services
      (append
        (list
          (service unattended-upgrade-service-type) ;; Security updates, yes please!
          (service dhcp-client-service-type)
          service-bin-links
          service-ssh-bitblock
             )
            %base-services     
            )
       )
  ))


              




   
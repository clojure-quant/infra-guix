(define-module (awb99 machine docker-base)
  #:export (os-docker-base
            ))

(use-modules 
  (gnu)
  (guix)
  (guix gexp)
  (guix packages)
  (gnu packages)
  (gnu packages bootloaders)
  (gnu packages ssh)
  (gnu system)
  (gnu services admin) ; unattended upgrades
  (gnu services networking)
  (gnu services ssh)
  (gnu services web)
  ; awb99 packages
  (awb99 packages programming)
  (awb99 package babashka)
  (awb99 packages systemcli)
  (awb99 guixutils) 
  (awb99 config users)
  (awb99 config iptables)
  (awb99 config ssh)
  (awb99 config bin-links)
  (awb99 config os-release)
  (awb99 config mingetty)
  (awb99 config bootstrap-files)
  (awb99 services trateg)
)


(define bin-packages
  (list
    babashka
     ))

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
      shell-packages
      )))




(define os-docker-base
  (operating-system
    (host-name "docker-base")
    (issue "Guix in docker\n\n")
    ;locale
    (timezone "Etc/UTC") ; (timezone "Europe/Paris")
    (locale "en_US.utf8")
    (keyboard-layout (keyboard-layout "at")) ; (keyboard-layout (keyboard-layout "us" "altgr-intl"))
    ; users
    (users users-docker)
    (sudoers-file sudoers-file-no-password)
    (packages
     (append
      extra-packages
      bin-packages
      %base-packages))
    (services
      (append
        (list
          service-bin-links
          ;service-ssh
          ;(service dhcp-client-service-type)
          ;service-os-release
          ;service-bootstrap-files; add the trateg git clone script
          ;service-ssh-bitblock
          ;(service trateg-service-type)
          ;service-trateg
          )
        %base-services))
    (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/vda"))
                (terminal-outputs '(console))))
    (file-systems (cons (file-system
                          (mount-point "/")
                           (device "/dev/vda2")
                          (type "ext4"))
                   %base-file-systems))

    
  ))


              




   

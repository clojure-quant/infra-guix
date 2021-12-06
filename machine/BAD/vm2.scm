
;; This is an operating system configuration template for a "Docker image" setup.

;; stolen from guix tarball
;;'gnu/system/examples/docker-image.tmpl'

;; https://github.com/Millak/guix-config/blob/master/vm_config.scm

; load guile namespaces 
(use-modules (gnu)
             (gnu packages shells) ; zsh
             (gnu packages finance)  ; trezord-udev-rules
             (awb99 services trezord)
             (awb99 services networking)
             )

(use-service-modules       
    networking 
              )


; to see where package is stored use:
; guix show git
(use-package-modules base  
                     ncdu
                     wget
                     finance  ; trezord
                     )





(define %ci.guix.gnu.org.pub
  (plain-file "ci.guix.gnu.org.pub"
              "(public-key
                 (ecc
                   (curve Ed25519)
                   (q #8D156F295D24B0D9A86FA5741A840FF2D24F60F7B6C4134814AD55625971B394#)))"))



(operating-system
  (host-name "gorilla")
  (timezone "Etc/UTC") ; "Europe/Berlin"
  (locale "de_AT.utf8") ; "en_US.utf8"
  (keyboard-layout (keyboard-layout "at"))
  ;; This is where user accounts are specified.  The "root" account is
  ;; implicit, and is initially created with the empty password.
  (users (cons (user-account
                 (name "pink")
                 (comment "pink at gorilla")
                 (uid 2002) ; uid needs to match user in host for docker
                 (group "users")
                 (supplementary-groups '("wheel" ; sudo
                                         "audio" 
                                        "video"
                                        "input"
                                         "tty"
                                         "lp"
                                         ))
                 (home-directory "/home/pink")
                 ;(shell (file-append zsh "/bin/zsh"))
                  ;; Specify a SHA-512-hashed initial password.
                  ;; (password (crypt "InitialPassword!" "$6$abc"))
                  (password "")
                                        )
               %base-user-accounts))

  ; (packages %base-packages)
  (packages 
     (append 
        (list 
          trezord
           wget 
           ncdu) 
           %base-packages))
  
  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets '("/dev/vda"))
                ;(bootloader grub-efi-bootloader)
                ;(target "/boot/efi")
                (terminal-outputs '(console))))

  (file-systems        %base-file-systems)

  ;; more services here:
  ;; https://github.com/Millak/guix-config/blob/master/macbook41_config.scm
  ; (services %base-services)
  (services 
    (cons*

      

      ; networking (needed by trezord)
      (service dhcp-client-service-type)

      (service trezord-service-type
                    (trezord-configuration))




      (modify-services %base-services
                     ;; The default udev rules are not needed in a VM.
                     (udev-service-type config =>
                                        (udev-configuration
                                          (inherit config)
                                          (rules '())))
                     (guix-service-type config =>
                                        (guix-configuration
                                          (inherit config)
                                          (substitute-urls
                                            (list "https://ci.guix.gnu.org"
                                                  "https://bayfront.guixsd.org"))
                                          (authorized-keys
                                            (list %ci.guix.gnu.org.pub)))))))




  ; end of os
  )


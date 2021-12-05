(use-modules (gnu)
             (guix modules))
(use-service-modules networking
                     ssh)
(use-package-modules admin
                     certs
                     package-management
                     ssh
                     tls)
 
(operating-system
  (host-name "my-server")
  (timezone "America/New_York")
  (locale "en_US.UTF-8")
  ;; This goofy code will generate the grub.cfg
  ;; without installing the grub bootloader on disk. 
  (bootloader (bootloader-configuration
               (bootloader
                (bootloader
                 (inherit grub-bootloader)
                 (installer #~(const #true))))))
  
(file-systems (cons (file-system
                        (device "/dev/sda")
                        (mount-point "/")
                        (type "ext4"))
                      %base-file-systems))
 
 
  (swap-devices (list "/dev/sdb"))
 

 
  (initrd-modules (cons "virtio_scsi"    ; Needed to find the disk
                        %base-initrd-modules))
 
  (users (cons (user-account
                (name "janedoe")
                (group "users")
                ;; Adding the account to the "wheel" group
                ;; makes it a sudoer.
                (supplementary-groups '("wheel"))
                (home-directory "/home/janedoe"))
               %base-user-accounts))
 
  (packages (cons* nss-certs            ;for HTTPS access
                   openssh-sans-x
                   %base-packages))
 
  (services (cons*
             (service dhcp-client-service-type)
             (service openssh-service-type
                      (openssh-configuration
                       (openssh openssh-sans-x)
                       (password-authentication? #false)
;                       (authorized-keys
;                        `(("janedoe" ,(local-file "janedoe_rsa.pub"))
;                          ("root" ,(local-file "janedoe_rsa.pub"))
;)
;)
))
             %base-services)))


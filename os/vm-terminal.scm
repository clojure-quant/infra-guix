(use-modules (gnu) 
             (guix) 
             (srfi srfi-1)
             (gnu packages shells) ; zsh
             (gnu services web)
             (gnu packages logging) ; tailon
             (gnu packages mc)
             (gnu packages disk) ; ranger
            
             (awb99 config users)
             (awb99 config mail)
             (awb99 config cron)

             (awb99 config os-release)
             (awb99 config special-files)
             (awb99 config mingetty)
             (awb99 services trezord-debug)
             (awb99 config nginx)       
            )
             
(use-service-modules desktop mcron networking spice ssh)
(use-package-modules bootloaders certs fonts nvi
                     package-management wget)


(define vm-image-motd (plain-file "motd" "
\x1b[1;37mThis is the GNU system.  Welcome!\x1b[0m

This instance of Guix is a template for virtualized environments.
You can reconfigure the whole system by adjusting /etc/config.scm
and running:

  guix system reconfigure /etc/config.scm

Run '\x1b[1;37minfo guix\x1b[0m' to browse documentation.

\x1b[1;33mConsider setting a password for the 'root' and 'guest' \
accounts.\x1b[0m
"))



(operating-system
  (host-name "vm1")
  (timezone "Europe/Amsterdam") ; (timezone "Etc/UTC")
  (locale "en_US.utf8")
  ; (keyboard-layout (keyboard-layout "us" "altgr-intl"))
  (keyboard-layout (keyboard-layout "at"))
  (label (string-append "GNU Guix " (package-version guix))) ;; Label for the GRUB boot menu.
  (firmware '())
  ;; Below we assume /dev/vda is the VM's hard disk.
  (bootloader (bootloader-configuration
               (bootloader grub-bootloader)
               (targets '("/dev/vda"))
               (terminal-outputs '(console))))
  (file-systems (cons (file-system
                        (mount-point "/")
                        (device "/dev/vda1")
                        (type "ext4"))
                      %base-file-systems))

  (users myusers-vm)

  ;; Our /etc/sudoers file.  Since 'guest' initially has an empty password,
  ;; allow for password-less sudo.
  (sudoers-file (plain-file "sudoers" "\
root ALL=(ALL) ALL
%wheel ALL=NOPASSWD: ALL\n"))

  (packages (append (list  nss-certs 
                           nvi 
                           wget 
                           trezord 
                           mc
                           ranger)
                    %base-packages))

  (services
   (append (list 
                 service-os-release
                 service-bin-links
                ; service-login-prompt

                 (service dhcp-client-service-type)  ;; Use the DHCP client service rather than NetworkManager.
                
                 (service mcron-service-type
                   (mcron-configuration
                     (jobs my-guix-maintenance-jobs)))
                 (service trezord-service-type
                    (trezord-configuration))
                 my-certbot-service
                 my-nginx-service
                 (service tailon-service-type
                    (tailon-configuration
                       (config-file
                         (tailon-configuration-file
                           (allowed-commands '("tail" "grep" "awk" "sed"))))))
                 )

           ;(append (lepiller-mail-services   
           ;          #:interface "ens3"         
           ;          #:domain "pinkgorilla.org") 
           ;         %base-services
           ;         )
           (patch-mingetty %base-services)
           ; %base-services
          ))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
(use-modules (gnu) 
             (guix) 
             (srfi srfi-1)
             (gnu packages shells) ; zsh
             (gnu packages finance)  ; trezord-udev-rules
             (gnu services web)
             (gnu packages logging) ; tailon
             (gorilla config cron)
             (gorilla services special-files)
             (gorilla services trezord-debug)
             (awb99 services nginx)
             (awb99 config mail)
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

  ;; Label for the GRUB boot menu.
  (label (string-append "GNU Guix " (package-version guix)))

  (firmware '())

  ;; Below we assume /dev/vda is the VM's hard disk.
  ;; Adjust as needed.
  (bootloader (bootloader-configuration
               (bootloader grub-bootloader)
               (targets '("/dev/vda"))
               (terminal-outputs '(console))))
  (file-systems (cons (file-system
                        (mount-point "/")
                        (device "/dev/vda1")
                        (type "ext4"))
                      %base-file-systems))

  (users (cons (user-account
                (name "florian")
                (comment "GNU Guix Live")
                (password "")                     ;no password
                (group "users")
                (supplementary-groups '("wheel" "netdev"
                                        "audio" "video")))
               %base-user-accounts))

  ;; Our /etc/sudoers file.  Since 'guest' initially has an empty password,
  ;; allow for password-less sudo.
  (sudoers-file (plain-file "sudoers" "\
root ALL=(ALL) ALL
%wheel ALL=NOPASSWD: ALL\n"))

  (packages (append (list  nss-certs nvi wget trezord  )
                    %base-packages))

  (services
   (append (list 

                 ;; Use the DHCP client service rather than NetworkManager.
                 (service dhcp-client-service-type)

                 service-bin-links

                 (service trezord-service-type
                    (trezord-configuration))

                  (service mcron-service-type
                  (mcron-configuration
                    (jobs %guix-maintenance-jobs)))

                  my-certbot-service
                  my-nginx-service

                 (service tailon-service-type
                    (tailon-configuration
                       (config-file
                         (tailon-configuration-file
                           (allowed-commands '("tail" "grep" "awk" "sed"))))))
                          
                  
                 
                 )

           (append (lepiller-mail-services   
                     #:interface "ens3"         
                     #:domain "pinkgorilla.org") 
                    %base-services
                    )
           ; %base-services
          ))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
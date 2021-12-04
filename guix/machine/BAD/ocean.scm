
; https://stumbles.id.au/getting-started-with-guix-deploy.html
; https://guix.gnu.org/blog/2019/managing-servers-with-gnu-guix-a-tutorial/
; https://wiki.pantherx.org/Installation-digital-ocean/

; https://git.pixie.town/pinoaffe/config/src/branch/master/hostile_takeover.sh


; guix system disk-image -t qcow2 config.scm' .
; then uploaded to custom image in DO interface. 
; make sure to upload image to the region you wish to deploy to. 
; and make sure you select one that's actually available to deploy droplet


(use-modules
   (gnu services admin))

(use-service-modules networking ssh web)
(use-package-modules bootloaders ssh)

(define %system
  (operating-system
   (host-name "atlanticocean")
   (timezone "Etc/UTC")
   (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (target "/dev/vda")
                (terminal-outputs '(console))))
   (file-systems (cons (file-system
                        (mount-point "/")
                        ;; Must be vda2 or you won't be able to reboot after `guix deploy`.
                        ;; This is because our base image makes an EFI partition at vda1.
                        (device "/dev/vda2")
                        (type "ext4"))
                       %base-file-systems))
   (services
    (append (list (service dhcp-client-service-type)
                  (service openssh-service-type
                           (openssh-configuration
                            (openssh openssh-sans-x)
                            (password-authentication? #false)
                            (permit-root-login #t)
                            (authorized-keys
                             ;; Authorise our SSH key.
                             `(("root" ,(local-file "id_rsa.pub"))))))
                  ;; Security updates, yes please!
                  (service unattended-upgrade-service-type)
                  ;; Note that Nginx isn't automatically restarted during
                  ;; `guix deploy`, so run `herd restart nginx`.
          )
            (modify-services %base-services
              ;; The server must trust the Guix packages you build. If you add the signing-key
              ;; manually it will be overridden on next `guix deploy` giving
              ;; "error: unauthorized public key". This automatically adds the signing-key.
              (guix-service-type config =>
                                 (guix-configuration
                                  (inherit config)
                                  (authorized-keys
                                   (append (list (local-file "/etc/guix/signing-key.pub"))
                                           %default-authorized-guix-keys)))))))))



(define c-do
   (digital-ocean-configuration
       (region "nyc1")
       (size "s-1vcpu-1gb")
       (enable-ipv6? #f)
       (ssh-key "/home/florian/repo/myLinux/data/ssh/coin")
       (tags (list "ubuntu-s-1vcpu-1gb-nyc1-01"
       ))
       ))

(define c-ssh
  (machine-ssh-configuration
    ;; Use host name or IP address here.
    (host-name "15.88.0.1")
    (system "x86_64-linux")
    ;; Update this!
    (host-key "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKp5IsRNi/qU2vrWNaH9MlZnOzN4umiEXkamScuwxF4M")
    (user "root")
    ;; Use this key to communicate with the machine.
    (identity "id_rsa")
    (port 22))
  )


(list (machine
       (operating-system %system)
       (environment digital-ocean-environment-type) ;  managed-host-environment-type)
       (configuration c-do)))



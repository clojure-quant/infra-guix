; https://notabug.org/jbranso/linode-guix-system-configuration/src/master/linode-locke-lamora-current-config.scm


(add-to-load-path (dirname (current-filename)))

(use-modules (gnu)
             (guix modules)
             (secret nginx)
             (public-keys)
             ;;(gnucode-form)
             (endlessh-service)
             (opensmtpd))
(use-service-modules admin ; unattended-upgrades
                     certbot
                     mail
                     mcron
                     messaging
                     networking
                     ssh
                     vpn ;;wireguard
                     web)
(use-package-modules admin
                     certs
                     package-management
                     ssh
                     tls)

(define %nginx-deploy-hook
  (program-file
   "nginx-deploy-hook"
   #~(let ((pid (call-with-input-file "/var/run/nginx/pid" read)))
       (kill pid SIGHUP))))

(define %user "joshua")

(operating-system
  (host-name "locke-lamora")
  (timezone "America/Chicago")
  (locale "en_US.UTF-8")
  ;; This goofy code will generate the grub.cfg
  ;; without installing the grub bootloader on disk.
  (bootloader (bootloader-configuration
               (bootloader
                (bootloader
                 (inherit grub-bootloader)
                 (installer #~(const #t))))))
  (file-systems (cons (file-system
                        (device "/dev/sda")
                        (mount-point "/")
                        (type "ext4"))
                      %base-file-systems))

  (swap-devices (list "/dev/sdb"))

  (initrd-modules (cons "virtio_scsi"    ; Needed to find the disk
                        %base-initrd-modules))

  (users (cons* (user-account
                 (name "joshua")
                 (group "users")
                 ;; Adding the account to the "wheel" group
                 ;; makes it a sudoer.
                 (supplementary-groups '("wheel"))
                 (home-directory "/home/joshua"))
;;                 (user-account
;;                  (name "vmail")
;;                  (group "vmail")
;;                  (home-directory "vmail")
;;                  (system? #t)
;;                  (comment "User that dovecot users to deliver emails
;; to /home/vmail/gnucode.me/joshua"))
                %base-user-accounts))

  ;; (groups (cons* (user-group
  ;;                 (name "vmail")
  ;;                 (system? #t))
  ;;                %base-groups))

  (sudoers-file
   (plain-file "sudoers"
               (string-append (plain-file-content %sudoers-specification)
                              (format #f "~a ALL = NOPASSWD: ALL~%"
                                      "joshua"))))

  (packages (cons* nss-certs            ;for HTTPS access
                   openssh-sans-x
                   %base-packages))
  
  (services (cons*
             (service dhcp-client-service-type)

             (service certbot-service-type
                      (certbot-configuration
                       (email "jbranso@dismail.de")
                       (webroot "/srv/www")
                       (certificates
                        (list
                         (certificate-configuration
                          (name "gnucode.me")
                          (domains '("gnucode.me" "www.gnucode.me"
                                     "mail.gnucode.me" "imap.gnucode.me"
                                     "smtp.gnucode.me" "wireguard.gnucode.me"))
                          (deploy-hook %nginx-deploy-hook))
                         (certificate-configuration
                          (name "gnu-hurd.com")
                          (domains '("gnu-hurd.com" "www.gnu-hurd.com"))
                          (deploy-hook %nginx-deploy-hook))
                         (certificate-configuration
                          (name "propernaming.org")
                          (domains '("propernaming.org" "www.propernaming.org"))
                          (deploy-hook %nginx-deploy-hook))
                         ))))

             (dovecot-service #:config
                              (dovecot-configuration
                               (mail-location "maildir:/home/%n/Maildir")
                               (protocols
                                (list
                                 (protocol-configuration
                                  (name "imap")
                                  (mail-max-userip-connections 3))))
                               ;; someone tries to login via joshua@gnucode.me
                               ;; this strips away that login username to "joshua"
                               ;; when I set up virtual users, I'll need to delete this!
                               ;; https://wiki.dovecot.org/DomainLost
                               ;; auth_username_format = %Ln
                               ;; lowercases the username but also
                               ;; drops the domain. Use
                               ;; auth_username_format = %Lu instead.
                               ;; (auth-username-format "%Ln")
                               ;; for now just use the defaults...
                               ;; (services
                               ;;  (list
                               ;;   (service-configuration
                               ;;    (kind "imap")
                               ;;    (client-limit 2))
                               ;;   (service-configuration
                               ;;    (kind "imap-login")
                               ;;    (clint-limit 2))
                               ;;   (service-configuration
                               ;;    (kind "auth")
                               ;;    (client-limit 2))
                               ;;   (service-configuration
                               ;;    (kind "auth-worker")
                               ;;    (client-limit 2))
                               ;;   (service-configuration
                               ;;    (kind "dict")
                               ;;    (client-limit 2)))
                               ;;  )

                               ;; perhaps I DO NOT need to use letsencrypt certs...
                               ;; because guix creates these certs for me by default in
                               ;; /etc/dovecot/
                               ;; I guess that I do need/want these certs.  Otherwise dovecot
                               ;; tries to connect to my server insecurely.
                               ;; which means that I probably need to change my user joshua password
                               ;; since I have been sending it insecurely!
                               (ssl-cert  "</etc/letsencrypt/live/gnucode.me/fullchain.pem")
                               (ssl-key "</etc/letsencrypt/live/gnucode.me/privkey.pem")
                               ))

             (service endlessh-service-type)

             ;;(service gnucode -form-service-type)

             (service mcron-service-type
                      (mcron-configuration
                       (jobs (list
                              ;; run endlessh every 5 minutes
                              #~(job "*/1 0 * * *"
                                     (string-append #$endlessh "/bin/endlessh -p 22")
                                     #:user "root")))))

             (service nginx-service-type
                      (nginx-configuration
                       (server-blocks
                        (list
                         (nginx-server-configuration
                          (server-name '("gnucode.me"))
                          (listen '("80" "443 ssl http2"
                                    "[::]:80" "[::]:443 ssl http2"))
                          (root "/srv/www/html/gnucode.me/site/")
                          ;; tell browsers my site supports HTTPS, and tell them that it will
                          ;; at least work for 1/2 hour.  Gradually,  I will increase this number.
                          (ssl-certificate "/etc/letsencrypt/live/gnucode.me/fullchain.pem")
                          (ssl-certificate-key "/etc/letsencrypt/live/gnucode.me/privkey.pem")
                          (raw-content (list "add_header Strict-Transport-Security max-age=1800;"))
                          (locations
                           (list
                            (nginx-location-configuration          ;certbot
                             (uri "/.well-known")
                             (body (list "root /srv/www;")))
                            (nginx-location-configuration
                             (uri "/form/")
                             (body '("proxy_pass http://127.0.0.1:8081;")))
                            %secret-nginx-location
                            )))
                         (nginx-server-configuration
                          (server-name '("gnu-hurd.com"))
                          (listen '("80" "443 ssl"))
                          (root "/srv/www/html/gnu-hurd.com/")
                          (ssl-certificate "/etc/letsencrypt/live/gnu-hurd.com/fullchain.pem")
                          (ssl-certificate-key "/etc/letsencrypt/live/gnu-hurd.com/privkey.pem")
                          ;; tell browsers my site supports HTTPS, and tell them that it will
                          ;; at least work for 1/2 hour.  Gradually,  I will increase this number.
                          (raw-content (list "add_header Strict-Transport-Security max-age=1800;"))
                          (locations
                           (list
                            (nginx-location-configuration          ;certbot
                             (uri "/.well-known")
                             (body (list "root /srv/www;"))))))
                         (nginx-server-configuration
                          (server-name '("propernaming.org"))
                          (listen '("80" "443 ssl"))
                          (root "/srv/www/html/propernaming.org/site/")
                          (ssl-certificate "/etc/letsencrypt/live/propernaming.org/fullchain.pem")
                          (ssl-certificate-key "/etc/letsencrypt/live/propernaming.org/privkey.pem")
                          ;; tell browsers my site supports HTTPS, and tell them that it will
                          ;; at least work for 1/2 hour.  Gradually,  I will increase this number.
                          (raw-content (list "add_header Strict-Transport-Security max-age=1800;"))
                          (locations
                           (list
                            (nginx-location-configuration          ;certbot
                             (uri "/.well-known")
                             (body (list "root /srv/www;"))))))
                         ))))
             (service openssh-service-type
                      (openssh-configuration
                       (openssh openssh-sans-x)
                       (password-authentication? #f)
                       (port-number 63355)
                       (authorized-keys
                        `(
                          ;; ("joshua" ,(local-file "/home/joshua/linode-guix-system-configuration/ssh-keys/joshua_id_rsa.pub"))
                          ;; ("root" ,(local-file "/home/joshua/linode-guix-system-configuration/ssh-keys/joshua_id_rsa.pub"))
                          ;; local file is simpler.  I can get rid of (use-module (secret ssh-keys))
                          ("joshua" ,(plain-file "id_rsa.pub" %joshua-ssh-key))
                          ("root" ,(plain-file "id_rsa.pub" %joshua-ssh-key))
                          ))))

             ;; I've created the prosody admin user, and I imported the cert...
             ;; but pidgin tells me that I the XMPP server at gnucode.me does not support encryption.
             (service prosody-service-type
                      (prosody-configuration
                       ;;(certificates "/etc/")
                       (admins '("jbranso@gnucode.me"))
                       (virtualhosts
                        (list
                         (virtualhost-configuration
                          (domain "gnucode.me"))))))

             (service mail-aliases-service-type
                      '(("webmaster" "root")
                        ("postmaster" "root")
                        ("abuse" "root")))

             ;; I can test send an email from my ssh machine via:
             ;; cat test-email.txt  | msmtp -- jbranso@dismail.de
             (service opensmtpd-service-type
                      (opensmtpd-configuration
                       (config-file %smtpd.conf)))

             (service unattended-upgrade-service-type)

             ;; (service wireguard-service-type
             ;;          (wireguard-configuration
             ;;           (private-key "/home/joshua/linode-guix-system-configuration/wireguard-keys/server.private.key")
             ;;           (peers
             ;;            (list
             ;;             (wireguard-peer
             ;;              (name "my servers peer for my laptop")
             ;;              (public-key "/home/joshua/linode-guix-system-configuration/wireguard-keys/laptop.pub"))))))
             %base-services)))


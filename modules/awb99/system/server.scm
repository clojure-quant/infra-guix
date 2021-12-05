(define-module (awb99 system server)
  #:export (%guix-maintenance-jobs
            ;%guix-temproots
            ;%tmp-tmpfs
            ))

; https://notabug.org/jbranso/linode-guix-system-configuration/src/master/deploy-locke-lamora-linode-simple.scm

(use-modules (gnu)
             (gnu services admin) ; unattended upgrades
             (awb99 services special-files)
             (awb99 config mail)
             )

(use-service-modules certbot networking ssh web)
(use-package-modules certs rsync screen ssh)

(define (cert-path host file)
  (format #f "/etc/letsencrypt/live/~a/~a.pem" host (symbol->string file)))


(define-public my-packages
  (cons* nss-certs openssh rsync screen
         %base-packages))


(define %%base-services
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

(define (set-up-html-directory directories)
  (when (not (access? "/srv/http" (logior R_OK W_OK)))
             (mkdir "/srv/http")))


(define %nginx-deploy-hook
  (program-file
    "nginx-deploy-hook"
    #~(let ((pid (call-with-input-file "/var/run/nginx/pid" read)))
           (kill pid SIGHUP))))


(define-public my-server
(operating-system
 (host-name "oceanic")
 (timezone "Europe/Paris")
 (locale "en_US.utf8")
 (bootloader (bootloader-configuration
              (bootloader grub-bootloader)
              (targets (list "/dev/vda"))
              (terminal-outputs '(console))))
 (file-systems (cons (file-system
                      (mount-point "/")
                      (device "/dev/vda1")
                      (type "ext4"))
                     %base-file-systems))
 (packages my-packages)
 (services
  (append
   (list
    
    ;; Security updates, yes please!
    (service unattended-upgrade-service-type)

    (service openssh-service-type
             (openssh-configuration
              (openssh openssh-sans-x)
              (permit-root-login 'prohibit-password)
              (authorized-keys
               `(("root"
                  ,(local-file "/home/florian/repo/myLinux/data/ssh/coin.pub"))))))

    service-bin-links

    (service certbot-service-type
             (certbot-configuration
              (email "hoertlehner@gmail.com")
              (webroot "/var/www")
              (certificates
               (list
                (certificate-configuration
                    (name "gorilla")
                    (domains '("pinkgorilla.org" "www.pinkgorilla.org"))
                    (deploy-hook %nginx-deploy-hook))
                ; (certificate-configuration
                ;    (name "gnu-hurd.com")
                ;    (domains '("gnu-hurd.com" "www.gnu-hurd.com"))
                ;    (deploy-hook %nginx-deploy-hook))
                
                ))))


    (service dhcp-client-service-type)
    (service nginx-service-type
             (nginx-configuration
              (server-blocks
               (list
                ; (nginx-server-configuration
                ;  (server-name '("pinkgorilla.org"))
                ;  (listen '("80"   
                ;           "[::]:80"
                ;           "443 ssl http2" 
                ;           "[::]:443 ssl http2"))
                ;  (root "/var/www/html/")
                ;  (ssl-certificate "/etc/letsencrypt/live/pinkgorilla.org/fullchain.pem")
                ;  (ssl-certificate-key "/etc/letsencrypt/live/pinkgorilla.org/privkey.pem")
                ;  ; (ssl-certificate (cert-path "pinkgorilla.org" 'fullchain))
                ;  ; (ssl-certificate-key (cert-path "pinkgorilla.org" 'privkey))
                ;  (locations
                ;    (list
                ;      (nginx-location-configuration          ;certbot
                ;        (uri "/.well-known")
                ;        (body (list "root /var/www;")))

                ;      (nginx-location-configuration
                ;         (uri "/")
                ;         (body (list "index index.html;"))))))
                ))))
    )

  (append (lepiller-mail-services   
  #:interface "ens3"         
  #:domain "pinkgorilla.org") 
 %%base-services
 )

  ; %%base-services
  ))))

   my-server
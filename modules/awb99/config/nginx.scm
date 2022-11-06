(define-module (awb99 config nginx)
#:export (my-certbot-service my-nginx-service)

)

; https://notabug.org/jbranso/linode-guix-system-configuration/src/master/deploy-locke-lamora-linode-simple.scm

(use-modules (gnu)
           (gnu services admin) ; unattended upgrades
           )

(use-service-modules certbot networking ssh web)
(use-package-modules certs rsync screen ssh)

(define (cert-path host file)
   (format #f "/etc/letsencrypt/live/~a/~a.pem" host (symbol->string file)))



(define %nginx-deploy-hook
(program-file
  "nginx-deploy-hook"
  #~(let ((pid (call-with-input-file "/var/run/nginx/pid" read)))
         (kill pid SIGHUP))))

(define (set-up-html-directory directories)
  (when (not (access? "/srv/http" (logior R_OK W_OK)))
             (mkdir "/srv/http")))
    
    




(define my-certbot-service
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
    
    )))))



(define my-nginx-service
(service nginx-service-type
(nginx-configuration
 (server-blocks
  (list
  ; (nginx-server-configuration
  ;   (server-name '("gorilla"))
  ;   (listen '("80"   
  ;            ; "[::]:80"
  ;          ))
  ;   (root "/var/www/html/")
  ;   (locations
  ;     (list
  ;       ;(nginx-location-configuration          ;certbot
  ;        ; (uri "/.well-known")
  ;         ; (body (list "root /var/www;")))
  ;       (nginx-location-configuration
  ;          (uri "/")
  ;          (body (list "index index.html;"))))))

    ;(nginx-server-configuration
    ;    (server-name '("pinkgorilla.org"))
    ;    (listen '("443 ssl http2" 
    ;             "[::]:443 ssl http2"))
    ;    (root "/var/www/html/")
    ;    (ssl-certificate "/etc/letsencrypt/live/pinkgorilla.org/fullchain.pem")
    ;    (ssl-certificate-key "/etc/letsencrypt/live/pinkgorilla.org/privkey.pem")
    ;    ; (ssl-certificate (cert-path "pinkgorilla.org" 'fullchain))
    ;    ; (ssl-certificate-key (cert-path "pinkgorilla.org" 'privkey))
    ;    (locations
    ;      (list
    ;        (nginx-location-configuration
    ;           (uri "/")
    ;           (body (list "index index.html;"))))))

        

))))

 )


;; /var/lib/certbot/renew-certificates


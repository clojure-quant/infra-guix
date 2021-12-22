(define-module (awb99 services trateg)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (nongnu packages clojure)
  #:export (trateg-configuration
            trateg-service-type
            service-trateg
          ))


; see: https://github.com/guix-mirror/guix/blob/892f1b7273d57b25940700877a02618fe826cc08/gnu/services/syncthing.scm
       
(define-record-type* <trateg-configuration>
  trateg-configuration make-trateg-configuration
  trateg-configuration?
    (user trateg-configuration-user      ;string
       (default #f))
    (group trateg-configuration-group     ;string
      (default "users"))
    (home trateg-configuration-home      ;string
      (default #f))
    (param1 trateg-configuration-param1
            (default "foo"))
    (arguments trateg-configuration-arguments ;list of strings
            (default '()))  
  )
 
(define trateg-shepherd-service
  (match-lambda
    (($ <trateg-configuration> user group home param1 arguments)
      (list 
        (shepherd-service
          (provision '(trateg))
          (documentation "trateg goldly docs")
          (requirement '(loopback))  ; services need to be started before current service
          (start 
            #~(make-forkexec-constructor
                (append (list (string-append #$clojure-tools "/bin/clj")
                              "-X:goldly-docs")
                         '#$arguments)
            #:directory "/home/shared/repo/clojure-quant/trateg/app/demo"
            #:user "florian"
            #:group "users"
            #:environment-variables (append (list (string-append "HOME=" (or #$home (passwd:dir (getpw #$user))))
                                                    "SSL_CERT_DIR3=/etc/ssl/certs"
                                                    "SSL_CERT_FILE3=/etc/ssl/certs/ca-certificates.crt"
                                                   )
                                            (remove (lambda (str)
                                              (or (string-prefix? "HOME=" str)
                                                  (string-prefix? "SSL_CERT_DIR3=" str)
                                                  (string-prefix? "SSL_CERT_FILE3=" str)))
                                              (environ)))
            #:log-file "/home/shared/goldly.log"
            ;#:pid-file #f
            ;#:pid-file-timeout (default-pid-file-timeout)
            ;#:file-creation-mask #f
            )) 
          (respawn? #f)
          (stop #~(make-kill-destructor))
    )))))
         

(define trateg-service-type
  (service-type
    (name 'trateg)
    (extensions (list (service-extension 
                       shepherd-root-service-type
                       trateg-shepherd-service)))
    (description "trateg goldly-docs")
    ;(default-value (trateg-configuration)) 
  ))
  

(define service-trateg
  (service trateg-service-type
     (trateg-configuration 
       ; (param1 "bongo") 
       ; (arguments '())  
        )))
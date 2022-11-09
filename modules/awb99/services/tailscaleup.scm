(define-module (awb99 services tailscaleup)
#:use-module (guix gexp)
#:use-module (gnu packages)
#:use-module (gnu services)
#:use-module (gnu services shepherd)
#:use-module (awb99 package tailscale)
#:export (tailscaleup-service))

(define tailscaleup-shepherd-service
(lambda (config)
  (list (shepherd-service
         (documentation "tailscaleup daemon.")
         (provision '(tailscaleup))
         (requirement '(networking tailscale))
         (actions (list ))
         (one-shot? #t)
         (start #~(make-forkexec-constructor
                   (list 
                     (string-append #$tailscale "/bin/tailscale")
                     "up")
                   #:log-file "/var/log/tailscaleup.log"
                   #:user "root"
                   #:environment-variables 
                      ;(append 
                         (list 
                           "PATH=/run/setuid-programs:/run/current-system/profile/bin:/run/current-system/profile/sbin"
                           "MYVAULT=/home/florian/repo/myLinux/myvault"
                          )
                          ;(environ))
                  ))
         (stop #~(make-kill-destructor))))))

(define tailscaleup-service-type
  (service-type 
    (name 'tailscaleup)
    (description "tailscaleup onetime.")
    (extensions
      (list (service-extension 
             shepherd-root-service-type
             tailscaleup-shepherd-service)))))

(define tailscaleup-service
  (service tailscaleup-service-type (list)
    ))


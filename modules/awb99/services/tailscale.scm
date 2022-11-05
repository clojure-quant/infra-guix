(define-module (awb99 services tailscale)
#:use-module (guix gexp)
#:use-module (gnu packages)
#:use-module (gnu services)
#:use-module (gnu services shepherd)
#:use-module (awb99 package tailscale)
#:export (tailscale-service))

; in building tailscale service,
; I used nonguix zerotier service as a template.
  
;(define %zerotier-action-join
;(shepherd-action
; (name 'join)
; (documentation "Join a network")
; (procedure #~(lambda (running network)
;                (let* ((zerotier-cli (string-append #$zerotier "/sbin/zerotier-cli"))
;                       (cmd (string-join (list zerotier-cli "join" network)))
;                       (port (open-input-pipe cmd))
;                       (str (get-string-all port)))
;                  (display str)
;                  (status:exit-val (close-pipe port)))))))

;(define %zerotier-action-leave
;(shepherd-action
; (name 'leave)
; (documentation "Leave a network")
; (procedure #~(lambda (running network)
;                (let* ((zerotier-cli (string-append #$zerotier "/sbin/zerotier-cli"))
;                       (cmd (string-join (list zerotier-cli "leave" network)))
;                       (port (open-input-pipe cmd))
;                       (str (get-string-all port)))
;                  (display str)
;                  (status:exit-val (close-pipe port)))))))

(define tailscale-shepherd-service
(lambda (config)
  (list (shepherd-service
         (documentation "Tailscale daemon.")
         (provision '(tailscale))
         (requirement '(networking))
         (actions (list ;%zerotier-action-join
                        ;%zerotier-action-leave
                    ))
         (start #~(make-forkexec-constructor
                   (list (string-append #$tailscale "/bin/tailscaled")
                         "--state=/var/run/tailscaled.state")
                   #:log-file "/var/log/tailscaled.log"
                   #:environment-variables 
                      (append 
                         (list 
                           "PATH=/run/setuid-programs:/run/current-system/profile/bin:/run/current-system/profile/sbin"
                          )
                          (environ))
                  ))
         (stop #~(make-kill-destructor))))))

(define tailscale-service-type
(service-type (name 'tailscale)
              (description "Tailscale daemon.")
              (extensions
               (list (service-extension shepherd-root-service-type
                                        tailscale-shepherd-service)))))

(define (tailscale-service config) ;#:key (config (list))
  (service tailscale-service-type 
    config
))

;(display "tailscale service compiled!")
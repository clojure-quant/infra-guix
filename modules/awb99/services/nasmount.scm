(define-module (awb99 services nasmount)
#:use-module (guix gexp)
#:use-module (gnu packages)
#:use-module (gnu services)
#:use-module (gnu services shepherd)
#:export (nasmount-service))

(define nasmount-shepherd-service
(lambda (config)
  (list (shepherd-service
         (documentation "nasmount daemon.")
         (provision '(nasmount))
         (requirement '(networking))
         (actions (list ))
         (one-shot? #t)
         (start #~(make-forkexec-constructor
                   (list "file-luks-nas-start.sh")
                   #:log-file "/var/log/nasmount.log"
                   #:user "root"
                   #:environment-variables 
                      (append 
                         (list 
                           "MYVAULT=/home/florian/repo/myLinux/myvault"
                          )
                          (environ))
                  ))
         (stop #~(make-kill-destructor))))))

(define nasmount-service-type
  (service-type 
    (name 'nasmount)
    (description "Nasmount daemon.")
    (extensions
      (list (service-extension 
             shepherd-root-service-type
             nasmount-shepherd-service)))))

(define nasmount-service
  (service nasmount-service-type (list)
    ))


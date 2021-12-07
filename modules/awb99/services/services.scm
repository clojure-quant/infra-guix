(define-module (gorilla services)
    #:use-module (guix) ; local-file
    #:use-module (gnu services)
    #:use-module (gnu services ssh)
    #:use-module (gnu packages ssh) ; openssh-sans-x
    #:export (vm-services-patch
              gorilla-ssh-service))


; (define (vm-services-patch services)
;   (modify-services services
;        ;; The default udev rules are not needed in a VM.
;        (udev-service-type config =>
;            (udev-configuration
;            (inherit config)
;            (rules '())))
;        ))





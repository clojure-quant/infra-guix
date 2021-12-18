(define-module (awb99 services virtualization))

(use-modules 
  (gnu services)
  (gnu services virtualization)
  )


; virtualization
; The (gnu services virtualization) module provides services for the libvirt and virtlog daemons, as well as other virtualization-related services.
; Libvirt daemon
; libvirtd is the server side daemon component of the libvirt virtualization management system. This daemon runs on host servers and performs required management tasks for virtualized guests.


  (service libvirt-service-type
    (libvirt-configuration 
      ;(tls-port "16555")
      (unix-sock-group "libvirt"))))

(service virtlog-service-type
         (virtlog-configuration
          (max-clients 1000)))


; (define (vm-services-patch services)
;   (modify-services services
;        ;; The default udev rules are not needed in a VM.
;        (udev-service-type config =>
;            (udev-configuration
;            (inherit config)
;            (rules '())))
;        ))
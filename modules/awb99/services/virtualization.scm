(define-module (awb99 services virtualization))

(use-modules 
  (gnu services)
  (gnu services virtualization)
  )


; virtualization
; The (gnu services virtualization) module provides services for the libvirt and virtlog daemons, as well as other virtualization-related services.
; Libvirt daemon
; libvirtd is the server side daemon component of the libvirt virtualization management system. This daemon runs on host servers and performs required management tasks for virtualized guests.

;; libvirt for VMs
(define-public services-virtualization
  (list
    (service libvirt-service-type
      (libvirt-configuration 
        ;(tls-port "16555")
        (unix-sock-group "libvirt")
        (listen-tls? #f)
        (listen-tcp? #f)
        (min-workers 1)))
    (service virtlog-service-type
      (virtlog-configuration
        (max-size 2)
        (max-clients 1000)))))


  


; (define (vm-services-patch services)
;   (modify-services services
;        ;; The default udev rules are not needed in a VM.
;        (udev-service-type config =>
;            (udev-configuration
;            (inherit config)
;            (rules '())))
;        ))





If you’re using Intel processor, then make sure your processor has support for hardware virtualization. 
If it does, then make sure VT-x or VT-d extension is enabled from the BIOS of your computer

packages:  virt-manager

Indeed, it was disabled in the BIOS, after I enabled virtualisation,
/dev/kvm appeared.
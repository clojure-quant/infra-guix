



    (service libvirt-service-type
    (libvirt-configuration
     (unix-sock-group "libvirt")))

(service virtlog-service-type)



virtualization
The (gnu services virtualization) module provides services for the libvirt and virtlog daemons, as well as other virtualization-related services.

Libvirt daemon
libvirtd is the server side daemon component of the libvirt virtualization management system. This daemon runs on host servers and performs required management tasks for virtualized guests.

Scheme Variable: libvirt-service-type


(use-modules (gnu services virtualization))

(service virtlog-service-type)
  (service libvirt-service-type
    (libvirt-configuration 
      (unix-sock-group "libvirt"))))
      
      
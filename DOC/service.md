


custom services:

; endlessh - trick ssh attackers by giving fake ssh daemon.
https://github.com/skeeto/endlessh


https://notabug.org/jbranso/linode-guix-system-configuration/src/master/opensmtpd.scm

  (service openssh-service-type
                       (openssh-configuration
                        (port-number 2222)
                        (permit-root-login #f)
                        (public-key-authentication? #t)))
 
             
              (service libvirt-service-type
                       (libvirt-configuration
                        (unix-sock-group "libvirt")))

              (service virtlog-service-type)

              (service rsync-service-type)

             
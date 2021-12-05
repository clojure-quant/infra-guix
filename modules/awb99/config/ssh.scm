(define-module (awb99 config ssh)
#:use-module (guix) ; local-file
#:use-module (gnu services)
#:use-module (gnu services ssh)
#:use-module (gnu packages ssh) ; openssh-sans-x
#:use-module (gnu packages compression) ; zlib (needed for openssh-sans-x)


#:export (;awb99-ssh-service 
          awb99-ssh-config

))



(define awb99-ssh-config
  (openssh-configuration
    (openssh openssh-sans-x)
    (password-authentication? #false)
    (authorized-keys
      `(("florian" ,(local-file "/home/florian/repo/myLinux/data/ssh/flo5.pub"  )) ; relative this file "../../flo5.pub"
        ("root" ,(local-file "/home/florian/repo/myLinux/data/ssh/flo5.pub" )) ; "../../flo5.pub"
      ))))



(define awb99-ssh-service
  (service openssh-service-type
     awb99-ssh-config
    ))


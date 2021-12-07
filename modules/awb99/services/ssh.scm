(define-module (awb99 services ssh)
  #:use-module (guix) ; local-file
  #:use-module (gnu services)
  #:use-module (gnu services ssh)
  #:use-module (gnu packages ssh) ; openssh-sans-x
  #:use-module (gnu packages compression) ; zlib (needed for openssh-sans-x)
  #:export (awb99-ssh-config
            service-ssh
            service-ssh-dropbear
  ))



(define awb99-ssh-config
  (openssh-configuration
    (openssh openssh-sans-x)
    (password-authentication? #false)
    ;(port-number 2222)
    (permit-root-login 'prohibit-password)
    ;(permit-root-login #f)
    (public-key-authentication? #t)
    (authorized-keys
      `(("florian" ,(local-file "/home/florian/repo/clojure-quant/infra-guix/bootstrap/flo5.pub"  )) ; relative this file "../../flo5.pub"
        ("root" ,(local-file "/home/florian/repo/clojure-quant/infra-guix/bootstrap/flo5.pub" )) ; "../../flo5.pub"
      ))))



(define service-ssh
  (service openssh-service-type
     awb99-ssh-config
    ))

; (service openssh-service-type
; (openssh-configuration
;   (x11-forwarding? #t)
;   (extra-content "StreamLocalBindUnlink yes")))


(define service-ssh-dropbear
  (service dropbear-service-type
    (dropbear-configuration
     (root-login? #t)
     (allow-empty-passwords? #t))))


; endlessh - trick ssh attackers by giving fake ssh daemon.
; https://github.com/skeeto/endlessh
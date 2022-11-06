(define-module (awb99 config ddclient)
  #:use-module (gnu)
  #:use-module (gnu services dns)
  #:use-module (awb99 vault)
)

; https://github.com/guix-mirror/guix/blob/47d73ac41d4613e3e45a8bb338aaa93aace2dd3b/gnu/services/dns.scm

; good dynamic dns services are:
; https://desec.io/
; ydns.io

(define-public service-ddclient-nuc 
  (service ddclient-service-type
    (ddclient-configuration 
      (secret-file (ddclient-config-filename "nuc")) ;"/home/florian/repo/myLinux/data/nuc/ddclient.conf"
      (syslog #f)
      ; user florian will lead to duplicate user warning in os reconfiguration
      ;(user "florian") ; default is "ddclient"
       
    )))



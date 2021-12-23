(define-module (awb99 services ddclient)
  #:use-module (gnu)
  #:use-module (gnu services dns))


; good dynamic dns services are:
; https://desec.io/
; ydns.io


(define-public service-ddclient-nuc 
  (service ddclient-service-type
    (ddclient-configuration 
      (secret-file "/home/florian/repo/myLinux/data/nuc/ddclient.conf")
    )))



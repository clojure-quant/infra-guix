(define-module (awb99 config ddclient)
  #:use-module (gnu)
  #:use-module (gnu services dns))


; good dynamic dns services are:
; https://desec.io/
; ydns.io

(define (ddclient-config-filename machine-name)
(string-append 
   (getenv "MYVAULT") 
   "/ddclient/" 
    machine-name
    "-ddclient.conf"))

(display "ddclient file: ")
(display (ddclient-config-filename "nuc"))

(define-public service-ddclient-nuc 
  (service ddclient-service-type
    (ddclient-configuration 
      (secret-file (ddclient-config-filename "nuc")) ;"/home/florian/repo/myLinux/data/nuc/ddclient.conf"
    )))



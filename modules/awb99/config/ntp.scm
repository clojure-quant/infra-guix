(define-module (awb99 config ntp)
  #:use-module (oop goops)  ; Defining classes and methods.
  #:use-module (gnu) 
  #:use-module (gnu services networking)
  #:export (service-ntp)
  )

; ntp is already in guix desktop services
; this ntp service is for bootstrapping only
;used in embedded machines

(define service-ntp
  (service openntpd-service-type
    (openntpd-configuration
      (listen-on '("127.0.0.1" "::1"))
      ;(sensor '("udcf0 correction 70000"))
      (constraint-from '("www.gnu.org"))
      ;; Prevent moving to year 2116.
      (constraints-from '("https://www.google.com/")))))

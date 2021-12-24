(define-module (awb99 test)
  #:use-module (ice-9 pretty-print)  
  #:use-module (guix gexp)
  #:use-module (gnu services base)
  #:use-module (awb99 config iptables)
  #:use-module (awb99 config users)
  #:use-module (awb99 packages)
  #:use-module (awb99 guixutils)
  #:use-module (awb99 services trateg)
  #:use-module (awb99 machine ocean)
  #:use-module (awb99 services ddclient)
  #:use-module (awb99 config cron)
  #:use-module (awb99 packages desktop)

)

(pretty-print desktop-chat-packages)

;(display "desktop-chat-packages: " desktop-chat-packages)

(display "cron jobs: ")

(pretty-print my-guix-maintenance-jobs)
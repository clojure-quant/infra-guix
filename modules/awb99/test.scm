(define-module (awb99 test)
  #:use-module (ice-9 pretty-print)  
  #:use-module (guix gexp)
  #:use-module (gnu services base)
  #:use-module (awb99 config iptables)
  #:use-module (awb99 config users)
  #:use-module (awb99 packages nuc)
  #:use-module (awb99 packages desktop)
  #:use-module (awb99 guixutils)
  #:use-module (awb99 services trateg)
  #:use-module (awb99 machine ocean)
  ; #:use-module (awb99 config ddclient)
  #:use-module (awb99 config cron)
  #:use-module (awb99 packages nuc)
  #:use-module (awb99 config wayland)
  #:use-module (awb99 helper)
  #:use-module (awb99 home emacs)
  #:use-module (awb99 home sway-service)
)

(pretty-print desktop-chat-packages)

;(display "desktop-chat-packages: " desktop-chat-packages)

(display "cron jobs: ")

(pretty-print my-guix-maintenance-jobs)

(pretty-print user-packages)


(pretty-print (->packages-output user-packages))

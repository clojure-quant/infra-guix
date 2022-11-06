(define-module (awb99 config readymedia)
#:use-module (gnu)
#:use-module (awb99 services readymedia))



(define-public (service-readymedia machine-name)
  (service minidlna-service-type
    (minidlna-configuration 
      (extra-config (string-append 
        "friendly_name=" machine-name "\n"
        "")))))

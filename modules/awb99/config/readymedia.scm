(define-module (awb99 config readymedia)
#:use-module (gnu)
#:use-module (awb99 services readymedia))


; MiniDLNA: ssdp (1900/udp)  trivnet1 (8200/tcp) 

(define-public (service-readymedia machine-name)
  (service minidlna-service-type
    (minidlna-configuration 
      (mediadir "/var/nas/media")
      (usergroup "nas")
      (extra-config (string-append 
        "friendly_name=" machine-name "\n"
        "")))))

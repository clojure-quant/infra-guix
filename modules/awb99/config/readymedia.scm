(define-module (awb99 config readymedia)
#:use-module (gnu)
#:use-module (awb99 services readymedia))


; MiniDLNA: ssdp (1900/udp)  trivnet1 (8200/tcp) 

; media_dir=A,/home/bron/multimedia/audio              audio only dir
; media_dir = P,/home/bron/multimedia/photos           photos only dir
; media_dir = V,/home/bron/media/videos                video only dir 
; media_dir=PV,/home/bron/multimedia/camara_fotos      photo+video dir

; MiniDLNA supports inotify monitoring to automatically discover new files. 
; To enable inotify support the kernel needs to have inotify support enabled.

(define-public (service-readymedia machine-name)
  (service minidlna-service-type
    (minidlna-configuration 
      (mediadir "/media/nas")
      (usergroup "nas")
      (extra-config (string-append 
        "friendly_name=" machine-name "\n"
        "log_level=warn\n" ; debug info warn error fatal off
        "")))))

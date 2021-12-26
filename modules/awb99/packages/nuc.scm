(define-module (awb99 packages nuc)
  #:use-module (awb99 packages)
  #:use-module (awb99 packages fonts)
)


(define-public nuc-packages
(append 
; clojure apps
  clojure-packages
  node-packages
; python-packages
; r-packages
  build-packages
; linux cli
  security-packages
  archive-packages
  monitor-packages
  network-packages
  file-transfer-packages
  shell-packages
  hardware-packages
; apps
  guix-core-packages
  virtual-machine-packages
  crypto-packages
; desktop
  desktop-chat-packages
  desktop-multimedia-packages
  desktop-office-packages
  desktop-browser-packages 
  desktop-tool-packages
  font-packages
; services
  services-packages
    ))


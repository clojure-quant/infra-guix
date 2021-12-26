(define-module (awb99 packages nuc)
  #:use-module (awb99 packages)
  #:use-module (awb99 packages fonts)
  #:use-module (awb99 packages desktop)
)

(define-public packages-nuc-root
  (append
    packages-desktop-extra
    packages-desktop-xfce
    packages-desktop-i3
    packages-desktop-sway
    packages-desktop-printer
    font-packages
    virtual-machine-packages
    crypto-packages
    services-packages
    guix-core-packages
    shell-packages
  ))


(define-public nuc-packages
(append 
  packages-nuc-root

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
  
  hardware-packages
; apps
 
 
; desktop
  desktop-chat-packages
  desktop-multimedia-packages
  desktop-office-packages
  desktop-browser-packages 
  desktop-tool-packages

 
    ))

 

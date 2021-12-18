(use-modules 
  (awb99 packages)    
  )


(define nuc-packages
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
  ; services
    services-packages
      ))


(specifications->manifest nuc-packages)


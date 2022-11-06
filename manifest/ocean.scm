(use-modules 
  (awb99 packages tools)    
  (awb99 packages programming)    
  )


(define ocean-packages
  (append 
  ; clojure apps
    clojure-packages
    ;node-packages
  ; python-packages
  ; r-packages
   ; build-packages
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
  ; desktop
  ;  desktop-chat-packages
  ;  desktop-multimedia-packages
  ;  desktop-office-packages
  ;  desktop-browser-packages 
  ;  desktop-tool-packages
  ; services
    services-packages
      ))


(specifications->manifest ocean-packages)


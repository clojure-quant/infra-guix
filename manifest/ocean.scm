(use-modules 
  (awb99 packages systemcli)    
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
   ; services
    services-packages
      ))


(specifications->manifest ocean-packages)


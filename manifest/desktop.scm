(use-modules 
  (awb99 install clojure)    
  (awb99 install chat)    
  (awb99 install python)    
  (awb99 install r)    
  (awb99 install tools)
  (awb99 install build)      
  (awb99 install desktop)    
  (awb99 install fonts)    
  (awb99 install crypto))


(define my-all 
  (append 
     my-tools 
     my-build 
  ;  my-crypto
  ; desktop
     my-chat 
     my-desktop 
     my-fonts
  ; clojure datascience
     my-clojure 
     ;my-python 
     ;my-r 
   
     ))

; (print my-all)

(specifications->manifest my-all)


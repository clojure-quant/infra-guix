(use-modules 
  (gorilla install clojure)    
  (gorilla install chat)    
  (gorilla install python)    
  (gorilla install r)    
  (gorilla install tools)
  (gorilla install build)      
  (gorilla install desktop)    
  (gorilla install fonts)    
  (gorilla install crypto))


(define my-all 
  (append 
     my-tools 
     my-build 
     my-clojure 
     my-chat 
     my-desktop 
     my-python 
     my-r 
     my-fonts
     my-crypto
   
     ))

; (print my-all)

(specifications->manifest my-all)


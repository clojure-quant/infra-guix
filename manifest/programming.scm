(use-modules
(gnu packages linux) ; wifi driver
(awb99 packages tools)
(awb99 packages fonts)
(awb99 packages wm)
(awb99 packages desktop)
(awb99 packages programming)
(awb99 packages fonts))


(define-public programming-packages
(append 
  ; ********************  clojure apps 
  clojure-packages
  node-packages
  ; ********************  
  ; python-packages
  ; ********************  
  ; r-packages
  ; ********************  cpp-packages
  build-packages

  ))


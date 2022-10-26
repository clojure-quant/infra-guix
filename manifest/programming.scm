(use-modules
(awb99 packages programming))


(define-public programming-packages
(append 
  ; ********************  clojure  
  clojure-packages
  ;node-packages
  ; ********************  
  ; python-packages
  ; ********************  
  ; r-packages
  ; ********************  cpp-packages
  ;build-packages

  ))


(specifications->manifest programming-packages)
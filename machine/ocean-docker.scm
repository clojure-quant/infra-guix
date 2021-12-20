(use-modules 
  (gnu)
  (awb99 packages)
  (awb99 guixutils) 
  )

; https://hpc.guix.info/blog/2021/10/when-docker-images-become-fixed-point/

;; https://github.com/Millak/guix-config/blob/master/vm_config.scm

;; https://github.com/Millak/guix-config/blob/master/macbook41_config.scm

(define extra-packages
  (map (compose list specification->package+output)
   (append 
     (list 
        "nss-certs"
        "openssh-sans-x"
        "mc")
      clojure-packages
      monitor-packages
      archive-packages
      network-packages
      shell-packages
      filesystem-packages
    ))
   )

  


(packages->manifest 
   ;extra-packages
  (append
     extra-packages
     %base-packages)
)
  

; (specifications->manifest %base-packages)
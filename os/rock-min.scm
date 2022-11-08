(use-modules 
  (awb99 machine rock)
  (awb99 machine rock-sp)
  )

(display "installing rock-pro os: min \n")

(define os-rock64-min
  (os-rock64 
    "rockit" 
    rock-packages
    rock-services
   ))

os-rock64-min
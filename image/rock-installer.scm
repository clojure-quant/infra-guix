(use-modules 
  (awb99 machine rock)
  (awb99 machine rock-image)
  (awb99 machine rock-sp)
  (awb99 machine rock-installer)
; of use-modules
)

(display "building rock-pro installer image \n")

(rock64-raw-image
  installation-os-rock64 )
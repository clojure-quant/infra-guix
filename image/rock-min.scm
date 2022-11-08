(use-modules 
  (awb99 machine rock)
  (awb99 machine rock-image)
  (awb99 machine rock-sp)
; of use-modules
)

;; this is a bootstrap image of guix for rock-pro
;; it can be build on x86.
;; it includes files in /etc/static
;; when this image is booted execute bash /etc/static/boostrap.sh
(display "building rock-pro image: min \n")

(define os-rock64-min
  (os-rock-image
    "rockit" 
    rock-packages
    rock-services
   ))

(rock64-raw-image
  os-rock64-min)
(use-modules 
  (awb99 machine rock)
  (awb99 machine rock-sp)
  )

;; this is a bootstrap image of guix for rock-pro
;; it can be build on x86.
;; it includes files in /etc/static
;; when this image is booted execute bash /etc/static/boostrap.sh
(display "installing os rock-pro: nas \n")

(define os-rock64-nas
  (os-rock64-configure
    "rockit" 
    rock-packages-nas
    rock-services-nas
   ))

os-rock64-nas
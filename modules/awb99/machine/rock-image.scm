
(define-module (awb99 machine rock-image)
  #:export (rock64-raw-image))

(use-modules 
  (gnu image)
  (gnu system image)
  (gnu system images rock64)
  (guix platforms arm) ; aarch64-linux
; of use-modules
)


(define (rock64-raw-image rock64-os)
  (image
    (inherit
      (os+platform->image rock64-os aarch64-linux
                          #:type rock64-image-type))
    (name 'rock64-raw-image)))


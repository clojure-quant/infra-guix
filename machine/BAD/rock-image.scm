


;; this is no longer used.

(define rock64-image-type
(image-type
 (name 'rock64-raw)
 (constructor (cut image-with-os
                   (raw-with-offset-disk-image (expt 2 24))
                   <>))))

(define rock64-raw-image
(image
 (inherit
  (os+platform->image rock64-os aarch64-linux
                      #:type rock64-image-type))
 (name 'rock64-raw-image)))

; rock64-raw-image

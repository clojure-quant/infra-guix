;; Generate a bootable image (e.g. for USB sticks, etc.) with:
;; $ guix system disk-image nongnu/system/install.scm

(use-modules
  (gnu system)
  (gnu system install)
  (gnu system keyboard)
  ;  (nongnu packages linux)
 )



(define my-installation-os
  (operating-system
    (inherit installation-os)
    (issue "Guix is Great!  Ave Guix!!  Ave!!!\n\n")
   ;locale
   (timezone "Etc/UTC") ; (timezone "Europe/Paris")
   (locale "en_US.utf8")
   (keyboard-layout (keyboard-layout "at")) ; (keyboard-layout (keyboard-layout "us" "altgr-intl"))
    ;(kernel linux)
    ;(firmware (list linux-firmware)
  
  ))

my-installation-os


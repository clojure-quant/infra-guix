(define-module (awb99 packages nuc)
  #:use-module (gnu packages linux) ; wifi driver
  #:use-module (awb99 packages tools)
  #:use-module (awb99 packages fonts)
  #:use-module (awb99 packages wm)
  #:use-module (awb99 packages desktop)
  #:use-module (awb99 packages programming)
  #:use-module (awb99 packages emacs)
)

(define-public packages-nuc-root
  (append
    packages-desktop-extra
    packages-desktop-xfce
    ;packages-desktop-i3
    packages-desktop-sway
    packages-desktop-printer
    font-packages
    virtual-machine-packages
    crypto-packages
    services-packages
    guix-core-packages
    shell-packages
  ))

(define-public packages-nuc-root-only
  (append
    packages-nuc-root
    (list
      "swaylock"
      "nix"
      "rtl8812au-aircrack-ng-linux-module"
      "wpa-supplicant" ; manage wifi networks
      ;  "mcron"
      ;  "shepherd"
   )))




 


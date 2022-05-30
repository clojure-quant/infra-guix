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
      ;  "mcron"
      ;  "shepherd"
   )))



(define-public nuc-packages
(append 
; ********************  packages-nuc-root
; ********************  linux cli
  security-packages
  archive-packages
  monitor-packages
  network-packages
  file-transfer-packages
  hardware-packages
  ; ********************  clojure apps 
  clojure-packages
  node-packages
; ********************  python-packages
; ********************  r-packages
; ********************  cpp-packages
  build-packages
; ********************  desktop
  desktop-chat-packages
  desktop-multimedia-packages
  desktop-office-packages
  desktop-browser-packages 
  desktop-tool-packages
  ;emacs-packages ; dont include emacs packges here. home will conflict.
  ))

 

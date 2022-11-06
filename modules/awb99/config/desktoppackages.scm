(define-module (awb99 config desktoppackages))

(use-modules 
  (gnu packages) 
  (gnu system) ; %base-packages
  ; (gnu packages linux) ; wifi driver
  (awb99 guixutils) 
  (awb99 packages tools)
  (awb99 packages fonts)
  (awb99 packages wm)
  (awb99 packages desktop)
  (awb99 packages programming)
  (awb99 packages emacs)
  (awb99 packages virtual)
  (awb99 packages crypto)
  (awb99 package tailscale)
)

(define-public cli-packages
(append 
  security-packages
  filesystem-packages
  archive-packages
  monitor-packages
  network-packages
  file-transfer-packages
  hardware-packages))  


(define packages-packagemanager
  (list
    ; other package managers
    "nix"
    "flatpak"))

(define packages-desktop-other
  (list
    "swaylock"
    "wpa-supplicant" ; manage wifi networks
    ; awb99 - rtl8812au module no longer exists in guix kernel. removed due to blobs.
    ;"rtl8812au-aircrack-ng-linux-module" ; rtl8812au USB wifi driver
    ;  "mcron"
    ;  "shepherd"
    "iptables" ; so iptables is in search-path; needed for tailscale
    "readymedia" ; DLNA/UPnP-AV media server (formerly known as MiniDLNA)
    "syncthing"
    ))


(define-public packages-desktop-system
(append
  guix-core-packages
  shell-packages
  cli-packages

  ; a typical desktop machine
  packages-wm-gnome
  packages-wm-sway
  ;packages-wm-xfce
  ;packages-wm-i3
  packages-desktop-printer
  packages-desktop-extra
  font-packages

  ; sort of customized setup
  virtual-machine-packages
  crypto-packages
  packages-desktop-other ; defined above
   
))



(define-public packages-desktop
  (append
    ;(specifications->package packages-desktop-system)
    (->packages-output packages-desktop-system)
    (list
       tailscale ; if tailscale is not installed, then tainscale cli app is not visible.
    )
    %base-packages))


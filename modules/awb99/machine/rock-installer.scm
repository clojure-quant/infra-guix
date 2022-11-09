(define-module (awb99 machine rock-installer)
  #:use-module (gnu system)
  #:use-module (gnu system install)
  #:use-module (gnu packages version-control) ;git
  ;#:use-module (gnu packages vim)
  ;#:use-module (gnu packages linux)
  ;#:use-module (gnu packages mtools)
  #:use-module (gnu packages package-management)
  #:use-module (nongnu packages linux) ; arm kernel
  #:export (installation-os-rock64))

(define installation-os-rock64
  (operating-system
    (inherit installation-os)
    (kernel linux-arm64-generic)
    ;(firmware (list linux-firmware))
    ; linux firmware brings this error: kernel module not found "ahci"
    (firmware %base-firmware)

    ;; Add some extra packages useful for the installation process
    (packages
     (append (list git )
             (operating-system-packages installation-os)))))


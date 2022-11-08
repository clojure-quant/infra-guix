;;; https://github.com/daviwil/dotfiles/blob/master/.config/guix/systems/install.scm

;; Generate a bootable image (e.g. for USB sticks, etc.) with:
;; $ guix system disk-image nongnu/system/install.scm

(define-module (nongnu system install)
  #:use-module (gnu system)
  #:use-module (gnu system install)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mtools)
  #:use-module (gnu packages package-management)
  #:use-module (nongnu packages linux)
  #:export (installation-os-nonfree))

(define installation-os-nonfree
  (operating-system
    (inherit installation-os)
    (kernel linux)
    (firmware (list linux-firmware))

    ;; Add some extra packages useful for the installation process
    (packages
     (append (list git exfat-utils fuse-exfat stow vim)
             (operating-system-packages installation-os)))))

installation-os-nonfree
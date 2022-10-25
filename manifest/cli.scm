(use-modules
 (gnu packages linux) ; wifi driver
 (awb99 packages tools)
 (awb99 packages fonts)
 (awb99 packages wm)
 (awb99 packages desktop)
 (awb99 packages programming)
 (awb99 packages emacs))


(define-public cli-packages
(append 
  security-packages
  archive-packages
  monitor-packages
  network-packages
  file-transfer-packages
  hardware-packages))


(specifications->manifest cli-packages)
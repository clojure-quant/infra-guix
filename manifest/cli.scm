(use-modules
 (awb99 packages tools)
 (awb99 packages desktop))

(define-public cli-packages
(append 
  security-packages
  archive-packages
  monitor-packages
  network-packages
  file-transfer-packages
  hardware-packages))

(specifications->manifest cli-packages)
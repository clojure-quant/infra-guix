(define-module (awb99 packages virtual))

(define-public virtual-machine-packages
(list 
  "ovmf"
  ; qemu
  "qemu"
  "virt-viewer"
  "virt-manager" ; ui for qemu
  ; docker
  "docker"
  "docker-compose"
  "docker-cli" 
 ; Ganeti is a virtual machine management system
))
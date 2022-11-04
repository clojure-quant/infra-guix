(define-module (awb99 config desktoppackages))

(use-modules 
  (gnu packages) ; specification->package
  (gnu system) ; %base-packages
  (awb99 packages desktopsystem))

(define (->packages-output specs)
(map specification->package+output specs))

(define (specifications->package specs)
 (map specification->package specs))

(define-public packages-desktop
(append
  (specifications->package packages-desktop-system)
  %base-packages))


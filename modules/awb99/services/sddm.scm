

; the X server is started by a “display manager” such as GDM, SDDM, and SLiM
; Simple Desktop Display Manager is a display manager for the X11 and Wayland windowing systems.


;(guix-service-type
;config => (guix-configuration
;(inherit config)
;(substitute-urls %my-substitute-urls)
;(extra-options '("--max-jobs=4"))))


;; Prevent network-manager from modifying /etc/resolv.conf.
; (network-manager-service-type
; config => (network-manager-configuration
;           (inherit config)
;           (dns "none")))


(define-public desktop-services-sddm
  (cons*
   
    ;(simple-service 'my-setuid-programs
    ;     setuid-program-service-type
    ;     (list (file-append brightnessctl "/bin/brightnessctl")))

    (modify-services %desktop-services
      )))







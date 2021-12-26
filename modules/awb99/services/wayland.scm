(define-module (awb99 services wayland))

(use-modules 
  (gnu services)
  (gnu services xorg)
  ;(gnu services virtualization)
  )

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

    ;(simple-service 'my-setuid-programs
    ;     setuid-program-service-type
    ;     (list (file-append brightnessctl "/bin/brightnessctl")))


(define-public (modify-gdm-wayland system-services)
  (modify-services system-services
    (gdm-service-type _ =>
      (gdm-configuration
        (wayland? #t)))))

(define-public (use-sddm system-services)
  (append 
    (modify-services system-services
      (delete gdm-service-type))
    (list (service sddm-service-type
            (sddm-configuration
              (display-server "wayland") ; display server for greeter. "x11" or "wayland"
              ;(theme "maldives") ; themes provided by SDDM: "elarun" "maldives" "maya"
              ;(numlock "on") ; "on" "off" "none"
              ;(themes-directory "/run/current-system/profile/share/sddm/themes")
            )))))




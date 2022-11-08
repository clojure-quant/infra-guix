(use-modules (gnu services linux)
  (gnu system images pine64))

(let ((base-os pine64-barebones-os))
  (operating-system
    (inherit base-os)
    (timezone "America/Indiana/Indianapolis")
    (services
      (cons
        (service earlyoom-service-type
          (earlyoom-configuration
          (prefer-regexp "icecat|chromium")))
        (operating-system-user-services base-os)))))

    

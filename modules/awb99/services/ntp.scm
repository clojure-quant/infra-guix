



(service openntpd-service-type
(openntpd-configuration
  (listen-on '("127.0.0.1" "::1"))
  ;; Prevent moving to year 2116.
  (constraints-from '("https://www.google.com/"))))


    ; ntp is already in guix desktop services
    ; (service
    ;   openntpd-service-type
    ;     (openntpd-configuration
    ;       (listen-on '("127.0.0.1" "::1"))
    ;       (sensor '("udcf0 correction 70000"))
    ;       (constraint-from '("www.gnu.org"))
    ;       (constraints-from '("https://www.google.com/"))))
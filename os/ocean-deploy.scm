(use-modules
  (gnu machine) ; machine definition
  (gnu machine ssh) ; machine-ssh-configuration
  (gnu machine digital-ocean) ; digital-ocean-configurations
  (awb99 machine ocean)
   )

(define c-ssh
  (machine-ssh-configuration
    (host-name "178.128.203.133")
    (system "x86_64-linux")
    (host-key "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC1QoCpwM+XzvGqM4g3z2yZbRH1ZBa8EQ7Weqx7ixoxT")
    (user "root")
    (identity "./keys/coin")
    (port 22)))

(define c-do
  (digital-ocean-configuration
    (region "nyc1")
    (size "s-1vcpu-1gb")
    (enable-ipv6? #f)
    (ssh-key "../keys/coin")
    (tags (list "ubuntu-s-1vcpu-1gb-nyc1-01"
      ))
      ))


(define machine-ocean 
   (machine
     (environment managed-host-environment-type)
     (configuration c-ssh)
     (operating-system  ocean-os)
   ))



(list 
  machine-ocean
  )

; this needs to be run from time to time.
; /var/lib/certbot/renew-certificates




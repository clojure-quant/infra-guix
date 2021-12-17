(use-modules
  (gnu machine) ; machine definition
  (gnu machine ssh) ; machine-ssh-configuration
  (gnu machine digital-ocean) ; digital-ocean-configurations
  (awb99 machine ocean)
   )

; https://stumbles.id.au/getting-started-with-guix-deploy.html
; https://guix.gnu.org/blog/2019/managing-servers-with-gnu-guix-a-tutorial/
; https://wiki.pantherx.org/Installation-digital-ocean/

; https://git.pixie.town/pinoaffe/config/src/branch/master/hostile_takeover.sh


; guix system disk-image -t qcow2 config.scm' .
; then uploaded to custom image in DO interface. 
; make sure to upload image to the region you wish to deploy to. 
; and make sure you select one that's actually available to deploy droplet



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
     (operating-system  ocean-os
      ;(inherit ocean-os2)
     ; (packages (append extra-packages %base-packages))
     )
   ))



(list 
  machine-ocean
  )

; this needs to be run from time to time.
; /var/lib/certbot/renew-certificates




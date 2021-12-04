(use-modules
   (gnu services admin)
   (gnu packages)
   (gorilla util)
   (gorilla install clojure)
   (awb99 system server)
   )

(use-service-modules networking ssh web)
(use-package-modules bootloaders ssh)

(define c-ssh
  (machine-ssh-configuration
    (host-name "178.128.203.133")
    (system "x86_64-linux")
    (host-key "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC1QoCpwM+XzvGqM4g3z2yZbRH1ZBa8EQ7Weqx7ixoxT")
    (user "root")
    (identity "/home/florian/repo/myLinux/data/ssh/coin")
    (port 22)))

(display "base packages: \n")
(display my-packages)

(define (->packages-output specs)
  (map specification->package+output specs))


(define extra-packages
   (->packages-output
     (append (list "mc")
             my-clojure
     )))

(display "extra packages: \n")
(display extra-packages)
(display "extra packages: done.\n")


(define ocean-os 
  (operating-system
    (inherit my-server)
    (packages (append extra-packages my-packages))
  ))

(list (machine
       (operating-system ocean-os)
       (environment managed-host-environment-type)
       (configuration c-ssh)))

; this needs to be run from time to time.
; /var/lib/certbot/renew-certificates
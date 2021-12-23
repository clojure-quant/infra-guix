


(use-package-modules vpn)

(operating-system
  ;; …
  (services (cons 

(simple-service 'wireguard-module
                      kernel-module-loader-service-type
                                  '("wireguard"))
                  %desktop-services))
  (packages (cons wireguard-tools %base-packages))
  (kernel-loadable-modules (list wireguard-linux-compat)))

  
  ;; VPN connection to the remote build nodes.
             (service wireguard-service-type
                      (wireguard-configuration
                       (addresses (list "10.0.0.1/32"))
                       (peers
                        (list
                         (wireguard-peer
                          (name "overdrive1")
                          (public-key "m2qys8ATAKUTT8YNUM3OmnJnw1lYm5GHpUA42/l1Qz8=")
                          (allowed-ips '("10.0.0.3/32")))
                         (wireguard-peer
                          (name "dover")
                          (public-key "b3D6Nv5X4npfko99HELdewtKL8LzbbeUAIFjpwU7HhA=")
                          (allowed-ips '("10.0.0.4/32")))
                         (wireguard-peer
                          (name "guix-x15")
                          (public-key "pM7dAWXJ35isIDJA3OpbR2YG1Pk3MI9VTlP5ELAeQkM=")
                          (allowed-ips '("10.0.0.5/32")))
                         (wireguard-peer
                          (name "guix-x15b")
                          (public-key "cwRqmMc8IPAHxFCGIt1WcnJnoWJcefcTXte2vMNi6Wo=")
                          (allowed-ips '("10.0.0.6/32")))
                         (wireguard-peer
                          (name "guixp9")
                          (public-key "4jflGVC+6ee1jsXR/6GgBKjxzw4T4WIwYiMhj/lYQTE=")
                          (allowed-ips '("10.0.0.7/32")))
                         (wireguard-peer
                          (name "pankow")
                          (public-key "zIrwnSjLegW0EpgiHlpLcZBU51nST1oGuRJGeOxwTWo=")
                          (allowed-ips '("10.0.0.8/32")))
                         (wireguard-peer
                          (name "kreuzberg")
                          (public-key "f9WGJTXp8bozJb0KxePjkOclF5pJUy1AomHWJHy80y4=")
                          (allowed-ips '("10.0.0.9/32")))
                         (wireguard-peer
                          (name "grunewald")
                          (public-key "jYP2hpbvUlklLamTWCSMW00xyneBrqazBI/ldiINOWc=")
                          (allowed-ips '("10.0.0.10/32")))))))
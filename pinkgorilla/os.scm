
;; This is an operating system configuration template for a "Docker image" setup.

;; stolen from guix tarball
;;'gnu/system/examples/docker-image.tmpl'

(use-modules (gnu)
             ;(guix)
             ;(srfi srfi-1)
             )

;(use-service-modules ;desktop 
                     ;networking 
 ;                    ssh 
                     ;xorg
  ;                   )


; to see where package is stored use:
; guix show git
(use-package-modules base  ; hello
                     version-control ; git
                     ncdu
;bootloaders 
                     ;certs 
                     ;fonts 
                     ;nvi
                     ;package-management 
                     wget
                     java ; jdk ; icedtea ; java
                     clojure 
                     ;xorg
                     )


(operating-system
  (host-name "gorilla")
  ;(timezone "Europe/Berlin")
  (timezone "Etc/UTC")
  (locale "en_US.utf8")
  ;; This is where user accounts are specified.  The "root" account is
  ;; implicit, and is initially created with the empty password.
  (users (cons (user-account
                (name "pink")
                (comment "pink at gorilla")
                (group "users")
                (supplementary-groups '("wheel"
                                        "audio" 
                                        "video")))
               %base-user-accounts))

 ;; Globally-installed packages.

  ; (packages %base-packages)
  (packages (append (list hello
                          git
                          wget
                          ncdu
                          icedtea
                          clojure
                          )
                    %base-packages))

  ;; Because the system will run in a Docker container, we may omit many
  ;; things that would normally be required in an operating system
  ;; configuration file.  These things include:
  ;;
  ;;   * bootloader
  ;;   * file-systems
  ;;   * services such as mingetty, udevd, slim, networking, dhcp
  ;;
  ;; Either these things are simply not required, or Docker provides
  ;; similar services for us.

  ;; This will be ignored.
  (bootloader (bootloader-configuration
               (bootloader grub-bootloader)
               (target "does-not-matter")))

  ;; This will be ignored, too.
  (file-systems (list (file-system
                        (device "does-not-matter")
                        (mount-point "/")
                        (type "does-not-matter"))))


 

  ;; Guix is all you need!
  (services (list (service guix-service-type)
                
                  ;; Uncomment the line below to add an SSH server.
                  ;(service openssh-service-type)

                  ;;, maybe then add a 'nginx-service-type' to its services field.
  ))

  ; end of os
  )






;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules
  (gnu home)
  (gnu packages)
  (gnu services)
  (guix gexp)
  (gnu home services shells)
  (awb99 guixutils) 
  (awb99 config helper)
  (awb99 packages) 
  )

(define nuc-packages
  (append 
    ; clojure apps
      clojure-packages
      node-packages
    ; python-packages
    ; r-packages
      build-packages
    ; linux cli
      security-packages
      archive-packages
      monitor-packages
      network-packages
      file-transfer-packages
      shell-packages
      hardware-packages
    ; apps
      guix-core-packages
      virtual-machine-packages
      crypto-packages
    ; desktop
      desktop-chat-packages
      desktop-multimedia-packages
      desktop-office-packages
      desktop-browser-packages 
      desktop-tool-packages
    ; services
      services-packages
    ))


(define (specifications->package specs)
  (map specification->package specs))

(home-environment
  (packages
    (->packages-output ; ->packages ; map specification->package
        nuc-packages))
  (services
    (list (service
            home-bash-service-type
            (home-bash-configuration
              (aliases
                '(("grep='grep --color" . "auto")
                  ("ll" . "ls -l")
                  ("ls='ls -p --color" . "auto")))
              (bashrc
                (list (local-file "./.bashrc" "bashrc")))
              (bash-profile
                (list (local-file
                        "./.bash_profile"
                        "bash_profile"))))))))

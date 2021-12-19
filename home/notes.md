Remove all avahi
(remove (lambda (service)
          (eq? (service-kind service) avahi-service-type))
        %desktop-services)


       
(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu services)
             (gnu packages admin)
             (guix gexp))


(home-environment
 (packages (list htop))
 (services
  (list
   (service home-bash-service-type
            (home-bash-configuration
             (guix-defaults? #t)
             (bash-profile '("\
export HISTFILE=$XDG_CACHE_HOME/.bash_history"))))

  






Remove all avahi
(remove (lambda (service)
          (eq? (service-kind service) avahi-service-type))
        %desktop-services)

export HISTFILE=$XDG_CACHE_HOME/.bash_history"))))

  






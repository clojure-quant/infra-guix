
         
(define-public %my-extra-desktop-packages
  (map (compose list specification->package+output)
       '("alsa-utils"
        
         "ibus" "ibus-rime" "librime" "dconf"
        "mako" "libnotify"
        "grim" "slurp" "imv"
     )))

postgresql
        "pulseaudio"
        "libappindicator"
        "pavucontrol"  Control
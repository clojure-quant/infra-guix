


         
(define-public %my-extra-desktop-packages
  (map (compose list specification->package+output)
       '("alsa-utils" "pulseaudio"
         "font-dejavu" "font-wqy-microhei" "font-awesome"
         "hicolor-icon-theme" "adwaita-icon-theme"
         "ibus" "ibus-rime" "librime" "dconf"
        "waybar" "rofi" "mako" "libnotify"
         "wl-clipboard" "grim" "slurp" "imv"
     )))


postgresql
        "pulseaudio"
        "libappindicator"
        "xdg-desktop-portal-gtk"
        "xdg-desktop-portal"
      
        "pavucontrol"
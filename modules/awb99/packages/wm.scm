(define-module (awb99 packages wm))


(define-public packages-wm-gnome
(list 
   "gnome" ; comes with tons of apps pre-installed.
   "gnome-tweaks"
   "totem" ; video player
   "rhythmbox" ; music player
   "gsettings-desktop-schemas-next" ; in gnome only withot -next included
   "authenticator" ; two factor authenticator
   "vinagre" ; rdp and vnc
   "matcha-theme"))

(define-public packages-wm-sway
(list 
  "wayland"
  ;  "xrandr" ; hidpi x-windows scaling
  ;"wlr-randr"
  "wofi" ; wayland rofi - programm launcher
  "alacritty" ; terminal
  "mako" ; desktop notifications for Wayland 
  "waybar"
  "xlsclients" ; running window ids
  ;"slurp" ; screenshots
  "grim" ; screenshots
  ;"swappy" ; screenshots
  "wl-clipboard"
  "wlsunset"  ; day night gamma adjustment
  "acpi" ; acpi info (battery, temperature)

  "xdg-desktop-portal" ; xdg-desktop-portal greatly improves the usability of Flatpak-installed apps, allowing them to open file chooser dialogs, open links
  ;"xdg-desktop-portal-wlr"
  "xdg-desktop-portal-gtk" 

  "qtbase" "qtwayland" ;to make Qt work on Wayland

 ; "glib:bin" ; gtk+ settings (creates conflicts)
  ;"gsettings-desktop-schemas" ; gtk+ settings - this does not work!

  "xcursor-themes"
  "xclock" ;x test

  "wmctrl" ; manage x-windows
 ; "interrobang" ; launcher

  "light" ; background lightness

  "sway"
  "swaybg" ; wallpaper background
  "swayidle"
;  "swaylock" ; this is in root profile.
   "i3blocks" ; sway uses i3blocks for menu
   "sysstat" ;mpstat
 ;  "pamixer" ;audio volume
 ;  "aumix"

   "ddcutil"  ; screen darkness controls

   "pipewire" ; new audio and video mixer (replaces pulseaudio)
   "wireplumber" ; wpctl status
))

(define-public packages-wm-xfce
  (list 
    ; https://guix.gnu.org/en/blog/2019/running-a-guix-xfce-desktop-on-centos-7/
    "xfce"
    "xfce4-screensaver"
    "xfce4-systemload-plugin"
    "xfce4-mount-plugin"
    "xfce4-panel"
    "xfce4-places-plugin"
    ;xfce4-taskmanager
    ; xfce4-power-manager       ** add this
    ; xfce4-pulseaudio-plugin   
    ; xfce4-whiskermenu-plugin
    ; xfce4-settings
    ; xfce4-screenshooter
   ; "xfce4-notifyd"
   ; "elementary-xfce-icon-theme"
   ; "exo"   ;xfce extension lib
 ))

(define-public packages-wm-i3
  (list 
    "i3-wm"
    "i3status"
    "i3blocks"
    "i3lock"
  ))

(define-public packages-wm-enlightenment
  (list 
    "enlightenment"
    ;"efl" ; Enlightenment Foundation Libraries
   ))


(define-public packages-desktop-printer
  (list 
    "cups"
    "cups-filters"
    "foomatic-filters"    ; postscript -> printer driver
    "hplip"; hp line printer drivers
    "system-config-printer"
  ))


(define-public packages-xwin
  (list
   
    "rofi" ; launcher
    ; "interrobang"
    "garcon" ; menu manager
    "dmenu"
    ;"progress" ; coreutil progress
  ))

(define-public packages-desktop-extra
(list
      "bemenu" ; menu library inspired by dmenu
     ; "lxqt"
     ; "mate"
     
    
      ; dwm https://www.reddit.com/r/GUIX/comments/l9ncsr/dwm_and_st_on_guix_best_practice/?utm_medium=android_app&utm_source=share
      ; EXWM  https://config.daviwil.com/desktop
     ))   



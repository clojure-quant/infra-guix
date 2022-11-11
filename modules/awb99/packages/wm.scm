(define-module (awb99 packages wm))

; xwin / wayland

(define-public packages-wm-xwin
(list
  "rofi" ; launcher
  ; "interrobang"
  "garcon" ; menu manager
  "dmenu"
  ;"progress" ; coreutil progress
  "xcursor-themes"
  "xclock" ;x test
))

(define-public packages-wm-wayland
(list
  "wayland"
  ;  "xrandr" ; hidpi x-windows scaling
  ;"wlr-randr"
  "wofi" ; wayland rofi - programm launcher
  "alacritty" ; terminal
  "mako" ; desktop notifications for Wayland
))

(define-public packages-wm-extra
(list
  "bemenu" ; menu library inspired by dmenu
  
  "wmctrl" ; manage x-windows
  "xlsclients" ; lists ids of open window ids
  "ddcutil"  ; communicate with monitor, screen darkness controls
  "light" ; send commands to background lightness
  "acpi" ; acpi info (battery, temperature) acpi -t (temperature)

  "xdg-desktop-portal" ; xdg-desktop-portal greatly improves the usability of Flatpak-installed apps, allowing them to open file chooser dialogs, open links
  ;"xdg-desktop-portal-wlr"
  "xdg-desktop-portal-gtk" 
  ; this seem to be libraries only
  ;"qtbase" 
  ;"qtwayland" ;to make Qt work on Wayland
     ))   


; windowmanager

(define-public packages-wm-gnome
(list 
   "gnome" ; comes with tons of apps pre-installed.
   "dconf" ; dump dconf entries in cli
   "dconf-editor" ; dconf editor
   "gnome-tweaks"
   ;"gsettings-desktop-schemas-next" ; in gnome only without -next included
   "matcha-theme"))

(define-public packages-wm-sway
(list 
  "sway"
  "swaybg" ; wallpaper background
  "swayidle"
  ;  "swaylock" ; this is in root profile.
  "i3blocks" ; sway uses i3blocks for menu   
  "waybar"
  
  ;"slurp" ; screenshots
  "grim" ; screenshots
  ;"swappy" ; screenshots
  "wl-clipboard"
  "wlsunset"  ; day night gamma adjustment
 
 ; "glib:bin" ; gtk+ settings (creates conflicts)
  ;"gsettings-desktop-schemas" ; gtk+ settings - this does not work!
 ; "interrobang" ; launcher
 

   
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

  (define-public packages-wm-mate
    (list 
      "mate"
      ; "lxqt"
      ; dwm https://www.reddit.com/r/GUIX/comments/l9ncsr/dwm_and_st_on_guix_best_practice/?utm_medium=android_app&utm_source=share
      ; EXWM  https://config.daviwil.com/desktop
    ))

; printer

(define-public packages-desktop-printer
  (list 
    "cups"
    "cups-filters"
    "foomatic-filters"    ; postscript -> printer driver
    "hplip"; hp line printer drivers
    "system-config-printer"
  ))






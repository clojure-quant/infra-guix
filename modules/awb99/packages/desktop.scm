(define-module (awb99 packages desktop))

(define-public packages-desktop-xfce
  (list 
    ; xfce
    ; https://guix.gnu.org/en/blog/2019/running-a-guix-xfce-desktop-on-centos-7/
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
 ))

(define-public packages-desktop-i3
  (list 
    "i3-wm"
    "i3status"
    "i3blocks"
    "i3lock"
  ))

(define-public packages-desktop-sway
  (list 
    "wayland"
    "wlr-randr"
    "wofi" ; wayland rofi
    "alacritty"
    "mako" ; desktop notifications for Wayland 
    "waybar"
    "xlsclients" ; running window ids
    "slurp" ; screenshots
    "grim" ; screenshots
    "swappy" ; screenshots
    "wl-clipboard"
    "wlsunset"  ; day night gamma adjustment
    "acpi" ; acpi info (battery, temperature)
    "direnv"
    "wlroots"
    "xdg-desktop-portal"
    "xdg-desktop-portal-wlr"
    "xdg-desktop-portal-gtk" 


    "hicolor-icon-theme"
    "gnome-themes-standard"
    "adwaita-icon-theme" ;to make GTK applications look OK
    "qtbase" "qtwayland" ;to make Qt work on Wayland

    "sway"
    "swaybg" ; wallpaper background
    "swayidle"
    "swaylock"
  ))

(define-public packages-desktop-printer
  (list 
    "cups"
    "cups-filters"
    "foomatic-filters"    ; postscript -> printer driver
    "hplip"; hp line printer drivers
    "system-config-printer"
  ))


(define-public packages-desktop-extra
(list "nss-certs"
      "fuse" ; for sshfs
      "sshfs"
      "nbd" ; to mount qcow2 images
      "glibc-locales" ; guix locales
      "mcron"

      ; shells used in user profiles need to be on system
      "fish"
      "zsh"
      "grep"   

    ;  "xrandr" ; hidpi x-windows scaling
    ;  "xdg-desktop-portal" ; xdg-desktop-portal greatly improves the usability of Flatpak-installed apps, allowing them to open file chooser dialogs, open links
      "ddcutil"  ; screen darkness controls
       "rofi" ; launcher
     
      ; "interrobang"
      "garcon" ; menu manager
      "dmenu"
      "bemenu" ; menu library inspired by dmenu
     
      "progress" ; coreutil progress

      ; elementary-xfce-icon-theme
      ; lxqt
      "lxqt"
      ; lxqt
      "mate"
      ;enlightenment
      "enlightenment"
      ;"efl" ; Enlightenment Foundation Libraries

      ; gnome
      "gnome"

      "iptables"
     
     ))   


; dwm https://www.reddit.com/r/GUIX/comments/l9ncsr/dwm_and_st_on_guix_best_practice/?utm_medium=android_app&utm_source=share
; EXWM  https://config.daviwil.com/desktop
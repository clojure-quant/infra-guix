(define-module (awb99 packages desktop))

(define-public packages-desktop-xfce
  (list 
    ; xfce
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
    "mako" ; lightweight notification daemon for Wayland 
    "waybar"
    "xlsclients"

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

      "xrandr" ; hidpi x-windows scaling
      "xdg-desktop-portal" ; xdg-desktop-portal greatly improves the usability of Flatpak-installed apps, allowing them to open file chooser dialogs, open links
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
     
     ; "adwaita-icon-theme" ;to make GTK applications look OK
     ; "qtbase" "qtwayland" ;to make Qt work on Wayland



      ; trezor
      "trezord-udev-rules"
      "trezord"
    
      ; docker
      "docker"
      "iptables"
     
     ))   

(define-public packages-desktop-nuc
  (append
    packages-desktop-extra
    packages-desktop-xfce
    packages-desktop-i3
    packages-desktop-sway
    packages-desktop-printer))
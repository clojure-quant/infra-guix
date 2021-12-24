(define-module (awb99 packages desktop)
;#:export (my-emacs)
)


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
    "sway"
    "swaybg"
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
      ; "wofi" wayland rofi
      ; "interrobang"
      "garcon" ; menu manager
      "dmenu"
      "bemenu" ; menu library inspired by dmenu
      ; "efl" ; Enlightenment Foundation Libraries

      "progress" ; coreutil progress

      ; elementary-xfce-icon-theme
      ; lxqt
      "lxqt"
      ; lxqt
      "mate"
      ;enlightenment
      "enlightenment"
      ; gnome
      "gnome"
     
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
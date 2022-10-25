
(define user-packages
(list "nss-certs"
"fuse" ; for sshfs
"sshfs"
"nbd" ; to mount qcow2 images
"glibc-locales" ; guix locales
"mcron"

"xrandr" ; hidpi x-windows scaling
; xfce
"xfce4-screensaver"
"xfce4-systemload-plugin"
"xfce4-mount-plugin"
"xfce4-panel"
"garcon" ; menu manager
"xfce4-places-plugin"
"xdg-desktop-portal" ; xdg-desktop-portal greatly improves the usability of Flatpak-installed apps, allowing them to open file chooser dialogs, open links
; xfce4-power-manager       ** add this
; xfce4-pulseaudio-plugin   
; xfce4-whiskermenu-plugin
; xfce4-settings
; xfce4-screenshooter
; elementary-xfce-icon-theme
; lxqt
"lxqt"
; lxqt
"mate"
;enlightenment
"enlightenment"
; gnome
"gnome"
; i3
"i3-wm"
"i3status"
"i3blocks"
"i3lock"
"dmenu"
"rofi"
; sway
"sway"
"swaybg"
"swayidle"
"swaylock"
"bemenu"
; shells used in user profiles need to be on system
"fish"
"zsh"
; trezor
"trezord-udev-rules"
"trezord"
; printing
"cups"
"cups-filters"
"foomatic-filters"    ; postscript -> printer driver
"hplip"; hp line printer drivers
"system-config-printer"
"grep"    ;grep errror in foomatic-filters.
; docker
"docker"
"iptables"
"rofi" ; programm launcher
; "wofi" wayland rofi
; "interrobang"

))


(specifications->manifest user-packages)


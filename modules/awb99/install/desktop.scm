(define-module (awb99 install desktop)
  #:export (my-desktop
            ))

(define my-desktop
  (list 
       
    ; x windows
    "xcursor-themes"
    "xclock" ;x test

    ; xfce
    "xfce4-screenshooter" 
    "xfce4-notifyd"
    "xfce4-whiskermenu-plugin" 
    "elementary-xfce-icon-theme"
    "hicolor-icon-theme"
    "adwaita-icon-theme" 
    "breeze-icons"
    "exo"   ;xfce extension lib

    ; fonts
    "fontconfig" 
    "font-hack"
    "font-fira-mono"
    "font-gnu-unifont" 
    "font-google-noto" 
    "font-openmoji"

    ; text editors
    "libreoffice"  ; libreoffice
    "emacs"
    "emacs-spacemacs-theme"
    ; "vim"
    ; "neovim"
    "eovim" ;    NEOVIM GUI
    "kate" ;          text editor
    "mousepad"  ; text editor

    ; pdf
    "pdfarranger"
    ; "xpdf"  ; does not show text of manually edited pdf files
    "qpdfview"  ; this is much better

    ; browser
    "icecat" ; - A free software alternative to Firefox
    "ungoogled-chromium"
    "midori"
    "nomad"
    "vimb"   ; vim keybinding browser.
    "nyxt"    ; browser with keybindings.  https://sparkylinux.org/nyxt/
    ; "palemoon" ;- A highly customizable browser

    ;image
    "sxiv" ; simple X image viewer
    "glimpse" ; image editor
    "xdot" ; graphviz .dot viewer needed for guix graph

    ;; gstreaner us zsed by Nyxt media dependencies.
    "gstreamer" ; Multimedia library
    "gst-libav" 
    "gst-plugins-base" 
    "gst-plugins-good"
    "gst-plugins-bad"
    "gst-plugins-ugly"

    ;video
    "vlc"
    ; "mpv"  ; audio/video player
    "subdl" ; subtitle download
    "kodi"
    "ffmpeg" ; record/play audio/video
    "libwebp" ; webp video compression"

    ;; audio
    "pavucontrol" 
    "opus" ; audio codec
    ; "sound" ; to "use-service-modules" to always use pulseaudio to avoid apps crashing. 

    "keepassxc"
    ; "transmission" ; torrent
    "transmission:gui" ; without :gui it does not work.n  The normal "out" output is the CLI versiononly.
    "qbittorrent" ; torrent
    "youtube-dl"
    "syncthing-gtk" 
  
    ; virtualisation
    "docker"
    "docker-compose"
    "docker-cli" 
    "qemu"
    "virt-manager" ; ui for qemu

    ; tools
    "flatpak"
    "xdotool" ; determine windows class names (for i3 wm rules)
    ; "gvfs" ; virtual file system
    "catfish" ; file search tool
    "udiskie" ; mount usb drives https://github.com/coldfix/udiskie/wiki/Usage
    "remmina"
    "scm"  ; scheme to c compiler
    ; "bsnes" ; super nintendo emulator
    "claws-mail"
    ; "kmail"
    "celestia-gtk" ; 3d simulation of universe/planets
    "vscodium"
    "go-ipfs"   ; bin: ipfs 
    "ntp"
    "ncurses"  ; cli gui 
    
  ))

(define-module (awb99 packages desktop))

(define-public desktop-chat-packages
  (list 
    ;"telegram-desktop"
    ;; IRC
    ; irc.libera.chat on port 6697.
    ; "weechat" ; IRC
    "quassel"    ; GUI replication of WeeChat.
    ;"srain" ; IRC client (supports images )
    ; "hexchat" ;
    ; "pidgin"
    ; "cawbird" ; twitter client
  ))


(define-public desktop-multimedia-packages
  (list
    ;image
    "sxiv" ; simple X image viewer
    "glimpse" ; image editor
    "imagemagick"

    ;; gstreaner us zsed by Nyxt media dependencies.
    "gstreamer" ; Multimedia library
    "gst-libav" 
    "gst-plugins-base" 
    "gst-plugins-good"
    ;"gst-plugins-bad"
    ;"gst-plugins-ugly"

    ;video
    "vlc"
    ; "mpv"  ; audio/video player
    "subdl" ; subtitle download
    "kodi"
    "ffmpeg" ; record/play audio/video
    "libwebp" ; webp video compression"
    "youtube-dl"
    "obs" ; video/audio streaming

    ;; audio
    "pavucontrol" 
    "opus" ; audio codec
    ; "sound" ; to "use-service-modules" to always use pulseaudio to avoid apps crashing. 

    ; pdf
    "pdfarranger"
    ; "xpdf"  ; does not show text of manually edited pdf files
    "qpdfview"  ; this is much better
    "zathura" ; lightweight pdf viewer

    ; torrent
 
    ; "transmission" ; torrent
    "transmission:gui" ; without :gui it does not work.n  The normal "out" output is the CLI versiononly.
    "qbittorrent" ; torrent
    ;"deluge"

    ; ??
    "mkvtoolnix"
    "mpd"
    "mpd-mpc"
  ))

   


(define-public desktop-office-packages
(list
  "libreoffice"
  "hunspell-dict-en" ; spell checker
  "hunspell-dict-en-us"
  "hunspell-dict-de"
  "recoll" ; fulltext search engine
 
   ; "vim"
   ; "neovim"
   "eovim" ;    NEOVIM GUI
   "kate" ;          text editor
   "mousepad"  ; text editor
))

(define-public desktop-browser-packages 
  (list 
    ; browser
    "icecat" ; - A free software alternative to Firefox
   ; "ungoogled-chromium"
   "ungoogled-chromium-wayland"
   "ublock-origin-chromium"
   "midori"
   ; "nomad"
   ; "vimb"   ; vim keybinding browser.
   ; "nyxt"    ; browser with keybindings like emacs  https://sparkylinux.org/nyxt/ https://nyxt.atlas.engineer/faq
   ; "palemoon" ;- A highly customizable browser
   "keepassxc"
))


(define-public desktop-tool-packages
(list 
  "syncthing-gtk" 

  ; tools
  "flatpak"
  "xdotool" ; determine windows class names (for i3 wm rules)
  ; "gvfs" ; for user mounts
  "catfish" ; file search tool
  "udiskie" ; mount usb drives https://github.com/coldfix/udiskie/wiki/Usage
  ;"remmina"
  ; "scm"  ; scheme to c compiler
  ;"claws-mail"
  ; "kmail"
  "celestia-gtk" ; 3d simulation of universe/planets
   "vscodium"
 
))

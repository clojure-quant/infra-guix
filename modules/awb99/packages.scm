(define-module (awb99 packages)
  ;#:export (nuc-packages
   ;          )
            )


(define-public clojure-packages
  (list 
      ;"icedtea"   ; open-jdk java
      ;"openjdk"
      ;(list "openjdk" "jdk" "doc" "out")
      ;"openjdk:doc"  ; doc output of openjdk - needed by cider/orchard
      "openjdk:jdk" ; having first openjdk does not work.s
      "fastjar" ; java "jar" app
      "java-qdox" 
      "java-swt"
      "rlwrap"
    
      "clojure-tools" ; nongnu version brings clj and clojure
      ; "clojure-tools-cli" ; guix version (OLD)
      ; "clojure"   ; from gnu guix  this is old.  brings clojure (OLD)
      ; "leiningen" ; nongnu downloads java-8 jar from github repo, v 2.9.5
   
      "graphviz" ;  dependency graphs
      "babashka" ; channel gorilla
      "certbot" ; letsencrypt certs
      "git"
  ))


(define-public node-packages
  (list 
    "node" ; v10, v14 is in development. brings node and npm
   ))


(define-public python-packages
  (list 
    ; possibly add this channel too ?
    ; https://github.com/UMCUGenetics/guix-additions/blob/master/umcu/packages/python.scm
    ; https://unix.stackexchange.com/questions/621269/use-a-python-projects-requirements-txt-as-input-to-a-guix-package-definition?rq=1
    "python"  
    ;"python-2"
    ;   "python-wrapper"
    ; "python-cython"
    ;"python-future"
    ;"python-h5py" 
    ;"python-mappy"
    "python-numpy" 
    "python-scipy" 
    "python-pandas"
    ;"python-setuptools
    "python-yarl" ; for edgar
    "python-certifi"
    "python-tqdm"
    "python-lxml"
    "python-soupsieve"
    "python-urllib3"
    "python-beautifulsoup4"
    "python-async-timeout"
    "python-chardet"
    "python-requests" 
    "python-typing-extensions"
    "python-attrs"
    "python-aiohttp"
  
    "python-yubikey-manager"
    ;"rofi-pass"
    ;"rofi"
    ;"python-yubikey-oath-dmenu"
   ))



(define-public r-packages
  ; possibly add this channel too ?
  ; https://github.com/UMCUGenetics/guix-additions/blob/master/umcu/packages/rstudio.scm
  ; r repos: Bioconductor + Cran
  (list ;; for RMarkdown
    "r"
    "r-rserve" ; tcp server adaptor
    ; "rstudio" ; channel guix-science
   ;"r-knitr"
   ;"r-yaml"
   ;"r-markdown"
   ;"r-rmarkdown"
   ;"texlive"
   ;; commonly used r packages
   ;"r-psych"

   ; clojisr goldly-example-datascience
   "r-ggplot2" 
   "r-dt"
   "r-svglite"
   "r-plotly"
   
   "r-lattice"
   "r-foreign"
   "r-readr"
   ;"r-haven"
   "r-dplyr"
   "r-tidyr"
   ;"r-stringr"
   ;"r-forecast"
   ;"r-lme4"
   ;"r-nlme"
   ;"r-nnet"
   ;"r-glmnet"
   ;"r-caret"
   ;"r-xmisc"
   ;"r-splitstackshape"
   ;"r-tm"
   ;"r-quanteda"
   ;"r-topicmodels"
   ;"r-stm"
   ;;"r-parallel"
   ;"r-nlp"
   ))


(define-public build-packages
  (list 
    "coreutils" ; glibcc gcc bash 
    ;"direnv" google this
      
    ;"idutils"
    ; "guile" 
    "hello"
    ;"nss-certs" ; tls certificates
       
    "make"
    "gcc-toolchain"
    ; "llvm" "clang" "clang-runtime" "clang-toolchain"
    ; "glibc" "gdb" "gcc-toolchain"
    ; "gnu-make" "cmake" "pkg-config"
    ; "patchelf" "binutils" "elfutils"
  ))

(define-public security-packages
  (list 
    "cryptsetup"  ; luks encryption
    "encfs"
    "openssl"))

(define-public filesystem-packages
  (list 
    "btrfs-progs" ; mkfs.btrfs
    "e2fsprogs"  ;mkfs.ext4
    "util-linux" ;mkwap
    "lvm2-static" ;dmsetup
    ;"connman" ;call connmanctl
    ;"dosfstools" ;mkfs.fat
    ;"jfsutils" ;jfs_mkfs
    ;"ntfs-3g" ;mkfs.ntfs
    ;"xfsprogs" ;mkfs.xfs
    ;"kbd" ;chvt
    "fuse" 
    "sshfs" ; mount sshfs via fuse
    "nbd" ; to mount qcow2 images
  ))


(define-public archive-packages
  (list
    "ddrescue"
    "lzip"
    "lziprecover"
    "p7zip"
    "par2cmdline"
    "tar"
    "tarlz"
    "zip"
    "unzip"
    "gzip"
    "zstd"
    "zutils"))
  
(define-public monitor-packages
  (list
   "htop"
   "glances"
   "iftop"
   "iotop"
   "lsof"
   "powertop"
   "smartmontools"
  ))


(define-public network-packages
  (list
    "badvpn"
    "bind:utils"
    "iodine"
    "mtr"
    "ngrep"
    "nmap"
    "socat"
    "tcpdump"
    "iputils" ; ping tracepath
    "nethogs"
    "net-tools" ; netstat
    "speedtest-cli"
  ))


(define-public file-transfer-packages
  (list
    "aria2"
   
    "go-ipfs"   ; bin: ipfs 
    "rclone"
    "rsync"
    "syncthing"
    "ranger" ; directory explorer
    "the-silver-searcher" ; ag
    "mc"
    "wget"
    "curl"
  ))

(define-public shell-packages
  (list 
    ; SHELL
    "bash"
    "bash-completion"
    "zsh"
    "zsh-autosuggestions"
    "fish"
    "less" ; needed by fish history
    "which" ; needed by clojisr in --pure environment
    "grep" ; needed by byobu
    "sed" ; needed by byobu
    ; TMUX
    "tmux" ; needed by byobu
    "byobu" ; tmux with better config
    "sysfsutils"
    "ncdu"
    "ncurses" ; clear
    "nano"
    "findutils" ; find
     "mlocate"  ; locate == whereis
    ;"idutils"
    "ntp"
    "ncurses"  ; cli gui 
  
   ))


(define-public hardware-packages
  (list 
   "sdparm" ; SCSI disk 
   "hdparm" ; ATA disk
   "gparted"
   "parted"
   "inxi"  ; hardware info 
   "cpuid" ; cpu info
   "cpuinfo" ; cpu info
   "tree"
   "whois"
  ; "perftest" ; makes problems with new guix
   "the-silver-searcher" ; ag
   "mesa-utils"
   "fasd" ; newer than autojump  
   ))

;; apps 

(define-public virtual-machine-packages
  (list 
    "ovmf"
    ; qemu
    "qemu"
    "virt-viewer"
    "virt-manager" ; ui for qemu
    ; docker
    "docker"
    "docker-compose"
    "docker-cli" 
   ; Ganeti is a virtual machine management system
  ))

(define-public guix-core-packages
  (list 
    "nss-certs" ; tls certificates
    "glibc-locales" ; all supported gnu clib locales (1 gig)
    ; "glibc-utf8-locales" ; small set of locales
    ; "openssh" ; required for git with ssh repos
    "openssh-sans-x"
    ;"openssl"
    "mcron"
    "guile" 
    ;"stow" symlink manager
  ))


(define-public crypto-packages
  (list 
    ; to see package source code:
    ; guix edit trezord 
    ;; create a plugdev group and add the trezord user to that group
    "trezord"  ; gnu/packages/finance.scm:1277:2  https://github.com/trezor/trezord-go
    "trezord-udev-rules"   ; run trezord as normal (non root) user  https://github.com/trezor/trezor-common
   ; "trezor-agent"  ; trezor as ssh  / gpg agent   https://github.com/romanz/trezor-agent
  ; trezor agent makes problem with new guix version 
    ; "electrum" ; bitcoin wallet   https://electrum.readthedocs.io/en/latest/hardware-linux.html#udev-rules
    ; "electron-cash" ; https://github.com/Electron-Cash/Electron-Cash Bitcoin Cash client
    ; "ledger"
    ; "ledger-agent"  ; https://github.com/romanz/trezor-agent   does trezor and ledger
    ; "python-trezor"  ;  https://github.com/romanz/trezor-agent  https://github.com/trezor/python-trezor
    ; "python-ledgerblue"   ; blue/nano s
    ; "python-trezor-agent"
    ; python-btchip-python
    ; python-keepkey  ; https://github.com/keepkey/python-keepkey
  ))

;; desktop 


(define-public desktop-chat-packages
  (list 
    "telegram-desktop"
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
     "xdot" ; graphviz .dot viewer needed for guix graph
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
    "ungoogled-chromium"
    "midori"
   ; "nomad"
    "vimb"   ; vim keybinding browser.
    "nyxt"    ; browser with keybindings.  https://sparkylinux.org/nyxt/
    ; "palemoon" ;- A highly customizable browser
    "keepassxc"
  ))


(define-public desktop-tool-packages
  (list 
    ; x windows
    "xcursor-themes"
    "xclock" ;x test

     "wmctrl" ; manage x-windows

    ; xfce
   ; "xfce4-screenshooter" 
   ; "xfce4-notifyd"
   ; "xfce4-whiskermenu-plugin" 
   ; "elementary-xfce-icon-theme"
   ; "hicolor-icon-theme"
   ; "adwaita-icon-theme" 
   ; "breeze-icons"
   ; "exo"   ;xfce extension lib

    "xdot" ; graphviz .dot viewer needed for guix graph
    "syncthing-gtk" 

 
    ; tools
    "flatpak"
    "xdotool" ; determine windows class names (for i3 wm rules)
    ; "gvfs" ; virtual file system
    "catfish" ; file search tool
    "udiskie" ; mount usb drives https://github.com/coldfix/udiskie/wiki/Usage
    "remmina"
    ; "scm"  ; scheme to c compiler
    ; "bsnes" ; super nintendo emulator
    "claws-mail"
    ; "kmail"
    "celestia-gtk" ; 3d simulation of universe/planets
     "vscodium"

    
  ))


(define-public services-packages
  (list  
    "shepherd"
    "mcron"
    "syncthing"
  ))


; another approach
; this is perhaps better, as I dont need manifest+os
; guix environment -l guix-requirements.scm.
;https://unix.stackexchange.com/questions/621269/use-a-python-projects-requirements-txt-as-input-to-a-guix-package-definition?rq=1

; or this: package reprocessing
; https://github.com/alezost/guix-config/blob/master/modules/al/guix/utils.scm




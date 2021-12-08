(define-public archive-packages
  (map (compose list specification->package+output)
       '("ddrescue"
         "lzip"
         "lziprecover"
         "p7zip"
         "par2cmdline"
         "tar"
         "unzip"
         "zip"
         "zstd"
         "zutils")))

(define-public command-line-packages
  (map (compose list specification->package+output)
       '("autossh"
         "cowsay"
         "espeak-ng"
         "fd"
         "file"
         "go-github-com-junegunn-fzf"
         "graphviz"
         "jq"
         "mosh"
         "parallel"
         "progress"
         "pv"
         "ripgrep"
         "sl"
         "stow"
         "tree")))

(define-public communication-packages
  (map (compose list specification->package+output)
       '("pidgin"
         "weechat")))

(define-public crypto-packages
  (map (compose list specification->package+output)
       '("cryptsetup"
         "encfs"
         "openssl")))


(define-public file-transfer-packages
  (map (compose list specification->package+output)
       '("aria2"
         "deluge"
         "go-ipfs"
         "rclone"
         "rsync"
         "syncthing")))

(define-public finance-packages
  (map (compose list specification->package+output)
       '("electrum"
         "gnucash"
         "ledger")))

(define-public monitor-packages
  (map (compose list specification->package+output)
       '("htop"
         "iftop"
         "iotop"
         "lsof"
         "powertop"
         "smartmontools")))

(define-public multimedia-packages
  (map (compose list specification->package+output)
       '("ffmpeg"
         "imagemagick"
         "mkvtoolnix"
         "mpd"
         "mpd-mpc"
         "ncmpcpp"
         "vlc"
         "youtube-dl")))

(define-public network-packages
  (map (compose list specification->package+output)
       '("badvpn"
         "bind:utils"
         "iodine"
         "mtr"
         "ngrep"
         "nmap"
         "socat"
         "tcpdump")))


(define-public virtual-machine-packages
  (map (compose list specification->package+output)
       '("ovmf"
         "qemu"
         "virt-viewer")))

(define-public office-packages
  (map (compose list specification->package+output)
       '("libreoffice"
         "obs")))
         
(define-public %my-extra-desktop-packages
  (map (compose list specification->package+output)
       '("alsa-utils" "pulseaudio"
         "font-dejavu" "font-wqy-microhei" "font-awesome"
         "hicolor-icon-theme" "adwaita-icon-theme"
         "ibus" "ibus-rime" "librime" "dconf"
         "sway" "swayidle" "waybar" "rofi" "mako" "libnotify"
         "wl-clipboard" "grim" "slurp" "imv"
         "alacritty" "fish")))


(define-public %my-base-desktop-services
  (cons*
   (service sddm-service-type)
   (modify-services
       ;; Remove GDM.
       (remove (lambda (service)
                 (eq? (service-kind service) gdm-service-type))
               %desktop-services)
     (guix-service-type
      config => (guix-configuration
                 (inherit config)
                 (substitute-urls %my-substitute-urls)
                 (extra-options '("--max-jobs=4"))))
     ;; Prevent network-manager from modifying /etc/resolv.conf.
     (network-manager-service-type
      config => (network-manager-configuration
                 (inherit config)
                 (dns "none"))))))


 (screen-locker-service swaylock)
   (simple-service 'my-setuid-programs
                   setuid-program-service-type
                   (list (file-append brightnessctl "/bin/brightnessctl"))))
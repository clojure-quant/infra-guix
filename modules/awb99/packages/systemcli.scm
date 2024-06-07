(define-module (awb99 packages systemcli))


(define-public security-packages
  (list 
    "cryptsetup"  ; luks encryption
    "encfs"
    "openssl") ; not to confuse with openssh
   )

(define-public filesystem-packages
  (list 
    "btrfs-progs" ; mkfs.btrfs
    "e2fsprogs"  ;mkfs.ext4 chattr
    "util-linux" ;mkwap
    "lvm2-static" ;dmsetup
    ;"connman" ;call connmanctl
    ;"dosfstools" ;mkfs.fat
    ;"jfsutils" ;jfs_mkfs
    ;"ntfs-3g" ;mkfs.ntfs
    ;"xfsprogs" ;mkfs.xfs
    ;"kbd" ;chvt
    "fuse" ; for sshfs
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
   ; "zutils" conflicts with gzip
  ))

(define-public monitor-packages
  (list
    "htop"
    "glances"
    "iftop"
    "iotop"
    "lsof"
    "powertop"
    "smartmontools"
    "sysstat" ;mpstat lots of tools
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
   ; "ddclient" ; dynamic dns client
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
    ;"fish"
    "less" ; needed by fish history
    "which" ; like whereis/locate find out where a programm is installed
    "grep" ; needed by byobu
    "sed" ; needed by byobu

    "direnv"

    ; TMUX
    "tmux" ; needed by byobu
    "byobu" ; tmux with better config
    "sysfsutils"
    "ncdu"
    "ncurses" ; clear
    "nano"
   ; "findutils" ; find
    "mlocate"  ; locate == whereis
    ;"idutils"
    "ntp"
    "ncurses"  ; cli gui 
    ;"mosh" ; ssh over instable network connection
   ))

(define-public hardware-packages
  (list 
    "sdparm" ; SCSI disk 
    "hdparm" ; ATA disk
    "gparted"
    "parted"
    "inxi"  ; hardware info 
  ;  "cpuid" ; cpu info  ; no substitutes available
    "cpuinfo" ; cpu info
    "lshw" ; list hardware
    "tree"
    "whois"
    ; "perftest" ; makes problems with new guix
    "the-silver-searcher" ; ag
    "mesa-utils"
    "fasd" ; newer than autojump  
    "neofetch" ; system info (compact format)
    "hwinfo"
   ))



(define-public cli-packages
(append 
  security-packages
  filesystem-packages
  archive-packages
  monitor-packages
  network-packages
  file-transfer-packages
  shell-packages
  hardware-packages))  

(define-public guix-core-packages
(list 
  "nss-certs" ; tls certificates
  "glibc-locales" ; all supported gnu clib locales (1 gig)
  ; "glibc-utf8-locales" ; small set of locales
  
; ssh -  required for git with ssh repos
  ; "openssh" 
  "openssh-sans-x"

  "guile" 
  ;"stow" symlink manager

  "iptables"
))

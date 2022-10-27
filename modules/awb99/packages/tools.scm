(define-module (awb99 packages tools))


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
    "ddclient" ; dynamic dns client
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
   ))

(define-public guix-core-packages
(list 
  "nss-certs" ; tls certificates
  "glibc-locales" ; all supported gnu clib locales (1 gig)
  ; "glibc-utf8-locales" ; small set of locales
  ; "openssh" ; required for git with ssh repos
  "openssh-sans-x"
  ;"openssl"

  "guile" 
  ;"stow" symlink manager
))

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

(define-public services-packages
(list  
  
  "syncthing"
  "iptables"
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


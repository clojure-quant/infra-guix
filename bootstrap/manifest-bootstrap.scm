(use-modules 
  (guix packages)
  (guix profiles)
  (gnu packages))

(define my-min
  (list 
    "nss-certs"
    "git"
    ;"openssh" ; required for git with ssh repos
    "openssh-sans-x"
    "btrfs-progs"
  
    "nano"
    "bash"
    "wget"
    "chrony"
  ;  "ntpd"
    
  
  ))

(define my-tools
(list 
"sdparm" ; SCSI disk 
"hdparm" ; ATA disk
"gparted"
"parted"
"inxi"  ; hardware info 
"cryptsetup" ; luks encryption
"cpuid" ; cpu info
"cpuinfo" ; cpu info
"openssh"
"tree"
"whois"
"perftest"
"the-silver-searcher" ; ag
"iputils" ; ping
; SHELL
"bash"
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
; download
"wget"
"curl"
"tar"
"p7zip"  ; p7zip
"tarlz"
"gzip"
"zip" 
"unzip" 
"sysfsutils"
; tools
"ranger" ; directory explorer
"mc"
"glances"
"htop"


"ncdu"
"ncurses" ; clear
"rsync"
"rclone"
"nano"
"findutils" ; find
"mlocate"  ; locate == whereis
"glibc-locales" ; all supported gnu clib locales (1 gig)
; "glibc-utf8-locales" ; small set of locales
"mcron"
"syncthing"
"certbot" ; letsencrypt certs
"mesa-utils"
"fasd" ; newer than autojump
"openssl"

))



(define (->packages specs)
(map specification->package specs))

(define (->manifests specs)
(packages->manifest (->packages specs)))

; (->manifests my-tools)

(->manifests my-min)
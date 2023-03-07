

sudo zsh


export MYVAULT=/home/florian/repo/myLinux/myvault
GUIX_PROFILE="/root/.config/guix/current"
. "$GUIX_PROFILE/etc/profile"


; get latest guix version
; bb pull is necessary because normal guix pull will set channels to only guix channel.
bb pull nuc12 

; upgrade guix os to latest os version
./bootstrap/guix-os-install.sh nuc12



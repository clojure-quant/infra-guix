


# os system

dont use this
`bb update-root` to update package definitions on user root

```
sudo zsh
; update guix package definitions
./bootstrap/guix-pull.sh

; upgrade guix os to latest os version
export MYVAULT=/home/florian/repo/myLinux/myvault
./bootstrap/guix-os-install.sh nuc12
```

GUIX_PROFILE="/root/.config/guix/current"
. "$GUIX_PROFILE/etc/profile"

; get latest guix version
; bb pull is necessary because normal guix pull will set channels to only guix channel.
bb pull
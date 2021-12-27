# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi




#export GUILE_LOAD_PATH=./scm:/home/florian/clojure-quant/infra-guix/home/.config/shepherd/init.d:$GUILE_LOAD_PATH

# https://notabug.org/jbranso/guix-config/src/master/.bash_profile

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    # export MOZ_ENABLE_WAYLAND=1
    # export GUIX_PACKAGE_PATH=/home/joshua/prog/gnu/guix/guix-packages/
    # XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/joshua/.local/share/flatpak/exports/share:$XDG_DATA_DIRS
#    echo "HERD USER SERVICES: " $GUILE_LOAD_PATH
#    shepherd \
#      --config=/home/florian/repo/myLinux/distros/guix/dotfiles/.config/shepherd/init.scm
#fi

GDK_SCALE=1
export GDK_SCALE=1
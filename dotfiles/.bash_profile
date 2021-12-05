export PATH="/home/john/.local/bin:$PATH"
export EDITOR="TERM=xterm-24bits emacsclient -nw --socket-name term"
export GIT_EXEC_PATH="/home/john/.guix-profile/libexec/git-core"

# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi


export GUILE_LOAD_PATH=./scm:/home/florian/repo/myLinux/distros/guix/dotfiles/.config/shepherd/init.d:$GUILE_LOAD_PATH

# https://notabug.org/jbranso/guix-config/src/master/.bash_profile

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    # export MOZ_ENABLE_WAYLAND=1
    # export GUIX_PACKAGE_PATH=/home/joshua/prog/gnu/guix/guix-packages/
    # XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/joshua/.local/share/flatpak/exports/share:$XDG_DATA_DIRS
    echo "HERD USER SERVICES: " $GUILE_LOAD_PATH
    shepherd \
      --config=/home/florian/repo/myLinux/distros/guix/dotfiles/.config/shepherd/init.scm
fi



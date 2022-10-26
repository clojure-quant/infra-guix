# Bash initialization for interactive non-login shells and
# for remote shells (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes.  Programs such as 'screen'
# honor it and otherwise use /bin/sh.
export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

# Source the system-wide file.
source /etc/bashrc


echo "hello from .bashrc (wunderbar!) .."

echo "binaries in GUIX_ENVIRONMENT/bin"
ls "$GUIX_ENVIRONMENT/bin"


# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1='\u@\h \w [env]\$ '
else
    PS1='\u@\h \w\$ '
fi



[ -r /home/florian/.byobu/prompt ] && . /home/florian/.byobu/prompt   #byobu-prompt#

GDK_SCALE=1
export GDK_SCALE=1


export PATH=$PATH:~/.nix-profile/bin
export PATH=$PATH:/home/florian/clojure/bin

GUIX_PROFILE="/home/florian/.guix-profile"
. "$GUIX_PROFILE/etc/profile"

GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles

# load all extra guix profiles on startup
GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles
for i in $GUIX_EXTRA_PROFILES/*; do
  profile=$i/$(basename "$i")
  if [ -f "$profile"/etc/profile ]; then
    GUIX_PROFILE="$profile"
    . "$GUIX_PROFILE"/etc/profile
  fi
  unset profile
done
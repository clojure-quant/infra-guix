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

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1='\u@\h \w [env]\$ '
else
    PS1='\u@\h \w\$ '
fi


alias ls='ls -p --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias clear="printf '\033c'"
alias lsa="ls -lsa"
alias lsah="ls -lsah"
alias psg='ps aux | grep -i'
alias tml="tmux list-sessions"
alias tma="TERM=xterm-24bits tmux attach-session -t"


[ -r /home/florian/.byobu/prompt ] && . /home/florian/.byobu/prompt   #byobu-prompt#

GUIX_PROFILE="/home/florian/.guix-profile"
. "$GUIX_PROFILE/etc/profile"

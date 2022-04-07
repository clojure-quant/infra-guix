

GIT SSL: if guest os has ssl issue with git:
git config --global http.sslverify false



 probably because GIT_EXEC_PATH is unset (did you try logging out and in again?)
<xelxebar>	For some reason it's getting set to $HOME/.config/guix/current/libexec/gi
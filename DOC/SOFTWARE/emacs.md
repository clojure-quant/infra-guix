# emacs

emacs -q -nw -l ~/.config/emacs/init.el


# plugins
When you install Emacs packages with Guix, the Elisp files are placed under the share/emacs/site-lisp/ directory of the profile in which they are installed. The Elisp libraries are made available to Emacs through the EMACSLOADPATH environment variable, which is set when installing Emacs itself.

export EMACSLOADPATH=/home/florian/.guix-profile/share/emacs/site-lisp/
export EMACSLOADPATH=/home/florian/.guix-home/profile/share/emacs/site-lisp


projectile-switch-project  switch between projects
treemacs  switch project tree on/off
zoom in/out using C-x C-+,

The popular Ctrl-v (paste), Ctrl-c (copy), Ctrl-z (undo) can be enabled by typing: M-x cua-mode or by inserting =(cua-mode) in Emacs configuration file. It also supports the Vim key bindings by installing the evil package (M-x package-install evil).

https://config.daviwil.com/emacs



/home/florian/.guix-home/profile/libexec
the emacs plugins are installed via a plugin that uses git.
git needs to have GIT_EXEC_PATH installed.

the github repo needs ssl certs

export GIT_EXEC_PATH=/home/florian/.guix-home/profile/libexec/git-core
export SSL_CERT_DIR=/etc/ssl/certs
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

Additionally, autoload definitions are automatically evaluated at the initialization of Emacs, by the Guix-specific guix-emacs-autoload-packages procedure. If, for some reason, you want to avoid auto-loading the Emacs packages installed with Guix, you can do so by running Emacs with the --no-site-file option (see Init File in The GNU Emacs Manual).





emacs-counsel


Emacs-consumer package from rde channel.


dired


smartparens
cleverparens
evil/cleverparens

prelude


emacs-perspective
emacs-parinfer-mode
emacs-paredit


emacs-evil
emacs-evil-smartparens
emacs-evil-tmux-navigator
emacs-evil-paredit
emacs-evil-owl
emacs-evil-mc
emacs-evil-leader
emacs-evil-cleverparens
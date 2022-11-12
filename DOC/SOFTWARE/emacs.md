# emacs

emacs -q -nw -l ~/.config/emacs/init.el


# guix plugins
**installed emacs packages** are in share/emacs/site-lisp/ 
libraries are made available to Emacs through the EMACSLOADPATH environment variable

export EMACSLOADPATH=/home/florian/.guix-profile/share/emacs/site-lisp/
export EMACSLOADPATH=/home/florian/.guix-home/profile/share/emacs/site-lisp

Additionally, autoload definitions are automatically evaluated at the initialization of Emacs, by the Guix-specific guix-emacs-autoload-packages procedure. If, for some reason, you want to avoid auto-loading the Emacs packages installed with Guix, you can do so by running Emacs with the --no-site-file option

# important keybindings
C = CTRL
M = ALT or ESC
e**x**ecute function M-x
emacs eval expression    C-M-x
zoom in/out using C-x C-+,

# projectile

**projectile-grep** greps in project
projectile-switch-project  switch between projects
treemacs  switch project tree on/off

# magit

C-x g       git status


The popular Ctrl-v (paste), Ctrl-c (copy), Ctrl-z (undo) can be enabled by typing: M-x cua-mode or by inserting =(cua-mode) in Emacs configuration file. It also supports the Vim key bindings by installing the evil package (M-x package-install evil).

https://config.daviwil.com/emacs





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




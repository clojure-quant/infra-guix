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
M-x e**x**ecute function
C-M-x emacs eval expression
zoom in/out using C-x C-+,
C-g  cancel current command. 
C-x C-c quit

**Window**
C-x 2 : split the active window vertically into two horizontal windows
C-x 3 : split the active window horizontally into two vertical windows
C-x o : change active window to next window
C-x 0 : close the active window
C-x 1 : close all windows except the active window
C-x ^ enlarge window

**Buffer**
C-x b : buffer switch
C-x right : right-cycle through buffers
C-x left : left-cycle through buffers
C-x k : kill buffer

**File**  (TWO TIME CONTROL )
C-x C-f : open file
C-x C-s : save file
C-x C-w : save file as

**Find**
C-x 4 f find 

**Copy paste**
C-w   cut
M-w  copy
C-y   paste
C-_   undo

# important functions

list-packages


# projectile

**projectile-grep** greps in project
projectile-switch-project  switch between projects
treemacs  switch project tree on/off

# magit

C-x g       git status
s           stage file
c           commit
C-c C-c     upload commit

# cua

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




; ~/.config/emacs/init.el

(add-to-list 'load-path "/home/florian/.guix-profile/share/emacs/site-lisp")

(require 'guix-emacs)
(guix-emacs-autoload-packages)

(load "subdirs.el")
(load "site-start.el")


(defun hello ()
  (print "hello from emacs"))

(global-set-key (kbd "C-c a") 'print-hello)

; You can try M-x load-library and see if you can load the package or library that way first.


(defun mp-add-python-keys ()
  (local-set-key (kbd "C-c q") 'shell))

(add-hook 'python-mode-hook #'mp-add-python-keys)

; emacs -q -nw -l ~/.mutt/emacs.el
; -q means "don't load an init.el file
; -nw means "no window" (don't create an X window, just do it in the terminal)
; -l means "load this lisp file"

(require 'vterm)
;(vterm)


;; Turn off the splash screen
(setq inhibit-startup-screen t)
;; Turn off the splash screen
(setq initial-scratch-message nil)

;; Maximize window on initialize
(add-hook 'window-setup-hook 'toggle-frame-maximized t)


(print "hello ......")


(treemacs)

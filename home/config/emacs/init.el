; ~/.config/emacs/init.el

(add-to-list 'load-path "/home/florian/.guix-profile/share/emacs/site-lisp")
(add-to-list 'load-path "/home/florian/.guix-home/profile/share/emacs/site-lisp")


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

;; Maximize Window on initialize
(add-hook 'window-setup-hook 'toggle-frame-maximized t)


(print "hello ......")


(treemacs)

(add-to-list 'load-path "/home/florian/emacsload")
(print "loading cfrs..")
(require 'cfrs)

(require 'projectile)

(defvar default-ecb-source-path
  (list '("~/repo/clojure-quant/infra-guix" "infra-guix")
	 '("~/" "~/")
	 '("/" "/")))

(add-hook 'ecb-basic-buffer-sync-hook
		  (lambda ()
			(when (functionp 'projectile-get-project-directories)
			  (when (projectile-project-p)
				(dolist (path-dir (projectile-get-project-directories))
				  (unless (member (list path-dir path-dir) default-ecb-source-path)
					(push (list path-dir path-dir) default-ecb-source-path)
					(customize-set-variable 'ecb-source-path default-ecb-source-path)
					))))))

(setq projectile-project-search-path
      '("~/repo/"
	;"~/work/"
	("~/github" . 1)))


;(require 'rainbow-delimiters)

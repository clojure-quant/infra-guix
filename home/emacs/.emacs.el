;;; .emacs.el  --- Emacs Init File -S*- lexical-binding: t -*-
;;; THIS FILE IS GENERATED

(setq vc-follow-symlinks t)

(setq user-emacs-directory "~/emacs/.emacs.d/")

(require 'server)
(unless (server-running-p)
  (server-start))

(setq isearch-lax-whitespace nil)
(defalias 'yes-or-no-p 'y-or-n-p) ; stop asking "yes" http://www.emacswiki.org/emacs/YesOrNoP
(add-to-list 'auto-mode-alist '("\\.service\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.path\\'" . conf-mode))

(setq straight-cache-autoloads t
      straight-check-for-modifications '(check-on-save find-when-checking)
      straight-repository-branch "develop"
      straight-use-package-by-default t
      use-package-always-ensure nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; https://github.com/raxod502/straight.el/issues/49#issuecomment-395979478
(defun straight-x-clean-unused-repos ()
  (interactive)
  (dolist (repo (straight--directory-files (straight--repos-dir)))
    (unless (or (straight--checkhash repo straight--repo-cache)
                (not (y-or-n-p (format "Delete repository %S?" repo))))
      (delete-directory (straight--repos-dir repo) 'recursive 'trash))))

(setq browse-pdf-generic-program (executable-find "emacsclient"))
(put 'list-timers 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(use-package emacs
  :straight (:type built-in)
  :init
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  :custom
  (backup-directory-alist '((".*" . "~/emacs/.emacs.d/temporary_files")))
  (blink-cursor-blinks 0)
  (blink-cursor-mode t)
  (case-fold-search t)
  (create-lockfiles nil)
  (cua-global-mark-cursor-color "#2aa198")
  (cua-normal-cursor-color "#839496")
  (cua-overwrite-cursor-color "#b58900")
  (cua-read-only-cursor-color "#859900")
  (custom-safe-themes t)
  (current-language-environment "UTF-8")
  (truncate-lines nil)
  (debug-on-error nil)
  (debug-on-quit nil)
  (delete-old-versions t)
  (electric-pair-mode nil)
  (enable-local-variables t)
  (fill-column 9999)
  (frame-background-mode 'dark)
  (global-hl-line-mode t)
  (global-linum-mode t)
  (help-at-pt-display-when-idle '(flymake-diagnostic) nil (help-at-pt))
  (help-at-pt-timer-delay 1)
  (history-delete-duplicates t)
  (hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
  (hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
  (hl-paren-colors '("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11"))
  (hl-sexp-background-color "#efebe9")
  (hscroll-margin 30)
  (hscroll-step 3)
  (inhibit-startup-screen t)
  (initial-scratch-message "")
  (large-file-warning-threshold nil)
  (line-number-mode t)
  (mark-even-if-inactive t)
  (max-lisp-eval-depth 9000)
  (max-mini-window-height 1.0)
  (max-specpdl-size 10000)
  (minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))  
  (password-cache-expiry 3600)
  (pos-tip-background-color "#073642")
  (pos-tip-foreground-color "#93a1a1")
  (recentf-auto-cleanup 'mode)
  (recentf-max-menu-items 100)
  (recentf-max-saved-items 100)
  (resize-mini-windows nil)
  (save-interprogram-paste-before-kill t)
  (scroll-bar-mode nil)
  (scroll-step 2)
  (mouse-wheel-progressive-speed nil)
  (mouse-wheel-follow-mouse t)
  (temporary-file-directory "~/emacs/.emacs.d/temporary_files")
  (truncate-partial-width-windows nil)
  (view-read-only t)
  (visible-bell t)
  (window-divider-default-bottom-width 1 nil nil "Customized with use-package window-divider")
  (window-divider-default-places t nil nil "Customized with use-package window-divider")
  (window-divider-default-right-width 1 nil nil "Customized with use-package window-divider")
  (window-divider-mode t)
  (word-wrap t)

;;;;;;;;;;;;;;;;;;;;;;
  :custom-face
  (default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "ADBO" :family "Source Code Pro"))))
  (cursor ((t (:background "orange red"))))
  (display-time-mail-face ((t (:background "red" :foreground "deep sky blue" :box (:line-width 2 :color "grey75" :style released-button)))))
					;      (helm-selection ((t (:inherit bold :extend t :background "#4169e1" :foreground "black"))))
  (hl-line ((t (:extend t :background "#191970"))))
  (mode-line-buffer-id ((t (:foreground "white smoke" :background "midnight blue"))))
  (mode-line ((t (:background "gray4" :foreground "light sky blue"))))
  (mode-line-inactive ((t (:background "#696969" :foreground "black" :box nil))))
  (popup-scroll-bar-background-face ((t (:background "black"))))
  (popup-scroll-bar-foreground-face ((t (:background "red"))))
  (scroll-bar ((t (:background "DarkRed" :foreground "black"))))
  (show-paren-match ((t (:background "#Ff4500" :foreground "black" :weight ultra-bold))))
  (window-divider ((t (:inherit vertical-border :background "cyan" :foreground "cyan" :width normal))))

  :config
  (global-hl-line-mode t)
  (global-auto-revert-mode t)
  ) ;; use-package emacs

(use-package anzu
  :delight
  :config (global-anzu-mode 1)
  (setq anzu-minimum-input-length 4))

(use-package better-shell
  :commands (tsa/hydra-shells shell better-shell-shell))

(use-package bookmark+
    :straight (bookmark+ :type git :host github :repo "emacsmirror/bookmark-plus")
    :demand t
    :custom
    (bmkp-last-as-first-bookmark-file "~/emacs/.emacs.d/bookmarks")
    (bookmark-save-flag 0)
    (bmkp-prompt-for-tags-flag nil)
    (bookmark-version-control t)
    (bmkp-default-handlers-for-file-types 
	  '(("\\.pdf$" . find-file)
	    ("\\.html$" . browse-url)
	    ("^http" . browse-url)))
    :custom-face
   (bmkp-a-mark ((t (:background "cyan" :foreground "black"))))
   (bmkp-file-handler ((t (:background "#FF8080" :foreground "black"))))

    :config    
    (defadvice bookmark-jump (after bookmark-jump activate)
      (let ((latest (bookmark-get-bookmark bookmark)))
	(setq bookmark-alist (delq latest bookmark-alist))
	(add-to-list 'bookmark-alist latest)))
    )

(use-package vertico
  :init
  (vertico-mode)

  ;; Optionally enable cycling for `vertico-next', `vertico-previous',
  ;; `vertico-next-group' and `vertico-previous-group'.
  ;; (setq vertico-cycle t)
)

(use-package savehist
  :straight (:type built-in)
  :init
  (savehist-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package consult
  :straight (consult :type git :host github :repo "minad/consult")
  :demand t
  :bind (("C-c s" . consult-outline)
	 ("C-x j j" . consult-bookmark)
	 ("M-s l" . consult-line)
	 ("C-h k" . tsa/consult-descbinds)
	 ("M-y" . consult-yank-pop)
	 ("<help> a" . consult-apropos))
  ;; :custom
  ;; (consult-project-root-function 'projectile-project-root)
  ;; (consult--read-config `((consult-bookmark :preview-key nil)
  ;; 			  (consult-buffer :preview-key ,(kbd "M-p"))))
  :config
  (consult-customize
   consult-bookmark :preview-key nil
   consult-buffer :preview-key (kbd "M-p"))
  (fset 'multi-occur #'consult-multi-occur))

(defun consult-line-from-isearch ()
   (interactive)
   (consult-line isearch-string))

(defun tsa/consult-descbinds ()
  (interactive)
  (describe-bindings)
  (other-window 1)
  (call-interactively #'consult-focus-lines))

(use-package bufler
  :delight '(:eval (if bufler-workspace-mode (concat "[buf:-" bufler-workspace-name "]") ""))
  :bind (("C-x C-b" . bufler)
	 :map bufler-list-mode-map
	 ("G" . tramp-cleanup-all-buffers))
  :custom (bufler-columns '("Name" "Size" "Path"))
  (bufler-column-name-max-length 30)
  :custom-face
  (bufler-buffer-special ((t (:inherit default :foreground "aqua" :slant italic))))
  :config
					;(bufler-mode t)
  (setf bufler-groups
	(bufler-defgroups
	  (group
	   ;; Subgroup collecting all named workspaces.
	   (auto-workspace))
	  (group
	   (mode-match "*w3m*" (rx "w3m")))
	  (group
	   (mode-match "*EXWM*" (rx bos "EXWM"))
	   (name-match "(Private) *Firefox*" (rx "(Private Browsing)" eos))
	   (name-match "*Firefox*" (rx bos "F :"))           
	   )
	  (group
	   (group-or "Chat"
		     (mode-match "Telega" (rx bos "telega-"))))
	  (group
	   ;; Subgroup collecting all `help-mode' and `info-mode' buffers.
	   (group-or "*Help/Info*"
		     (mode-match "*Help*" (rx bos "help-"))
		     (mode-match "*Info*" (rx bos "info-"))))
	  (group
	   ;; Subgroup collecting all special buffers (i.e. ones that are not
	   ;; file-backed), except `magit-status-mode' buffers (which are allowed to fall
	   ;; through to other groups, so they end up grouped with their project buffers).
	   (group-and "*Special*"
		      (lambda (buffer)
			(unless (or (funcall (mode-match "Magit" (rx bos "magit-status"))
					     buffer)
				    (funcall (mode-match "Dired" (rx bos "dired"))
					     buffer)
				    (funcall (auto-file) buffer))
			  "*Special*")))
	   (group
	    ;; Subgroup collecting these "special special" buffers
	    ;; separately for convenience.
	    (name-match "**Special**"
			(rx bos "*" (or "Messages" "Warnings" "scratch" "Backtrace") "*")))
	   (group
	    ;; Subgroup collecting all other Magit buffers, grouped by directory.
	    (mode-match "*Magit* (non-status)" (rx bos (or "magit" "forge") "-"))
	    (auto-directory))
	   ;; Remaining special buffers are grouped automatically by mode.
	   (auto-mode))
	  ;; All buffers under "~/.emacs.d" (or wherever it is).
	  (dir user-emacs-directory)
	  (group
	   ;; Subgroup collecting buffers in `org-directory' (or "~/org" if
	   ;; `org-directory' is not yet defined).
	   (dir (if (bound-and-true-p org-directory)
		    org-directory
		  "~/org"))
	   (group
	    ;; Subgroup collecting indirect Org buffers, grouping them by file.
	    ;; This is very useful when used with `org-tree-to-indirect-buffer'.
	    (auto-indirect)
	    (auto-file))
	   ;; Group remaining buffers by whether they're file backed, then by mode.
	   (group-not "*special*" (auto-file))
	   (auto-mode))
	  (group
	   ;; Subgroup collecting buffers in a projectile project.
	   (auto-projectile))
	  (group
	   ;; Subgroup collecting buffers in a version-control project,
	   ;; grouping them by directory.
	   (auto-project))
	  ;; Group remaining buffers by directory, then major mode.
	  (auto-directory)
	  (auto-mode))))

(use-package iflipb
  :bind ((("M-TAB" . iflipb-next-buffer))
	 ("M-S-TAB" . iflipb-previous-buffer))
  :custom
  (iflipb-ignore-buffers nil)
  (iflipb-permissive-flip-back t))

(use-package marginalia
  :straight (marginalia :type git :host github :repo "minad/marginalia")
  :bind (:map minibuffer-local-map
	      ("C-M-a" . marginalia-cycle)
	      ;; When using the Embark package, you can bind `marginalia-cycle' as an Embark action!
	      ;;:map embark-general-map
	      ;;     ("A" . marginalia-cycle)
	      )
  :init
  (marginalia-mode)
  ;; When using Selectrum, ensure that Selectrum is refreshed when cycling annotations.
  ;; (advice-add #'marginalia-cycle :after
  ;; 	      (lambda () (when (bound-and-true-p selectrum-mode) (selectrum-exhibit))))

  ;(setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  )

(use-package embark
  :straight (embark :type git :host github :repo "oantolin/embark")
  :bind
  (("M-." . embark-dwim)
   ("C-h B" . embark-bindings)
   ("C-." . embark-act))               ; pick some comfortable binding

  :config
  (setq embark-action-indicator
	(lambda (map _target)
	  (which-key--show-keymap "Embark" map nil nil 'no-paging)
	  #'which-key--hide-popup-ignore-command)
	embark-become-indicator embark-action-indicator)

  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package lsp-mode
  :hook
  (clojure-mode . lsp)
  (clojurescript-mode . lsp)
  (clojurec-mode . lsp)

  :custom
  (help-at-pt-timer-delay 1)
  (help-at-pt-display-when-idle '(flymake-diagnostic))
  (lsp-lens-enable t)
  (lsp-signature-auto-activate nil)
  :commands lsp)

(use-package lsp-ui  :commands lsp-ui-mode)

(use-package company-lsp  :commands company-lsp)

(use-package cider
  :bind (:map cider-mode-map
	      ("C-c M-;" . cider-pprint-eval-last-sexp-to-comment)
	      ("C-c TAB" . clojure-align))
  :custom
  (cider-inject-dependencies-at-jack-in t)
  :config
  (setq cider-repl-use-clojure-font-lock t
	cider-font-lock-dynamically '(macro core function var)
	cider-default-cljs-repl 'figwheel
	cider-repl-display-help-banner nil
	cider-repl-use-pretty-printing t)
  (fset 'tsa/clojure-letvar-to-def
	(lambda (&optional arg)
	  "with cursor at a let-var, def it so you can proceed with repl debugging." 
	  (interactive "p") (kmacro-exec-ring-item (quote ([40 100 101 102 32 C-right C-right 134217734 134217734 134217734 24 5 67108911 67108911] 0 "%d")) arg)))
  (define-key clojure-mode-map (kbd "M-L") 'tsa/clojure-letvar-to-def))

(use-package flycheck-joker)

(use-package clojure-mode
  :after flycheck-joker
  :hook  ((clojure-mode . my-clojure-mode-hook)
	  (clojure-mode . flycheck-mode))
:custom
  (nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))

  :custom-face 
  (clj-todo-face ((t (:box (:line-width 2 :color "dim gray" :style released-button) :weight ultra-bold))))

  :config
  (cider-auto-test-mode t)
  (defun my-clojure-mode-hook () 
    (highlight-phrase "TODO" 'clj-todo-face)
    (yas-minor-mode 1) 
    (and buffer-file-name
     (string-match "/\\(?:style\\|css\\)/" buffer-file-name)
     (rainbow-mode 1)))
  (use-package flycheck-clj-kondo 
    :config
    (dolist (checkers '((clj-kondo-clj . clojure-joker)
			(clj-kondo-cljs . clojurescript-joker)
			(clj-kondo-cljc . clojure-joker)))
      (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers))))))

(use-package clojure-mode-extra-font-locking
  :requires clojure-mode)

(use-package company
     :delight company-mode
     :custom
     (company-quickhelp-color-background "#4F4F4F")
     (company-quickhelp-color-foreground "#DCDCCC")
     (company-idle-delay 0.3)
     :defer t
     :config
     (global-company-mode)
     (add-hook 'prog-mode-hook #'company-mode-on)       
     (setq company-idle-delay 0.3))

(use-package company-quickhelp
     :demand t
     :config
     (company-quickhelp-mode 1)
     (setq company-quickhelp-delay 0.5)
     (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(use-package dired
  :straight (:type built-in)
  :custom
  (dired-dwim-target t)
  (dired-guess-shell-alist-user '(("\\.*$" "xdg-open")))
  (dired-listing-switches "-alh")
  (diredp-image-preview-in-tooltip 300)
  :config
  (add-hook 'dired-mode-hook (lambda () (auto-revert-mode)))
)

(use-package dired+     
  :custom
  (dired-listing-switches "-alh")
  (delete-by-moving-to-trash t)
  :bind (:map dired-mode-map 
	      ("C-c C-r" . dired-toggle-read-only))
  :config
  (add-hook 'dired-mode-hook
	    (lambda ()
	      (define-key dired-mode-map (kbd "<return>")
		'dired-find-alternate-file) ; was dired-advertised-find-file
	      (define-key dired-mode-map (kbd "^")
		(lambda () (interactive) (find-alternate-file "..")))
					; was dired-up-directory
	      ))
  (setq dired-guess-shell-alist-user
	(list (list "\\.*$" "xdg-open");; fixed rule
       ;; possibly more rules...
	      ))
  (put 'dired-find-alternate-file 'disabled nil))

(defun dired-sort-toggle ()
  "This is a redefinition of the fn from dired.el. Normally,
dired sorts on either name or time, and you can swap between them
with the s key.  This function one sets sorting on name, size,
time, and extension. Cycling works the same.
"
  (setq dired-actual-switches
        (let (case-fold-search)
          (cond
           ((string-match " " dired-actual-switches) ;; contains a space
            ;; New toggle scheme: add/remove a trailing " -t" " -S",
            ;; or " -U"
            ;; -t = sort by time (date)
            ;; -S = sort by size
            ;; -X = sort by extension

            (cond

             ((string-match " -t\\'" dired-actual-switches)
              (concat
               (substring dired-actual-switches 0 (match-beginning 0))
               " -X"))

             ((string-match " -X\\'" dired-actual-switches)
              (concat
               (substring dired-actual-switches 0 (match-beginning 0))
               " -S"))

             ((string-match " -S\\'" dired-actual-switches)
              (substring dired-actual-switches 0 (match-beginning 0)))

             (t
              (concat dired-actual-switches " -t"))))

           (t
            ;; old toggle scheme: look for a sorting switch, one of [tUXS]
            ;; and switch between them. Assume there is only ONE present.
            (let* ((old-sorting-switch
                    (if (string-match (concat "[t" dired-ls-sorting-switches "]")
                                      dired-actual-switches)
                        (substring dired-actual-switches (match-beginning 0)
                                   (match-end 0))
                      ""))

                   (new-sorting-switch
                    (cond
                     ((string= old-sorting-switch "t") "X")
                     ((string= old-sorting-switch "X") "S")
                     ((string= old-sorting-switch "S") "")
                     (t "t"))))
              (concat
               "-l"
               ;; strip -l and any sorting switches
               (dired-replace-in-string (concat "[-lt"
                                                dired-ls-sorting-switches "]")
                                        ""
                                        dired-actual-switches)
               new-sorting-switch))))))

  (dired-sort-set-modeline)
  (revert-buffer))

(defun dired-sort-set-modeline ()
 "This is a redefinition of the fn from `dired.el'. This one
properly provides the modeline in dired mode, supporting the new
search modes defined in the new `dired-sort-toggle'.
"
  ;; Set modeline display according to dired-actual-switches.
  ;; Modeline display of "by name" or "by date" guarantees the user a
  ;; match with the corresponding regexps.  Non-matching switches are
  ;; shown literally.
  (when (eq major-mode 'dired-mode)
    (setq mode-name
          (let (case-fold-search)
            (cond ((string-match "^-[^t]*t[^t]*$" dired-actual-switches)
                   "Dired by time")
                  ((string-match "^-[^X]*X[^X]*$" dired-actual-switches)
                   "Dired by ext")
                  ((string-match "^-[^S]*S[^S]*$" dired-actual-switches)
                   "Dired by sz")
                  ((string-match "^-[^SXUt]*$" dired-actual-switches)
                   "Dired by name")
                  (t
                   (concat "Dired " dired-actual-switches)))))
    (force-mode-line-update)))

(use-package diredfl
  :demand t
  :config
  (add-hook 'dired-mode-hook 'diredfl-mode)
  :custom-face
  (diredfl-dir-name ((t (:foreground "#3679D8" :box (:line-width 2 :color "grey75" :style released-button)))))
  (diredfl-dir-priv ((t (:foreground "#3679D8" :underline t))))
  (diredfl-exec-priv ((t (:background "#79D836" :foreground "black"))))
  (diredfl-read-priv ((t (:background "#D8B941" :foreground "black"))))
  (diredfl-write-priv ((t (:background "#D83441" :foreground "black")))))

(use-package dired-rainbow 
:custom-face
      (dired-rainbow-directory-face ((t (:foreground "#6cb2eb" :box (:line-width 2 :color "deep sky blue" :style released-button)))))
:config
  (progn
    (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")
    ))

;; Ibuffer-style filtering and saved filter groups (persistent, unlike narrow)
(use-package dired-filter)

(use-package dired-narrow
  :bind
  (:map dired-mode-map
	("C-c n" . dired-narrow)))

(use-package ediff
    :custom
    (diff-command "wdiff")
    (diff-switches "")
    (ediff-window-setup-function 'ediff-setup-windows-plain)
)

(use-package helpful)

(use-package which-key
  :delight
  :config
  (which-key-mode))

;; GOLDEN PAKAGE
(use-package magit
  :custom 
       (vc-annotate-background nil)
       (vc-annotate-color-map
	'((20 . "#cc6666")
	  (40 . "#de935f")
	  (60 . "#f0c674")
	  (80 . "#b5bd68")
	  (100 . "#8abeb7")
	  (120 . "#81a2be")
	  (140 . "#b294bb")
	  (160 . "#cc6666")
	  (180 . "#de935f")
	  (200 . "#f0c674")
	  (220 . "#b5bd68")
	  (240 . "#8abeb7")
	  (260 . "#81a2be")
	  (280 . "#b294bb")
	  (300 . "#cc6666")
	  (320 . "#de935f")
	  (340 . "#f0c674")
	  (360 . "#b5bd68")))
       (vcannotate-very-old-color nil)
       (vc-follow-symlinks t)
       (vc-handled-backends nil) ;; disable built-in vc
       ;(vc-handled-backends '(Git))
  :config
				      ;    (global-magit-file-mode)
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-diff-use-overlays nil))

(use-package markdown-mode
  :mode "\\.md\\'")

(use-package multiple-cursors
  :bind (("C-M-n" . mc/mark-next-lines))
  :custom 
  (mc/always-run-for-all t))

(use-package smartparens
    :demand t
    :bind (("C-<f5>" . smartparens-mode))
    :custom-face
    (sp-show-pair-enclosing ((t (:inherit highlight :background "orange red"))))
    (sp-show-pair-match-face ((t (:background "#Ff4500" :foreground "black" :weight ultra-bold))))

    :config
    (show-smartparens-global-mode)
    (sp-use-paredit-bindings)
    (add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)
    (add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
    (add-hook 'cider-repl-mode-hook #'turn-on-smartparens-strict-mode)
    (add-hook 'message-mode-hook 'turn-off-smartparens-mode)
    (add-hook 'org-mode-hook 'turn-off-smartparens-mode)
    (bind-keys
     :map smartparens-strict-mode-map
     (";" . sp-comment)
     ("M-[" . sp-backward-barf-sexp)
     ("M-]" . sp-forward-slurp-sexp)
     ("M-f" . sp-forward-symbol)
     ("M-b" . sp-backward-symbol)
     ("M-a" . sp-beginning-of-sexp)
     ("M-e" . sp-end-of-sexp)))

(use-package smartparens-config
       :straight (:type built-in))

(use-package paren
  :config
  (show-paren-mode 1))

(use-package projectile
  :delight '(:eval (concat " [P: " (projectile-project-name) "]"))
  :custom
  (projectile-completion-system 'default)
  (projectile-switch-project-action 'projectile-find-file)
  :config
  (projectile-global-mode)
  (define-key projectile-command-map (kbd "s g") 'consult-git-grep))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package rainbow-identifiers
  :config
  (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))

(use-package rainbow-mode
  :mode "\\.css")

(use-package recentf
  :straight (:type built-in)
  :bind (("C-x C-r" . consult-recent-file))
  :config
  (setq recentf-max-menu-items 100)
  (recentf-mode 1))

(use-package shell
  :straight (:type built-in)
  :custom
  (shell-command-prompt-show-cwd t)
  (comint-completion-addsuffix nil)
  (ansi-color-faces-vector
   '[default bold shadow italic underline bold bold-italic bold])
  (ansi-term-color-vector
   '[unspecified "#1F1611" "#660000" "#144212" "#EFC232" "#5798AE" "#BE73FD" "#93C1BC" "#E6E1DC"] t)
  (async-shell-command-buffer 'new-buffer)
  :config ;http://stackoverflow.com/questions/704616/something-wrong-with-emacs-shell
  (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (add-to-list 'display-buffer-alist
	       '("^\\*shell\\*$" . (display-buffer-same-window)))) ;; don't open shell in a new window

(use-package ace-link
  :bind (:map gnus-summary-mode-map 
	      ("M-o" . ace-link-gnus)
	      :map gnus-article-mode-map
	      ("M-o" . ace-link-gnus)
	      :map org-mode-map
	      ("M-o" . ace-link-org)
	      :map w3m-mode-map
	      ("M-o" . ace-link-w3m)
	      )
  :config
  (ace-link-setup-default))

(use-package ace-window
  :bind (("s-<tab>" . ace-window)))

(use-package ace-popup-menu

  :config
  (ace-popup-menu-mode 1))

(use-package ace-jump-mode
  :bind (("C-c SPC" . ace-jump-mode))
  :custom
  (ace-isearch-function 'ace-jump-char-mode)
  :config
  (setq ace-jump-mode-case-fold nil)
  (setq ace-jump-mode-submode-list '(ace-jump-line-mode ace-jump-char-mode ace-jump-word-mode)
	ace-jump-mode-scope 'frame))

(use-package avy
  :demand t
  :custom
  (avy-all-windows 'all-frames)
  (avy-background t)
  (avy-case-fold-search nil)
  (avy-highlight-first t)
  :custom-face
  (avy-lead-face ((t (:background "#F5f5f5" :foreground "#1E1C31" :weight bold))))
  (avy-lead-face-0 ((t (:inherit avy-lead-face :background "#Ff0000"))))
  (avy-lead-face-1 ((t (:inherit avy-lead-face :background "#32cd32"))))
  (avy-lead-face-2 ((t (:inherit avy-lead-face :background "#1e90ff")))))

(use-package swiper)

(use-package ace-isearch
  :demand t
  :delight
  :bind (:map isearch-mode-map
	      ("M-i" . consult-line-from-isearch) ;; doesn't quite work; doesn't know search string
	      ;("M-i" . ace-isearch-swiper-from-isearch)
	      )
  :custom    
  (ace-isearch-function 'avy-goto-char)
  (ace-isearch-2-switch-function 'avy-goto-char-2)
  ;(ace-isearch-function-from-isearch 'ace-isearch-swiper-from-isearch)
  (ace-isearch-input-idle-delay 0.2)
  ;(ace-isearch-input-length 9)
  (ace-isearch-use-ace-jump (quote printing-char))
  (ace-isearch-use-function-from-isearch nil) ;; don't make long searches into fancy stuff
  (ace-isearch-use-jump (quote printing-char))

  :config
  (global-ace-isearch-mode t)
  (add-hook 'isearch-mode-hook
	  (function
	   (lambda ()
	     (define-key isearch-mode-map "\C-h" 'isearch-mode-help)
	     (define-key isearch-mode-map "\C-t" 'isearch-toggle-regexp)
	     (define-key isearch-mode-map "\C-c" 'isearch-toggle-case-fold)
	     (define-key isearch-mode-map "\C-j" 'isearch-edit-string)))))

(use-package ace-jump-zap	
  :bind (("M-z" . ace-jump-zap-to-char))
  :config
  (setq ajz/zap-function 'kill-region))

(use-package windmove
  :config
  (setq windmove-default-keybindings t))

(use-package windresize
  :defer t
  :bind ("C-c w" . windresize))

(use-package winner
  :straight (:type built-in)
  :config
  (winner-mode 1))

(use-package telephone-line
  :after winum
  :custom 
  (telephone-line-mode t)
  (default-tab-width 3 t)
  (telephone-line-primary-left-separator 'telephone-line-cubed-left)
  (telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left)
  (telephone-line-primary-right-separator 'telephone-line-cubed-right)
  (telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
  (telephone-line-height 24)
  (telephone-line-evil-use-short-tag t)  
  :config     
  (setq telephone-line-faces '((evil . telephone-line-modal-face)
			       (modal . telephone-line-modal-face)
			       (ryo . telephone-line-ryo-modal-face)
			       (accent telephone-line-accent-active . telephone-line-accent-inactive)
			       (nil mode-line . mode-line-inactive)
			       (winum . (winum-face . winum-face))))
  (telephone-line-defsegment telephone-line-org-clock-segment ()
    (when (telephone-line-selected-window-active)
      (if (and (functionp 'org-clocking-p) (org-clocking-p))
	  (org-clock-get-clock-string))))
  (telephone-line-defsegment telephone-line-pdf-segment ()
    (when (eq major-mode 'pdf-view-mode)
      (propertize (pdf-view-page-number)
		  'face '(:inherit)
		  'display '(raise 0.0)
		  'mouse-face '(:box 1))))
  (telephone-line-defsegment telephone-line-winum-segment ()
    (propertize (eval (cadr winum--mode-line-segment))
		'face '(:box (:line-width 2 :color "cyan" :style released-button))		
		'display '(raise 0.0)
		'mouse-face '(:box 1)))
  (setq telephone-line-lhs '((winum . (telephone-line-winum-segment))
			     (accent . (telephone-line-pdf-segment
					telephone-line-vc-segment
					telephone-line-erc-modified-channels-segment
					telephone-line-process-segment))
			     (nil . (telephone-line-projectile-segment
				     telephone-line-buffer-segment
				     telephone-line-org-clock-segment
				     ))))
  ;(setq telephone-line-center-rhs '((evil . (telephone-line-battery-segment))))
  (setq telephone-line-rhs '((nil . (telephone-line-flycheck-segment					
				     ))
			     (accent . (telephone-line-major-mode-segment))
			     (evil . (telephone-line-airline-position-segment))))
  (telephone-line-mode t))

(use-package modus-themes
  :straight (modus-themes :type git :host gitlab :repo "protesilaos/modus-themes")
  :custom
  (modus-themes-headings
   '((t . rainbow-line)))
  (modus-themes-slanted-constructs t)
  (modus-themes-bold-constructs nil)
  (modus-theme-mode-line '3d)
  (modus-themes-intense-hl-line t)
  (modus-themes-completions 'opinionated)
  (modus-themes-lang-checkers 'intense-foreground)
  :init
  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :bind (("C-c T" . modus-themes-toggle))
  :config
  ;(modus-themes-load-operandi)
  (modus-themes-load-vivendi)
  )

;; comes with emacs, but still GOLDEN PACKAGE for anyone who works on multiple servers
(use-package tramp
  :straight (:type built-in)
  :defer t
  :custom
  (tramp-default-method "ssh")
  (tramp-completion-reread-directory-timeout nil)
  (tramp-default-remote-shell "/bin/bash")
  (tramp-encoding-shell "/bin/bash")
  ;(vc-handled-backends nil)
  ;; https://github.com/emacs-helm/helm/issues/981
  :config
  (add-to-list 'tramp-default-proxies-alist
	       '(nil "\\`root\\'" "/ssh:%h:"))
  (add-to-list 'tramp-default-proxies-alist
	       '((regexp-quote (system-name)) nil nil)))

(use-package transient
  :after org
  ;; comes installed with Magit, no need to install
  :straight nil
  ;; Anything not in a binding below needs to be called-out as a command
  :commands (transient-define-prefix)
  :init
  (autoload 'org-store-link "org")
  :bind*
  ;("C-M-o" . tsa/transient-window)
  ;("C-c o" . tsa/transient-global-org)
  ("C-z" . tsa/transient-shell)
  ;("C-;" . tsa/transient-multiplecursors)
  ("C-h" . tsa/transient-help) ;; risky over-writing help?
  ;("M-g" . tsa/transient-goto)
  ("M-s h" . tsa/transient-highlight)
  ("C-c b" . tsa/transient-bbdb)
  ("C-x M-e" . tsa/transient-w3m)
  ;("<f1>" . tsa/hydra-fkeys/body)
  ("<f12>" . tsa-transient-spelling))

;;; Usage Functions
(defun transient-ace-cmd ()
  (interactive)
  (ace-window 1)
  (add-hook 'ace-window-end-once-hook
	    'tsa/transient-window))

(defun tsa/split-vertical ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun tsa/split-horizontal ()
  (interactive)
  (split-window-below)
  (windmove-down))

(defun tsa/screen-swap ()
  (interactive)
  (ace-window 4)
  ;; (add-hook 'ace-window-end-once-hook
  ;; 	    'transient-window)
  )

(defun tsa/del-window ()
  (interactive)
  (ace-window 16)
  (add-hook 'ace-window-end-once-hook
	    'transient-window))

(defun tsa/split-window-4 ()
  "Split into 4 windows"
 (interactive)
 (when (= 1 (length (window-list)))
   (split-window-vertically)
   (split-window-horizontally)
   (other-window 2)
   (split-window-horizontally)))

(defun tsa/correct-all () 
  (interactive)
  (setq current-prefix-arg '(4))
  (call-interactively 'flyspell-correct-wrapper))

(defun tsa/projectile (&optional choose-project)
  "Open the scratch buffer. With c-u, in other window."
  (interactive "P")
  (let ((scratch "*scratch*"))
    (if choose-project (projectile-switch-project)
      (projectile-find-file))))

(defun tsa/open-scratch (&optional same-window)
  "Open the scratch buffer. With c-u, in other window."
  (interactive "P")
  (let ((scratch "*scratch*"))
    (if same-window (switch-to-buffer scratch)
      (switch-to-buffer-other-window scratch))))

(transient-define-prefix tsa/transient-highlight ()
  "Persistent Highlights"
  [["Highlight"
    ("r" "Highlight regexp" highlight-lines-matching-regexp)
    ;("c" "Column Highlight Mode" column-highlight-mode)
    ("X" "highlight changes (global)" global-highlight-changes-mode)
    ("x" "Highlight changes (local)" highlight-changes-mode)
    ;("e" "Global highlight edits" global-semantic-highlight-edits-mode)
    ("l" "Highlight lines" highlight-lines-matching-regexp)
    ("b" "Compare buffers" highlight-compare-buffers)
    ("f" "Compare file" highlight-compare-with-file)
    ("p" "Highlight Phrase" highlight-phrase)
    ("r" "Highlight regexp" highlight-regexp)
    ("." "Highlight symbol at point" highlight-symbol-at-point)
    ("u" "Unhighlight" unhighlight-regexp)
    ]])

(transient-define-prefix tsa/transient-multiplecursors ()
  "MultiCursors"
  :transient-suffix 'transient--do-stay  
  [["Multiple Cursors"
    ("n" "next~" mc/mark-next-lines)
    ("N" "un next~" mc/unmark-next-like-this)
    ("p" "prev~" mc/mark-previous-like-this)
    ("P" "un prev~" mc/unmark-previous-like-this)
    ("a" "all~" mc/mark-all-like-this)
    ("r" "all-region" mc/mark-all-in-region)
    ("d" "all-dwim" mc/mark-all-dwim)
    ("." "mark-pop" mc/mark-pop)
    ("w" "words" mc/mark-all-words-like-this)
    ("#" "numbers" mc/insert-numbers)]])

(transient-define-prefix tsa/transient-w3m ()
  "W3M"
  ["W3M"
   ("e" "🔍 search" w3m-search)
   ("n" "🏠 new" w3m)
   ("h" "history" w3m-db-history)
   ("b" "buffers" w3m-select-buffer)
   ])

(transient-define-prefix tsa-transient-spelling ()
  "Spelling"
  ["Spelling"
   ("<f12>" "spell buffer" flyspell-buffer :transient t)
   ("<f11>" "spell correct" tsa/correct-all)
   ("<f10>" "one correct" flyspell-correct-wrapper)]
  )

(transient-define-prefix tsa/transient-shell
  "Shell commands to be used"
  ["Shell Commands"
   [("z" "bettersh" better-shell-shell)
    ("r" "remote" better-shell-remote-open)
    ("e" "eshell" eshell)
    ("t" "term" term)
    ]])

(transient-define-prefix tsa/transient-help ()
  "Help commands that I use. A subset of C-h with others thrown in."
  ["Help Commands"
   ["Mode & Bindings"
    ("m" "Mode" describe-mode)
    ("b" "Major Bindings" which-key-show-full-major-mode)
    ("B" "Minor Bindings" which-key-show-full-minor-mode-keymap)
    ("d" "Descbinds" tsa/consult-descbinds)
    ("D" "Descbinds" Helper-describe-bindings)
    ("t" "Top Bindings  " which-key-show-top-level)]
   ["Describe"
    ("C" "Command" helpful-command)
    ("f" "Function" helpful-callable)
    ("v" "Variable" helpful-variable)
    ("k" "Key" helpful-key)
    ("c" "Key Briefly" describe-key-briefly)
    ]
   ["Info on"
    ("C-m" "Linux Manual" man)
    ("C-c" "Emacs Command" Info-goto-emacs-command-node)
    ("C-f" "Function" describe-function)
    ("C-v" "Variable" describe-variable)     
    ("C-k" "Emacs Key" Info-goto-emacs-key-command-node)
    ]
   ["Goto Source"
    ("L" "Library" find-library-other-frame)
    ("F" "Function" find-function-other-frame)
    ("V" "Variable" find-variable-other-frame)
    ("K" "Key" find-function-on-key-other-frame)
    ]
   ]
  [
   ["Internals"
    ("u" "Insert Unicode Char" insert-char)
    ("I" "Input Method" describe-input-method)
    ("G" "Language Env" describe-language-environment)
    ("S" "Syntax" describe-syntax)
    ("O" "Coding System" describe-coding-system)
    ("C-o" "Coding Brief" describe-current-coding-system-briefly)
    ("T" "Display Table" describe-current-display-table)
    ("e" "Echo Messages" view-echo-area-messages)
    ("l" "Lossage" view-lossage)
    ]
   ["Describe"
    ("s" "Symbol" helpful-symbol)
    ("." "At Point   " helpful-at-point)
    ("C-f" "Face" describe-face)
    ("w" "Where Is" where-is)
    ("=" "Position" what-cursor-position)
    ]
   ["Info Manuals"
    ("C-i" "Info" info)
    ("C-4" "Other Window " info-other-window)
    ("C-e" "Emacs" info-emacs-manual)
    ("C-m" "Linux Man" man)
    ]
   ]
  )

(transient-define-prefix tsa/transient-global-org
  "Orgmode Master Transient"
  ;; (:color blue
  ;; :hint nil
  ;; :body-pre (setq exwm-input-line-mode-passthrough ''t)
  ;; :post (setq exwm-input-line-mode-passthrough nil))
  [["Clocks"
    ("C-t" "timer start"  org-timer-start)
    ("C-s" "timer stop"  org-timer-stop)
    ("w" "clock-in to recent task" org-mru-clock-in)
    ("W" "Clock in the last task" org-clock-in-last)
    ("o" "Clock Out" org-clock-out)
    ("j" "goto clock" org-clock-goto)
    ("J" "Go to a clock" (lambda () (interactive) (org-clock-goto '(4))))]

   ["Timers"
    ("r" "Set Timer" org-timer-set-timer)
    ("p" "Print org timer" org-timer)]

   ["Hugo Blogging"
    ("h" "export to hugo" hugo)
    ("u" "upload" hugo-publish-up)
    ("t" "publish and upload" hugo-total)
    ]

   ["Misc"
    ("g" "Export as Markdown" org-gfm-export-as-markdown)
    ("\\" "toggle pretty entities" org-toggle-pretty-entities)
    ("l" "go to last stored capture" org-capture-goto-last-stored)
    ("," "set org priority" org-priority)]])

(defun tsa/move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun tsa/move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'left))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun tsa/move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun tsa/exwm-workspace-swap ()
  "Swap workspaces, querying for which to swap if there are more than 2"
  (interactive)
  (if (= 2 (exwm-workspace--count))
      (let ((w1 (first exwm-workspace--list))
	    (w2 (second exwm-workspace--list)))
	(exwm-workspace-swap w1 w2))
    (call-interactively 'exwm-workspace-swap)))

(defun tsa/move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(transient-define-prefix tsa/transient-scroll ()
  "WIP Navigate screen repeatably. but suffix or infix don't seem to do it"
  [["Navigate Viewport"
    ("," "scroll leftward" scroll-right)
    ("." "scroll rightward" scroll-left)
    ("[" "backward a page" backward-page)
    ("]" "forward a page" forward-page)]])

(transient-define-prefix tsa/transient-goto ()
  "Buffer nav"
  [["Go To in Buffer"
    ("g" "line" goto-line)
    ("TAB" "column" move-to-column)
    ("l" "jump to visible line" ace-jump-line-mode)
    ("c" "char" goto-char)
    ("o" "ace" ace-link)   
    ]
   ["Navigate Viewport"
    ("[" "Navigate Viewport" tsa/transient-scroll)
    ]
   ["Errors"
    ("n" "next err" next-error)
    ("p" "prev err" previous-error)]

   ["Replace"
    ("r" "query replace simple" anzu-query-replace)
    ("R" "query replace regexp" anzu-query-replace-regexp)
    ("t" "query replace thing at cursor" anzu-query-replace-at-cursor)
    ("T" "clobber-replace thing at cursor" anzu-query-replace-at-cursor-thing)
    ]])

(transient-define-prefix tsa/transient-bbdb ()
  "BBDB Commands"
  ["BBDB"
   ("b" "Ivy BBDB" tsa/bbdb-list)
   ("B" "BBDB" bbdb)
   ("c" "Create" bbdb-create)
   ("x" "X-Field" bbdb-search-xfields)
   ("s" "Snarf" bbdb-snarf)]
  )

(defun tsa/toggle-ace-mode ()
  "Toggle whether to search by word or char"
  (interactive)
  (if (function-equal ace-isearch-function 'ace-jump-char-mode)
      (progn 
	(setq ace-isearch-function 'ace-jump-word-mode)
	(message "Jump-Word Mode"))
    (progn 
      (setq ace-isearch-function 'ace-jump-char-mode)
      (message "Jump-Char Mode"))))

(transient-define-prefix tsa/transient-fkeys
  "Transient for the <f#> keys"
  ["F-Keys"
  ("<f1>" "hide modeline" tsa/hide-mode-line)
  ("<C-f1>" "show filename" tsa/show-file-name)
  ("<f2>" "prev msg" tsa/insert-previous-message)
  ("<f3>" "Toggle search word//char" tsa/toggle-ace-mode)
  ("<f4>" "shorturl" tsa/yourls-shorten-at-point)
  ("<f5>" "truncate lines" toggle-truncate-lines)
  ("<f6>" "hl-line mode" global-hl-line-mode)
  ("<S-f6>" "hicol" column-highlight-mode )
  ("<f7>" "line num mode" display-line-numbers-mode)
  ("<C-f7" "scrollbar" toggle-scroll-bar)
  ("r" "revert buffer" revert-buffer)])

(defun tsa/hide-mode-line (arg)
  "Hide or global hide-modeline for a transient. Doesn't work, though."  
  (interactive "p")
  (message (format "Arg is: %d" arg))
  (cond
   ((equal arg 1)
    ((lambda () (interactive) (hide-mode-line-mode))))
   ((equal arg 4)
    ((lambda () (interactive) (global-hide-mode-line-mode))))))

(transient-define-prefix tsa/transient-window ()
  "Window navigation transient"
  :transient-suffix 'transient--do-stay  
  [["Movement"
    ("h" "focus ←" windmove-left)
    ("j" "focus ↓" windmove-down)
    ("k" "focus ↑" windmove-up)
    ("l" "focus →" windmove-right)]
   ["Resize"    
    ("q" "X←" tsa/move-splitter-left)
    ("w" "X↓" tsa/move-splitter-down)    
    ("e" "X↑" tsa/move-splitter-up)    
    ("r" "X→" tsa/move-splitter-right)]
   ["Switch"
    ("b" "buffer" switch-to-buffer)
    ("f" "find-file" find-file)
    ("g" "git-grep" consult-git-grep)
    ("p" "projectile" tsa/projectile)
    ("F" "follow" follow-mode)
    ("a" "ace 1" transient-ace-cmd)]
   ["Split"
    ("v" "vertical" tsa/split-vertical)
    ("x" "horizontal" tsa/split-horizontal)
    ("`" "exwm swap" tsa/exwm-workspace-swap)
    ("s" "swap" tsa/screen-swap)
    ("S" "split" toggle-window-split)
    ("d" "delete window" delete-window)
    ("D" "delete other" tsa/del-window)
    ("o" "delete other2" delete-other-windows)
    ;; ("z" (lambda ()
    ;; 	   (winner-undo)
    ;; 	   (setq this-command 'winner-undo)))
    ("Z" "winner redo" winner-redo)
					;("SPC" "" nil)
    ]
   ["Scroll"
    ("." "left" scroll-left)
    ("," "right" scroll-right)
    ("4" "quad view" tsa/split-window-4)
    ("=" "Scratch" tsa/open-scratch)
					;     (";TODO: " "" projectile-toggle-between-implementation-and-test "test<>imp")
    ]]
  )

(use-package undo-tree

  :delight undo-tree-mode
  :bind (("C-x /" . undo-tree-visualize))
  :config
  (global-undo-tree-mode t))

(let ((ext '(".html"
	     ".phtml"
	     ".php"
	     ".tpl"
	     ".asp"
	     ".jsp"
	     ".aspx"
	     ".erb"
	     ".mustache"
	     ".djhtml")))
  (regexp-opt ext))
;; "\\(?:\\.\\(?:aspx?\\|djhtml\\|erb\\|html\\|jsp\\|mustache\\|ph\\(?:p\\|tml\\)\\|tpl\\)\\)"
(use-package web-mode
  :mode "\\(?:\\.\\(?:aspx?\\|djhtml\\|erb\\|html\\|jsp\\|mustache\\|ph\\(?:p\\|tml\\)\\|tpl\\)\\)")

(use-package winum
  :demand t
  ;:bind (("s-<tab>" . tsa/winum-or-switch))
  :custom-face
  (winum-face ((t (:background "cyan" :foreground "black" :weight ultra-bold :width extra-condensed))))
  :custom 
  (winum-auto-setup-mode-line nil)
  :config
  (winum-set-keymap-prefix (kbd "s-`"))
  (winum-mode t)
  (add-hook 'window-state-change-hook 'winum--update) ;; this hook is too early
  (defun tsa/winum-or-switch (&optional p)
    (interactive "p")
    (if (= 2 winum--window-count)
	(other-frame p)
      (call-interactively 'winum-select-window-by-number))))

(use-package yasnippet
  :delight yas-minor-mode
  :custom
  (yas-indent-line 'fixed)
  :custom-face
  (yas-field-highlight-face ((t (:inherit secondary-selection))))
  :config
  (add-to-list 'yas-snippet-dirs "~/emacs/Snippets")
  (add-to-list 'yas-snippet-dirs "snippets/yasnippet-snippets/snippets")
  (use-package clojure-snippets )
  (yas-global-mode))

;;; Usage Functions
(defun tsa/hydra-ace-cmd ()
  (interactive)
  (ace-window 1)
  (add-hook 'ace-window-end-once-hook
	    'tsa/transient-window))

(defun hydra-split-vertical ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun hydra-split-horizontal ()
  (interactive)
  (split-window-below)
  (windmove-down))

(defun tsa/hydra-screen-swap ()
  (interactive)
  (ace-window 4)
  (add-hook 'ace-window-end-once-hook
	    'tsa/hydra-window))

(defun hydra-del-window ()
  (interactive)
  (ace-window 16)
  (add-hook 'ace-window-end-once-hook
	    'tsa/transient-window))

(defun tsa/split-window-4 ()
  "Split into 4 windows"
 (interactive)
 (if (= 1 (length (window-list)))
     (progn (split-window-vertically)
	    (split-window-horizontally)
	    (other-window 2)
	    (split-window-horizontally))))

(defun tsa/correct-all () 
  (interactive)
  (setq current-prefix-arg '(4))
  (call-interactively 'flyspell-correct-wrapper))

(defun tsa/projectile (&optional choose-project)
  "Open the scratch buffer. With c-u, in other window."
  (interactive "P")
  (let ((scratch "*scratch*"))
    (if choose-project (projectile-switch-project)
      (projectile-find-file))))

(defun tsa/open-scratch (&optional same-window)
  "Open the scratch buffer. With c-u, in other window."
  (interactive "P")
  (let ((scratch "*scratch*"))
    (if same-window (switch-to-buffer scratch)
      (switch-to-buffer-other-window scratch))))

(defhydra tsa/hydra-multiplecursors (global-map "C-;"
					    :color red)
  "MultiCursors"
  ("n" mc/mark-next-lines "next~")
  ("N" mc/unmark-next-lines "un next~")
  ("p" mc/mark-previous-lines "prev~")
  ("P" mc/unmark-previous-lines "un prev~")
  ("a" mc/mark-all-like-this "all~")
  ("r" mc/mark-all-in-region "all-region")
  ("d" mc/mark-all-dwim "all-dwim")
  ("." mc/mark-pop "mark-pop")
  ("w" mc/mark-all-words-like-this "words")
  ("#" mc/insert-numbers "numbers")
  ("SPC" nil) )

(defhydra tsa/hydra-w3m (:color blue)
   "EW3M"
   ("e" w3m-search "w3m 🔍")
   ("E" w3m "w3m 🏠")
   ("h" w3m-db-history "history")
   ("b" w3m-select-buffer "buffers")
   )

;; "Eww"
;; ("e" eww "eww")
;; ("b" eww-switch-to-buffer "switch")
;; ("B" eww-list-buffers "buffers")
;;"h" eww-list-histories "history")

(global-set-key
 (kbd "<f12>")
 (defhydra tsa/hydra-spelling (:color red)
   "Shell"
   ("<f12>" flyspell-buffer "spell buffer")
   ("<f11>" tsa/correct-all "spell correct" :color blue)
   ("<f10>" flyspell-correct-wrapper "one correct")))

(global-set-key
 (kbd "C-z")
 (defhydra tsa/hydra-shells (:color blue)
   "Shell"
   ("z" better-shell-shell "bettersh")
   ("C-z" better-shell-shell "bettersh")
   ("Z" better-shell-remote-open "better-remote")
   ("e" eshell "eshell")
   ("t" term "term")))

(global-set-key
 (kbd "C-c o")
 (defhydra tsa/hydra-global-org (:color blue
			    :hint nil
			    :body-pre (setq exwm-input-line-mode-passthrough ''t)
			    :post (setq exwm-input-line-mode-passthrough nil))

   ("C-t"  org-timer-start "⏰ start")
   ("C-s"  org-timer-stop "⏰ stop")
   ("C-S"  org-timer-stop)
   ;; Need to be at timer
   ("r" org-timer-set-timer "⏰ set")
   ("C-r"  org-timer-set-timer)
   ;; Print timer value to buffer0:00:00 
   ("p" org-timer "⏲ stat")
   ("C-p"  org-timer)
   ("w" (org-mru-clock-in ;org-clock-in '(4)
	 ) "🕑 clock-in")
   ("C-w"  (org-clock-in '(4)))
   ("o" org-clock-out "🕕 out")
   ("C-o"  org-clock-out)
   ;; Visit the clocked task from any buffer
   ("j" org-clock-goto "⮏")
   ("C-j"  org-clock-goto)
   ("l" org-capture-goto-last-stored "⮰")
   ("C-l"  org-capture-goto-last-stored)
   ("," org-priority "orgp⤴")
   ("C-,"  org-priority)
   ("h" hugo "✍ hugo")
   ("u" hugo-publish-up "✍ pub")
   ("t" hugo-total "✍ total")
   ("g" org-gfm-export-as-markdown "as🅫")
   ("\\" org-toggle-pretty-entities "λ")
   ("W" org-clock-in-last "Clock in the last task")      
   ("J" (lambda () (interactive) (org-clock-goto '(4))) "Go to a clock")))

(require 'windmove) ; also already added in my emacs-el

(defun tsa/hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun tsa/hydra-move-splitter-left (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun tsa/hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun tsa/exwm-workspace-swap ()
  "Swap workspaces, querying for which to swap if there are more than 2"
  (interactive)
  (if (= 2 (exwm-workspace--count))
      (let ((w1 (first exwm-workspace--list))
	    (w2 (second exwm-workspace--list)))
	(exwm-workspace-swap w1 w2))
    (call-interactively 'exwm-workspace-swap)))

(defun tsa/hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(bind-key* "C-M-o"
	   (defhydra tsa/hydra-window (:body-pre (setq exwm-input-line-mode-passthrough ''t)
					     :post (setq exwm-input-line-mode-passthrough nil))
	     "
Movement^^        ^Split^         ^Switch^		^Resize^
----------------------------------------------------------------
_h_ ←       	_v_ertical    	_b_uffer		_q_ X←
_j_ ↓        	_x_ horizontal	_f_ind files	_w_ X↓
_k_ ↑        	_z_ undo      	_a_ce 1		_e_ X↑
_l_ →        	_Z_ redo      	_s_wap		_r_ X→
_F_ollow	_S_witch  	_D_lt Other   			max_i_mize
_SPC_ cancel	_o_nly this   	_d_elete	
_,_ Scroll←			_p_roject
_._ Scroll→                     _g_rep
"
	     ("h" windmove-left )
	     ("C-h"  windmove-left )
	     ("j" windmove-down )
	     ("C-j"  windmove-down )
	     ("k" windmove-up )
	     ("C-k"  windmove-up )
	     ("l" windmove-right )
	     ("C-l"  windmove-right )
	     ("q" tsa/hydra-move-splitter-left)
	     ("C-q"  tsa/hydra-move-splitter-left)
	     ("w" tsa/hydra-move-splitter-down)
	     ("C-w"  tsa/hydra-move-splitter-down)
	     ("e" tsa/hydra-move-splitter-up)
	     ("C-e"  tsa/hydra-move-splitter-up)
	     ("r" tsa/hydra-move-splitter-right)
	     ("C-r"  tsa/hydra-move-splitter-right)
	     ("b" switch-to-buffer)
	     ("C-b"  switch-to-buffer)
	     ("f" find-file)
	     ("C-f"  find-file)
	     ("g" consult-git-grep :color blue)
	     ("p" tsa/projectile)
	     ("C-p"  tsa/projectile)
	     ("F" follow-mode)
	     ("C-F"  follow-mode)
	     ("a" tsa/hydra-ace-cmd)
	     ("C-a"  tsa/hydra-ace-cmd)
	     ("v" tsa/split-vertical)
	     ("C-v"  tsa/split-vertical)
	     ("x" tsa/split-horizontal)
	     ("C-x"  tsa/split-horizontal)
	     ("s" tsa/screen-swap)
	     ("C-s"  tsa/screen-swap)
	     ("S" toggle-window-split)
	     ("C-S" toggle-window-split)
	     ("d" delete-window)
	     ("C-d"  delete-window)
	     ("D" tsa/del-window)
	     ("C-D"  tsa/del-window)
	     ("o" delete-other-windows)
	     ("C-o"  delete-other-windows)
	     ("i" ace-maximize-window)
	     ("C-i"  ace-maximize-window)
	     ("z" (progn
		    (winner-undo)
		    (setq this-command 'winner-undo)))
	     ("C-z" (progn
		      (winner-undo)
		      (setq this-command 'winner-undo)))
	     ("Z" winner-redo)
	     ("C-Z"  winner-redo)
	     ("SPC" nil)
	     ("C-SPC"  nil)
	     ("." scroll-left)
	     ("," scroll-right)
	     ("4" tsa/split-window-4)
	     ("=" tsa/open-scratch "Scratch")
	     ("t" projectile-toggle-between-implementation-and-test "test<>imp")
	     ("`" tsa/exwm-workspace-swap "exwm swap")))

(global-set-key
 (kbd "M-g")
 (defhydra tsa/hydra-goto ()
   "Go To"
   ("g" goto-line "line") ; reserve for normal M-g g function (may be different in some modes)
   ("M-g" goto-line "line")
   ("TAB" move-to-column "col")
   ("l" ace-jump-line-mode "ace line" :color blue)
   ("c" goto-char "char")
   ("n" next-error "next err")
   ("o" ace-link "ace" :color blue)
   ("p" previous-error "prev err")
   ("r" anzu-query-replace "qrep")
   ("R" anzu-query-replace-regexp "rep regex")
   ("t" anzu-query-replace-at-cursor "rep cursor")
   ("T" anzu-query-replace-at-cursor-thing "rep cursor thing")
   ("," scroll-right "scroll leftward")
   ("." scroll-left "scroll rightward")
   ("[" backward-page "back page")
   ("]" forward-page "forward page")
   ("SPC" nil "cancel")))

(defhydra tsa/hydra-gnus-group ()
  "Gnus Group"
					;    ("TAB" gnus-topic-indent "indent")
					;    ("<tab>" gnus-topic-indent "indent")
  ("#" gnus-topic-mark-topic "mark")
  ("u" gnus-topic-unmark-topic "unmark")
  ("C" gnus-topic-copy-matching "Copy-m")
  ("D" gnus-topic-remove-group "DLT")
  ("H" gnus-topic-toggle-display-empty-topics "Hide Empty")
  ("M" gnus-topic-move-matching "Move-m")
  ("S" gnus-topic-sort-map "sort")
  ("c" gnus-topic-copy-group "copy")
  ("h" gnus-topic-hide-topic "hide")
  ("j" gnus-topic-jump-to-topic "jump")
  ("m" gnus-topic-move-group "move")
  ("N" gnus-topic-create-topic "new")
  ("n" gnus-topic-goto-next-topic "→")
					;    ("TAB" gnus-topic-goto-next-topic "→")
  ("<tab>" gnus-topic-goto-next-topic "→")
  ("p" gnus-topic-goto-previous-topic "←")
					;    ("BACKTAB" gnus-topic-goto-previous-topic "←")
  ("<backtab>" gnus-topic-goto-previous-topic "←")
  ("r" gnus-topic-rename "rename")
  ("s" gnus-topic-fold-this-topic "show")
  ("DEL" gnus-topic-delete "delete")
  ("SPC" nil "cancel"))

(global-set-key
 (kbd "C-c b")
 (defhydra tsa/hydra-bbdb ()
   "Go To"
   ("b" tsa/bbdb-list "Ivy BBDB")
   ("B" bbdb "BBDB")
   ("c" bbdb-create "Create")
   ("x" bbdb-search-xfields "X-Field")
   ("s" bbdb-snarf "Snarf")
   ("SPC" nil "cancel")
   ))

(defun tsa/toggle-ace-mode ()
  "Toggle whether to search by word or char"
  (interactive)
  (if (function-equal ace-isearch-function 'ace-jump-char-mode)
      (progn 
	(setq ace-isearch-function 'ace-jump-word-mode)
	(message "Jump-Word Mode"))
    (progn 
      (setq ace-isearch-function 'ace-jump-char-mode)
      (message "Jump-Char Mode"))))

(defun tsa/hide-mode-line (arg)
  "Hide or global hide-modeline for a hydra. Doesn't work, though."  
  (interactive "p")
  (message (format "Arg is: %d" arg))
  (cond
   ((equal arg 1)
    ((lambda () (interactive) (hide-mode-line-mode))))
   ((equal arg 4)
    ((lambda () (interactive) (global-hide-mode-line-mode))))))

(defhydra tsa/hydra-fkeys
  (:color red)
  "F Keys"
  ("<f1>" tsa/hide-mode-line "modeline" :color blue)
  ("<C-f1" tsa/show-file-name "filename" :color blue)
  ("<f2>" tsa/insert-previous-message "prev msg")
  ("<f3>" tsa/toggle-ace-mode "Search w//c")
  ("<f4>" tsa/yourls-shorten-at-point "shorturl")
  ("<f5>" toggle-truncate-lines "truncate" :color blue)
  ("<f6>" global-hl-line-mode "hlline")
  ("<S-f6>" column-highlight-mode  "hicol")
  ("<f7>" display-line-numbers-mode "lnum")
  ("<C-f7" toggle-scroll-bar "scrollbar")
  ("r" revert-buffer "revert")
  ("SPC" nil "cancel" :color blue))

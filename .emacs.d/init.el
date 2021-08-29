(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1)   ; Disable the toolbar
(tooltip-mode -1)    ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room
(menu-bar-mode -1)   ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

;; (set-face-attribute 'default nil :font "Fira Code Retina" :height 280)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Display line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents)) ; Sometimes need to run 'package-refresh-contents' manually

;; Initialize use-package 
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; (use-package command-log-mode)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ; Don't start serches with ^
  
(use-package ivy
  :demand t
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)	
	 ;; ("C-l" . ivy-alt-done)
	 ;; ("C-j" . ivy-next-line)
	 ;; ("C-k" . ivy-previous-line)
	 ;; :map ivy-switch-buffer-map
	 ;; ("C-k" . ivy-previous-line)
	 ;; ("C-l" . ivy-done)
	 ;; ("C-d" . ivy-switch-buffer-kill)
	 ;; :map ivy-reverse-i-search-map
	 ;; ("C-k" . ivy-previous-line)
         ;; ("C-d" . ivy-reverse-i-search-kill))
	 )
  :config
  (ivy-mode)
  )

(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package vterm
  :bind ("<C-return>" . vterm-other-window))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1.0))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; (use-package general)

(use-package ewal-spacemacs-themes
  :config
  (load-theme 'spacemacs-light t))

(defun rune/evil-hook ()
  (dolist (mode '(vterm-mode-hook))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package evil
  :init
  (setq evil-want-C-u-delete t)
  (setq evil-want-C-u-scroll t)
  ;; (setq evil-disable-insert-state-bindings nil)
  ;; ;; (setq evil-search-module swiper)
  (setq evil-cross-lines t)
  (setq evil-want-integration t)	; for evil-collection
  (setq evil-want-keybinding nil)	; for evil-collection
  :config
  (evil-mode 1)
  ;; (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package key-chord
  :demand t
  :after evil
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

;; (use-package hydra
;;   :after evil)

;; (defhydra hydra-window-scale (:timeout 4)
;;   "scale window"
;;   ("+" evil-window-increase-height "in"))

;; (rune/leader-keys
;;   "C-w" '(hydra-window-scale/body :which-key "scale window"))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-switch-project-action #'projectile-dired))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package mozc
  :init
  (setq default-input-method "japanese-mozc")
  :custom
  (mozc-candidate-style 'overlay))

(use-package auctex-latexmk
  :config
  (auctex-latexmk-setup))

;; (use-package evil-magit
;;   :after magit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fci-rule-color "#7c6f64")
 '(jdee-db-active-breakpoint-face-colors (cons "#0d1011" "#fabd2f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d1011" "#b8bb26"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d1011" "#928374"))
 '(objed-cursor-color "#fb4934")
 '(package-selected-packages
   '(auctex-latexmk mozc-cand-posframe mozc-im evil-magit projectile hydra evil-collection evil general ewal-spacemacs-themes spacemacs-common spacemacs-themes helpful ivy-rich which-key rainbow-delimiters counsel vterm use-package ivy doom-modeline))
 '(rustic-ansi-faces
   ["#282828" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#cc241d" "#8ec07c" "#ebdbb2"])
 '(vc-annotate-background "#282828")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b8bb26")
    (cons 40 "#cebb29")
    (cons 60 "#e3bc2c")
    (cons 80 "#fabd2f")
    (cons 100 "#fba827")
    (cons 120 "#fc9420")
    (cons 140 "#fe8019")
    (cons 160 "#ed611a")
    (cons 180 "#dc421b")
    (cons 200 "#cc241d")
    (cons 220 "#db3024")
    (cons 240 "#eb3c2c")
    (cons 260 "#fb4934")
    (cons 280 "#e05744")
    (cons 300 "#c66554")
    (cons 320 "#ac7464")
    (cons 340 "#7c6f64")
    (cons 360 "#7c6f64")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

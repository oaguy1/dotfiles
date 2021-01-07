
;; Go straight to *scratch*
(setq inhibit-startup-message t)

;; Turn off scrollbar
(scroll-bar-mode -1)

;; Load my preferred theme
(load-theme 'wombat)

;; Set Fira Code to be typeface if in GUI mode
(unless (display-graphic-p)
    (set-face-attribute 'default nil :font "Fira Code" :height 110))

;; Make escape quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set up package.el to query different packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://melpa.org/packages/")))
(package-initialize)

;; refresh archive contents if none exists
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; install evil packages if not present
(unless (package-installed-p 'evil)
  (package-install 'evil))

(use-package ivy
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode t))

;; configure evil mode
(use-package evil
  :config
  (evil-mode 1))

(use-package slime
  :config
  (setq inferior-lisp-program "sbcl"))

(use-package magit)

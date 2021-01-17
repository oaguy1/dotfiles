
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
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("tromey" . "http://tromey.com/elpa/")
			 ("org" . "https://orgmode.org/elpa/")))

(package-initialize)

;; refresh archive contents if none exists
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; nice fuzzy-completion lib + evil bindings
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
	 ("C-d" . ivy-reverse-i-search-kill)))
(ivy-mode 1)

;; evil mode, aka vim like editing in emacs
(use-package evil
  :config
  (evil-mode 1))

;; common lisp repl support in emacs
(use-package slime
  :config
  (setq inferior-lisp-program "sbcl"))

;; git client, kinda nice, but weird compared to commandline
(use-package magit)

;; clojure mode!!
(use-package clojure-mode)

;; extra stuff for clojure mode? Dunno, it's in CFTBAT
(use-package clojure-mode-extra-font-locking)

;; Like slime, but for clojure
(use-package cider)

;; enhances M-x
(use-package smex)

;; project navigation
(use-package projectile)

;; colorful parenthesis matching!
(use-package rainbow-delimiters)

;; markdown!
(use-package markdown-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(w3m markdown-mode cider use-package smex slime rainbow-delimiters projectile magit ivy evil clojure-mode-extra-font-locking)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

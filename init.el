;; Default Emacs settings
(require 'package)

(setq initial-buffer-choice 'dashboard-open)
(windmove-default-keybindings)
(add-hook #'prog-mode-hook #'display-line-numbers-mode)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tab-bar-mode 1)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'exec-path "~/.local/bin/")
;; Comment/uncomment this line to enable MELPA Stable if desired.
;; See `package-archive-priorities` and `package-pinned-packages`.
;; Most users will not need or want to do this.
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(defun background-more-opaque ()
  (interactive)
  (set-frame-parameter nil 'alpha-background (+ (frame-parameter nil 'alpha-background) 5)))

(keymap-global-set "C-x 5 +" #'background-more-opaque)

(defun background-more-transparent ()
  (interactive)
  (set-frame-parameter nil 'alpha-background (- (frame-parameter nil 'alpha-background) 5)))

(keymap-global-set "C-x 5 -" #'background-more-transparent)
(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))

(use-package ewal
  :ensure t
  :init (setq ewal-use-built-in-always-p nil
	      ewal-use-built-in-on-failure-p t))
(ewal-load-colors "~/.cache/wal/colors.json")
(load-theme 'ewal-doom-one t)

(use-package nov
  :ensure t)

(use-package focus
  :ensure t)

(use-package theme-magic
  :ensure t)

(use-package solarized)
;; (load-theme 'solarized-gruvbox-dark t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind-keymap ("C-c p" . projectile-mode-map))


(use-package beacon
  :init
  (beacon-mode 1))

(use-package vertico
  :init
  (vertico-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) 

(use-package flycheck
  :ensure t)

(use-package inform7
  :ensure t)

(use-package vterm
  :ensure t)

(use-package helpful
  :ensure t
  :bind (("C-h f" . #'helpful-callable)
	 ("C-h v" . #'helpful-variable)
	 ("C-h k" . #'helpful-key)
	 ("C-h x" . #'helpful-command)))

(use-package dired
  :config
  (set-variable 'delete-by-moving-to-trash t))

(use-package paredit
  :ensure t
  :defer t
  :init (paredit-mode))

(use-package telephone-line
  :ensure t
  :init (telephone-line-mode 1))

(use-package company
  :ensure t
  :hook (after-init-hook . global-company-mode))

(use-package treemacs
  :ensure t
  :init (treemacs)
  :hook (server-after-make-frame-hook . treemacs))

(use-package ace-window
  :ensure t
  :bind ("M-o" . "ace-window"))

(use-package empv
  :ensure t
  :bind ("C-x m" . empv-map))

;;; -*- lexical-binding: t -*-
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    '("2b0fcc7cc9be4c09ec5c75405260a85e41691abb1ee28d29fcd5521e4fca575b"
;;      "7fea145741b3ca719ae45e6533ad1f49b2a43bf199d9afaee5b6135fd9e6f9b8"
;;      "46433a4be67ff0f415175d0876ef9435d190f3aa57bb00670febd70ba0ba52e1"
;;      "9e9209fd17023af648e3aaf682255c29beddf5ceb04c3ce7cc883323c2b54901"
;;      "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36"
;;      "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633"
;;      "615d8f3208b19161ada77e155beaca0678a35abb182ceae87e26660ecbca04d5"
;;      "7aa5eb0412ee93dfacdeb1fff906932c2fb1747b8c96063ac4d7c1dc461bc0e6"
;;      "7c340289e943a8e1fdd76152014b75a976912caaa93285d9ff9581641166221b"
;;      "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e"
;;      "5474d779462cf40f889aa91e334f725b9308116d784967bd11ba9eec26bfaa12"
;;      "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1"
;;      default))
;;  '(package-selected-packages
;;    '(beacon company dashboard empv ewal ewal-doom-themes helpful
;; 	    markdown-mode orderless paredit solarized-theme
;; 	    telephone-line theme-magic treemacs vertico vterm web-mode)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :foreground "#a89984" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 143 :width normal :foundry "JB" :family "JetBrains Mono")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93"
     "7aa5eb0412ee93dfacdeb1fff906932c2fb1747b8c96063ac4d7c1dc461bc0e6"
     "7c340289e943a8e1fdd76152014b75a976912caaa93285d9ff9581641166221b"
     default))
 '(emform-i7-data-dir "~/Downloads/work/inform/inform7/Internal/")
 '(emform-i7-executable "~/.local/bin/inform7")
 '(emform-i7-install-location "~/Downloads/work/inform/inform7/Internal/")
 '(package-selected-packages
   '(beacon casual company dashboard empv ewal-doom-themes flycheck
	    flycheck-package focus helpful inform7 inform7-mode
	    lorem-ipsum markdown-mode nov orderless paredit projectile
	    solarized-theme telephone-line theme-magic treemacs
	    vertico vterm web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 143 :width normal :foundry "JB" :family "JetBrains Mono")))))

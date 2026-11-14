;; -*- lexical-binding: t; -*-

;;; init.el

;;; Package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;;; General settings
(setq make-backup-files nil
      auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t))
      auto-save-visited-interval 2
      initial-scratch-message nil
      inhibit-startup-screen t)
(setq-default tab-width 4
              indent-tabs-mode nil
              standard-indent 4)
(auto-save-visited-mode 1)
(cua-mode 1)
(savehist-mode 1)
(recentf-mode 1)
(pixel-scroll-precision-mode 1)
(setq delete-by-moving-to-trash t)
(setq native-comp-async-report-warnings-errors 'silent)

;;; UI
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(fringe-mode 0)
(column-number-mode -1)
(size-indication-mode 1)
(global-display-line-numbers-mode 1)

;;; Theme
(use-package solarized-theme
  :ensure t
  :config
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'solarized-dark-high-contrast t))

;;; Mode-line
(use-package mood-line
  :config (mood-line-mode 1))

;;; Magit
(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-c m l" . magit-log))
  :config (magit-auto-revert-mode -1))

;;; Move Text
(use-package move-text
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))

;;; multiple-cursors
(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

;;; Dired
(use-package dired-x
  :ensure nil
  :bind ("C-x d" . dired-jump))


;;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;;; Apheleia
(use-package apheleia
  :config (apheleia-global-mode +1))

;;; Tree-sitter
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;;; Corfu
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.1)
  (corfu-cycle t)
  (tab-always-indent 'complete)
  :init (global-corfu-mode 1))

;;; Cape
(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file))

;;; Vertico
(use-package vertico
  :custom (vertico-cycle t)
  :init (vertico-mode 1))

;;; Marginalia
(use-package marginalia
  :init (marginalia-mode 1))

;;; Orderless
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

(use-package vundo
  :bind ("C-x u" . vundo))

(use-package indent-bars
  :hook (prog-mode . indent-bars-mode))

(use-package ace-window
  :bind ("C-x o" . ace-window))

(use-package which-key
  :config (which-key-mode 1))

(use-package dashboard
  :custom
  (dashboard-items '((recents . 10)))
  (dashboard-center-content t)
  :config
  (dashboard-setup-startup-hook))

(use-package yasnippet
  :config (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package yasnippet-capf
  :after (cape yasnippet)
  :config (add-to-list 'completion-at-point-functions #'yasnippet-capf))

;; org-mode
(use-package org
  :ensure nil
  :custom
  (org-startup-indented t)
  (org-hide-emphasis-markers t)
  (org-return-follows-link t))

(use-package org-modern
  :ensure t
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

(use-package org-appear
  :ensure t
  :hook (org-mode . org-appear-mode))

(use-package consult
  :bind (("C-s" . consult-line)
         ("C-x b" . consult-buffer)))

(use-package avy
  :bind ("C-j" . avy-goto-char-timer))

(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult)
  :hook
  (embark-collect-mode . embark-consult-preview-minor-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7fea145741b3ca719ae45e6533ad1f49b2a43bf199d9afaee5b6135fd9e6f9b8"
     "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633"
     "46433a4be67ff0f415175d0876ef9435d190f3aa57bb00670febd70ba0ba52e1"
     "b1d29d79c6cbcb9106b92100318053ad6108aa63aceb0802b2e2c0a43c9e9746"
     "8c3ed94e7048ba43c1f2c455b2f1b4adc0b58c0232c82db29ae80e54aec00cbe"
     "9e9209fd17023af648e3aaf682255c29beddf5ceb04c3ce7cc883323c2b54901"
     "d540b201e1dee6f004a4cfef8ada576159a08e5d1b67723a99d2cf069892ea2a"
     "65d07771a02842150802f2bc32393b49d27e74520c9aca0d2897f69712ec4a49"
     "f7f98d620ddcbd718f95b7400f7dd0e505150718913cfa95fffb37cbffaab063"
     "62b3f11cf9bcf2f56be51c3ec91e6feb1e7e380967ea4df9434aab589ca41396"
     "d4b2d80ad2a37ba2feec0b445a5b90bf379c6d09c1d48c404c16eb2b88fc9d29"
     "71ff2f817f051ea43c04d2d0f209c2445d06355243fe94d7e00007539fbc471b"
     default))
 '(package-selected-packages
   '(ace-window apheleia cape consult corfu dashboard diredfl embark
                embark-consult gruvbox-theme indent-bars magit
                marginalia mood-line move-text multiple-cursors
                orderless org-appear org-modern rainbow-delimiters
                treesit-auto vertico vundo yasnippet yasnippet-capf
                yasnippet-snippets zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

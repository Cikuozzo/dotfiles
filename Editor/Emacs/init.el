;; -*- lexical-binding: t; -*-

;;; init.el

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

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
  :ensure t
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

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

;;; UI
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(fringe-mode 0)
(column-number-mode -1)
(size-indication-mode 1)
(global-display-line-numbers-mode 1)
(set-face-attribute 'default nil :height 180)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; Bar settings
(use-package diminish
  :ensure t
  :config
  (diminish 'which-key-mode)
  (diminish 'whitespace-mode))

(use-package emacs
  :custom
  (column-number-mode t)
  (line-number-mode t)
  (mode-line-format
   '("%e "
     mode-line-mule-info
     mode-line-modified
     " "
     (:property buffer-name face mode-line-buffer-id)
     "  (%p) %l:%c  "
     "[%m] "
     mode-line-modes
     vc-mode
     " "))
  :config
  (custom-set-faces
   '(mode-line
     ((t (:background "#3c3836"
          :foreground "#ebdbb2"
          :box (:line-width 4 :color "#3c3836")))))
   '(mode-line-inactive
     ((t (:background "#1d2021"
          :foreground "#7c6f64"
          :box (:line-width 4 :color "#1d2021")))))))

;;; Theme
(use-package gruvbox-theme
  :defer t
  :init (load-theme 'gruvbox-dark-hard t))

;;; Savehist
(savehist-mode 1)

;;; Vertico
(use-package vertico
  :custom (vertico-cycle t)
  :init (vertico-mode 1))

;;; Orderless
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

;;; Marginalia
(use-package marginalia
  :init (marginalia-mode 1))

;;; Consult
(use-package consult
  :bind (("C-s"   . consult-line)
         ("C-x b" . consult-buffer)
         ("C-c r" . consult-ripgrep)
         ("C-c i" . consult-imenu)
         ("M-y"   . consult-yank-pop)
         ("M-g g" . consult-goto-line)))

;;; Embark
(use-package embark
  :bind (("C-."   . embark-act)
         ("C-;"   . embark-dwim)
         ("C-h B" . embark-bindings))
  :init (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :hook (embark-collect-mode . consult-preview-at-point-mode))

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

;;; Magit
(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-c m l" . magit-log))
  :config (magit-auto-revert-mode -1))

;;; multiple-cursors
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-\""        . mc/skip-to-next-like-this)
         ("C-:"         . mc/skip-to-previous-like-this)))

;;; Move Text
(use-package move-text
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))

;;; Dired
(use-package dired-x
  :ensure nil
  :custom
  (dired-dwim-target t)
  (dired-listing-switches "-alh")
  (dired-mouse-drag-files t)
  :config
  (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")))

;;; Programming languages
(use-package zig-mode)
(use-package nix-mode)

;;; Tree-sitter
(use-package treesit-auto
  :custom
  (treesit-auto-install t)
  (treesit-font-lock-level 4)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#3c3836" :foreground "#ebdbb2" :box (:line-width 4 :color "#3c3836")))))
 '(mode-line-inactive ((t (:background "#1d2021" :foreground "#7c6f64" :box (:line-width 4 :color "#1d2021"))))))

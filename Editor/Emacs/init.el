;;; init.el

;;; automatic package managment
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun rc/require (&rest packages)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (pkg packages)
    (unless (package-installed-p pkg)
      (package-install pkg))
    (require pkg)))

;;; Programming language mode

(rc/require 'zig-mode)
(rc/require 'rust-mode)
(rc/require 'go-mode)
(rc/require 'nix-mode)

;; personal settings
(setq make-backup-files nil)
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default standard-indent 4)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 0)
(fringe-mode 0)
(tooltip-mode 0)
(global-display-line-numbers-mode 1)
(size-indication-mode 1)
(cua-mode 1)
(set-face-attribute 'default nil :height 180)
(setq auto-save-visited-interval 2)
(auto-save-visited-mode 1)

;;; Gruber-darker theme
(rc/require 'gruber-darker-theme)
(load-theme 'gruber-darker t)

;; 4. IDO MODE
(rc/require 'ido-completing-read+)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(setq ido-enable-flex-matching t)

;;; Magit
(rc/require 'cl-lib)
(rc/require 'magit)
(setq magit-auto-revert-mode nil)
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; multiple-cursors
(rc/require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;; Move Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; dired-x
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

;;; Company
(rc/require 'company)
(global-company-mode 1)
(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.1)


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
 )

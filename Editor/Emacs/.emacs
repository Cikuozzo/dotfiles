(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))

(setq custom-file "~/.emacs.custom.el")


(load "~/.emacs.rc/rc.el")
(setq make-backup-files nil) ; stop creating ~ files
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)
(setq tab-width 4)
(setq indent-tabs-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 0)
(fringe-mode 0)
(tooltip-mode 0)
(global-display-line-numbers-mode 1)
(size-indication-mode 1)
(cua-mode 1)
(set-face-attribute 'default nil :height 180)

(rc/require-theme 'gruber-darker)

;;; ido
(rc/require 'ido-completing-read+)
(require 'ido-completing-read+)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

;;;magit
(rc/require 'cl-lib)
(rc/require 'magit)
(setq magit-auto-revert-mode nil)
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; multiple cursors
(rc/require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;; dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

;;; Move Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; Org-Mode

;; Carica ed abilita org-modern
(rc/require 'org-modern)
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

;; Configurazioni dell'interfaccia Org
(setq org-startup-indented t)        ; Indentazione visiva dei livelli
(setq org-hide-leading-stars t)      ; Nasconde gli * extra nei titoli
(setq org-startup-folded 'overview)  ; Apre i file con i titoli chiusi
(setq org-ellipsis " ▾")             ; Simbolo per i titoli compressi

;; Modifica e codice
(setq org-return-follows-link t)     ; Invio apre i link
(setq org-src-fontify-natively t)    ; Syntax highlight nei blocchi codice
(setq org-src-tab-acts-natively t)   ; TAB funziona correttamente nel codice

;; Export
(setq org-html-htmlize-output-type 'css)
(setq org-export-with-toc t)         ; Indice automatico
(setq org-export-with-section-numbers t)

;; Shortcut globali
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link);;; Org-Mode

(rc/require 'org-modern)
(use-package org-modern
  :hook (org-mode . org-modern-mode))

(setq org-startup-indented t)        ; indentazione visiva dei livelli
(setq org-hide-leading-stars t)      ; nasconde gli * extra nei titoli
(setq org-startup-folded 'overview)  ; apre i file con i titoli chiusi
(setq org-ellipsis " ▾")             ; simbolo per i titoli compressi

(setq org-return-follows-link t)     ; Invio apre i link
(setq org-src-fontify-natively t)    ; syntax highlight nei blocchi codice
(setq org-src-tab-acts-natively t)   ; Tab funziona correttamente nel codice

(setq org-html-htmlize-output-type 'css)
(setq org-export-with-toc t)         ; indice automatico
(setq org-export-with-section-numbers t)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)

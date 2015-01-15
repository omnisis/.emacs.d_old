;;; Emacs Load Path
;;; Add a custom directory for custom extensions
(setq load-path (cons "~/.emacs.d/custom" load-path))

;;; Initialize Emacs Package System
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(defun ensure-pkg-installed (&rest packages)
  "Assure every package is installed, ask for installation if it's not."
  "Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
	 nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	   (package-install package)
	 package)))
   packages))

(package-initialize)

;; Make sure to have d/l'ed archive description.  Or use package-archive-contents
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Install Desired Emacs Packages (if not already installed)
(ensure-pkg-installed 
  'auctex
  'magit
  'full-ack
  'projectile
  'helm
  'rainbow-delimiters
  'markdown-mode
  'yasnippet
  'multi-term
  'elpy 
  'solarized-theme
  'twilight-theme
  ;; 'ergoemacs-mode
  'latex-preview-pane
)

;; Load custom elisp code
(require 'chj-appearance)
(require 'chj-editor)
(require 'chj-extras)
(require 'chj-python)
(require 'chj-keymap)

;; Custom Voodoo
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(delete-selection-mode t)
 '(ergoemacs-theme-options (quote ((move-and-transpose-lines on))))
 '(initial-scratch-message "")
 '(magit-use-overlays nil)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

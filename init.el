;;; Emacs Load Path
;;; Add a custom directory for custom extensions
(add-to-list 'load-path "~/.emacs.d/custom")
;; TODO: get all top-level dirs and add to load-path automatically
(add-to-list 'load-path "~/.emacs.d/vendor/ensime-emacs")

;;; Initialize Emacs Package System
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; Initialize Pkg System
(setq package-enable-at-startup nil)
(package-initialize)


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



;; Make sure to have d/l'ed archive description.  Or use package-archive-contents
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Install Desired Emacs Packages (if not already installed)
(ensure-pkg-installed 
  'ag
  'auto-complete
  'org-ac
  'browse-kill-ring
  'css-mode
  'dash
  'diminish
  'emmet-mode
  'ac-emmet
  'ac-etags
  'ac-ispell
  ;;'ensime : I built this from source
  'exec-path-from-shell
  'fill-column-indicator
  'flycheck
  'flx-ido ;; better matching engine for Ido
  'ido-vertical-mode
  'python-mode
  'smartparens
  'auctex
  'visual-regexp
  'yaml-mode
  'doc-view
  'ebib
  'magit
  'full-ack
  'projectile
  'helm
  'help-fns+
  'rainbow-delimiters
  'markdown-mode
  'neotree  ;; like vim's NERDTree for emacs
  'yasnippet
  'multi-term
  'elpy
  'zenburn-theme 
  'solarized-theme
  'twilight-theme
  ;; 'ergoemacs-mode
  'latex-preview-pane
  'scala-mode2
  'sbt-mode
  'smooth-scrolling
  's
  'dash
  'slime
  'undo-tree
  )

;; Make sure PATH is setup properly from the syspath
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; Load custom elisp code
(require 'chj-defuns) ;; should come first: contains re-usable elisp functions
(require 'chj-defaults) ;; basic settings to make Emacs sane
(require 'chj-appearance) ;; appearance related tweaks
(require 'chj-editor) ;; editor changes
(require 'chj-completion) ;; completion with auto-complete, company, yasnippets, etc
(require 'chj-extras) ;; Eye Candy and extra fluff
(require 'chj-java) ;; JVM lang settings
(require 'chj-scala) ;; Scala-Specfic settings
(require 'chj-python) ;; Python Specific settings
(require 'chj-latex) ;; Tex related settings
(require 'chj-terminal) ;; Settings for Terminal/Shell modes
(require 'chj-keymap) ;; should come last: contains all keybindings for various plugins and modes

;; Custom Voodoo
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(delete-selection-mode t)
 '(ergoemacs-theme-options (quote ((move-and-transpose-lines on))))
 '(initial-scratch-message "")
 '(magit-use-overlays nil)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(safe-local-variable-values (quote ((project-venv-name . "stock-strategy-tester"))))
 '(shift-select-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

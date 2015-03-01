(require 'ido)

;; ---
;; Constant Directories
;; ---

(defun ido-choose-from-recentf ()
  "Use ido to select a recently visited file from the `recentf-list'"
  (interactive)
  (find-file (ido-completing-read "Open File: " recentf-list nil t)))

;; ---
;; IDO Configuration
;; ---
(ido-mode t)
(setq ido-enable-prefix nil
      ido-save-directory-list-file "~/.emacs.d/.ido.last"
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-show-dot-for-direcd t
      ido-max-prospects 10)

;; Ido + Flx-Ido
(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido fasces to see flx highlights
(setq ido-user-faces nil)

;; flx-ido looks better w/ ido-vertical-mode
(require 'ido-vertical-mode)
(ido-vertical-mode)

(defun chj-ido-vertical-keybindings()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-next-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-next-match))

(add-hook 'ido-vertical-mode-hook 'chj-ido-vertical-keybindings)
  

;; C-x C-j opens dired with the cursor on the file you are editing
(require 'dired-x)

;; ---
;; Desktop Save Behvaior
;; ---
(setq
 desktop-path '("~/.emacs.d/")
 desktop-dirname "~/.emacs.d/"
 desktop-base-file-name "emacs-desktop")

;; remove desktop after it's been read
(defun remove-desktop ()
  ;; desktop-remove clears desktop-dirname
  (setq desktop-dirname-tmp desktop-dirname)
  (desktop-remove)
  (setq desktop-dirname desktop-dirname-tmp))

(add-hook 'desktop-after-read-hook
	  'remove-desktop)
	 
(defun saved-session ()
  (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

;; use session-restore to restore the desktop manually
(defun session-restore ()
  "Restore a saved emacs session."
  (interactive)
  (if (saved-session)
      (desktop-read)
    (message "No desktop found.")))

;; use session-save to save the desktop manually
(defun session-save ()
  "Save an emacs session."
  (interactive)
  (if (saved-session)
      (if (y-or-n-p "Overwrite existing desktop? ")
	  (desktop-save-in-desktop-dir)
	(message "Session not saved."))
  (desktop-save-in-desktop-dir)))

;; ask user whether to restore desktop at start-up
(defun restore-desktop-prompt ()
  (if (saved-session)
      (if (y-or-n-p "Restore desktop? ")
          (session-restore))))

(add-hook 'after-init-hook
          'restore-desktop-prompt)


;; Basic Editor Settings
(progn

  ;; beep! mutha-fucker, i freakin dare you (tried (setq visible-bell t) but it's uuuglee) 
  (setq ring-bell-function 'ignore)

   ;; Settings related to editing of text
  (setq-default indent-tabs-mode nil) ;; no tabs
  (setq-default tab-with 4)           ;; maintain 4 char tabwidth by default

  ;; tell Emacs to help me help me
  (setq suggest-key-bindings t)
  
  ;; saveplace remembers your location in a file when saving files
  (require 'saveplace)
  (setq save-place-file (expand-file-name "saveplace" emacs-savedir))

  ;; bookmarks
  (require 'bookmark)
  (setq bookmark-default-file (expand-file-name "bookmarks" emacs-savedir)
        bookmark-save-flag 1)
  
  )

;; CUA mode for std copy/cut/paste behavior
;;(cua-mode t)

;; tramp, for remote access
(progn 
  (require 'tramp)
  (setq tramp-default-method "ssh"))

;; Highlight extremely long lines
(require 'whitespace)


(provide 'chj-editor)



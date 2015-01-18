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
(progn 
  (interactive)
  (ido-mode t)
  (setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
  (setq ido-enable-flex-matching t)
  (setq ido-user-filename-at-point 'guess)
  (setq ido-show-dot-for-dired t)
)
  
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
	 
(defun saved-session ()
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


;; --- 
;; Backup/Savefile Configuration
;; ---
(progn
  (setq
   backup-by-copying t ; don't clobber symlinks
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)
  (setq backup-directory-alist `((".*" .  ,emacs-tmpdir)))
  (setq auto-save-file-name-transforms `((".*" ,emacs-tmpdir t))))

;; Basic Editor Settings
(progn

  ;; use UTF-8 like the rest of the 21st century
  (prefer-coding-system 'utf-8)

  ;;; Prevent Extraneous Tabs
  (setq-default indent-tabs-mode nil)
  
  ;; beep! mutha-fucker, i freakin dare you (tried (setq visible-bell t) but it's uuuglee) 
  (setq ring-bell-function 'ignore)

  ;; whenever an external process changes a file under emacs and there
  ;; was no buffer local modification, just revert to ondisk contents
  (global-auto-revert-mode 1)
  
  ;; Settings related to editing of text
  (setq-default indent-tabs-mode nil) ;; no tabs
  (setq-default tab-with 4)           ;; maintain 4 char tabwidth by default

  ;; tell Emacs to help me help me
  (setq suggest-key-bindings t)
  
  ;; delete the selection with a keypress
  (delete-selection-mode)
  
  ;; meaningful names for buffers with the same name
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-separator "/")
  (setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
  (setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers
  

  ;; saveplace remembers your location in a file when saving files
  (require 'saveplace)
  (setq save-place-file (expand-file-name "saveplace" emacs-savedir))

  ;; save recent files
  (require 'recentf)
  (setq recentf-save-file (expand-file-name "recentf" emacs-savedir)
	recentf-max-saved-items 500
	recentf-max-menu-items 15
	;; disable recentf cleanup on start (causes issues with remote files)
	recentf-auto-cleanup 'never)
  (recentf-mode 1)

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



;; ---
;; Constant Directories
;; ---

(defconst emacs-savedir (expand-file-name "saves/" "~/.emacs.d"))

(defconst emacs-tmpdir (expand-file-name "tmpdir" "~/.emacs.d"))

(defvar emacs-extra-paths '("/usr/local/bin") 
"Extra paths to make available to EMACS when running commands.")

(defun add-to-path (x)
  (setenv "PATH" (concat (getenv "PATH") ":" x)))

;; add emacs-extra-paths to exec-path
(setq exec-path (append emacs-extra-paths exec-path))

;; add all extra paths to the system PATH variable
(mapc (lambda (x) (add-to-path x)) emacs-extra-paths)

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
  ;; ido related keymap bindings
  (global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
  ;;(global-set-key (kbd "C-x C-c") 'ido-switch-buffer)
  (global-set-key (kbd "C-x b") 'ibuffer)
  ;; hotkey to integrate find-recent with ido
  (global-set-key (kbd "C-x r") 'ido-choose-from-recentf))

;; C-x C-j opens dired with the cursor on the file you are editing
(require 'dired-x)

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

  ;; Default Binding for keyboard quit is too hard to reach (C-g), S-k feels much nicer
  (global-unset-key (kbd "C-g"))
  (global-set-key (kbd "s-K") 'keyboard-quit)
 
  ;; use UTF-8 like the rest of the 21st century
  (prefer-coding-system 'utf-8)
  
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

;; tramp, for remote access
(progn 
  (require 'tramp)
  (setq tramp-default-method "ssh"))

(provide 'chj-editor)



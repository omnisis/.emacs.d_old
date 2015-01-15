(require 'evil)
(require 'evil-leader)


(progn
  ;; enable global-evil-leader berfore evil-mode as per evil-leader sources
  (global-evil-leader-mode)
  (setq evil-search-module 'evil-search
        evil-want-C-u-scroll 'f
        evil-want-C-w-in-emacs-state t)
  (evil-leader/set-leader "<SPC>") 
  (evil-leader/set-key
    "f" 'ido-find-file
    ;"b" 'ido-switch-buffer
    "b"  'helm-buffers-list
    ;"r" 'ido-choose-from-recentf
    "r" 'helm-mini
    "k" 'kill-buffer
    "d" 'ido-dired
    ;"x" 'smex
    "x" 'helm-M-x
    "l" 'goto-line
    "s" 'bookmark-set 
    "b" 'helm-bookmarks
    "g" 'magit-status) 

  ;; Tweak default State for various modes (default is Normal, as in Vim) 
  (loop for (mode . state) in '((inferior-emacs-lisp-mode . emacs)
                                (nrepl-mode . insert)
                                (sbt-mode . emacs)
                                (pylookup-mode . emacs)
                                (comint-mode . normal)
                                (shell-mode . insert)
                                (git-commit-mode . insert)
                                (git-rebase-mode . emacs)
                                (term-mode . emacs)
                                (help-mode . emacs)
                                (helm-grep-mode . emacs)
                                (grep-mode . emacs)
                                (bc-menu-mode . emacs)
                                (magit-branch-manager-mode . emacs)
                                (rdictcc-buffer-mode . emacs)
                                (dired-mode . emacs)
                                (wdired-mode . normal))
        do (evil-set-initial-state mode state))

  ;; ESC quits
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  (evil-mode 1)
)

(provide 'chj-evil)

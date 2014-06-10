(require 'evil)
(require 'evil-leader)


(progn
  ;; enable global-evil-leader berfore evil-mode as per evil-leader sources
  (global-evil-leader-mode)
  (setq evil-search-module 'evil-search
        evil-want-C-u-scroll 'f
        evil-want-C-w-in-emacs-state t)
  (evil-mode t)
  (evil-leader/set-leader "<SPC>") 
  (evil-leader/set-key
    "f" 'ido-find-file
    "b" 'ido-switch-buffer
    "r" 'ido-choose-from-recentf
    "k" 'kill-buffer
    "d" 'ido-dired
    "x" 'smex))

(provide 'chj-evil)

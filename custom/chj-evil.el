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
    "b" 'ido-switch-buffer
    "r" 'ido-choose-from-recentf
    "k" 'kill-buffer
    "d" 'ido-dired
    "x" 'smex)
  ;; evil-mode config
  (mapc (lambda (mode)
          (add-to-list 'evil-emacs-state-modes mode))
        '(sbt-mode))
  (evil-mode t)
)

(provide 'chj-evil)

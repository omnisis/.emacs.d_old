(progn 
  (setq inhibit-splash-screen t)
  (setq initial-scratch-message "")
  (setq inhibit-startup-message 't)
  (line-number-mode t)
  (column-number-mode t)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  ;; on mac, there's always a menubar drawn, don't have it empty
  (unless (string-match "apple-darwin" system-configuration)
    (menu-bar-mode -1))
  

  ;; color theme settings
  ;; NO LONGER NEEDED IN EMACS24 !!! (require 'color-theme)
  (load-theme 'solarized-dark t)
  )

;; default font
(set-default-font "Menlo 13")  

;; zooming
(global-set-key (kbd "C-c C-=") 'text-scale-increase)
(global-set-key (kbd "C-c C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-0") (lambda () (interactive) (text-scale-set 0)))

(provide 'chj-appearance)

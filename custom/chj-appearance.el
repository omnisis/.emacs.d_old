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
  (require 'color-theme)
  (load-theme 'solarized-dark t)
  )

(provide 'chj-appearance)

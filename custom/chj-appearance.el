
(setq inhibit-splash-screen t)
(setq initial-scratch-message "Welcome to Emacs!")
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

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; default font
;;(set-default-font "Inconsolata 13")
(set-default-font "Melo 12")

;; Unclutter the modeline
(require 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "tagedit" '(diminish 'tagedit-mode))
(eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "guide-key" '(diminish 'guide-key-mode))
(eval-after-load "magit" '(diminish 'magit-auto-revert-mode))
(eval-after-load "whitespace-cleanup-mode" '(diminish 'whitespace-cleanup-mode))
(eval-after-load "subword" '(diminish 'subword-mode))

(provide 'chj-appearance)

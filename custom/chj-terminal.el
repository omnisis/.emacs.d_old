
(require 'multi-term) ;; adds multiple term buffer support to ansi-term

;; toggles b/w term/char mode (useful for keybinding)
(defun chj-toggle-term-mode()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

;;(defun chj-invoke-term (name)
;; "Invokes configured term"
;;  (interactive "sTerminal Name: ")
;;  (multi-term))

(defun chj-toggle-term-visor ())


;; Terminal configuration
(progn
  (setq multi-term-dedicated-max-window-height 35)
  (setq multi-term-dedicated-window-height 35)
  (setq multi-term-dedicated-select-after-open-p t)
  (setq multi-term-dedicated-skip-other-window-p t)
  (setq multi-term-switch-after-close t)
  (setq shell-file-name "zsh")
  (setq explicit-shell-file-name "/usr/local/bin/zsh")
  (setq explicit-zsh-args '("--login" "--interactive"))
  (setq multi-term-program "/usr/local/bin/zsh")
  (setenv "SHELL" shell-file-name)
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
  (setq term-buffer-maximum-size 10000)
  (setq system-uses-terminfo t)
)

(defun chj-term-mode-hook ()
  (setq yas-dont-activate t))

(add-hook 'term-mode-hook 'chj-term-mode-hook)

;; NOTE: In order to get proper terminal support for eterm-color you need to run this command
;; tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

(provide 'chj-terminal)

(require 'tramp)


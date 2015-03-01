
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
  (setq term-bind-key-alist '(("C-c C-c" . term-interrupt-subjob) 
                              ("C-c C-e" . term-send-esc) 
                              ("M-RET" . chj-toggle-term-mode)
                              ("C-p" . previous-line) 
                              ("C-n" . next-line) 
                              ("C-s" . isearch-forward) 
                              ("C-r" . isearch-backward) 
                              ("C-m" . term-send-return) 
                              ("C-y" . term-paste) 
                              ("M-f" . term-send-forward-word) 
                              ("M-b" . term-send-backward-word) 
                              ("M-o" . term-send-backspace) 
                              ("M-p" . term-send-up) 
                              ("M-n" . term-send-down) 
                              ("M-M" . term-send-forward-kill-word) 
                              ("M-N" . term-send-backward-kill-word) 
                              ("M-r" . term-send-reverse-search-history) 
                              ("M-," . term-send-raw) 
                              ("M-." . comint-dynamic-complete)))

  (add-to-list 'term-bind-key-alist '("C-z" . term-stop-subjob))
  (add-to-list 'term-bind-key-alist '("C-c j" . chj-toggle-term-mode))
  ;; Free M-RET so that we can bind to it
  (setq term-unbind-key-list '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>" "M-RET"))
  ;; (add-to-list 'term-unbind-key-list "C-c j")

  (setq yas-dont-activate t))
(defun chj-term-mode-hook ()
  (setq yas-dont-activate t)
  ;; in line mode normal mappings are in effect so set it here
  (local-set-key (kbd "M-RET") 'chj-toggle-term-mode))

(add-hook 'term-mode-hook 'chj-term-mode-hook)

;; NOTE: In order to get proper terminal support for eterm-color you need to run this command
;; tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

(provide 'chj-terminal)

(require 'tramp)


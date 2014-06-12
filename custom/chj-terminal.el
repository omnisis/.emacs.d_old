(defun term-toggle-mode ()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))


(global-set-key (kbd "C-c t") 'term-toggle-mode)
(progn 
  ;;(setq shell-file-name "bash")
  ;;(setq explicit-shell-file-name "/bin/bash")
  ;;(setq explicit-bash-args '("--noediting" "--login" "-i"))
  ;;(setenv "SHELL" shell-file-name)
  ;;(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
  ;;(setq system-uses-terminfo nil)
) 

(add-hook 'term-mode-hook
          (lambda () (local-set-key (kbd "C-=") 'term-toggle-mode))) 

(provide 'chj-terminal)


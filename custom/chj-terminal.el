(defun term-toggle-mode ()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))


(global-set-key (kbd "C-c t") 'term-toggle-mode)

(provide 'chj-terminal)



;; Map escape to cancel (like C-g)...
(global-set-key [escape] 'keyboard-escape-quit)     
(define-key isearch-mode-map [escape] 'isearch-abort)

;; <f5> for "helm-mini"
(global-set-key (kbd "<f5>") 'helm-mini)
(global-set-key (kbd "<f2>") 'execute-extended-command)

;; Buffer/File/Directory commands
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-o") 'ido-find-file)

(defun chj-new-empty-buffer ()
  "Open a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

(global-set-key (kbd "M-n") 'chj-new-empty-buffer)
(global-set-key (kbd "s-r") 'rename-buffer)
(global-set-key (kbd "s-R") 'rename-file)
(global-set-key (kbd "<f10>") 'ido-switch-buffer)



(provide 'chj-keymap)
 













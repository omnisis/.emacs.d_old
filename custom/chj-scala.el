(require 'scala-mode2)

(add-to-list 'load-path (format "%s/%s" "~/Dev/ensime-2.10" "elisp/"))
(require 'ensime)

;; cause ensime-mode to be started whenever scala-mode is enabled
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; set some scala mode only key mappings for interacting with SBT 
(add-hook 'scala-mode-hook (lambda ()
  (interactive)
  (local-set-key (kbd "<f5>") 'sbt-start) 
  (local-set-key (kbd "<f6>") 'sbt-command)
  (local-set-key (kbd "<f7>") 'sbt-paste-region)
  (local-set-key (kbd "<f8>") 'sbt-send-all) 
))

(require 'sbt-mode)

(defun sbt-send-all ()
  "Sends entire contents of current buffer to SBT buffer."
  (interactive)
  (sbt-send-region 0 (buffer-size)))

(setq sbt:program-name "/usr/local/bin/sbt")   
(add-hook 'sbt-mode-hook '(lambda ()
  ;; compilation skip threshold tells the compilation minor-mode whihc
  ;; type of compiler output can be skipped: 1 = skip info, 2 = skip info and warnings
  (setq compilation-skip-threshold 1)
  (local-set-key (kbd "C-a") 'comint-bol)
  (local-set-key (kbd "M-RET") 'comint-accumulate))


)

   
(define-key scala-mode-map (kbd "<f8>") 'sbt-send-all) 
(provide 'chj-scala)

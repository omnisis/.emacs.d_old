(require 'scala-mode2)
(require 'sbt-mode)
(require 'ensime)


;;(add-to-list 'load-path (format "%s/%s" "~/Dev/ensime-2.10" "elisp/"))
;;(require 'ensime)

;; cause ensime-mode to be started whenever scala-mode is enabled
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; set some scala mode only key mappings for interacting with SBT


(setq ensime-log-events t)
(setq debug-on-error t)

(defun chj-setup-mode-scala()
  (interactive)
  ;; bind the 'newline-and-indent' command and
  ;; 'scala-indent:insert-asterisk-on-multiline-comment' to RET in
  ;; order to get indentation and asterisk-insertion within multi-line
  ;; comments.
  (local-set-key (kbd "RET") '(lambda ()
    (interactive)
    (newline-and-indent)
    (scala-indent:insert-asterisk-on-multiline-comment)))
  )



  ;;(add-hook 'scala-mode-hook 'chj-setup-mode-scala)
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  

;; (require 'sbt-mode)

;; (defun sbt-send-all ()
;;   "Sends entire contents of current buffer to SBT buffer."
;;   (interactive)
;;   (sbt-send-region 0 (buffer-size)))

;; (setq sbt:program-name "/usr/local/bin/sbt")   
;; (add-hook 'sbt-mode-hook '(lambda ()
;;   ;; compilation skip threshold tells the compilation minor-mode whihc
;;   ;; type of compiler output can be skipped: 1 = skip info, 2 = skip info and warnings
;;   (setq compilation-skip-threshold 1)
;;   (local-set-key (kbd "C-a") 'comint-bol)
;;   (local-set-key (kbd "M-RET") 'comint-accumulate))


;;)

   
;;(define-key scala-mode-map (kbd "<f8>") 'sbt-send-all) 
(provide 'chj-scala)

;;---
;; Configure ack (a better grep)
;;---
(progn
  ;;(require 'ack-and-a-half)
  ;;(setq ack-and-a-half-executable "/usr/local/bin/ack")
  (add-to-list 'load-path "/usr/local/bin/ack")
 
  ;; create shorter aliases
  (autoload 'ack-same "full-ack" nil t)
  (autoload 'ack "full-ack" nil t)
  (autoload 'ack-find-same-file "full-ack" nil t)
  (autoload 'ack-find-file "full-ack" nil t)
  )

;;---
;; Configure projectile (A project editor)
;;--
(progn
  (require 'projectile)
  (projectile-global-mode))

;;---
;; YAS Snippet
;;---
(progn
  (require 'yasnippet)
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"
          "~/Dev/yasnippet-snippets"
          )))
  (yas-reload-all)
  (add-hook 'prog-mode-hook
             '(lambda ()
               (yas-minor-mode)))

;;---
; smex
;;---
;;(require 'smex)
;;(smex-initialize)

;;---
;; rainbox-delimiters (makes matching up delims easy to see)
;;---
(require 'rainbow-delimiters)
(add-hook 'proj-mode-hook (lambda () 'rainbow-delimiters-mode))


;;---
;; Git integration
;;--
(require 'magit)

;;---
;; Helm
;;---
(require 'helm)
(require 'helm-config)
;;(require 'helm-ls-git)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-a") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;---
;; Powerline
;;---
;;(require 'powerline)
;;(powerline-default-theme)

  
(provide 'chj-extras)

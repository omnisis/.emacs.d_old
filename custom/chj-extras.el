;;---
;; Configure ack-and-a-half (a better grep)
;;---
(progn
  (require 'ack-and-a-half)
  (setq ack-and-a-half-executable "/usr/local/bin/ack")
  ;; create shorter aliases
  (defalias 'ack 'ack-and-a-half)
  (defalias 'ack-same 'ack-and-a-half-same)
  (defalias 'ack-find-file 'ack-and-a-half-find-file)
  (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)
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
  (yas-global-mode 1)
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"
          "~/Dev/yasnippet-snippets"
          )))

;;---
; smex
;;---
(require 'smex)
(smex-initialize)

;;---
;; rainbox-delimiters (makes matching up delims easy to see)
;;---
(require 'rainbow-delimiters)
(add-hook 'proj-mode-hook 'rainbow-delimiters-mode) 


;;---
;; Git integration
;;--
(require 'magit)

(provide 'chj-extras)

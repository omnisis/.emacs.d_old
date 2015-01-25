;; --
;; Its debatable whether this configuration belongs in another file, this is mostly
;; config and plugins of the form: "Pimp my Emacs", that is things that make Emacs rock
;; and turn it into more of a sentient being than a simple text editor, things like
;; experimental text navigation modes, or Helm, project mgmt, things like that.
;; --

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
  (autoload 'ack-find-file "full-ack" nil t))

;;---
;; Configure projectile (A project editor)
;;--
(defun chj-setup-projectile()
  (let ((projectile-ignorelist '(".ensime_cache" "target" "build")))
    (mapcar (lambda (p) (add-to-list 'projectile-globally-ignored-files p)) projectile-ignorelist)))

(require 'projectile)
(setq projectile-cache-file (expand-file-name "projectile.cache" emacs-savedir))
(projectile-global-mode t)
(add-hook 'projectile-mode-hook 'chj-setup-projectile)


;;---
; smex
;;---
;;(require 'smex)
;;(smex-initialize)

;;---
;; rainbox-delimiters (makes matching up delims easy to see)
;;---
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook (lambda () 'rainbow-delimiters-mode))


;;---
;; Git integration
;;--
(require 'magit)

;;---
;; Helm
;;---
(require 'helm)
(defun chj-helm-setup ()
  (require 'helm-config)
  (setq helm-input-idle-delay 0.2)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t)
  (setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
  (helm-mode t))
(chj-helm-setup)
;;(require 'helm-ls-git)

;;---
;; Powerline
;;---
;;(require 'powerline)
;;(powerline-default-theme)

  
(provide 'chj-extras)

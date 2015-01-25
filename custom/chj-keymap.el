;; key bindings (note this only makes sense if caps lock == ctrl)
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'super) ;; option is super
  (setq mac-command-modifier 'meta) ;; cmd as meta since it is bigger than option/control
  (setq ns-function-modifier 'hyper)
  (global-set-key [kp-delete] 'delete-char)) ;; sets fn-delete to be right-delete

 
;; zooming / screen control
(global-set-key (kbd "C-c C-=") 'text-scale-increase)
(global-set-key (kbd "C-c C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-0") (lambda () (interactive) (text-scale-set 0)))
(global-set-key (kbd "M-<f10>") 'toggle-frame-maximized)  ;; maximize frame
(global-set-key (kbd "M-<f11>") 'toggle-frame-fullscreen)  ;; toggle fullscreen

;; provides shift + [up/down/right/left] for window movement as oppossed to C-x o 
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; Motion
;; >>>
;; Std. Emacs movement
;; C-a/C-e: beg/end of line
;; C-p/C-n: prev/next line
;; C-M-f/b: movement forward/backward by sexp
;; C-M-u/d: movement up/down in sexps
;; M-g M-g: goto line
;; C-M-a/e: goto beg/end of defun
;; >>>
(global-set-key (kbd "M-a") 'backward-paragraph)
(global-set-key (kbd "M-e") 'forward-paragraph)
(global-set-key (kbd "M-n") 'scroll-up)
(global-set-key (kbd "M-p") 'scroll-down)

;; Occur is nice, helm-occur is nicer
(global-set-key (kbd "C-c o") 'helm-occur)

;; Recursive Grep
(global-set-key (kbd "C-c r") 'rgrep)

;; --
;; Function Key Mapppings
;;===
;; Helm bookmarks
;; F1 is reserved for help
(global-set-key (kbd "<f2>") 'helm-M-x)
;; f3/f4 are reserved for macros
(global-set-key (kbd "<f5>") 'multi-term-dedicated-toggle)
(global-set-key (kbd "<f6>") 'multi-term) ;; opens a new terminal
(global-set-key (kbd "<f8>") 'magit-status) 
(global-set-key (kbd "<f9>") 'helm-bookmarks)
(require 'neotree)
(global-set-key (kbd "<f10>") 'neotree) 


;; C-c C-l Toggles showing line numbers
(global-set-key (kbd "C-c C-l") 'linum-mode)

;; Map escape to cancel (like C-g)...
(global-set-key [escape] 'keyboard-escape-quit)     
(define-key isearch-mode-map [escape] 'isearch-abort)

;; A better M-x
(global-set-key (kbd "M-x") 'execute-extended-command)


;; "helm-mini" is awesome and kind of is mash-up
;; of recentf + ido-buffer
;; This keybinding is choosen because its easy to press
;; without moving the fingers from the home row
(global-set-key (kbd "C-c k") 'helm-mini)


;; Buffer/File/Directory commands
(global-set-key (kbd "M-s") 'save-buffer)
;;(global-set-key (kbd "M-o") 'ido-find-file)


(defun chj-new-empty-buffer ()
  "open a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

;;(global-set-key (kbd "M-n") 'chj-new-empty-buffer)
;;(global-set-key (kbd "s-r") 'rename-buffer)
;;(global-set-key (kbd "s-R") 'rename-file)
;;(global-set-key (kbd "<f10>") 'ido-switch-buffer)
;; Helm stuff
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-a") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "s-/") 'helm-mini)


;; Use C-o to hit other window
(global-set-key (kbd "C-o") 'other-window)
;; minimizing emacs is a pain
(global-unset-key (kbd "C-z"))

;; ido related keymap bindings
;; (global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
;; (global-set-key (kbd "C-x C-c") 'ido-switch-buffer)
;; (global-set-key (kbd "C-x b") 'ibuffer)
;; hotkey to integrate find-recent with ido
(global-set-key (kbd "M-r") 'ido-choose-from-recentf)

;; Term management
(require 'multi-term)
(add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
(add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
(add-to-list 'term-bind-key-alist '("<f10>" . man))
(add-to-list 'term-bind-key-alist '("C-c t" . chj-toggle-term-mode))
;; custom emacs unbindings for term mode
(add-to-list 'term-unbind-key-list "C-o")
(add-to-list 'term-unbind-key-list "C-c t")

;; ----------------------------------------------------------
;; Mode-specfic keybindings
;; ----------------------------------------------------------

;; Lisp Mode
(defun chj-keybindings-elisp ()
  (local-set-key (kbd "C-c C-e") 'eval-buffer))
(add-hook 'emacs-lisp-mode-hook 'chj-keybindings-elisp)




;; send raw escape in term mode?
;; (define-key term-raw-map [?\e] 'term-send-raw)

(provide 'chj-keymap)






    



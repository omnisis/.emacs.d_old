;;; Minor mode
(defvar chj-command-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "b s") 'bookmark-save)
    (define-key map (kbd "b j") 'bookmark-jump)
    map)
  "Keymap for  commands after `chj-keymap-prefix'")

(fset 'chj-command-map chj-command-map)


(setq chj-keymap-prefix (kbd "M-RET"))
(defvar chj-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map chj-keymap-prefix 'chj-command-map)
    map)
  "Keymap for
e mode.")


(define-minor-mode chj-mode
  "Minor mode to assist in providing an ergonomic key-binding space
   via M-RET which isn't bound in normal emacs keybindings."
  :lighter " CHJ "
  :keymap chj-mode-map
  :group 'chj
  :require 'chj-mode
  (message "CHJ Mode activated ..."))

(define-globalized-minor-mode chj-global-mode
  chj-mode
  chj-mode)

(provide 'chj-mode)


(chj-global-mode 1)

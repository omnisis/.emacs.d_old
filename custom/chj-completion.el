(require 'yasnippet)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'popup)

;;---
;; YAS Snippet : Programmer Expansion Help
;;---
(progn
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"
          "~/Dev/yasnippet-snippets"
          ))
  (yas-reload-all)
  (yas-global-mode 1)
  ;; use backtab(shift+tab) instead of TAB to avoid clashing with other forms of completion
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand))

(eval-after-load 'popup
  '(progn
     (define-key popup-menu-keymap (kbd "M-n") 'popup-next)
     (define-key popup-menu-keymap (kbd "TAB") 'popup-next)
     (define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
     (define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
     (define-key popup-menu-keymap (kbd "M-p") 'popup-previous)))

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t)))

(defun chj-yasnippet-setup ()
  (setq yas-prompt-functions
        '(yas-popup-isearch-prompt
          yas-no-prompt))
  (yas-reload-all)
  (add-hook 'prog-mode-hook
            '(lambda ()
               (yas-minor-mode))))

(chj-yasnippet-setup)

;; ---
;; Auto-Complete tweaks
;; ---
(defun chj-auto-complete-setup ()
  (progn
    (require 'auto-complete-config)
    ;; Location of auto-complete dictionaries
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
    
    
    ;; By default, global-auto-complete-mode will toggle ac according to
    ;; ac-modes, add org-mode and text-mode to ac-modes
    (dolist (mode '(text-mode org-mode))
      (add-to-list 'ac-modes mode))

    ;; when entering org/text/prog modes, add files/filenames to ac-sources
    (dolist (ac-mode-hook '(text-mode-hook org-mode-hook prog-mode-hook))
      (add-hook ac-mode-hook
                (lambda ()
                  (add-to-list 'ac-sources 'ac-source-files-in-current-dir)
                  (add-to-list 'ac-sources 'ac-source-filename))))

    ;; Setup AC with default options
    (ac-config-default)

    (global-auto-complete-mode nil)))

(chj-auto-complete-setup)
  

;; TODO: Consider stealing ac-source-pcomplete from OME for
;; AC + PCOMPLETE integration


(provide 'chj-completion)



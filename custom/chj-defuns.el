(defun view-url ()
  "Open a new buffer containing the contents of URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    (cond ((search-forward "<?xml" nil t) (xml-mode))
          ((search-forward "<html" nil t) (html-mode)))))

(defun add-to-path (x)
  "Adds a value to PATH envvar and syncs exec-path and PATH."
  (progn 
    (setenv "PATH" (concat (getenv "PATH") ":" x))))


;; Directory where emacs savefiles will go
(defconst emacs-savedir (expand-file-name "saves/" "~/.emacs.d"))

;; Where will emacs tmpfiles go
(defconst emacs-tmpdir (expand-file-name "tmpdir" "~/.emacs.d"))

;; Extra paths to make available to EMACS when running commands.")
(defvar emacs-extra-paths '("/usr/local/bin")) 
(mapc (lambda (x) (add-to-path x)) emacs-extra-paths)


(defun refill-buffer ()
  "Selects the whole buffer and performs a fill-region on it."
  (interactive)
  (fill-region (point-min) (point-max)))


(provide 'chj-defuns)


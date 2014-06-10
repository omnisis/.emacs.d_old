(require 'scala-mode2)

(add-to-list 'load-path (format "%s/%s" "~/Dev/ensime-2.10" "elisp/"))
(require 'ensime)

;; cause ensime-mode to be started whenever scala-mode is enabled
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'chj-scala)

;; I prefer el-get over emacs pacakge.el (for now)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(when (>=  emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))


;; Directory where we store our customizations
(add-to-list 'load-path "~/.emacs.d/custom")

;; we prefer el-get over emacs24+ package.el (for now) due to its flexibility and
;; compatibility with MELPA/ELPA/etc
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq el-get-user-package-directory "~/.emacs.d/el-get-user/initfiles")


;; now either el-get is `required already, or have been loaded by the el-get installer
(setq 
 my-el-get-pkglist
 '(el-get
   ack-and-a-half
   auto-complete
   yasnippet
   color-theme
   projectile
   color-theme-solarized
   rainbow-delimiters
   ;; auto-completing M-x
   smex
   ;; scala
   sbt-mode
   scala-mode2
   ensime
   ;; evil relates
   evil
   evil-leader
   ;; git support
   magit
   ;; helm
   helm
   helm-ls-git
))

;; Build the El-Get copy of the package.el pkgs if we have not
;; built it before.  
;; TODO:  For now will need to delete the dir to update...
(require 'el-get-elpa)
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

;; install new pkgs and init already installed pkgs
(el-get 'sync my-el-get-pkglist)

;; list of custom elisp to run
(require 'chj-appearance)
(require 'chj-editor)
(require 'chj-extras)
(require 'chj-evil)
(require 'chj-terminal)
      
;; prog lang specific customizations
(require 'chj-scala)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#042028")
 '(background-mode dark)
 '(cursor-color "#708183")
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#708183")
 '(magit-diff-options nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Setup ElPy
(when (require 'elpy nil t)
  (elpy-enable)
  ;;(elpy-clean-modeline)
  ;; completion backend, could be jedi
  (setq elpy-rpc-backend "rope")
  (elpy-use-ipython)
  (setq python-shell-interpreter-args "--matplotlib osx --profile dataanalysis"))


;; Setup VirtualEnvs for ElPy
(defun chj-pyvenv-setup()
  (pyvenv-workon "ipython-base"))

(require 'pyvenv)
(chj-pyvenv-setup)

(provide 'chj-python)





(defun foo()
  (progn
  (message "foo")
  (message "bar")))





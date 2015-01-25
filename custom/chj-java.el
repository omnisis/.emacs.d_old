;; Locations to various Java installations
(setq java-versions-alist '(("Java6" . "/Library/Java/JavaVirtualMachines/1.6.0_51-b11-457.jdk/Contents/Home")
                            ("Java7" . "/Library/Java/JavaVirtualMachines/jdk1.7.0_40.jdk/Contents/Home")
                            ("Java8" . "/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home")
                            ))

(defun chj-javahome ()
  "Sets the Java environment variable $JAVA_HOME.  Subsequent shells and terms should honor the new version."
  (interactive)
  (let
      ((flavor (completing-read "flavor: " '("Java6" "Java7" "Java8"))))
    (message (format "Setting System Java To: %s" flavor))
    (setenv "JAVA_HOME" (cdr (assoc flavor java-versions-alist)))))

(provide 'chj-java)

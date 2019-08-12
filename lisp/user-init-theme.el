(message "configuring themes")

(defun user-init-configure-zenburn ()
  "Configure zenburn theme."
  (load-theme 'zenburn))

(defun user-init-configure-solarized ()
  "Configure solarized theme."
  (load-theme 'solarized-dark)
  (load-theme 'solarized-light))

;; select theme to load on startup
(add-hook 'after-init-hook 'user-init-configure-zenburn)
(add-hook 'after-init-hook 'user-init-configure-solarized)

(provide 'user-init-theme)

(message "configuring themes")

(defun user-init-configure-zenburn ()
  "Configure zenburn theme."
  (load-theme 'zenburn))

(defun user-init-configure-solarized ()
  "Configure solarized themes."
  (load-theme 'solarized-dark)
  (load-theme 'solarized-light))

;; load all themes on startup
(add-hook 'after-init-hook 'user-init-configure-zenburn)
(add-hook 'after-init-hook 'user-init-configure-solarized)

(provide 'user-init-themes)

(message "configuring themes")

(defun user-init-configure-zenburn ()
  (load-theme 'zenburn t))

(defun user-init-configure-solarized ()
  (load-theme 'solarized-dark t t)
  (load-theme 'solarized-light t t))

;; load all themes on startup
(add-hook 'after-init-hook 'user-init-configure-zenburn)
(add-hook 'after-init-hook 'user-init-configure-solarized)

(provide 'user-init-themes)

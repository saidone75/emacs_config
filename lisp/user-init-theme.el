;;; user-init-theme.el --- Configure color theme

;;; Commentary:
;;

;;; Code:

(defun user-init-configure-zenburn ()
  "Configure zenburn theme."
  (load-theme 'zenburn t))

(defun user-init-configure-solarized ()
  "Configure solarized theme."
  (load-theme 'solarized-dark)
  (load-theme 'solarized-light))

;;In order to change theme, change initilialization function here.
;; (add-hook 'after-init-hook 'user-init-configure-solarized)
(add-hook 'after-init-hook 'user-init-configure-zenburn)

(message "config theme")
(provide 'user-init-theme)

;;; user-init-theme.el ends here

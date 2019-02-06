;;; user-init-writeroom-mode.el --- Configuration for writeroom mode

;;; Commentary:
;;

;;; Code:

(with-eval-after-load 'writeroom-mode

  (load-theme 'solarized-light)

  (defun my-writeroom-theme (arg)
    (cond
     ((= arg 1)
      (enable-theme 'solarized-light))
     ((= arg -1)
      (disable-theme 'solarized-light))))

  (add-to-list 'writeroom-global-effects #'my-writeroom-theme))

(message "config writeroom-mode")
(provide 'user-init-writeroom-mode)

;;; user-init-company.el ends here

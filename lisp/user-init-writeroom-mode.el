(message "configuring writeroom-mode")

(with-eval-after-load 'writeroom-mode

  ;; switch theme when entering writeroom-mode
  (defun my-writeroom-theme (arg)
    (cond
     ((= arg 1)
      (enable-theme 'solarized-light))
     ((= arg -1)
      (disable-theme 'solarized-light))))

  (add-to-list 'writeroom-global-effects #'my-writeroom-theme))

(provide 'user-init-writeroom-mode)

(message "configuring writeroom-mode")

(with-eval-after-load 'writeroom-mode

  ;; set automatic fullscreen behaviour
  (define-writeroom-global-effect fullscreen 'fullboth)
  
  ;; switch theme when entering writeroom-mode
  (defun my-writeroom-theme (arg)
    (cond
     ((= arg 1)
      (enable-theme 'solarized-light))
     ((= arg -1)
      (disable-theme 'solarized-light))))

  (add-to-list 'writeroom-global-effects 'my-writeroom-theme))

(global-set-key (kbd "C-x w w") 'writeroom-mode)

(provide 'user-init-writeroom-mode)

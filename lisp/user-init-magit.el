(message "configuring magit")

(with-eval-after-load 'magit

  (defun help/magit-kill-buffers ()
    (interactive)
    (let ((buffers (magit-mode-get-buffers)))
      (magit-restore-window-configuration)
      (mapc #'kill-buffer buffers)))

  (define-key magit-status-mode-map (kbd "q") #'help/magit-kill-buffers))

(global-set-key (kbd "C-x g") 'magit-status)

(provide 'user-init-magit)

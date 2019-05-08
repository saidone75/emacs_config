(message "configuring projectile")

(projectile-mode)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))

;; use ag instead of find as generic command
(setq projectile-generic-command "ag -l0")

;(add-hook 'after-init-hook #'projectile-global-mode)

(provide 'user-init-projectile)

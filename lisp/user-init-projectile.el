(message "configuring projectile")

(projectile-mode)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))
;; (add-hook 'after-init-hook #'projectile-global-mode)

(provide 'user-init-projectile)

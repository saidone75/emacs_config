(message "configuring helm-ag")

(setq helm-ag-insert-at-point 'symbol)
(setq helm-ag-fuzzy-match t)

(global-set-key (kbd "C-x c g a") 'helm-do-ag-project-root)
(global-set-key (kbd "C-x c g s") 'helm-do-ag)
(global-set-key (kbd "C-x c g g") 'helm-do-grep-ag)

(provide 'user-init-helm-ag)

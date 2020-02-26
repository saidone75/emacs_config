(message "configuring org-mode")

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

;; set maximum indentation for description lists
(setq org-list-description-max-indent 5)

;; prevent demoting heading also shifting text inside sections
(setq org-adapt-indentation nil)

;; show todo list on startup
(add-hook 'after-init-hook 'org-todo-list)

(provide 'user-init-org-mode)

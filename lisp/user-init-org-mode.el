(message "configuring org-mode")

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; set default capture file
(setq org-default-notes-file (concat org-directory "/refile.org"))

;; save all org buffers every 1 minute before the hour
(run-at-time "00:59" 3600 'org-save-all-org-buffers)

;; set maximum indentation for description lists
(setq org-list-description-max-indent 5)

;; prevent demoting heading also shifting text inside sections
(setq org-adapt-indentation nil)

;; show todo list on startup
(add-hook 'after-init-hook 'org-todo-list)

(provide 'user-init-org-mode)

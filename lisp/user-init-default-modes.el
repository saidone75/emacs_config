(message "configuring default modes")

(global-set-key (kbd "C-x g") 'magit-status)

;; use ibuffer for buffer List
;(global-set-key (kbd "C-x C-b") 'ibuffer)

;; hide menu bar
(menu-bar-mode 0)

;; don't show REPL when first connected
(setq cider-repl-pop-to-buffer-on-connect nil)

(provide 'user-init-default-modes)

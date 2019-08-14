(message "configuring cider")

;; don't show REPL when first connected
(setq cider-repl-pop-to-buffer-on-connect nil)
;; hide *nrepl-connection* and *nrepl-server* from switch-to-buffer list
(setq nrepl-hide-special-buffers t)

(provide 'user-init-cider)


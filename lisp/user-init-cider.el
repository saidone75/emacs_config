(message "configuring cider")

;; don't show REPL when first connected
(setq cider-repl-pop-to-buffer-on-connect nil)

;; hide *nrepl-connection* and *nrepl-server* from switch-to-buffer list
(setq nrepl-hide-special-buffers t)

;; enable cider-mode when entering clojure-mode
(add-hook 'clojure-mode-hook #'cider-mode)

(provide 'user-init-cider)

(message "configuring helm")

(require 'helm-config)
(helm-mode 1)

(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-b") 'helm-buffers-list)
(define-key global-map (kbd "C-x C-o") 'helm-occur)
(define-key global-map (kbd "M-x") 'helm-M-x)

(provide 'user-init-helm)

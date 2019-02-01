(add-hook 'after-init-hook (lambda ()
                             (global-set-key (kbd "C-x g") 'magit-status)))

; use ibuffer for buffer List
(global-set-key (kbd "C-x C-b") 'ibuffer)

; hide menu bar
(menu-bar-mode 0)

(provide 'user-init-default-modes)

(message "configuring auctex")

(setq TeX-PDF-mode t)

(setq TeX-view-program-list '(("Chrome" "google-chrome %o")))
(setq TeX-view-program-selection '((output-pdf "Chrome")))

(provide 'user-init-auctex)

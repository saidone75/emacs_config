(message "loading configuration")

;; set here the needed packages
(defvar user-packages '(clojure-mode
                        cider
                        helm
                        helm-ag
                        projectile
                        helm-projectile
                        magit
                        company
                        paredit
                        rainbow-delimiters
                        zenburn-theme
                        solarized-theme
                        writeroom-mode
                        flycheck-joker
                        ))

(provide 'user-init-config)

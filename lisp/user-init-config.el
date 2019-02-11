(message "loading configuration")

;; set here the needed packages
(defvar user-packages '(clojure-mode
                        cider
                        projectile
                        magit
                        company
                        paredit
                        rainbow-delimiters
                        ag ;; silver searcher support for projectile
                        zenburn-theme
                        solarized-theme
                        writeroom-mode
                        ))

(provide 'user-init-config)

;;; user-init-config.el --- Main emacs configuration file
;;; Commentary:
;;

;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;
;; Dependent packages ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(defvar user-packages '(clojure-mode
                        cider
                        projectile
                        magit
                        company
                        paredit
                        rainbow-delimiters
                        ag ;; silver searcher support for projectile
                        zenburn-theme
                        writeroom-mode
                        ))

(message "load configuration")
(provide 'user-init-config)

;;; user-init-config.el ends here

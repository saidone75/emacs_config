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
                        ag ;; silver searcher support for projectile
                        zenburn-theme
                        ))

(message "load configuration")
(provide 'user-init-config)

;;; user-init-config.el ends here

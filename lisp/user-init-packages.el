(message "configuring packages")

(require 'package)

;; set here the needed packages
(defvar user-packages '(auctex
                        clojure-mode
                        cider
                        flycheck-clj-kondo
                        helm
                        helm-ag
                        projectile
                        helm-projectile
                        magit
                        company
                        paredit
                        rainbow-delimiters
                        org
                        zenburn-theme
                        solarized-theme
                        writeroom-mode
                        web-mode
                        markdown-mode
                        ))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; install packages
(dolist (p user-packages)
  (when (not (package-installed-p p))
    (package-refresh-contents)
    (package-install p)))

(provide 'user-init-packages)

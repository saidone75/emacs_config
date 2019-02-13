(message "configuring packages")

(require 'package)
(require 'user-init-config)

;; package resources
;("gnu" . "http://elpa.gnu.org/packages/")
;("marmalade" . "http://marmalade-repo.org/packages/")
;("melpa" . "http://melpa.milkbox.net/packages/")

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; install packages that are stored in user-packages variable
(dolist (p user-packages)
  (when (not (package-installed-p p))
    (package-refresh-contents)
    (package-install p)))

(provide 'user-init-packages)

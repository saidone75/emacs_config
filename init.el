(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

(require 'user-init)

(provide 'init)

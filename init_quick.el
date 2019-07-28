;; quick startup in terminal
;; alias em='emacs -Q -nw --load ~/.emacs.d/init_quick.el'
(let ((default-directory  "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))
(require 'zenburn-theme)

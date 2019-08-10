;; quick startup in terminal
;; alias em='emacs -Q -nw --load ~/.emacs.d/init_quick.el'

(let ((default-directory  "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))

;; set theme
(require 'zenburn-theme)

;; disable menu bar
(menu-bar-mode -1)

;; set GC threshold to 16 MiB
(setq gc-cons-threshold (expt 2 24))

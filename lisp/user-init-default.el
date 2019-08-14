;; changes on emacs default values
(message "config default")

;; disable toolbar
(tool-bar-mode -1)

;; disable scrollbar
(set-scroll-bar-mode -1)

;; enable narrowing
(put 'narrow-to-region 'disabled nil)

;; enable paren matching mode
(show-paren-mode 1)

;; enable electric pair mode
(electric-pair-mode 1)

;; enable electric indent mode
(electric-indent-mode 1) 

;; set regular-expression mode to string
;(require 're-builder)
;(reb-change-syntax 'string)

;; disable the splash screen
(setq inhibit-splash-screen 1)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; enable highlock mode for all parents
(global-hi-lock-mode 1)

;; set GC threshold to 16 MiB
(setq gc-cons-threshold (expt 2 24))

(provide 'user-init-default)

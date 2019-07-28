;; changes on emacs default values
(message "config default")

;; disable toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode 0))

;; disable scrollbar
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;; enable narrowing
(put 'narrow-to-region 'disabled nil)

;; enable paren matching mode
(show-paren-mode t)

;; enable electric pair mode
(electric-pair-mode t)

;; enable electric indent mode
(electric-indent-mode)

;; set regular-expression mode to string
;(require 're-builder)
;(reb-change-syntax 'string)

;; disable the splash screen
(setq inhibit-splash-screen t)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; set default directory
;(setq default-directory "~/")

;; enable highlock mode for all parents
(global-hi-lock-mode 1)

;; run check-parens after saving any file
(add-hook 'after-save-hook 'check-parens nil t)

;; set GC threshold to 16 MiB
(setq gc-cons-threshold (expt 2 24))

(provide 'user-init-default)

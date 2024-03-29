;; changes on emacs default values
(message "configuring default")

;; disable toolbar
(tool-bar-mode -1)

;; hide menu bar
(menu-bar-mode -1)

;; disable scrollbar
(scroll-bar-mode -1)

;; enable narrowing
(put 'narrow-to-region 'disabled nil)

;; enable paren matching mode
(show-paren-mode 1)

;; enable electric pair mode
(electric-pair-mode 1)

;; enable electric indent mode
(electric-indent-mode 1) 

;; disable the splash screen
(setq inhibit-splash-screen 1)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; enable highlock mode for all parents
(global-hi-lock-mode 1)

;; set GC threshold to 128 MiB
(setq gc-cons-threshold (expt 2 27))

;; set max-specpdl-size
(setq max-specpdl-size 32000)

;; set preferred browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")

;; re-enable some disabled commands
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(provide 'user-init-default)

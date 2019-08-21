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

;; set GC threshold to 64 MiB
(setq gc-cons-threshold (expt 2 26))

;; set preferred browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;; compact mode-line
(defvar mode-line-compact-list
  `((paredit-mode . " π")
    (projectile-mode . " ⁍")
    (company-mode . " 𝍎")
    (helm-mode . " ⎈")
    ;; Major modes
    (lisp-interaction-mode . "λ")
    (emacs-lisp-mode . "EL")
    (clojure-mode . "CLJ")))

(defun compact-mode-line ()
  (interactive)
  (loop for compact in mode-line-compact-list
        do (let* ((mode (car compact))
                  (mode-str (cdr compact))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'compact-mode-line)

(provide 'user-init-default)

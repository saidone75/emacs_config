(message "configuring packages")

;; compact mode-line
(defvar mode-line-compact-list
  `((paredit-mode . " π")
    (projectile-mode . " ⁍")
    (company-mode . " 𝍎")
    (helm-mode . " ⎈")
    ;; Major modes
    (lisp-interaction-mode . "λ")
    (emacs-lisp-mode . "EL")
    (clojure-mode . "CLJ")
    (mu4e-main-mode . "✉M")
    (mu4e-headers-mode . "✉H")
    (mu4e-view-mode . "✉V")
    (mu4e-compose-mode . "✉C")))

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

(provide 'user-init-packages-config)

(message "configuring mu4e")

(require 'mu4e)

(require 'user-init-mu4e-private)

;; spell check
;; (add-hook 'mu4e-compose-mode-hook 'flyspell-mode)

;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)

;; for mbsync
(setq mu4e-change-filenames-when-moving t)

;; path to maildir
(setq mu4e-maildir "~/Maildir")

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it)

;; pick first context by default
(setq mu4e-context-policy 'pick-first)

;; compose without asking context
;; (setq mu4e-compose-context-policy nil)

;; no automatic signature
(setq mu4e-compose-signature-auto-include nil)

;; don't save message to Sent messages
;;(setq mu4e-sent-messages-behavior 'delete)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "mbsync -aVX")

(setq mu4e-update-interval 1800)

;; (setq mu4e-html2text-command "w3m -T text/html")
(setq mu4e-html2text-command 'mu4e-shr2text)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; view message in browser by typing 'aV'
(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(global-set-key (kbd "C-c m n") 'mu4e)
(global-set-key (kbd "C-c m u") 'mu4e-update-mail-and-index)
(setq mu4e-hide-index-messages t)

;; load org-mu4e -- installed manually, not through MELPA
(load "org-mu4e")

(require 'org-mu4e)

;; turn off colors for message preview
(require 'mu4e-contrib)
(setq shr-color-visible-luminance-min 60)
(setq shr-color-visible-distance-min 5)
(setq shr-use-colors nil)
(advice-add #'shr-colorize-region :around (defun shr-no-colourise-region (&rest ignore)))

;; customize headers fields
(setq mu4e-headers-time-format "%T")
(setq mu4e-headers-fields
      '((:human-date . 12)
        (:flags . 4)
        (:from-or-to . 20)
        (:subject . nil)))

;; remove underline from headers view
(set-face-attribute 'mu4e-header-highlight-face nil :underline nil)

;; custom context label
(defun mu4e-context-label ()
  (if (mu4e-context-current)
      (concat "[" (propertize (mu4e~quote-for-modeline
                               (substring (mu4e-context-name (mu4e-context-current)) 2))
                              'face 'mu4e-context-face) "]") ""))

;; d move to trash only without marking for deletion
(setf (alist-get 'trash mu4e-marks)
      (list :char '("d" . "▼")
            :prompt "dtrash"
            :dyn-target (lambda (target msg)
                          (mu4e-get-trash-folder msg))
            :action (lambda (docid msg target)
                      (mu4e~proc-move docid (mu4e~mark-check-target target) "+S-u-N"))))

;; remove attachment
(defun my-remove-attachment (msg num)
  "Remove attachment."
  (let* ((attach (mu4e~view-get-attach msg num))
         (path (mu4e-msg-field msg :path))
         (filename (and attach (plist-get attach :name)))
         (cmd (format "altermime --input='%s' --remove='%s'"  path filename)))
    (when (and filename
               (yes-or-no-p
                (format "Are you sure you want to remove '%s'?" filename)))
      (shell-command cmd)
      (message cmd))))

(add-to-list 'mu4e-view-attachment-actions
             '("remove-attachment" . my-remove-attachment))

;; fix wrong file name
(defun mu4e-news ()
  "Show the mu4e 'about' page."
  (interactive)
  (mu4e-info (concat mu4e-doc-dir "/NEWS.org.gz")))

;; number of lines to show in headers
(setq mu4e-headers-visible-lines 20)

;; highlight color
;; (add-hook 'mu4e-headers-mode-hook
;;           (lambda ()
;;             (set-face-background 'mu4e-header-highlight-face "#4F4F4F")))

(setq epa-pinentry-mode 'loopback)

;; don't ask to quit
(setq mu4e-confirm-quit nil)

(provide 'user-init-mu4e)

(message "configuring mu4e-alert")

(require 'user-init-mu4e-private)

(defun mu4e-alert-write-unread-mail-count ()
  (mu4e-alert--get-mu-unread-mails (lambda (mails)
                                     (with-temp-file "~/.unread-mail-count" (insert (int-to-string (length mails)))))))                                      

(add-hook 'after-init-hook #'mu4e-alert-write-unread-mail-count) 
(add-hook 'mu4e-view-mode-hook #'mu4e-alert-write-unread-mail-count)
(add-hook 'mu4e-index-updated-hook #'mu4e-alert-write-unread-mail-count)
(add-hook (if (boundp 'mu4e-message-changed-hook)
              'mu4e-message-changed-hook
            'mu4e-msg-changed-hook)
          #'mu4e-alert-write-unread-mail-count)

(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

(provide 'user-init-mu4e-alert)

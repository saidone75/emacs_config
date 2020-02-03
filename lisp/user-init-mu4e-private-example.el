;; contexts
(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "a saidone@example.com"
           :enter-func (lambda () (mu4e-message "entering saidone@example.com context"))
           :leave-func (lambda () (mu4e-message "leaving saidone@example.com context"))
           ;; match based on the maildir of the message
           :match-func (lambda (msg)
                         (when msg
                           (string-prefix-p "/saidone" (mu4e-message-field msg :maildir))))
           :vars '( ( user-mail-address . "saidone@example.com" )
                    ( smtpmail-smtp-user . "saidone" )
                    ( smtpmail-smtp-server . "smtp.example.com" )
                    ( user-full-name . "Saidone" )
                    ( mu4e-sent-folder . "/saidone/Sent" )
                    ( mu4e-trash-folder . "/saidone/Trash" )
                    ( mu4e-refile-folder . "/saidone/Archives" )
                    ( mu4e-drafts-folder . "/saidone/Drafts" )
                    ))
         ,(make-mu4e-context
           :name "b saidone@me.com"
           :enter-func (lambda () (mu4e-message "entering saidone@me.com context"))
           :leave-func (lambda () (mu4e-message "leaving saidone@me.com context"))
           ;; match based on the maildir of the message
           :match-func (lambda (msg)
                         (when msg
                           (string-prefix-p "/saidone-me" (mu4e-message-field msg :maildir))))
           :vars '( ( user-mail-address . "saidone@me.com" )
                    ( smtpmail-smtp-user . "saidone@me.com" )
                    ( smtpmail-smtp-server . "smtp.me.com" )
                    ( user-full-name . "Saidone" )
                    ( mu4e-sent-folder . "/saidone-me/Sent" )
                    ( mu4e-trash-folder . "/saidone-me/Trash" )
                    ( mu4e-drafts-folder . "/saidone-me/Drafts" )
                    ))))

;; shortcuts
(setq mu4e-maildir-shortcuts
      '(
        ("/saidone/INBOX" . ?h)
        ("/saidone-me/INBOX" . ?g)
        ))

;; bookmarks
(setq mu4e-bookmarks
      `( ,(make-mu4e-bookmark
           :name  "Unread messages"
           :query (concat
                   "flag:unread maildir:\"/saidone/INBOX\""
                   " OR "
                   "flag:unread maildir:\"/saidone-me/INBOX\"")
           :key ?u)
         ,(make-mu4e-bookmark
           :name "Today's messages"
           :query (concat
                   "date:today..now maildir:\"/saidone/INBOX\""
                   " OR "
                   "date:today..now maildir:\"/saidone-me/INBOX\"")
           :key ?t)
         ,(make-mu4e-bookmark
           :name "Last 7 days"
           :query (concat
                   "date:7d..now maildir:\"/saidone/INBOX\""
                   " OR "
                   "date:7d..now maildir:\"/saidone-me/INBOX\"")
           :key ?w)
         ,(make-mu4e-bookmark
           :name "Flagged in INBOX"
           :query (concat
                   "flag:flagged maildir:\"/saidone/INBOX\""
                   " OR "
                   "flag:flagged maildir:\"/saidone-me/INBOX\"") 
           :key ?f)))

(setq mu4e-alert-interesting-mail-query
      (concat
       "flag:unread maildir:/saidone/INBOX"
       " OR "
       "flag:unread maildir:/saidone-me/INBOX"
       ))

(provide 'user-init-mu4e-private)

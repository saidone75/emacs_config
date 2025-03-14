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

(setq temporary-file-directory "~/snap/chromium/")

;; view message in browser by typing 'aV'
(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(global-set-key (kbd "C-c m n") 'mu4e)
(global-set-key (kbd "C-c m u") 'mu4e-update-mail-and-index)
(setq mu4e-hide-index-messages t)

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
                      (mu4e--server-move docid (mu4e--mark-check-target target) "+S-u-N"))))

;; c copy message to another folder
;; see also https://emacs.stackexchange.com/questions/25012/how-can-i-copy-an-email-message-in-mu4e
(defun my~mark-get-copy-target ()
  "Ask for a copy target, and propose to create it if it does not exist."
  (interactive)
  (let* ((target (mu4e-ask-maildir "Copy message to: "))
         (target (if (string= (substring target 0 1) "/")
                     target
                   (concat "/" target)))
         (fulltarget (concat mu4e-maildir target)))
    (when (or (file-directory-p fulltarget)
              (and (yes-or-no-p
                    (format "%s does not exist.  Create now?" fulltarget))
                   (mu4e-proc-mkdir fulltarget)))
      target)))
(defun copy-message-to-target(docid msg target)
  (let ((new_msg_path nil) ;; local variable
        (msg_flags (mu4e-message-field msg :flags)))
    (setq new_msg_path (format "%s/%s/cur/%s" mu4e-maildir target (mu4e~draft-message-filename-construct
                                                                   (mu4e-flags-to-string msg_flags))))
    (copy-file (mu4e-message-field msg :path) new_msg_path)
    (mu4e~proc-add new_msg_path (mu4e~mark-check-target target))))
(add-to-list 'mu4e-marks
             '(copy
               :char ("c" . "c")
               :prompt "copy"
               :ask-target  my~mark-get-copy-target
               :action copy-message-to-target))
(mu4e~headers-defun-mark-for copy)
(define-key mu4e-headers-mode-map (kbd "c") 'mu4e-headers-mark-for-copy)

;; remove attachment
(defun my-remove-attachment (msg num)
  "Remove attachment."
  (let* ((attach (mu4e~view-get-attach msg num))
         (path (mu4e-msg-field msg :path))
         (filename (and attach (plist-get attach :name)))
         (cmd (format "altermime --input='%s' --remove='%s'" path filename)))
    (when (and filename
               (yes-or-no-p
                (format "Are you sure you want to remove '%s'?" filename)))
      (shell-command cmd)
      (message cmd))))

(add-to-list 'mu4e-view-mime-part-actions
             '("remove-attachment" . my-remove-attachment))

;; remove all attachments
(defun my-remove-all-attachment (msg num)
  "Remove all attachments."
  (let* ((path (mu4e-msg-field msg :path))
         (cmd (format "altermime --input='%s' --removeall" path)))
    (when (yes-or-no-p
           (format "Are you sure you want to remove all attachments from '%s'?" msg))
      (shell-command cmd)
      (message cmd))))

(add-to-list 'mu4e-view-mime-part-actions
             '("remove-all-attachments" . my-remove-all-attachments))

;; number of lines to show in headers
(setq mu4e-headers-visible-lines 20)

;; include related
(setq mu4e-headers-include-related nil)

;; headers max results
(setq mu4e-headers-results-limit 2000)

;; highlight color
(add-hook 'mu4e-headers-mode-hook
          (lambda ()
            (set-face-background 'mu4e-header-highlight-face "#4F4F4F")))

(setq epa-pinentry-mode 'loopback)

;; don't ask to quit
(setq mu4e-confirm-quit nil)

;; unread messages
(setq unread-messages-query (format "%s OR %s"
                                    "flag:unread maildir:'/saidone-kugelmass-local/INBOX'"
                                    "flag:unread maildir:'/saidone75-gmail-local/INBOX'"))

(defun get-unread-mail-count ()
  (let* ((command (concat mu4e-mu-binary " msgs-count -- --query='" unread-messages-query "'")))
    (string-trim (shell-command-to-string command))))

(defun write-unread-mail-count ()
  (with-temp-file "~/.unread-mail-count" (insert (get-unread-mail-count))))

(add-hook 'after-init-hook #'write-unread-mail-count) 
(add-hook 'mu4e-view-mode-hook #'write-unread-mail-count)
(add-hook 'mu4e-index-updated-hook #'write-unread-mail-count)

(provide 'user-init-mu4e)

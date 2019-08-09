(message "configuring flycheck-joker")

(require 'flycheck)

(flycheck-define-checker clojure-joker
                         "A Clojure syntax checker using Joker.
  See URL `https://github.com/candid82/joker'."
                         :command ("joker" "--lint" "-")
                         :standard-input t
                         :error-patterns
                         ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
                          (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
                         :modes (clojure-mode clojurec-mode)
                         :predicate (lambda () (not (string= "edn" (file-name-extension (buffer-file-name))))))

(flycheck-define-checker clojurescript-joker
                         "A ClojureScript syntax checker using Joker.
  See URL `https://github.com/candid82/joker'."
                         :command ("joker" "--lintcljs" "-")
                         :standard-input t
                         :error-patterns
                         ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
                          (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
                         :modes (clojurescript-mode))

(flycheck-define-checker edn-joker
                         "EDN syntax checker using Joker.
  See URL `https://github.com/candid82/joker'."
                         :command ("joker" "--lintedn" "-")
                         :standard-input t
                         :error-patterns
                         ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
                          (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
                         :modes (clojure-mode clojurec-mode)
                         :predicate (lambda () (string= "edn" (file-name-extension (buffer-file-name)))))

(add-to-list 'flycheck-checkers 'clojure-joker)
(add-to-list 'flycheck-checkers 'clojurescript-joker)
(add-to-list 'flycheck-checkers 'edn-joker)

(add-hook 'clojure-mode-hook 'flycheck-mode)

(provide 'user-init-flycheck-joker)

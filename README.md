# My GNU Emacs config

`$ git clone https://github.com/saidone75/emacs_config.git ~/.emacs.d`

How to add packages:
- add package name to the list named `user-packages` contained in `lisp/user-init-packages.el` 
```clojure
;; set here the needed packages
(defvar user-packages '(clojure-mode
                        cider
                        ...
                        zenburn-theme
                        ))
```                     
- create (if needed) a new config file for the package named `lisp/user-init-$PACKAGE_NAME.el`
```clojure
(message "configuring $PACKAGE_NAME")

...

(provide 'user-init-$PACKAGE_NAME)
```
- load config file from `lisp/user-init.el`
```clojure
(require 'user-init-$PACKAGE_NAME)
```

## License
Copyright (c) 2020-2022 Saidone

Distributed under the MIT License

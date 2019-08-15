# My GNU Emacs config

`$ git clone https://github.com/saidone75/emacs_config.git ~/.emacs.d`

How to add packages:
- add package name to `user-packages` list contained in `lisp/user-init-packages.el` 
```clojure
;; set here the needed packages
(defvar user-packages '(clojure-mode
                        cider
                        ...
                        zenburn-theme
                        ))
```
                        
- create (if needed) a new config file for the package named `lisp/user-init-$PACKAGE_NAME.el`
- load config file from `lisp/user-init.el`

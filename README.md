# My GNU Emacs config

`$ git clone https://github.com/saidone75/emacs_config.git ~/.emacs.d`

How to add a package:

- add package name to `user-packages` list contained in `lisp/user-init-packages.el`
- create (if needed) a new config file for the package named `lisp/user-init-$PACKAGE_NAME.el`
- load config file from `lisp/user-init.el`

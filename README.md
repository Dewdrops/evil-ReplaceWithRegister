evil-replace-with-register
============

Port of [ReplaceWithRegister](http://www.vim.org/scripts/script.php?script_id=2703).

Default bindings
--------

`["x]gR{motion}` (evil-replace-with-register)

Replacing an existing text with the contents of register x.

Installation
------------

```lisp
(require 'evil-replace-with-register)
;; change default key bindings (if you want) HERE
;; (setq evil-replace-with-register-key (kbd "gr"))
(evil-replace-with-register-install)
```

Customization
-------

You can change the default bindings by customizing `evil-replace-with-register-key` BEFORE `evil-replace-with-register-install` is called.


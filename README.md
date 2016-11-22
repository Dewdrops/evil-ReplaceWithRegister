evil-ReplaceWithRegister
============

Port of [ReplaceWithRegister](http://www.vim.org/scripts/script.php?script_id=2703).

Default bindings
--------

`["x]gR{motion}` (evil-ReplaceWithRegister)

Replacing an existing text with the contents of register x.

Installation
------------

```lisp
(require 'evil-replace-with-register)
;; change default key bindings (if you want) HERE
;; (setq evil-ReplaceWithRegister-key (kbd "gr"))
(evil-ReplaceWithRegister-install)
```

Customization
-------

You can change the default bindings by customizing `evil-ReplaceWithRegister-key` BEFORE `evil-ReplaceWithRegister-install` is called.


(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/undo-tree")
(add-to-list 'load-path "~/.emacs.d/goto-chg")
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

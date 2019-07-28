(add-to-list 'default-frame-alist '(font . "mononoki-11"))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)
(setq show-paren-delay 0)
(show-paren-mode 1)

(load-theme 'solarized-light t)

(require 'which-key)
(which-key-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'visuals)

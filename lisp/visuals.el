(add-to-list 'default-frame-alist '(font . "mononoki-11"))
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 180))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)
(setq show-paren-delay 0)
(show-paren-mode 1)

(load-theme 'solarized-light t)

(use-package which-key
  :config
  (which-key-mode))

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'visuals)

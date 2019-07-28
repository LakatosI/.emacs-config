(use-package evil
  :init
  (setq evil-want-C-i-jump nil)
  :config
  
  (evil-mode 1))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package evil-escape
  :after evil
  :config
  (setq evil-escape-delay 0.3)
  (setq evil-escape-key-sequence "jk")
  (evil-escape-mode 1))
  


(provide 'vimification)

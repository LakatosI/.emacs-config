(require 'evil)
(setq evil-want-C-i-jump nil)
(evil-mode 1)

(require 'evil-escape)

(setq evil-escape-delay 0.3)
(setq evil-escape-key-sequence "jk")
(evil-escape-mode 1)


(require 'undo-tree)
(global-undo-tree-mode)


(provide 'vimification)

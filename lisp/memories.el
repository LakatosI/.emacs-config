(use-package recentf
  :config
  (setq recentf-save-file (ill-local-file "recentf"))
  (setq recentf-max-menu-items 25)
  (recentf-mode 1))

(provide 'memories)

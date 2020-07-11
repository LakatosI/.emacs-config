
;; Ensure everything is okay on a mac

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
  
;;; Setup folder for instance-local files, caches, customizations, etc, that don't belong in
;;; the repo
(if (not (file-exists-p (ill-local-file "")))
    (make-directory (ill-local-file "")))

(setq custom-file (ill-local-file "custom.el"))

(setq auto-save-list-file-prefix (ill-local-file  "auto-save-list" "saves-"))
(setq eshell-directory-name (ill-local-file "eshell"))
(setq bookmark-default-directory (ill-local-file "eshell"))

(setq backup-directory-alist `(("." . ,(ill-local-file "backups"))))

(provide 'ill/environment)


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
(load custom-file)

(setq auto-save-list-file-prefix (ill-local-file  "auto-save-list" "saves-"))
(setq eshell-directory-name (ill-local-file "eshell"))
(setq bookmark-default-directory (ill-local-file "eshell"))

(setq backup-directory-alist `(("." . ,(ill-local-file "backups"))))

(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms `((".*" ,(ill-local-file "auto-save-list") t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome in Emacs") ; print a default message in the empty scratch buffer opened at startup


(provide 'ill/environment)

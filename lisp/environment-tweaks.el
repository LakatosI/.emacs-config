;; Ensure everything is okay on a mac
(require 'exec-path-from-shell)

(when (memq window-system '(mac ns x))
      (exec-path-from-shell-initialize))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))


;;

;;; Setup folder for instance-local files, caches, customizations, etc, that don't belong in
;;; the repo
(if (not (file-exists-p (ill-local-file "")))
    (make-directory (ill-local-file "")))

(setq custom-file (ill-local-file "custom.el"))
(require 'recentf)
(setq recentf-save-file (ill-local-file "recentf"))
(setq auto-save-list-file-prefix (ill-local-file  "auto-save-list" "saves-"))
(setq eshell-directory-name (ill-local-file "eshell"))
(setq bookmark-default-directory (ill-local-file "eshell"))

(setq backup-directory-alist `(("." . ,(ill-local-file "backups"))))
(setq package-user-dir (ill-local-file "elpa"))

;;; Setup package
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "https://orgmode.org/elpa/")
			("gnu"   . "https://elpa.gnu.org/packages/")
			("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(require 'use-package)

(provide 'environment-tweaks)

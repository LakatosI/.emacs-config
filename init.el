(setq load-path (cons (concat (file-name-as-directory user-emacs-directory) "lisp") load-path))
(load "ill")

(if (not (file-exists-p (ill-local-file "")))
    (make-directory (ill-local-file "")))

(setq custom-file (ill-local-file "custom.el"))
(setq recentf-save-file (ill-local-file "recentf"))
(setq auto-save-list-file-prefix (ill-local-file  "auto-save-list" "saves-"))

(setq backup-directory-alist `(("." . ,(ill-local-file "backups"))))
(setq package-user-dir (ill-local-file "elpa"))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
			("gnu"   . "http://elpa.gnu.org/packages/")
			("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Bootstrap 'use-package'

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'org)

(org-babel-load-file (ill-init-file "README.org"))
(delete-file (ill-init-file "README.el"))

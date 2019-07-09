;;; ill-init --- My init file

;;; Commentary:
;;; This is a back-to-basics version of my init file, consisting of a simple .el, .org, and some utility
;;; libraries

;;; Code:

;; Start emacs in server mode
(require 'server)
;; Start a server if (server-running-p) does not return t (e.g. if it
;; returns nil or :other)
(or (eq (server-running-p) t)
    (server-start))

;;; Load my utility library
(setq load-path (cons (concat (file-name-as-directory user-emacs-directory) "lisp") load-path))
(require 'ill)

;;; Setup folder for instance-local files, caches, customizations, etc, that don't belong in
;;; the repo
(if (not (file-exists-p (ill-local-file "")))
    (make-directory (ill-local-file "")))

(setq custom-file (ill-local-file "custom.el"))
(defvar recentf-save-file)
(setq recentf-save-file (ill-local-file "recentf"))
(setq auto-save-list-file-prefix (ill-local-file  "auto-save-list" "saves-"))
(setq eshell-directory-name (ill-local-file "eshell"))
(setq bookmark-default-directory (ill-local-file "eshell"))

(setq backup-directory-alist `(("." . ,(ill-local-file "backups"))))
(setq package-user-dir (ill-local-file "elpa"))

;;; Setup package
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
			("gnu"   . "http://elpa.gnu.org/packages/")
			("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'org)
(org-babel-load-file (ill-init-file "README.org"))
(delete-file (ill-init-file "README.el"))

(provide 'init)
;;; init.el ends here


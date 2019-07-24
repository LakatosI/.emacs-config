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
(add-to-list 'load-path (concat (file-name-as-directory user-emacs-directory) "lisp"))
(require 'ill)
(require 'info)
(add-to-list 'Info-additional-directory-list (ill-init-file "docs"))



(add-to-list 'load-path (ill-init-file "external"))
(add-to-list 'load-path (ill-init-file "external/evil-1.2.14"))
(require 'evil)
(evil-mode 1)



(require 'undo-tree)
(global-undo-tree-mode)

(when (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil))

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

;; (package-initialize)

;; ;;; Bootstrap 'use-package'
;; (unless (package-installed-p 'use-package)
;;     (package-refresh-contents)
;;     (package-install 'use-package))

;; (use-package evil
;; 	     :ensure t)

;; (require 'org)
;; ;(org-babel-load-file (ill-init-file "README.org"))
;; ;(delete-file (ill-init-file "README.el"))

(global-set-key (kbd "<C-tab>") 'complete-symbol)

(global-set-key (kbd "C-x C-n") 'other-window)

(defun other-window-backward (&optional n)
  "Select the previous windew"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(other-window-backward)

;Need to change this to make it work with evil
(global-set-key (kbd "C-x C-p") 'other-window-backward)


(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

(defun scroll-one-line-ahead ()
  "Scrolls ahead 1 line."
  (interactive)
  (scroll-ahead 1))

(defun scroll-one-line-behind ()
  "Scrolls ahead 1 line."
  (interactive)
  (scroll-behind 1))

(global-set-key (kbd "C-'") 'scroll-one-line-behind)
(global-set-key (kbd "C-;") 'scroll-one-line-behind)

(defun read-only-if-symlink ()
  "Sets buffer to read-only if file is a symlink" 
  (if (file-symlink-p buffer-file-name)
      (progn (setq buffer-read-only t)
	     (message "File is a symlink!"))))
(add-hook 'find-file-hooks 'read-only-if-symlink)
  
(defun visit-target-instead ()
  "Replace the buffer with a buffer visiting the link target."
  (interactive)
  (if buffer-file-name
      (let ((target (file-symlink-p buffer-file-name)))
	(if target
	    (find-alternate-file target)
	  (error "Not viziting a symlink")))
    (error "Not viziting a file")))

(defun clobber-symlink ()
  "Replace symlink with a copy of the link target"
  (interactive)
  (if buffer-file-name
      (let ((target (file-symlink-p buffer-file-name)))
	(if target
	    (if (yes-or-no-p (format "Replace %s with %s"
				     buffer-file-name
				     target))
		(progn
		  (delete-file buffer-file-name)
		  (write-file buffer-file-name)))
	  (error "Not viziting a symlink")))
    (error "Not viziting a file")))
	      
  



(provide 'init)
;;; init.el ends here


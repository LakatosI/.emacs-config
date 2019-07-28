;;; ill-init --- My init file

;;; Commentary:
;;; This is a back-to-basics version of my init file, consisting of a simple .el, .org, and some utility
;;; libraries

;;; Code:

;; Start emacs in server mode

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'server)
;; Start a server if (server-running-p) does not return t (e.g. if it
;; returns nil or :other)
(or (eq (server-running-p) t)
    (server-start))


;;; Load my utility library
(add-to-list 'load-path (concat (file-name-as-directory user-emacs-directory) "lisp"))
(require 'ill)

(require 'my-externals)

(require 'documentation)
(require 'environment-tweaks)

(require 'memories)
(require 'vimification)
(require 'visuals)

(require 'ivy)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(ivy-mode 1)

(require 'counsel)
(require 'swiper)
(global-set-key "\C-s" 'swiper)



;(require 'learning-elisp)
(provide 'init)
;;; init.el ends here


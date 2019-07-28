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
(add-to-list 'load-path (concat (file-name-as-directory user-emacs-directory) "lisp"))
(require 'ill)

(require 'my-externals)
(require 'environment-tweaks)
(require 'documentation)
(require 'memories)
(require 'vimification)
(require 'visuals)

(use-package ivy
  :commands ivy-mode
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1))

(use-package counsel)
(use-package swiper
  :config
  (global-set-key "\C-s" 'swiper))

;(require 'learning-elisp)
(provide 'init)
;;; init.el ends here


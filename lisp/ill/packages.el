(setq package-user-dir (ill-local-file "elpa"))

;;; Setup package
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "https://orgmode.org/elpa/")
			("gnu"   . "https://elpa.gnu.org/packages/")
			("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(require 'use-package)

(provide 'ill/packages)

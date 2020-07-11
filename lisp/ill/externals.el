(add-to-list 'custom-theme-load-path (ill-init-file "external/solarized-emacs-1.3.0"))

(add-to-list 'load-path (ill-init-file "external"))



(defvar my-externals-list ()
  "A list of folders from \"external\" to add to the loadpath during init")

(setq my-externals-list '(
			  "evil-1.2.14"
			  "exec-path-from-shell-1.12"
			  "solarized-emacs-1.3.0"
			  "emacs-which-key-3.3.1"
			  "evil-escape-3.14"
			  "swiper-0.12.0"
			  "use-package-2.4"
			  "yasnippet-0.13.0"
			  "rust-mode-0.4.0"
			  "company-mode-0.9.10"
			  "lsp-mode-6.0"
			  ))

(dolist (external my-externals-list load-path)
  (add-to-list 'load-path (ill-init-file "external" external)))
	


(provide 'ill/externals)

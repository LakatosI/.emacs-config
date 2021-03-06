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
			  "company-20200616.2354"
			  "lsp-mode-6.0"
			  "general-20200516.50"
			  "which-key-20200702.219"
			  "avy-20200624.1148"
			  "ace-window-20200606.1259"
			  ))

(dolist (external my-externals-list load-path)
  (add-to-list 'load-path (ill-init-file "external" external)))
	


(provide 'ill/externals)

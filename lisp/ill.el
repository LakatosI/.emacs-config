(defun ill-init-file (&rest path-components)
  "Returns a path to a file localized in the user's emacs directory"
  (directory-file-name (mapconcat 'file-name-as-directory (cons user-emacs-directory path-components) "")))

(defun ill-local-file (&rest file-name)
    (apply 'ill-init-file  ".local"  file-name))

(provide 'ill)

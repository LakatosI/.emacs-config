(defun ill/compose-file-path (&rest path-components)
  "Return a path to a file composed from individual components"
  (expand-file-name (directory-file-name (mapconcat 'file-name-as-directory path-components ""))))
(defun ill-init-file (&rest path-components)
  "Returns a path to a file localized in the user's emacs directory"
  (apply 'ill/compose-file-path (cons user-emacs-directory path-components)))

(defun ill-local-file (&rest file-name)
    (apply 'ill-init-file  ".local"  file-name))

(provide 'ill/files)

(defun ill/bazel--generate-compile-commands ()
  "Function runs bazel command to regenerate compile_command.json for ILL workspace"
  (let ((default-directory (projectile-project-root)))
    (when default-directory
      (save-window-excursion
	(shell-command "bazel build //tools/...")))))

(defun ill/bazel-gen-compile-commands ()
  "Command to generate compile_commands.json for ILL project"
  (interactive)
  (let ((in-project-query (projectile-project-root))
	(ill-project-query (file-exists-p (ill/compose-file-path (projectile-project-root) ".ill_workspace"))))
    (when (and in-project-query ill-project-query)
      (ill/bazel--generate-compile-commands)
      (lsp-foreach-workspace
       (lsp-workspace-restart it)))))

(provide 'ill/bazel)

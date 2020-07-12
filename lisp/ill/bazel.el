(defun ill/bazel--generate-compile-commands ()
  "Function runs bazel command to regenerate compile_command.json for ILL workspace"
  (let ((default-directory (projectile-project-root)))
    (when default-directory
      (save-window-excursion
	(shell-command "bazel build //tools/...")))))

(defun ill/bazel-gen-compile-commands ()
  "Command to generate compile_commands.json for ILL project"
  (interactive)
  (ill/bazel--generate-compile-commands)
  (lsp-foreach-workspace
   (lsp-workspace-restart it))
  )

(provide 'ill/bazel)

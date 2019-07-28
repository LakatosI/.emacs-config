

(defun other-window-backward (&optional n)
  "Select the previous windew"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(other-window-backward)

;Need to change this to make it work with evil
(global-set-key (kbd "C-x C-p") 'other-window-backward)
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
	      
  
(provide 'learning-elisp)

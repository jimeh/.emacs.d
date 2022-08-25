;;; siren-reopen.el --- jimeh's Emacs Siren: reopen helpers.

;;; Commentary:

;; Helper function to reopen buffers.

;;; Code:

(defun siren-reopen ()
  "Reopen current buffer.

If the current buffer is backed by a readable file, it will kill
the buffer, and reopen the file.

If current buffer is the *scratch* buffer, it will create a new scratch buffer."
  (interactive)
  (cond (buffer-file-name (siren-reopen--current-file))
        ((string= (buffer-name) "*scratch*") (siren-reopen--scratch-buffer))))

(defun siren-reopen--current-file ()
  "Reopen the current file."
  (interactive)
  (let ((filename buffer-file-name))
    (if (not (file-readable-p filename))
        (message "Buffer is not visiting a readable file!")
      (kill-buffer)
      (find-file filename))))

(defun siren-reopen--scratch-buffer ()
  "Reopen the *scratch* buffer."
  (interactive)
  (let ((buffer (get-buffer "*scratch*")))
    (when (and buffer (not (buffer-file-name buffer)))
      (with-current-buffer buffer
        (kill-buffer))
      (scratch-buffer))))

(provide 'siren-reopen)
;;; siren-reopen.el ends here

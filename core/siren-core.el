;;; siren-core.el --- jimeh's Emacs Siren: Core Siren functions.

;;; Commentary:

;; Core Siren functions used a bit all over the place. Some of them shamelessly
;; ripped from Emacs Prelude.

;;; Code:

(defun siren-add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (string-prefix-p "." f)))
        (add-to-list 'load-path name)
        (siren-add-subfolders-to-load-path name)))))

(defun siren-smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun siren-wrap-with (s)
  "Create a wrapper function for smartparens using S."
  `(lambda (&optional arg)
     (interactive "P")
     (sp-wrap-with-pair ,s)))

(defun siren-align-region-to-equals (begin end)
  "Align region (specified with BEGIN and END) to equal signs."
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

(defun siren-align-region-to-opening-brace (begin end)
  "Align region (specified with BEGIN and END) to equal opening brace."
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\){" 1 1 ))

(defun siren-yank-pop-forwards (arg)
  "Yank pop in reverse."
  (interactive "p")
  (yank-pop (- arg)))

(defun siren-other-window-reverse ()
  "Switch to the previous window."
  (interactive)
  (other-window -1))

(defun siren-rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting.

Borrowed from: http://emacsredux.com/blog/2013/05/04/rename-file-and-buffer/"
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)))))))

(defun siren-ignore-error-wrapper (fn)
  "Funtion return new function that ignore errors.
   The function wraps a function with `ignore-errors' macro."
  (lexical-let ((fn fn))
    (lambda ()
      (interactive)
      (ignore-errors (funcall fn)))))

(provide 'siren-core)
;;; siren-core.el ends here

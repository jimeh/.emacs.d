(defun customizations-for-dired-mode ()
  (interactive)
  (linum-mode t)
  (define-key dired-mode-map (kbd "c") 'dired-create-directory)
  (when (require 'dired+ nil 'noerror)
    (toggle-diredp-find-file-reuse-dir 1)))

(add-hook 'dired-mode-hook 'customizations-for-dired-mode)

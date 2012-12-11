(defun customizations-for-dired-mode ()
  (interactive)
  (define-key dired-mode-map (kbd "c") 'dired-create-directory)
)

(add-hook 'dired-mode-hook 'customizations-for-dired-mode)

(defun customizations-for-ack-mode ()
  (interactive)
  (define-key ack-mode-map (kbd "q") 'kill-this-buffer))

(add-hook 'ack-mode-hook 'customizations-for-ack-mode)

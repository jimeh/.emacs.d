;; Make Magit look a bit prettier with my theme
(defun customizations-for-magit-mode ()
  (interactive)
  (linum-mode t))

(add-hook 'magit-mode-hook 'customizations-for-magit-mode)

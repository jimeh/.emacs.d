;; Make Magit look a bit prettier with my theme
(defun customizations-for-magit-mode ()
  (interactive)
  (linum-mode t))

(add-hook 'magit-mode-hook 'customizations-for-magit-mode)

;; Write commit messages in style
(defun customizations-for-magit-log-edit-mode ()
  (interactive)
  (flyspell-mode)
  (linum-mode t)
  (auto-fill-mode)
  (setq fill-column 72)
  (fci-mode))

(add-hook 'magit-log-edit-mode-hook 'customizations-for-magit-log-edit-mode)

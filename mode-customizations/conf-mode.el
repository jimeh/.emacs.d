(defun customizations-for-conf-mode ()
  (interactive)
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (auto-complete-mode))

(add-hook 'conf-mode-hook 'customizations-for-conf-mode)

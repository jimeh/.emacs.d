(defun customizations-for-makefile-mode ()
  (interactive)
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (setq tab-width 4)
  (highlight-indentation-mode))

(add-hook 'makefile-mode-hook 'customizations-for-makefile-mode)

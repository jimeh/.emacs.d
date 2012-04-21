(defun customizations-for-sh-mode ()
  (interactive)
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (highlight-indentation-mode))

(add-hook 'sh-mode-hook 'customizations-for-sh-mode)

(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(defun customizations-for-php-mode ()
  (interactive)
  (setq whitespace-action (quote (auto-cleanup)))
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (highlight-indentation-mode))

(add-hook 'php-mode-hook 'customizations-for-php-mode)

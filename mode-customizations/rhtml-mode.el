(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

(defun customizations-for-rhtml-mode ()
  (interactive)
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (setq tab-width 2)
  (setq highlight-indentation-offset 2)
  (highlight-indentation-mode))

(add-hook 'rhtml-mode-hook 'customizations-for-rhtml-mode)

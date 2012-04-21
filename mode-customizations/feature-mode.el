(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))

(defun customizations-for-feature-mode ()
  (interactive)
  (setq whitespace-action (quote (auto-cleanup)))
  (flyspell-mode)
  (linum-mode t)
  (fci-mode)
  (setq highlight-indentation-offset 2)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode))

(add-hook 'feature-mode-hook 'customizations-for-feature-mode)

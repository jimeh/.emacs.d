(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun customizations-for-coffee-mode ()
  (interactive)
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (setq tab-width 2)
  (setq highlight-indentation-offset 2)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode))

(add-hook 'coffee-mode-hook 'customizations-for-coffee-mode)

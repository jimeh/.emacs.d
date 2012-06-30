(defun customizations-for-lisp-mode ()
  (interactive)
  (setq whitespace-action (quote (auto-cleanup)))
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode))

(add-hook 'lisp-mode-hook 'customizations-for-lisp-mode)

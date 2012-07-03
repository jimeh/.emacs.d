(defun customizations-for-emacs-lisp-mode ()
  (interactive)
  (setq whitespace-action (quote (auto-cleanup)))
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (auto-complete-mode))

(add-hook 'emacs-lisp-mode-hook 'customizations-for-emacs-lisp-mode)

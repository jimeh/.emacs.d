;; Write commit messages in style
(defun customizations-for-git-commit-mode ()
  (interactive)
  (flyspell-mode)
  (linum-mode t)
  (auto-fill-mode)
  (subword-mode)
  (fci-mode))

(add-hook 'git-commit-mode-hook 'customizations-for-git-commit-mode)

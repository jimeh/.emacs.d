;;; siren-gitignore.el --- jimeh's Emacs Siren: gitignore-mode configuration.

;;; Commentary:

;; Basic configuration for gitignore-mode.

;;; Code:

(use-package gitignore-mode
  :mode "\\.gitignore" "gitignore\\'"
  :hook (gitignore-mode . siren-gitignore-mode-setup)

  :init
  (defun siren-gitignore-mode-setup ()))

(provide 'siren-gitignore)
;;; siren-gitignore.el ends here

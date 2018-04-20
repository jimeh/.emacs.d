;;; siren-gitignore.el --- jimeh's Emacs Siren: gitignore-mode configuration.

;;; Commentary:

;; Basic configuration for gitignore-mode.

;;; Code:

(require 'siren-programming)

(use-package gitignore-mode
  :mode "\\.gitignore" "gitignore\\'"
  :hook (gitignore-mode . siren-gitignore-mode-setup)

  :init
  (defun siren-gitignore-mode-setup ()
    (siren-prog-mode-setup)
    (setq tab-width 2)
    (highlight-indentation-current-column-mode)
    (run-hooks 'siren-prog-mode-hook)))

(provide 'siren-gitignore)
;;; siren-gitignore.el ends here

;;; siren-gitignore.el --- jimeh's Emacs Siren: gitignore-mode configuration.

;;; Commentary:

;; Basic configuration for gitignore-mode.

;;; Code:

(use-package gitignore-mode
  :mode "\\.gitignore" "gitignore\\'"

  :config
  (require 'siren-programming)

  (defun siren-gitignore-mode-defaults ()
    (siren-prog-mode-defaults)
    (setq tab-width 2)
    (highlight-indentation-current-column-mode)
    (run-hooks 'siren-prog-mode-hook))

  (setq siren-gitignore-mode-hook 'siren-gitignore-mode-defaults)
  (add-hook 'gitignore-mode-hook (lambda ()
                                   (run-hooks 'siren-gitignore-mode-hook))))

(provide 'siren-gitignore)
;;; siren-gitignore.el ends here

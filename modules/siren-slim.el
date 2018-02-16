;;; siren-slim.el --- jimeh's Emacs Siren: slim-mode configuration.

;;; Commentary:

;; Basic configuration for slim-mode.

;;; Code:

(use-package slim-mode
  :mode "\\.slim\\'"

  :config
  (defun siren-slim-mode-defaults ()
    (siren-prog-mode-defaults)
    (highlight-indentation-current-column-mode))

  (setq siren-slim-mode-hook 'siren-slim-mode-defaults)
  (add-hook 'slim-mode-hook (lambda () (run-hooks 'siren-slim-mode-hook))))

(provide 'siren-slim)
;;; siren-slim.el ends here

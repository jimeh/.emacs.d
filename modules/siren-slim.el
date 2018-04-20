;;; siren-slim.el --- jimeh's Emacs Siren: slim-mode configuration.

;;; Commentary:

;; Basic configuration for slim-mode.

;;; Code:

(use-package slim-mode
  :mode "\\.slim\\'"
  :hook (slim-mode-hook . siren-slim-mode-hook)

  :init
  (defun siren-slim-mode-setup ()
    (siren-prog-mode-setup)
    (highlight-indentation-current-column-mode))

  (setq siren-slim-mode-hook 'siren-slim-mode-defaults)
  (add-hook 'slim-mode-hook (lambda () (run-hooks 'siren-slim-mode-hook))))

(provide 'siren-slim)
;;; siren-slim.el ends here

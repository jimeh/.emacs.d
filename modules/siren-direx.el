;;; siren-direx.el --- jimeh's Emacs Siren: direx configuration.

;;; Commentary:

;; Basic configuration for direx.

;;; Code:

(use-package direx
  :bind
  ("C-x j" . direx-project:jump-to-project-root)

  :config
  (setq direx:closed-icon " + "
        direx:open-icon " - ")

  (defun siren-direx-mode-defaults ())

  (setq siren-direx-mode-hook 'siren-direx-mode-defaults)
  (add-hook 'direx-mode-hook (lambda () (run-hooks 'siren-direx-mode-hook))))

(provide 'siren-direx)
;;; siren-direx.el ends here

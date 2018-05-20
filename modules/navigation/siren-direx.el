;;; siren-direx.el --- jimeh's Emacs Siren: direx configuration.

;;; Commentary:

;; Basic configuration for direx.

;;; Code:

(use-package direx
  :bind ("C-x j" . direx-project:jump-to-project-root)
  :hook (direx-mode . siren-direx-mode-setup)

  :config
  (setq direx:closed-icon " + "
        direx:open-icon " - "))

(defun siren-direx-mode-setup ())

(provide 'siren-direx)
;;; siren-direx.el ends here

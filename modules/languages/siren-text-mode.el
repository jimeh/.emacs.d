;;; siren-text-mode.el --- jimeh's Emacs Siren: text-mode configuration.

;;; Commentary:

;; Basic configuration for text-mode.

;;; Code:

(use-package text-mode
  :ensure nil ;; loaded from emacs built-ins
  :hook (text-mode . siren-text-mode-setup)
  :init
  (defun siren-text-mode-setup ()
    (setq fill-column 80)

    (visual-line-mode t)))

(provide 'siren-text-mode)
;;; siren-text-mode.el ends here

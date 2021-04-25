;;; siren-whitespace-cleanup.el --- jimeh's Emacs Siren: whitespace-cleanup-mode configuration.

;;; Commentary:

;; Basic configuration for whitespace-cleanup-mode package

;;; Code:

(use-package whitespace-cleanup-mode
  :defer t
  :hook
  (prog-mode . whitespace-cleanup-mode)

  :custom
  (whitespace-cleanup-mode-preserve-point nil)
  (whitespace-cleanup-mode-only-if-initially-clean nil))

(provide 'siren-whitespace-cleanup)
;;; siren-whitespace-cleanup.el ends here

;;; siren-diff-hl.el --- jimeh's Emacs Siren: diff-hl configuration.

;;; Commentary:

;; Basic configuration for diff-hl.

;;; Code:

(use-package diff-hl
  :init
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (global-diff-hl-mode +1))

(provide 'siren-diff-hl)
;;; siren-diff-hl.el ends here

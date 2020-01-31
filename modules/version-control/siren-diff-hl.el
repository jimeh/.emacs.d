;;; siren-diff-hl.el --- jimeh's Emacs Siren: diff-hl configuration.

;;; Commentary:

;; Basic configuration for diff-hl.

;;; Code:

(require 'siren-magit)

(use-package diff-hl
  :hook
  (after-init . global-diff-hl-mode)
  (after-init . diff-hl-flydiff-mode)
  (dired-mode . diff-hl-dired-mode)
  (magit-post-refresh . diff-hl-magit-post-refresh))

(provide 'siren-diff-hl)
;;; siren-diff-hl.el ends here

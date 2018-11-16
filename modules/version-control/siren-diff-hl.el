;;; siren-diff-hl.el --- jimeh's Emacs Siren: diff-hl configuration.

;;; Commentary:

;; Basic configuration for diff-hl.

;;; Code:

(require 'siren-magit)

(use-package diff-hl
  :demand
  :hook ((dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh))

  :config
  (global-diff-hl-mode +1)
  (diff-hl-flydiff-mode +1))

(provide 'siren-diff-hl)
;;; siren-diff-hl.el ends here

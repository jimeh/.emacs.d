;;; siren-diff-hl.el --- jimeh's Emacs Siren: diff-hl configuration.

;;; Commentary:

;; Basic configuration for diff-hl.

;;; Code:

(require 'siren-magit)

(use-package diff-hl
  :hook
  (prog-mode . siren-turn-on-diff-hl-mode)
  (text-mode . siren-turn-on-diff-hl-mode)
  (dired-mode . diff-hl-dired-mode)
  (magit-post-refresh . diff-hl-magit-post-refresh)

  :init
  (defun siren-turn-on-diff-hl-mode ()
    (turn-on-diff-hl-mode)
    (diff-hl-flydiff-mode 1)))

(provide 'siren-diff-hl)
;;; siren-diff-hl.el ends here

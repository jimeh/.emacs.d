;;; siren-display-fill-column.el --- jimeh's Emacs Siren: fill-column configuration.

;;; Commentary:

;; Basic configuration for fill-column.

;;; Code:

;; Emacs 27.x and later: Use native display-fill-column-indicator
(when (not (version< emacs-version "27.0"))
  (use-package display-fill-column-indicator
    :straight (:type built-in)

    :hook
    (prog-mode . display-fill-column-indicator-mode)

    :custom
    (display-fill-column-indicator-character ?\u2502))

  (defun siren-display-fill-column (&optional arg)
    "Activate or deactivate visual fill column.
Optional ARG is passed directly to mode toggle function."
    (display-fill-column-indicator-mode arg)))

;; Emacs 26.x: Use fill-column-indicator package
(when (version< emacs-version "27.0")
  (use-package fill-column-indicator
    :hook
    (prog-mode . fci-mode)

    :custom
    (fci-handle-line-move-visual nil)
    (fci-handle-truncate-lines nil)
    (fci-rule-width 1))

  (defun siren-display-fill-column (&optional arg)
    "Activate or deactivate visual fill column.
Optional ARG is passed directly to mode toggle function."
    (fci-mode (or arg t))))

(provide 'siren-display-fill-column)
;;; siren-display-fill-column.el ends here

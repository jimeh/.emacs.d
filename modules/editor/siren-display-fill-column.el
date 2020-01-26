;;; siren-display-fill-column.el --- jimeh's Emacs Siren: fill-column configuration.

;;; Commentary:

;; Basic configuration for fill-column.

;;; Code:

(require 'siren-fci)

(defun siren-display-fill-column (&optional arg)
  "Activate or deactivate visual fill column.
Optional ARG is passed directly to mode toggle function."
  (fci-mode (or arg t)))

(provide 'siren-display-fill-column)
;;; siren-display-fill-column.el ends here

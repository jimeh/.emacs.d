;;; siren-smart-shift.el --- jimeh's Emacs Siren: smart-shift

;;; Commentary:

;; Configuration for smart-shift

;;; Code:

(use-package smart-shift
  :bind
  ("C-c [" . smart-shift-left)
  ("C-c ]" . smart-shift-right)
  ("M-{" . smart-shift-left)
  ("M-}" . smart-shift-right))

(provide 'siren-smart-shift)
;;; siren-smart-shift.el ends here

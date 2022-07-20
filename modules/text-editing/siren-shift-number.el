;;; siren-shift-number.el --- jimeh's Emacs Siren: shift-number.

;;; Commentary:

;; Basic configuration of shift-number.

;;; Code:

(use-package shift-number
  :general
  ("M-=" 'shift-number-up)
  ("M-+" 'shift-number-down))

(provide 'siren-shift-number)
;;; siren-shift-number.el ends here

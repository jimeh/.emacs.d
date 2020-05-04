;;; siren-windmove.el --- jimeh's Emacs Siren: windmove

;;; Commentary:

;; Configuration for windmove.

;;; Code:

(use-package windmove
  :straight (:type built-in)
  :config
  (global-set-key (kbd "M-k") (siren-ignore-error-wrapper 'windmove-down))
  (global-set-key (kbd "M-i") (siren-ignore-error-wrapper 'windmove-up))
  (global-set-key (kbd "M-j") (siren-ignore-error-wrapper 'windmove-left))
  (global-set-key (kbd "M-l") (siren-ignore-error-wrapper 'windmove-right)))

(provide 'siren-windmove)
;;; siren-windmove.el ends here

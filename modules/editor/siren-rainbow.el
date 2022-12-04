;;; siren-rainbow.el --- jimeh's Emacs Siren: rainbow-mode configuration.

;;; Commentary:

;; Basic configuration for rainbow-mode.

;;; Code:

(use-package rainbow-mode
  :defer t
  :diminish rainbow-mode
  :hook
  ((css-mode
    php-mode) . siren-rainbow-mode-enable)

  :preface
  (defun siren-rainbow-mode-enable ()
    (rainbow-mode t)))

(provide 'siren-rainbow)
;;; siren-rainbow.el ends here

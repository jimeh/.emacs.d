;;; siren-special-mode.el --- jimeh's Emacs Siren: special-mode configuration.

;;; Commentary:

;; Basic configuration for special-mode.

;;; Code:

(use-package special-mode
  :straight (:type built-in)
  :defer t

  :hook
  (special-mode . siren-special-mode-setup)

  :init
  (defun siren-special-mode-setup ()
    (hl-line-mode t)))

(provide 'siren-special-mode)
;;; siren-special-mode.el ends here

;;; siren-fundamental-mode.el --- jimeh's Emacs Siren: fundamental-mode configuration.

;;; Commentary:

;; Basic configuration for fundamental-mode.

;;; Code:

(use-package fundamental-mode
  :straight (:type built-in)
  :defer t

  :hook
  (fundamental-mode . siren-fundamental-mode-setup)

  :init
  (defun siren-fundamental-mode-setup ()
    (hl-line-mode t)))

(provide 'siren-fundamental-mode)
;;; siren-fundamental-mode.el ends here

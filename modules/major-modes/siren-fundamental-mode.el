;;; siren-fundamental-mode.el --- jimeh's Emacs Siren: fundamental-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for fundamental-mode.

;;; Code:

(use-package fundamental-mode
  :straight (:type built-in)
  :defer t

  :hook
  (fundamental-mode . siren-fundamental-mode-setup)

  :preface
  (defun siren-fundamental-mode-setup ()
    (hl-line-mode t)))

(provide 'siren-fundamental-mode)
;;; siren-fundamental-mode.el ends here

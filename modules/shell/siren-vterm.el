;;; siren-vterm.el --- jimeh's Emacs Siren: vterm configuration.

;;; Commentary:

;; Basic configuration for vterm.

;;; Code:

(require 'siren-windmove)

(use-package vterm
  :hook
  (vterm-mode . siren-vterm-mode-setup)

  :bind
  (:map vterm-mode-map
        ("M-i" . siren-windmove-up)
        ("M-k" . siren-windmove-down)
        ("M-j" . siren-windmove-left)
        ("M-l" . siren-windmove-right))

  :custom
  (vterm-always-compile-module t)

  :init
  (defun siren-vterm-mode-setup ()
    (hl-line-mode -1)))

(provide 'siren-vterm)
;;; siren-vterm.el ends here

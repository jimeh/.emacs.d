;;; siren-vterm.el --- jimeh's Emacs Siren: vterm configuration.

;;; Commentary:

;; Basic configuration for vterm.

;;; Code:

(require 'siren-windmove)

(use-package vterm
  :defer t
  :hook
  (vterm-mode . siren-vterm-mode-setup)

  :bind
  (:map vterm-mode-map
        ("M-i" . windmove-up)
        ("M-k" . windmove-down)
        ("M-j" . windmove-left)
        ("M-l" . windmove-right)
        ("M-K" . windmove-swap-states-down)
        ("M-I" . windmove-swap-states-up)
        ("M-J" . windmove-swap-states-left)
        ("M-L" . windmove-swap-states-right))

  :custom
  (vterm-always-compile-module t)

  :init
  (defun siren-vterm-mode-setup ()
    (hl-line-mode -1)))

(provide 'siren-vterm)
;;; siren-vterm.el ends here

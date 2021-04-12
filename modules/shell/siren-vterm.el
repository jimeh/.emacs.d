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
        ("C-c [" . vterm-copy-mode)
        ("M-i" . windmove-up)
        ("M-k" . windmove-down)
        ("M-j" . windmove-left)
        ("M-l" . windmove-right)
        ("M-K" . windmove-swap-states-down)
        ("M-I" . windmove-swap-states-up)
        ("M-J" . windmove-swap-states-left)
        ("M-L" . windmove-swap-states-right))
  (:map vterm-copy-mode-map
        ("C-g" . siren-vterm-copy-mode-cancel)
        ("C-c [" . vterm-copy-mode))

  :custom
  (vterm-always-compile-module t)
  (vterm-kill-buffer-on-exit t)
  (vterm-max-scrollback 50000)

  :init
  (defun siren-vterm-mode-setup ()
    (hl-line-mode -1))

  (defun siren-vterm-copy-mode-cancel ()
    "Clear mark if mark is active, otherwise exit vterm-copy-mode."
    (interactive)
    (if mark-active (deactivate-mark) (vterm-copy-mode -1))))

(provide 'siren-vterm)
;;; siren-vterm.el ends here

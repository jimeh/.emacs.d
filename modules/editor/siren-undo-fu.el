;;; siren-undo-fu.el --- jimeh's Emacs Siren: undo-fu configuration.

;;; Commentary:

;; Basic configuration for undo-fu.

;;; Code:

(use-package undo-fu
  :demand
  :general
  ("M--" 'undo-fu-only-undo)
  ("M-_" 'undo-fu-only-redo)
  ("s-z" 'undo-fu-only-undo)
  ("s-Z" 'undo-fu-only-redo)

  :custom
  (undo-fu-allow-undo-in-region nil)
  (undo-fu-ignore-keyboard-quit t))

(provide 'siren-undo-fu)
;;; siren-undo-fu.el ends here

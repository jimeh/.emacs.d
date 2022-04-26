;;; siren-vundo.el --- jimeh's Emacs Siren: vundo configuration.

;;; Commentary:

;; Basic configuration for vundo.

;;; Code:

(use-package vundo
  :demand
  :general
  ("C-x u" 'vundo)

  :custom
  (vundo-glyph-alist vundo-unicode-symbols))

(provide 'siren-vundo)
;;; siren-vundo.el ends here

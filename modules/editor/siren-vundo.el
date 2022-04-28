;;; siren-vundo.el --- jimeh's Emacs Siren: vundo configuration.

;;; Commentary:

;; Basic configuration for vundo.

;;; Code:

(use-package vundo
  :demand
  :general
  ("C-x u" 'vundo)
  (:keymaps 'vundo-mode-map
            "C-f" 'vundo-forward
            "C-b" 'vundo-backward
            "C-n" 'vundo-next
            "C-p" 'vundo-previous
            "C-a" 'vundo-stem-root
            "C-e" 'vundo-stem-end)

  :custom
  (vundo-glyph-alist vundo-unicode-symbols))

(provide 'siren-vundo)
;;; siren-vundo.el ends here

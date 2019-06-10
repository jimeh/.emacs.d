;;; siren-lsp.el --- jimeh's Emacs Siren: lsp-mode configuration.

;;; Commentary:

;; Basic configuration for lsp-mode.

;;; Code:

(use-package lsp-mode
  :commands lsp

  :custom
  (lsp-eldoc-render-all nil))

(provide 'siren-lsp)
;;; siren-lsp.el ends here

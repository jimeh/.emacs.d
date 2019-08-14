;;; siren-lsp.el --- jimeh's Emacs Siren: lsp-mode configuration.

;;; Commentary:

;; Basic configuration for lsp-mode.

;;; Code:

(use-package lsp-mode
  :commands lsp

  :bind (:map lsp-mode-map
              ("C-c C-." . lsp-rename))

  :custom
  (lsp-eldoc-render-all nil))

(provide 'siren-lsp)
;;; siren-lsp.el ends here

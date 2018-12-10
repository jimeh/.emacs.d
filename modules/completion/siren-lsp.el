;;; siren-lsp.el --- jimeh's Emacs Siren: lsp-mode configuration.

;;; Commentary:

;; Basic configuration for lsp-mode.

;;; Code:

(require 'siren-company)

(use-package lsp-mode
  :config
  (require 'lsp-clients))

(use-package company-lsp)

(provide 'siren-lsp)
;;; siren-lsp.el ends here

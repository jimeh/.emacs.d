;;; siren-consult-lsp.el --- jimeh's Emacs Siren: consult-lsp configuration.

;;; Commentary:

;; Basic configuration for consult-lsp.

;;; Code:

(require 'siren-consult)
(require 'siren-lsp)

(use-package consult-lsp
  :general
  ("C-c C-\\" 'consult-lsp-diagnostics))

(provide 'siren-consult-lsp)
;;; siren-consult-lsp.el ends here
